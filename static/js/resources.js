/* ==================================================
   EDURIGHTS SL RESOURCE CENTER
   RESOURCE CARD INTERACTION SYSTEM

   Purpose:
   - Highlights the currently viewed resource
   - Remembers selected resource using localStorage
   - Restores selection after page refresh

================================================== */


/* ==========================================
   RESOURCE CARD CLICK EFFECT
========================================== */

document.addEventListener("DOMContentLoaded", function () {

    const viewButtons =
        document.querySelectorAll(".resource-view-btn");

    viewButtons.forEach(function (button) {

        button.addEventListener("click", function () {

            /* Remove highlight from all cards */

            document
                .querySelectorAll(".resource-card-pro")
                .forEach(function (card) {

                    card.classList.remove(
                        "resource-card-active"
                    );

                });

            /* Get current card */

            const card =
                button.closest(".resource-card-pro");

            if (card) {

                /* Add glow effect */

                card.classList.add(
                    "resource-card-active"
                );

                /* Save selected card */

                localStorage.setItem(
                    "active_resource_card",
                    card.id
                );

            }

        });

    });

});


/* ==========================================
   RESTORE ACTIVE RESOURCE CARD
========================================== */

window.addEventListener("load", function () {

    const activeId =
        localStorage.getItem(
            "active_resource_card"
        );

    if (!activeId) {

        return;

    }

    const activeCard =
        document.getElementById(activeId);

    if (activeCard) {

        activeCard.classList.add(
            "resource-card-active"
        );

    }

});