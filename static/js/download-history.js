/* ==================================================
   EDURIGHTS SL DOWNLOAD HISTORY

   Purpose:
   Search and filter download records.

================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function () {

        const searchInput =
            document.getElementById(
                "downloadSearch"
            );

        const tableRows =
            document.querySelectorAll(
                "#downloadHistoryTable tbody tr"
            );

        if (!searchInput) {

            return;

        }

        searchInput.addEventListener(
            "keyup",
            function () {

                const value =
                    searchInput.value.toLowerCase();

                tableRows.forEach(
                    function (row) {

                        const text =
                            row.textContent.toLowerCase();

                        if (
                            text.includes(value)
                        ) {

                            row.style.display = "";

                        }

                        else {

                            row.style.display =
                                "none";

                        }

                    }
                );

            }
        );

    }
);