 
 $(document).ready(function() {

    bnr();
    fnSwiper();
	fnhover();
    
});


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

var sn = 0
function bnr() {
    sn++;
    if (sn >= 3) {
        $(".main .slide").animate({
            left: sn * -1200
        }, 500, function() {
            $(this).css({
                "left": 0
            });
        });
        sn = 0;
    } else {
        $(".main .slide").animate({
            left: sn * -1200
        }, 500);
    }
    $(".main .page .num").text(sn + 1);
}


function fnSwiper() {
    var btimer = setInterval("bnr()", 3000);
    $(".next").click(function() {
        clearInterval(btimer);
        bnr();
        btimer = setInterval("bnr()", 3000);
    });
    $(".prev").click(function() {
        clearInterval(btimer);
        sn--;
        if (sn < 0) {
            sn = 2;
            $(".main .slide").css({
                left: -(sn + 1) * 1200
            }, 500);
        }
        $(".main .slide").animate({
            left: -sn * 1200
        }, 500);
        $(".main .page .num").text(sn + 1);
        btimer = setInterval("bnr()", 3000);
    });

}  