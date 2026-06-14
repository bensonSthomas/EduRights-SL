/* ==================================================
   EDURIGHTS SL - ANALYTICS PAGE JAVASCRIPT

   Purpose:
   - Animates number counters.
   - Animates progress bars.
   - Keeps analytics page interactive without inline JS.
================================================== */


document.addEventListener("DOMContentLoaded", function () {

    /* ==================================================
       COUNT-UP ANIMATION
       Finds all elements with class .count-up and counts
       from 0 to the backend value stored in data-count.
    ================================================== */

    const counters =
        document.querySelectorAll(".count-up");

    counters.forEach(function (counter) {

        const target =
            parseInt(counter.getAttribute("data-count")) || 0;

        let current = 0;

        const duration = 900;

        const stepTime = 20;

        const increment =
            target / (duration / stepTime);

        const timer =
            setInterval(function () {

                current += increment;

                if (current >= target) {

                    counter.textContent = target;

                    clearInterval(timer);

                } else {

                    counter.textContent =
                        Math.floor(current);

                }

            }, stepTime);

    });


    /* ==================================================
       PROGRESS BAR ANIMATION
       Uses data-width from Flask percentages.
    ================================================== */

    const progressBars =
        document.querySelectorAll(".analytics-progress-fill");

    progressBars.forEach(function (bar) {

        const width =
            bar.getAttribute("data-width") || 0;

        setTimeout(function () {

            bar.style.width =
                width + "%";

        }, 250);

    });

});