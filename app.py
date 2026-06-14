import os
import json
import mysql.connector
from datetime import datetime
from flask import Flask, render_template, request, redirect, url_for, session, flash, send_from_directory, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
from config import get_db_connection
from flask import jsonify
import hashlib


app = Flask(__name__)
app.secret_key = "edurights_sl_secret_key"


UPLOAD_FOLDER = "static/uploads"

ALLOWED_EXTENSIONS = {
    "pdf",
    "doc",
    "docx",
    "ppt",
    "pptx",
    "txt",

    "mp4",
    "mov",
    "avi",
    "mkv",
    "webm",

    "mp3",
    "wav",
    "aac",
    "m4a"
}



app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER


def allowed_file(filename):
    return "." in filename and filename.rsplit(".", 1)[1].lower() in ALLOWED_EXTENSIONS


def log_action(user_id, action):
    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO audit_logs (user_id, action)
        VALUES (%s, %s)
        """,
        (user_id, action)
    )

    connection.commit()
    cursor.close()
    connection.close()


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":

        if not request.form.get("accept_terms"):

            flash(
            "You must accept the Terms of Use and Privacy Policy.",
            "danger"
            )

            return redirect(
            url_for("register")
            )

        full_name = request.form["full_name"]
        email = request.form["email"]
        password = request.form["password"]
        role = request.form["role"]

        hashed_password = generate_password_hash(password)

        connection = get_db_connection()
        cursor = connection.cursor()

        try:
            cursor.execute(
                """
                INSERT INTO users (full_name, email, password_hash, role)
                VALUES (%s, %s, %s, %s)
                """,
                (full_name, email, hashed_password, role)
            )

            connection.commit()
            flash("Account created successfully. Please login.", "success")
            return redirect(url_for("login"))

        except mysql.connector.Error:
            flash("Email already exists or database error occurred.", "danger")

        finally:
            cursor.close()
            connection.close()

    return render_template("register.html")

@app.route("/login", methods=["GET", "POST"])
def login():

    if request.method == "POST":

        email = request.form["email"]
        password = request.form["password"]

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute(
            "SELECT * FROM users WHERE email = %s",
            (email,)
        )

        user = cursor.fetchone()

        cursor.close()
        connection.close()

        if user and check_password_hash(user["password_hash"], password):

            session["user_id"] = user["id"]
            session["full_name"] = user["full_name"]
            session["role"] = user["role"]

            print("LOGIN SESSION:", dict(session))

            log_action(user["id"], "Logged into the system")

            flash("Login successful.", "success")
            return redirect(url_for("dashboard"))

        flash("Invalid email or password.", "danger")

    return render_template("login.html")

@app.route("/dashboard")
def dashboard():

    # ==================================================
    # REQUIRE USER LOGIN
    # ==================================================

    if "user_id" not in session:

        flash(
            "Please login first.",
            "warning"
        )

        return redirect(
            url_for("login")
        )

    # ==================================================
    # USER INFORMATION
    # ==================================================

    user_id = session["user_id"]

    role = session.get(
        "role"
    )

    # ==================================================
    # DATABASE CONNECTION
    # ==================================================

    connection = get_db_connection()

    cursor = connection.cursor(
        dictionary=True
    )

    # ==================================================
    # RECENT RESOURCE HISTORY
    # ==================================================

    if role == "Teacher":

        cursor.execute(
            """
            SELECT
                id,
                title,
                category,
                approved
            FROM resources
            WHERE uploaded_by = %s
            ORDER BY id DESC
            LIMIT 5
            """,
            (user_id,)
        )

    else:

        cursor.execute(
            """
            SELECT
                id,
                title,
                category,
                approved
            FROM resources
            ORDER BY id DESC
            LIMIT 5
            """
        )

    recent_resources = cursor.fetchall()

    # ==================================================
    # DOWNLOAD HISTORY
    # ==================================================

    cursor.execute(
        """
        SELECT
            d.id,
            d.downloaded_at,
            r.title
        FROM downloads d
        JOIN resources r
            ON d.resource_id = r.id
        WHERE d.user_id = %s
        ORDER BY d.downloaded_at DESC
        LIMIT 5
        """,
        (user_id,)
    )

    download_history = cursor.fetchall()

    # ==================================================
    # AUDIT LOGS
    # ==================================================

    cursor.execute(
        """
        SELECT *
        FROM audit_logs
        WHERE user_id = %s
        ORDER BY created_at DESC
        LIMIT 5
        """,
        (user_id,)
    )

    audit_logs = cursor.fetchall()

    # ==================================================
    # RECENT ACTIVITY
    # ==================================================

    cursor.execute(
        """
        SELECT *
        FROM audit_logs
        WHERE user_id = %s
        ORDER BY created_at DESC
        LIMIT 8
        """,
        (user_id,)
    )

    recent_activity = cursor.fetchall()

    # ==================================================
    # TEACHER UPLOAD HISTORY
    # ==================================================

    teacher_uploads = []

    if role == "Teacher":

        cursor.execute(
            """
            SELECT
                id,
                title,
                category,
                approved,
                created_at
            FROM resources
            WHERE uploaded_by = %s
            ORDER BY created_at DESC
            LIMIT 5
            """,
            (user_id,)
        )

        teacher_uploads = cursor.fetchall()

    # ==================================================
    # CLOSE DATABASE
    # ==================================================

    cursor.close()

    connection.close()

    # ==================================================
    # LOAD DASHBOARD
    # ==================================================

    return render_template(
        "dashboard.html",
        recent_resources=recent_resources,
        download_history=download_history,
        audit_logs=audit_logs,
        recent_activity=recent_activity,
        teacher_uploads=teacher_uploads
    )

@app.route("/start-upload")
def start_upload():

    if "user_id" not in session:
        flash("Please login first.", "warning")
        return redirect(url_for("login"))

    return redirect("/legal-analyzer")


@app.route("/upload-resource", methods=["GET", "POST"])
def upload_resource():

    analysis_id = request.args.get("analysis_id")

    if not analysis_id:
        flash(
        "Please complete a legal risk assessment before uploading.",
        "warning"
    )
        return redirect(url_for("legal_analyzer"))

    if "user_id" not in session:
        flash("Please login first.", "warning")
        return redirect(url_for("login"))

    if session.get("role") not in ["Teacher", "Admin"]:
        flash(
            "Only teachers and admins are allowed to upload educational resources.",
            "danger"
        )
        return redirect(url_for("dashboard"))

    if request.method == "POST":
        title = request.form["title"]
        description = request.form["description"]
        category = request.form["category"]
        resource_type = request.form["resource_type"]
        license_type = request.form["license_type"]
        copyright_owner = request.form["copyright_owner"]
        permission_status = request.form["permission_status"]
        sdg_goal = request.form["sdg_goal"]

        uploaded_file = request.files.get("resource_file")
        file_name = None

        if uploaded_file and uploaded_file.filename != "":
            if allowed_file(uploaded_file.filename):
                safe_name = secure_filename(uploaded_file.filename)
                file_name = datetime.now().strftime("%Y%m%d%H%M%S_") + safe_name

                uploaded_file.save(
                    os.path.join(app.config["UPLOAD_FOLDER"], file_name)
                )
            else:
                flash("Invalid file type. Use PDF, DOC, DOCX, PPT, PPTX, or TXT.", "danger")
                return redirect(url_for("upload_resource"))

        approved_status = 1 if session.get("role") == "Admin" else 0

        connection = get_db_connection()
        cursor = connection.cursor()

        cursor.execute(
            """
            INSERT INTO resources
            (
                title,
                description,
                category,
                resource_type,
                file_name,
                license_type,
                copyright_owner,
                permission_status,
                sdg_goal,
                uploaded_by,
                approved,
                analysis_id
            )
            VALUES
            (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """,
            (
                title,
                description,
                category,
                resource_type,
                file_name,
                license_type,
                copyright_owner,
                permission_status,
                sdg_goal,
                session.get("user_id"),
                approved_status,
                analysis_id
            )
        )

        connection.commit()
        cursor.close()
        connection.close()

        log_action(
            session.get("user_id"),
            f"Uploaded resource: {title}"
        )

        if approved_status == 1:
            flash("Admin resource uploaded and approved successfully.", "success")
        else:
            flash("Resource submitted successfully and is awaiting admin approval.", "success")

        return redirect(url_for("dashboard"))

    return render_template(
        "upload_resource.html",
        analysis_id=analysis_id
    )


@app.route("/resources")
def resources():

    search = request.args.get("search", "")
    category = request.args.get("category", "")

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    if search or category:

        cursor.execute(
    """
    SELECT resources.*,
           users.full_name
    FROM resources
    LEFT JOIN users
    ON resources.uploaded_by = users.id
    WHERE approved = 1
    AND (%s = '' OR category = %s)
    AND (
        %s = ''
        OR title LIKE %s
        OR category LIKE %s
        OR description LIKE %s
    )
    ORDER BY id DESC
    """,
    (
        category,
        category,
        search,
        f"%{search}%",
        f"%{search}%",
        f"%{search}%"
    )
)

    else:

        cursor.execute(
            """
            SELECT resources.*,
                   users.full_name
            FROM resources
            LEFT JOIN users
            ON resources.uploaded_by = users.id
            WHERE approved = 1
            ORDER BY id DESC
            """
        )

    resources = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
    "resources.html",
    resources=resources,
    search=search,
    category=category
)

@app.route("/resource/<int:resource_id>")
def resource_detail(resource_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT resources.*,
               users.full_name
        FROM resources
        LEFT JOIN users
        ON resources.uploaded_by = users.id
        WHERE resources.id = %s
        """,
        (resource_id,)
    )

    resource = cursor.fetchone()

    cursor.close()
    connection.close()

    return render_template("resource_detail.html", resource=resource)


