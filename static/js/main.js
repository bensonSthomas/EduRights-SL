/* ==================================================
   COOKIE CONSENT SYSTEM

   Session-Based Only
================================================== */


/* ==========================================
   ACCEPT
========================================== */

function acceptCookies() {

    sessionStorage.setItem(
        "cookieBannerSeen",
        "true"
    );

    hideCookieBanner();
}


/* ==========================================
   DECLINE
========================================== */

function declineCookies() {

    sessionStorage.setItem(
        "cookieBannerSeen",
        "true"
    );

    hideCookieBanner();
}


/* ==========================================
   HIDE BANNER
========================================== */

function hideCookieBanner() {

    const banner =
        document.getElementById(
            "cookieConsent"
        );

    if (!banner) {

        return;
    }

    banner.style.display =
        "none";
}


/* ==========================================
   INITIALIZE
========================================== */

document.addEventListener(
    "DOMContentLoaded",
    function () {

        const banner =
            document.getElementById(
                "cookieConsent"
            );

        if (!banner) {

            return;
        }

        const seen =
            sessionStorage.getItem(
                "cookieBannerSeen"
            );

        if (seen === "true") {

            banner.style.display =
                "none";

        } else {

            banner.style.display =
                "block";
        }

    }
);
/* ==================================================
   AUTO CLOSE FLASH MESSAGES
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const alerts =
            document.querySelectorAll(
                ".alert"
            );

        alerts.forEach(

            function(alert){

                setTimeout(

                    function(){

                        alert.classList.remove(
                            "show"
                        );

                        alert.classList.add(
                            "fade"
                        );

                        setTimeout(

                            function(){

                                alert.remove();

                            },

                            500

                        );

                    },

                    5000

                );

            }

        );

    }
);