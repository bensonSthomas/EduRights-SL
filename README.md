## I.T LAW AND IPR LEGAL ISSUES
## BSEM2201 GROUP 7 MEMBERS:
    BENSON SIMEON THOMAS     905003034
    KENNETH OLU JONES        905003974
    KHADIJAH KUBRA BUNDUKA   905003991

## LECTURER:
            Ing. Sheku Dinneh Kamara
# Development of a Tool for Legal & Ethical Framework for Digital Public Goods (DPGS)


# EduRights SL

## Project Overview

EduRights SL is a web-based Digital Public Goods aligned platform designed to support ethical, legal, and responsible educational resource sharing in Sierra Leone.

The system allows students, teachers, and administrators to interact through a structured educational platform where learning resources can be uploaded, reviewed, approved, accessed, downloaded, and monitored. It promotes responsible digital learning, legal awareness, transparency, and improved access to educational resources.

EduRights SL is built to support Sustainable Development Goal 4: Quality Education by helping educational institutions and learners access educational resources in a more organized, accountable, and legally responsible way.

---

## Digital Public Goods Alignment

EduRights SL aligns with the principles of Digital Public Goods because it is designed as a digital solution that supports public value, education, transparency, and responsible access to learning resources.

### Reasons EduRights SL is DPG Aligned

1. **Supports Public Good**

   The platform is focused on improving educational access and responsible educational resource sharing, especially within Sierra Leone.

2. **Supports SDG 4: Quality Education**

   EduRights SL contributes to quality education by helping students access approved learning materials and helping teachers share resources responsibly.

3. **Promotes Open and Responsible Resource Sharing**

   The system encourages educational content sharing while still considering legal, ethical, and permission-related requirements.

4. **Improves Transparency**

   Features such as audit logs, download history, approval records, and activity tracking help make the resource-sharing process more transparent.

5. **Encourages Accountability**

   Teachers can upload resources, administrators can review submissions, and student downloads can be tracked.

6. **Uses Web Technologies**

   EduRights SL is built using accessible web technologies such as Flask, HTML, CSS, JavaScript, Bootstrap, and MySQL.

7. **Can Be Adapted by Educational Institutions**

   The system can be reused or improved by schools, colleges, universities, and educational organizations that need a structured resource-sharing platform.

---

## Project Objectives

The main objectives of EduRights SL are:

* To improve access to educational resources.
* To support ethical educational resource sharing.
* To promote legal awareness when sharing digital educational materials.
* To allow teachers to upload educational resources.
* To allow administrators to review, approve, or reject uploaded resources.
* To allow students to access approved resources.
* To track downloads and user activity.
* To provide audit logs for transparency.
* To support multilingual access through a language-switching framework.
* To support SDG 4: Quality Education.

---

## Main User Roles

EduRights SL supports three main user roles.

### 1. Student

Students can:

* Register and log in.
* Access the dashboard.
* Browse approved educational resources.
* View resource details.
* Download approved resources.
* View download history.
* Use the platform in a structured learning environment.

### 2. Teacher

Teachers can:

* Register and log in.
* Upload educational resources.
* Provide resource details such as title, description, category, resource type, license type, permission status, copyright owner, and SDG goal.
* Submit resources for legal analysis and administrator review.
* View uploaded resources and upload history.

### 3. Administrator

Administrators can:

* Access the admin approval panel.
* Review uploaded resources.
* View legal analysis reports.
* Approve or reject resources.
* View analytics.
* View download history.
* View audit logs.
* Monitor system activity.

---

## Key Features

### User Authentication

* User registration.
* User login.
* User logout.
* Session-based access control.
* Role-based dashboard display.

### Dashboard

* Role-based dashboard for students, teachers, and administrators.
* Recent resources display.
* Recent activity display.
* Download history display.
* Teacher upload history.
* Admin access to analytics and audit records.

### Resource Management

* Resource upload portal.
* Resource library.
* Resource detail page.
* File attachment support.
* Resource categories.
* Resource type selection.
* SDG goal selection.
* Download functionality.

