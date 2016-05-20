//::: FlexSlider
$(document).ready(function () {
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: false, 
        touch: true,
        animationLoop: true
    });
});

//::: Funções :::
$(function () {
    //Menu Mobile
    $('.mobmenu').click(function () {
        $('.main-header-menu ul').slideToggle();
        $(this).toggleClass('active');
        return false;
    });
    //Debug Images
    $('.debug').each(function () {
        $(this).after('<p style="color: #fff; background: #333; padding: 10px">' + $(this).width() + 'px</p>');
    });
});