@app.route("/admin")
def admin_panel():
    if "user_id" not in session:
        return redirect(url_for("login"))

    if session.get("role") != "Admin":
        flash("Access denied.", "danger")
        return redirect(url_for("dashboard"))

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
    """
    SELECT

        resources.*,
        users.full_name,

        legal_analyses.risk_score,
        legal_analyses.risk_level,
        legal_analyses.findings,
        legal_analyses.recommendation

    FROM resources

    LEFT JOIN users
    ON resources.uploaded_by = users.id

    LEFT JOIN legal_analyses
    ON resources.analysis_id = legal_analyses.id

    ORDER BY resources.id DESC
    """
)

    resources = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("admin.html", resources=resources)

@app.route("/analytics")
def analytics():

    # ==================================================
    # REQUIRE ADMIN LOGIN
    # ==================================================

    if "user_id" not in session:

        flash(
            "Please login first.",
            "warning"
        )

        return redirect(
            url_for("login")
        )

    if session.get("role") != "Admin":

        flash(
            "Access denied.",
            "danger"
        )

        return redirect(
            url_for("dashboard")
        )

    # ==================================================
    # DATABASE CONNECTION
    # ==================================================

    connection = get_db_connection()

    cursor = connection.cursor(
        dictionary=True
    )

    # ==================================================
    # USER TOTALS
    # ==================================================

    cursor.execute("SELECT COUNT(*) AS total FROM users")
    total_users = cursor.fetchone()["total"]

    cursor.execute("SELECT COUNT(*) AS total FROM users WHERE role = 'Student'")
    total_students = cursor.fetchone()["total"]

    cursor.execute("SELECT COUNT(*) AS total FROM users WHERE role = 'Teacher'")
    total_teachers = cursor.fetchone()["total"]

    cursor.execute("SELECT COUNT(*) AS total FROM users WHERE role = 'Admin'")
    total_admins = cursor.fetchone()["total"]

    # ==================================================
    # RESOURCE TOTALS
    # ==================================================

    cursor.execute("SELECT COUNT(*) AS total FROM resources")
    total_resources = cursor.fetchone()["total"]

    cursor.execute("SELECT COUNT(*) AS total FROM resources WHERE approved = 1")
    approved_resources = cursor.fetchone()["total"]

    cursor.execute("SELECT COUNT(*) AS total FROM resources WHERE approved = 0")
    pending_resources = cursor.fetchone()["total"]

    cursor.execute("SELECT COUNT(*) AS total FROM resources WHERE approved = 2")
    rejected_resources = cursor.fetchone()["total"]

    # ==================================================
    # DOWNLOAD TOTALS
    # ==================================================

    cursor.execute("SELECT COUNT(*) AS total FROM downloads")
    total_downloads = cursor.fetchone()["total"]

    # ==================================================
    # USER DISTRIBUTION PERCENTAGES
    # ==================================================

    student_percentage = 0
    teacher_percentage = 0
    admin_percentage = 0

    if total_users > 0:

        student_percentage = round(
            (total_students / total_users) * 100
        )

        teacher_percentage = round(
            (total_teachers / total_users) * 100
        )

        admin_percentage = round(
            (total_admins / total_users) * 100
        )

    # ==================================================
    # RESOURCE DISTRIBUTION PERCENTAGES
    # ==================================================

    approved_percentage = 0
    pending_percentage = 0
    rejected_percentage = 0

    if total_resources > 0:

        approved_percentage = round(
            (approved_resources / total_resources) * 100
        )

        pending_percentage = round(
            (pending_resources / total_resources) * 100
        )

        rejected_percentage = round(
            (rejected_resources / total_resources) * 100
        )

    # ==================================================
    # CLOSE DATABASE CONNECTION
    # ==================================================

    cursor.close()

    connection.close()

    # ==================================================
    # LOAD ANALYTICS PAGE
    # ==================================================

    return render_template(
        "analytics.html",
        total_users=total_users,
        total_students=total_students,
        total_teachers=total_teachers,
        total_admins=total_admins,
        total_resources=total_resources,
        approved_resources=approved_resources,
        pending_resources=pending_resources,
        rejected_resources=rejected_resources,
        total_downloads=total_downloads,
        student_percentage=student_percentage,
        teacher_percentage=teacher_percentage,
        admin_percentage=admin_percentage,
        approved_percentage=approved_percentage,
        pending_percentage=pending_percentage,
        rejected_percentage=rejected_percentage
    )

