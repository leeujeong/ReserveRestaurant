/**
 * 
 */
 
 $(document).ready(function() {



    fnhover();
    fnQuickMenu();

    fn1();
    fn2();
    fn3();
    fn4();

});

function fnQuickMenu() {
    var currentPosition = parseInt($(".quickmenu").css("top"));
    $(window).scroll(function() {
        var position = $(window).scrollTop();
        $(".quickmenu").stop().animate({ "top": position + currentPosition + "px" }, 1000);
    });

}

function fnhover() {
    (function($) {
        $('.cate ul').hide();
        $('.cate .menu .subopen').click(function() {
            if ($(this).hasClass('active')) {
                $(this).parent().next().slideUp('slow');
                $(this).removeClass('active');
            } else {
                $('.accordion').find('.active').parent().next().slideUp('slow');
                $('.accordion').find('.active').removeClass('active');
                $(this).parent().next().slideDown('slow');
                $(this).addClass('active');
            }
        });
    })(jQuery);
}

 

function fn1(){
    $('.search_condition_section1').toggleClass('invisible');
    $('#search1_btn_area').toggleClass('invisible');
}

function fn2(){
    $('#location').on('click',function(event){

        $('.search_condition_section1').toggleClass('invisible');
        $('#search1_btn_area').toggleClass('invisible');

    })
}

function fn3(){
    $('.search_condition_section3').toggleClass('invisible');
    $('#search3_btn_area').toggleClass('invisible');
}

function fn4(){
    $('#price_person').on('click',function(event){

        $('.search_condition_section3').toggleClass('invisible');
        $('#search3_btn_area').toggleClass('invisible');

    })
}

 