/* ==================================================
   EDURIGHTS SL
   ABOUT PAGE JAVASCRIPT

   Purpose:
   - Scroll reveal animations
   - Smooth hover effects
   - Professional page interactions

================================================== */


/* ==================================================
   SCROLL REVEAL ANIMATION
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const reveals =
            document.querySelectorAll(
                ".reveal"
            );

        const observer =
            new IntersectionObserver(

                function(entries){

                    entries.forEach(

                        function(entry){

                            if(
                                entry.isIntersecting
                            ){

                                entry.target.classList.add(
                                    "active"
                                );

                            }

                        }

                    );

                },

                {
                    threshold:0.15
                }

            );

        reveals.forEach(

            function(item){

                observer.observe(
                    item
                );

            }

        );

    }
);


/* ==================================================
   FEATURE CARD HOVER ENHANCEMENT
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const featureCards =
            document.querySelectorAll(
                ".feature-card"
            );

        featureCards.forEach(

            function(card){

                card.addEventListener(

                    "mouseenter",

                    function(){

                        card.style.boxShadow =
                            "0 25px 60px rgba(37,99,235,.18)";

                    }

                );

                card.addEventListener(

                    "mouseleave",

                    function(){

                        card.style.boxShadow =
                            "0 15px 40px rgba(15,23,42,.08)";

                    }

                );

            }

        );

    }
);


/* ==================================================
   ABOUT CARDS HOVER ENHANCEMENT
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const cards =
            document.querySelectorAll(

                ".about-card, " +
                ".role-card, " +
                ".mission-card"

            );

        cards.forEach(

            function(card){

                card.addEventListener(

                    "mouseenter",

                    function(){

                        card.style.transform =
                            "translateY(-10px)";

                    }

                );

                card.addEventListener(

                    "mouseleave",

                    function(){

                        card.style.transform =
                            "translateY(0px)";

                    }

                );

            }

        );

    }
);


/* ==================================================
   GOOGLE MAP CARD EFFECT
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const mapFrame =
            document.querySelector(
                ".map-frame"
            );

        if(!mapFrame){

            return;

        }

        mapFrame.addEventListener(

            "mouseenter",

            function(){

                mapFrame.style.transform =
                    "translateY(-6px)";

            }

        );

        mapFrame.addEventListener(

            "mouseleave",

            function(){

                mapFrame.style.transform =
                    "translateY(0px)";

            }

        );

    }
);


/* ==================================================
   SHIELD CARD GLOW EFFECT
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const shield =
            document.querySelector(
                ".about-shield-card"
            );

        if(!shield){

            return;

        }

        setInterval(

            function(){

                shield.style.boxShadow =
                    "0 0 40px rgba(37,99,235,.18)";

                setTimeout(

                    function(){

                        shield.style.boxShadow =
                            "0 20px 50px rgba(15,23,42,.18)";

                    },

                    1200

                );

            },

            3000

        );

    }
);


/* ==================================================
   STAGGERED LOAD EFFECT
================================================== */

window.addEventListener(

    "load",

    function(){

        const sections =
            document.querySelectorAll(
                ".about-section"
            );

        sections.forEach(

            function(section,index){

                section.style.transitionDelay =
                    (index * 0.08) + "s";

            }

        );

    }

);


/* ==================================================
   FUTURE EXPANSION

   Reserved for:
   - Team Members
   - Statistics Counters
   - Timeline Animation
   - Educational Impact Metrics

================================================== */