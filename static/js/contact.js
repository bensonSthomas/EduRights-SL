/* ==================================================
   EDURIGHTS SL CONTACT PAGE JAVASCRIPT
================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function(){

        const revealItems =
            document.querySelectorAll(
                ".contact-reveal"
            );

        const observer =
            new IntersectionObserver(
                function(entries){

                    entries.forEach(
                        function(entry){

                            if(entry.isIntersecting){

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

        revealItems.forEach(
            function(item){

                observer.observe(item);

            }
        );

        const stars =
            document.querySelectorAll(
                "#contactStars span"
            );

        const ratingText =
            document.getElementById(
                "contactRatingText"
            );

        let selectedRating = 0;

        stars.forEach(
            function(star){

                star.addEventListener(
                    "mouseenter",
                    function(){

                        const rating =
                            Number(
                                star.dataset.rating
                            );

                        highlightStars(
                            rating,
                            "hovered"
                        );

                    }
                );

                star.addEventListener(
                    "mouseleave",
                    function(){

                        clearClass(
                            "hovered"
                        );

                    }
                );

                star.addEventListener(
                    "click",
                    function(){

                        selectedRating =
                            Number(
                                star.dataset.rating
                            );

                        updateSelectedStars(
                            selectedRating
                        );

                        ratingText.textContent =
                            "You rated EduRights SL " +
                            selectedRating +
                            " out of 5";

                    }
                );

            }
        );

        function highlightStars(rating,className){

            clearClass(className);

            stars.forEach(
                function(star){

                    if(
                        Number(star.dataset.rating) <= rating
                    ){

                        star.classList.add(className);

                    }

                }
            );

        }

        function updateSelectedStars(rating){

            stars.forEach(
                function(star){

                    if(
                        Number(star.dataset.rating) <= rating
                    ){

                        star.classList.add("active");

                    }else{

                        star.classList.remove("active");

                    }

                }
            );

        }

        function clearClass(className){

            stars.forEach(
                function(star){

                    star.classList.remove(className);

                }
            );

        }

    }
);