### Legal Compliance

* Legal compliance page.
* Legal analyzer.
* License checker.
* Legal report generation.
* Risk score and risk level support.
* Approval workflow based on legal review.

### Administration

* Admin resource approval page.
* Approve resource function.
* Reject resource function.
* Analytics dashboard.
* Audit logs.
* Download history.
* Resource deletion option for administrators.

### Platform Pages

* Home page.
* Resources page.
* Legal Compliance
* About page.
* Contact page.
* Dashboard page.
* Login page.
* Register page.
* Privacy policy page.
* Terms of use page.

### User Experience Features

* Professional responsive design.
* Modern navigation bar.
* Footer section.
* Cookie consent banner.
* Auto-closing flash messages.
* JavaScript-powered rating system on the contact page.
* Separate JavaScript files for cleaner project structure.
* Multilingual framework using translations.

---

## Technologies Used

### Backend

* Python
* Flask

### Frontend

* HTML5
* CSS3
* JavaScript
* Bootstrap 5

### Database

* MySQL

### Development Tools

* Visual Studio Code
* Git
* GitHub
* MySQL Workbench

---

## Project Structure

   text
edurights-sl/

├── app.py
├── config.py
├── translations.py
├── requirements.txt
├── README.md
├── LICENSE
│
├── __pycache__/
│   ├── config.cpython-314.pyc
│   └── translations.cpython-314.pyc
│
├── data/
│   └── legal_knowledge.json
│
├── database/
│   └── database.sql
│
├── docs/
│   └── project documentation files
│
├── static/
│   │
│   ├── css/
│   │   └── style.css
│   │
│   ├── js/
│   │   ├── about.js
│   │   ├── admin_approval.js
│   │   ├── analytics.js
│   │   ├── audit_logs.js
│   │   ├── contact.js
│   │   ├── download-history.js
│   │   ├── main.js
│   │   ├── resource_detail.js
│   │   ├── resources.js
│   │   └── upload-resource.js
│   │
│   └── uploads/
│       └── uploaded resource files
│
├── templates/
│   ├── about.html
│   ├── admin.html
│   ├── analytics.html
│   ├── audit_logs.html
│   ├── base.html
│   ├── contact.html
│   ├── dashboard.html
│   ├── download_history.html
│   ├── html.html
│   ├── index.html
│   ├── legal_analyzer.html
│   ├── legal_compliance.html
│   ├── legal_report.html
│   ├── license_checker.html
│   ├── license_information.html
│   ├── login.html
│   ├── privacy_policy.html
│   ├── register.html
│   ├── resource_detail.html
│   ├── resources.html
│   ├── terms_of_use.html
│   └── upload_resource.html
│
└── venv/
    └── virtual environment files


---

## Important Project Files

### `app.py`

This is the main Flask application file. It contains the routes, backend logic, database queries, user authentication, dashboard logic, resource upload handling, admin approval functions, legal analysis routes, and other system functions.

### `config.py`

This file stores configuration details for the application, such as database connection settings and other important system configuration values.


### `requirements.txt`

This file contains the Python packages required to run the project.

### `README.md`

This file explains the project, installation steps, usage instructions, project structure, features, and development information.

### `LICENSE`

This file contains the license information for the project.

### `data/legal_knowledge.json`

This file stores legal knowledge data used by the legal analyzer or legal compliance features.

### `static/css/style.css`

This file contains the styling for the entire system, including pages such as home, dashboard, about, contact, resources, legal compliance, admin pages, and other interface sections.

### `static/js/`

This folder contains separate JavaScript files for different system pages. Separating JavaScript files improves code organization and makes the project easier to maintain.

### `templates/`

This folder contains all HTML template files used by Flask to render the pages of the system.

### `static/uploads/`

This folder stores uploaded educational resource files.

---

## Installation Instructions

### Step 1: Clone the Repository

    bash
