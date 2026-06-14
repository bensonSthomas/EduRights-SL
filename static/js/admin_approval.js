/* ==================================================
   EDURIGHTS SL
   ADMIN RESOURCE APPROVAL PAGE

   Purpose:
   - Filters approval table rows by search text.
   - Keeps JavaScript separate from the template.
================================================== */


document.addEventListener("DOMContentLoaded", function () {

    /* ==================================================
       GET SEARCH INPUT AND TABLE ROWS
    ================================================== */

    const searchInput =
        document.getElementById("approvalSearch");

    const rows =
        document.querySelectorAll("#approvalTable tbody tr");


    /* ==================================================
       STOP IF PAGE ELEMENTS ARE MISSING
       This prevents JavaScript errors on other pages.
    ================================================== */

    if (!searchInput || !rows.length) {

        return;

    }


    /* ==================================================
       SEARCH FILTER
       Hides rows that do not contain the search text.
    ================================================== */

    searchInput.addEventListener("keyup", function () {

        const searchValue =
            searchInput.value.toLowerCase();

        rows.forEach(function (row) {

            const rowText =
                row.innerText.toLowerCase();

            if (rowText.includes(searchValue)) {

                row.style.display = "";

            } else {

                row.style.display = "none";

            }

        });

    });

});