$(document).ready(function() {
    const stars = $('.star');
    stars.click(function() {
        stars.removeClass('active');
        $(this).prevAll().addBack().addClass('active');
        console.log("mouse click")
    });

    // Add mouseover event listener to each star
    stars.mouseenter(function() {
        // Remove hover class from all stars
        stars.removeClass('hover');

        // Add hover class to all stars up to the hovered star
        $(this).prevAll().addBack().addClass('hover');
        console.log("mouse over")
    });

    // Add mouseout event listener to each star
    $('.rating').mouseleave(function() {
        // Remove hover class from all stars
        stars.removeClass('hover');

        // Add active class to all stars up to the last clicked star
        $('.active').prevAll().addBack().addClass('active');
        console.log("mouse out")
    });
});