@app.route("/approve-resource/<int:resource_id>")
def approve_resource(resource_id):
    if session.get("role") != "Admin":
        flash("Access denied.", "danger")
        return redirect(url_for("dashboard"))

    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute(
        """
        UPDATE resources
        SET approved = 1
        WHERE id = %s
        """,
        (resource_id,)
    )

    connection.commit()
    cursor.close()
    connection.close()

    log_action(session.get("user_id"), f"Approved resource ID: {resource_id}")

    flash("Resource approved successfully.", "success")
    return redirect(url_for("admin_panel"))


@app.route("/reject-resource/<int:resource_id>")
def reject_resource(resource_id):
    if session.get("role") != "Admin":
        flash("Access denied.", "danger")
        return redirect(url_for("dashboard"))

    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute(
        """
        UPDATE resources
        SET approved = -1
        WHERE id = %s
        """,
        (resource_id,)
    )

    connection.commit()
    cursor.close()
    connection.close()

    log_action(session.get("user_id"), f"Rejected resource ID: {resource_id}")

    flash("Resource rejected successfully.", "warning")
    return redirect(url_for("admin_panel"))


@app.route("/delete-resource/<int:resource_id>")
def delete_resource(resource_id):
    if session.get("role") != "Admin":
        flash("Access denied. Only admins can delete resources.", "danger")
        return redirect(url_for("resources"))

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM resources WHERE id = %s",
        (resource_id,)
    )

    resource = cursor.fetchone()

    if resource is None:
        cursor.close()
        connection.close()
        flash("Resource not found.", "danger")
        return redirect(url_for("resources"))

    if resource["file_name"]:
        file_path = os.path.join(
            app.config["UPLOAD_FOLDER"],
            resource["file_name"]
        )

        if os.path.exists(file_path):
            os.remove(file_path)

    cursor.execute(
        "DELETE FROM resources WHERE id = %s",
        (resource_id,)
    )

    connection.commit()

    cursor.close()
    connection.close()

    log_action(
        session.get("user_id"),
        f"Deleted resource from library: {resource['title']}"
    )

    flash("Resource deleted successfully from the library.", "success")
    return redirect(url_for("resources"))


