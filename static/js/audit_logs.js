/* ==========================================
   AUDIT LOG SEARCH
========================================== */

document.addEventListener("DOMContentLoaded", () => {

    const searchInput =
        document.getElementById("auditSearch");

    const rows =
        document.querySelectorAll(
            "#auditTable tbody tr"
        );

    searchInput.addEventListener(
        "keyup",
        () => {

            const value =
                searchInput.value.toLowerCase();

            rows.forEach(row => {

                const text =
                    row.innerText.toLowerCase();

                row.style.display =
                    text.includes(value)
                    ? ""
                    : "none";

            });

        }
    );

});