git clone https://github.com/YOUR_USERNAME/edurights-sl.git
```

### Step 2: Move into the Project Folder

    bash
cd edurights-sl


### Step 3: Create a Virtual Environment

    bash
python -m venv venv


### Step 4: Activate the Virtual Environment

For Windows:

    bash
venv\Scripts\activate


For macOS or Linux:

    bash
source venv/bin/activate


### Step 5: Install Required Packages

    bash
pip install -r requirements.txt


### Step 6: Set Up the Database

1. Open MySQL Workbench.
2. Create a database for the project.
3. Import or run the SQL file inside the `database/` folder.
4. Confirm that the required tables are created.
5. Update database connection details in `config.py` if needed.

### Step 7: Run the Application

    bash
python app.py


### Step 8: Open the System in the Browser

    text
http://127.0.0.1:5000


---

## Usage Instructions

### Registering a User

1. Open the Register page.
2. Enter full name, email, password, and role.
3. Accept the terms and policies.
4. Submit the form.

### Logging In

1. Open the Login page.
2. Enter registered email and password.
3. Submit the form.
4. The system redirects the user to the dashboard.

### Uploading a Resource

1. Log in as a Teacher.
-Legal Analyzer Check
2. Open the Upload Resource page.
3. Fill in the resource details.
4. Attach a supported file.
5. Submit the resource for review.

### Reviewing Resources

1. Log in as an Administrator.
2. Open the Admin Approval page.
3. Review submitted resources.
4. View legal report if available.
5. Approve or reject the resource.

### Accessing Resources

1. Log in as a Student.
2. Open the Resource Library.
3. Browse approved resources.
4. View resource details.
5. Download available files.

---

## Database Tables

The project uses MySQL tables such as:

* `users`
* `resources`
* `downloads`
* `audit_logs`
* `legal_analyses`
* `license_rules`
* `notifications`

These tables support user management, resource storage, legal analysis, download tracking, audit logs, and platform activity.

---

## Version Control and GitHub Usage

This project is managed using Git and GitHub for proper version control.

Good version control practices followed include:

* Meaningful commit messages.
* Separation of frontend, backend, and static files.
* Organized folder structure.
* Clear documentation.
* Clean and readable code.
* Well-commented HTML, CSS, JavaScript, and Python sections.

Example commit messages:

    text
Initial EduRights SL project setup
Added user authentication system
Implemented resource upload portal
Added legal compliance analyzer
Created admin approval workflow
Added dashboard analytics page
Added about and contact pages
Improved styling and responsiveness
Implemented multilingual support framework
Updated README documentation


---

## Code Quality

The system follows clean coding practices such as:

* Clear file organization.
* Separate JavaScript files for individual pages.
* Reusable base template.
* Commented HTML sections.
* Commented CSS sections.
* Commented JavaScript functions.
* Structured Flask routes.
* Role-based access control.
* Meaningful page names and route names.

---

## Security and Responsibility

EduRights SL includes security and responsibility-focused features such as:

* User authentication.
* Session management.
* Role-based access.
* Admin approval workflow.
* Legal compliance checks.
* Audit logs.
* Download tracking.
* Cookie consent notice.

---

## SDG 4 Alignment

EduRights SL supports Sustainable Development Goal 4: Quality Education.

The platform contributes to SDG 4 by:

* Helping learners access educational resources.
* Supporting teachers in sharing educational content.
* Encouraging responsible digital education.
* Promoting legal and ethical educational resource use.
* Improving transparency in educational content sharing.

---

## Future Improvements

Possible future improvements include:

* advanced multilingual translation coverage.
* Stronger legal analysis intelligence.
* AI-supported resource recommendations.
* Institution-level reporting.
* Mobile application version.
* Email notification system.
* Improved search and filtering.
* More detailed analytics.
* Cloud deployment.

---

## Developer

EduRights SL was developed as an academic project focused on Digital Public Goods, educational access, responsible resource sharing, and legal compliance awareness.

---

## License

This project is intended for academic and educational use and uses the MIT License.