@app.route("/download/<int:resource_id>")
def download_resource(resource_id):
    if "user_id" not in session:
        flash("Please login first to download resources.", "warning")
        return redirect(url_for("login"))

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT * FROM resources
        WHERE id = %s AND approved = 1
        """,
        (resource_id,)
    )

    resource = cursor.fetchone()

    if resource is None:
        cursor.close()
        connection.close()
        flash("Resource not found or not approved.", "danger")
        return redirect(url_for("resources"))

    if not resource["file_name"]:
        cursor.close()
        connection.close()
        flash("No attached file is available for this resource.", "warning")
        return redirect(url_for("resource_detail", resource_id=resource_id))

    cursor.execute(
        """
        INSERT INTO downloads (user_id, resource_id)
        VALUES (%s, %s)
        """,
        (session.get("user_id"), resource_id)
    )

    connection.commit()

    cursor.close()
    connection.close()

    log_action(
        session.get("user_id"),
        f"Downloaded resource: {resource['title']}"
    )

    return send_from_directory(
        app.config["UPLOAD_FOLDER"],
        resource["file_name"],
        as_attachment=True
    )
@app.route("/download-history")
def download_history():

    if "user_id" not in session:

        flash(
            "Please login first.",
            "warning"
        )

        return redirect(
            url_for("login")
        )

    connection = get_db_connection()

    cursor = connection.cursor(
        dictionary=True
    )

    # =====================================
    # ADMIN CAN SEE EVERYTHING
    # =====================================

    if session.get("role") == "Admin":

        cursor.execute(
            """
            SELECT
                d.id,
                d.downloaded_at,
                r.title,
                u.full_name
            FROM downloads d
            JOIN resources r
                ON d.resource_id = r.id
            JOIN users u
                ON d.user_id = u.id
            ORDER BY d.downloaded_at DESC
            """
        )

    # =====================================
    # STUDENT / TEACHER SEE ONLY THEIR OWN
    # =====================================

    else:

        cursor.execute(
            """
            SELECT
                d.id,
                d.downloaded_at,
                r.title
            FROM downloads d
            JOIN resources r
                ON d.resource_id = r.id
            WHERE d.user_id = %s
            ORDER BY d.downloaded_at DESC
            """,
            (session["user_id"],)
        )

    history = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "download_history.html",
        history=history
    )
@app.route("/audit-logs")
def audit_logs():

    if session.get("role") != "Admin":
        flash("Access denied.", "danger")
        return redirect(url_for("dashboard"))

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT
            audit_logs.id,
            users.full_name,
            audit_logs.action,
            audit_logs.created_at
        FROM audit_logs
        LEFT JOIN users
            ON audit_logs.user_id = users.id
        ORDER BY audit_logs.created_at DESC
        """
    )

    logs = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "audit_logs.html",
        logs=logs
    )
