/* ==================================================
   RESOURCE DETAIL PAGE
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    () => {

        const cards =
            document.querySelectorAll(
                ".resource-detail-card, .resource-meta-card"
            );

        cards.forEach(card => {

            card.addEventListener(
                "mouseenter",
                () => {
                    card.classList.add(
                        "resource-card-active"
                    );
                }
            );

            card.addEventListener(
                "mouseleave",
                () => {
                    card.classList.remove(
                        "resource-card-active"
                    );
                }
            );

        });

    }
);