@app.route("/license-checker", methods=["GET", "POST"])
def license_checker():

    result = None
    explanation = None

    if request.method == "POST":

        license_type = request.form["license_type"]
        permission_status = request.form["permission_status"]

        if license_type == "No License" or permission_status == "No Permission":
            result = "High Risk"
            explanation = "This resource should not be shared."

        elif permission_status == "Pending Permission":
            result = "Medium Risk"
            explanation = "Permission has not been confirmed."

        else:
            result = "Low Risk"
            explanation = "Resource can be shared if license terms are followed."

    return render_template(
        "license_checker.html",
        result=result,
        explanation=explanation
    )

@app.route("/api/resources")
def api_resources():

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    category = request.args.get("category")
    resource_type = request.args.get("type")
    search = request.args.get("search")

    query = """
        SELECT *
        FROM resources
        WHERE approved = 1
    """

    params = []

    if category:
        query += " AND category = %s"
        params.append(category)

    if resource_type:
        query += " AND resource_type = %s"
        params.append(resource_type)

    if search:
        query += " AND title LIKE %s"
        params.append(f"%{search}%")

    query += " ORDER BY created_at DESC"

    cursor.execute(query, tuple(params))
    resources = cursor.fetchall()

    cursor.close()
    connection.close()

    for resource in resources:
        if resource["created_at"]:
            resource["created_at"] = str(resource["created_at"])

    return jsonify({
        "project": "EduRights SL",
        "purpose": "Open access to legally approved educational resources",
        "data_standard": "JSON",
        "total_resources": len(resources),
        "resources": resources
    })


@app.route("/api/resources/<int:resource_id>")
def api_resource_detail(resource_id):

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT *
        FROM resources
        WHERE id = %s
        AND approved = 1
        """,
        (resource_id,)
    )

    resource = cursor.fetchone()

    cursor.close()
    connection.close()

    if not resource:
        return jsonify({
            "error": "Resource not found"
        }), 404

    if resource["created_at"]:
        resource["created_at"] = str(resource["created_at"])

    return jsonify(resource)

@app.route("/logout")
def logout():
    if "user_id" in session:
        log_action(session.get("user_id"), "Logged out of the system")

    session.clear()
    flash("You have logged out successfully.", "info")
    return redirect(url_for("home"))
    
@app.route("/api/docs")
def api_docs():
    return render_template("api_docs.html")

@app.route("/license-information")
def license_information():
    return render_template("license_information.html")

@app.route("/api/legal-knowledge")
def api_legal_knowledge():

    with open(
        "data/legal_knowledge.json",
        "r",
        encoding="utf-8"
    ) as file:

        legal_data = json.load(file)

    return jsonify(legal_data)

@app.route("/legal-compliance")
def legal_compliance():
    return render_template("legal_compliance.html")

@app.route("/chatbolt", methods=["POST"])
def chatbolt():

    data = request.get_json()
    question = data.get("question", "").lower().strip()

    if not question:
        return jsonify({
            "answer": "Please ask a question about EduRights SL legal compliance, licensing, copyright, IPR, IT Law, DPG, SDGs, JSON APIs or interoperability."
        })

    with open("data/legal_knowledge.json", "r", encoding="utf-8") as file:
        knowledge = json.load(file)

    best_match = None
    highest_score = 0

    question_words = set(question.replace("?", "").replace(",", "").split())

    weak_words = {
        "edurights",
        "sl",
        "system",
        "platform",
        "the",
        "what",
        "how",
        "does",
        "do",
        "is",
        "are",
        "use",
        "used",
        "about",
        "explain",
        "tell",
        "me"
    }

    for section_name, section_data in knowledge.items():

        if not isinstance(section_data, dict):
            continue

        score = 0

        keywords = section_data.get("keywords", [])
        answer = section_data.get("answer", "").lower()
        name = section_data.get("name", "").lower()
        section_title = section_name.replace("_", " ").lower()

        # Strong match: exact keyword phrase appears in question
        for keyword in keywords:
            keyword = keyword.lower()

            if keyword in question:
                score += 20

            keyword_words = set(keyword.split())

            for word in keyword_words:
                if word in question_words and word not in weak_words:
                    score += 6

        # Section name match, e.g. software_license => software license
        if section_title in question:
            score += 15

        for word in section_title.split():
            if word in question_words and word not in weak_words:
                score += 5

        # Name field match, e.g. MIT License
        if name and name in question:
            score += 25

        if name:
            for word in name.split():
                if word in question_words and word not in weak_words:
                    score += 7

        # Light answer-content support
        for word in question_words:
            if word not in weak_words and word in answer:
                score += 1

        if score > highest_score:
            highest_score = score
            best_match = section_data

    if best_match and highest_score >= 5:
        return jsonify({
            "answer": best_match.get("answer", "No answer found.")
        })

    return jsonify({
        "answer": "I could not find a strong match in the EduRights SL legal knowledge base. Try asking about MIT licensing, copyright compliance, Intellectual Property Rights, IT Law, Digital Public Goods, SDG alignment, JSON APIs, interoperability, audit logs or admin review."
    })
#LEGAL ANALYZER ROUTE
@app.route("/legal-analyzer", methods=["GET", "POST"])
def legal_analyzer():
    print("LEGAL ANALYZER HIT")
    print("SESSION:", dict(session))

    risk_score = None
    risk_level = None
    recommendation = None
    findings = []

    risk_angle = 0
    risk_color = "#20C997"

    analysis_id = None

    if request.method == "POST":

        permission_status = request.form.get("permission_status")
        license_type = request.form.get("license_type")
        attribution_available = request.form.get("attribution_available")
        source_type = request.form.get("source_type")
        intended_use = request.form.get("intended_use")

        resource_title = request.form.get("title")
        resource_type = request.form.get("resource_type")
        copyright_owner = request.form.get("copyright_owner")

        uploaded_file = request.files.get("resource_file")

        risk_score = 0

        file_name = None
        file_hash = None

        # ==========================
        # FILE ANALYSIS
        # ==========================

        if uploaded_file and uploaded_file.filename:

            file_name = uploaded_file.filename

            file_bytes = uploaded_file.read()
            uploaded_file.seek(0)

            file_hash = hashlib.sha256(
                file_bytes
            ).hexdigest()

            file_extension = file_name.split(".")[-1].lower()

            file_size_mb = round(
                len(file_bytes) / (1024 * 1024),
                2
            )

            findings.append(
                f"File detected: {file_name}"
            )

            findings.append(
                f"File type: {file_extension.upper()}"
            )

            findings.append(
                f"File size: {file_size_mb} MB"
            )

            # DUPLICATE CHECK

            connection = get_db_connection()
            cursor = connection.cursor()

            cursor.execute(
                """
                SELECT id
                FROM legal_analyses
                WHERE file_hash=%s
                LIMIT 1
                """,
                (file_hash,)
            )

            duplicate = cursor.fetchone()

            cursor.close()
            connection.close()

            if duplicate:

                risk_score += 35

                findings.append(
                    "Duplicate resource detected in repository."
                )

            if file_extension in [
                "mp4",
                "avi",
                "mkv",
                "mov",
                "webm"
            ]:

                risk_score += 10

                findings.append(
                    "Video resources require additional copyright verification."
                )

            if file_size_mb > 100:

                risk_score += 5

                findings.append(
                    "Large resource detected."
                )

        # ==========================
        # LEGAL CHECKS
        # ==========================

        if permission_status == "Pending Permission":
            risk_score += 25

        elif permission_status == "No Permission":
            risk_score += 50

        if license_type == "GPL v3":
            risk_score += 5

        elif license_type == "Creative Commons":
            risk_score += 10

        elif license_type == "No License":
            risk_score += 25

        elif license_type == "Unknown License":
            risk_score += 35

        if attribution_available == "No":
            risk_score += 20

        if source_type == "Institution Resource":
            risk_score += 10

        elif source_type == "Internet Source":
            risk_score += 20

        elif source_type == "Third Party Resource":
            risk_score += 30

        if intended_use == "Teaching":
            risk_score += 5

        elif intended_use == "Research":
            risk_score += 10

        elif intended_use == "Public Sharing":
            risk_score += 20

        if (
            permission_status == "No Permission"
            and source_type == "Third Party Resource"
        ):
            risk_score += 20

        risk_score = min(risk_score, 100)

        # ==========================
        # CLASSIFICATION
        # ==========================

        if risk_score <= 30:

            risk_level = "LOW RISK"
            recommendation = "Safe to proceed."
            risk_color = "#20C997"

        elif risk_score <= 60:

            risk_level = "MEDIUM RISK"
            recommendation = "Manual review recommended."
            risk_color = "#FFD166"

        else:

            risk_level = "HIGH RISK"
            recommendation = "High legal risk detected."
            risk_color = "#dc3545"

        risk_angle = int(
            (risk_score / 100) * 360
        )

        findings_text = "\n".join(findings)

        # ==========================
        # SAVE TO DATABASE
        # ==========================

        connection = get_db_connection()
        cursor = connection.cursor()

        cursor.execute(
            """
            INSERT INTO legal_analyses(
                user_id,
                title,
                resource_type,
                file_name,
                file_hash,
                license_type,
                copyright_owner,
                permission_status,
                attribution_available,
                source_type,
                intended_use,
                risk_score,
                risk_level,
                findings,
                recommendation
            )
            VALUES(
                %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s
            )
            """,
            (
                1,
                resource_title,
                resource_type,
                file_name,
                file_hash,
                license_type,
                copyright_owner,
                permission_status,
                attribution_available,
                source_type,
                intended_use,
                risk_score,
                risk_level,
                findings_text,
                recommendation
            )
        )

        connection.commit()

        analysis_id = cursor.lastrowid

        cursor.close()
        connection.close()
        return render_template(
        "legal_analyzer.html",
         risk_score=risk_score,
        risk_level=risk_level,
        recommendation=recommendation,
        findings=findings,
        risk_angle=risk_angle,
        risk_color=risk_color,
        analysis_id=analysis_id
        )


    return render_template(
        "legal_analyzer.html",
        risk_score=risk_score,
        risk_level=risk_level,
        recommendation=recommendation,
        findings=findings,
        risk_angle=risk_angle,
        risk_color=risk_color,
        analysis_id=analysis_id
    )
@app.route("/legal-report/<int:analysis_id>")
def legal_report(analysis_id):

    if "user_id" not in session:
        return redirect(url_for("login"))

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT *
        FROM legal_analyses
        WHERE id=%s
        """,
        (analysis_id,)
    )

    report = cursor.fetchone()

    cursor.close()
    connection.close()

    if not report:
        flash("Legal report not found.", "danger")
        return redirect(url_for("admin_panel"))

    return render_template(
        "legal_report.html",
        report=report
    )
# PRIVACY POLICY ROUTE
@app.route("/privacy-policy")
def privacy_policy():
    return render_template("privacy_policy.html")

# TERMS OF USE ROUTE 
@app.route("/terms-of-use")
def terms_of_use():
    return render_template("terms_of_use.html") 


# ABOUT PAGE ROUTE
@app.route("/about")
def about():

    return render_template(
        "about.html"
    )

# ==================================================
# CONTACT PAGE
# ==================================================

@app.route("/contact")
def contact():

    return render_template(
        "contact.html"
    )


if __name__ == "__main__":
    app.run(debug=True)