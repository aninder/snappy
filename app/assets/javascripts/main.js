$(function () {
    $(document).on("page:change",
        function (e) {
            $('input[type="text"]:first').focus();
        }
    );
    $(document).on("page:fetch",
        function (e) {
            $('header .loader-inner').addClass(get_random_loader());
            $('.container-main .container').addClass('animated '+get_random_animation(animations_out));

            add_req_divs();
        }
    );
    $(document).on("page:load",
        function (e) {
            $('.container-main .container').addClass('animated '+get_random_animation(animations_in));
        }
    );
});

function get_random_loader(){
    return loader_classes[Math.floor(Math.random()* loader_classes.length)];
}

function get_random_animation(an){
    return an[Math.floor(Math.random()* an.length)];
}

var loader_classes=[
"ball-pulse",
"ball-grid-pulse",
"ball-clip-rotate",
"ball-clip-rotate-pulse",
"square-spin",
"ball-clip-rotate-multiple",
"ball-pulse-rise",
"ball-rotate",
"cube-transition",
"ball-zig-zag",
"ball-zig-zag-deflect",
"ball-triangle-path",
"ball-scale",
"line-scale",
"line-scale-party",
"ball-scale-multiple",
"ball-pulse-sync",
"ball-beat",
"line-scale-pulse-out",
"line-scale-pulse-out-rapid",
"ball-scale-ripple",
"ball-scale-ripple-multiple",
"ball-spin-fade-loader",
"line-spin-fade-loader",
"triangle-skew-spin",
"pacman",
"ball-grid-beat",
"semi-circle-spin"
]

function add_req_divs() {
    $('.loader-inner.ball-pulse').html(addDivs(3));
    $('.loader-inner.ball-grid-pulse').html(addDivs(9));
    $('.loader-inner.ball-clip-rotate').html(addDivs(1));
    $('.loader-inner.ball-clip-rotate-pulse').html(addDivs(2));
    $('.loader-inner.square-spin').html(addDivs(1));
    $('.loader-inner.ball-clip-rotate-multiple').html(addDivs(2));
    $('.loader-inner.ball-pulse-rise').html(addDivs(5));
    $('.loader-inner.ball-rotate').html(addDivs(1));
    $('.loader-inner.cube-transition').html(addDivs(2));
    $('.loader-inner.ball-zig-zag').html(addDivs(2));
    $('.loader-inner.ball-zig-zag-deflect').html(addDivs(2));
    $('.loader-inner.ball-triangle-path').html(addDivs(3));
    $('.loader-inner.ball-scale').html(addDivs(1));
    $('.loader-inner.line-scale').html(addDivs(5));
    $('.loader-inner.line-scale-party').html(addDivs(4));
    $('.loader-inner.ball-scale-multiple').html(addDivs(3));
    $('.loader-inner.ball-pulse-sync').html(addDivs(3));
    $('.loader-inner.ball-beat').html(addDivs(3));
    $('.loader-inner.line-scale-pulse-out').html(addDivs(5));
    $('.loader-inner.line-scale-pulse-out-rapid').html(addDivs(5));
    $('.loader-inner.ball-scale-ripple').html(addDivs(1));
    $('.loader-inner.ball-scale-ripple-multiple').html(addDivs(3));
    $('.loader-inner.ball-spin-fade-loader').html(addDivs(8));
    $('.loader-inner.line-spin-fade-loader').html(addDivs(8));
    $('.loader-inner.triangle-skew-spin').html(addDivs(1));
    $('.loader-inner.pacman').html(addDivs(5));
    $('.loader-inner.ball-grid-beat').html(addDivs(9));
    $('.loader-inner.semi-circle-spin').html(addDivs(1));
}
var addDivs = function(n) {
    var arr = [];
    for (i = 1; i <= n; i++) {
        arr.push('<div></div>');
    }
    return arr;
};


var animations_in=
["bounce",
"flash",
"pulse",
"rubberBand",
"shake",
"swing",
"tada",
"wobble",
"jello",
"bounceIn",
"bounceInDown",
"bounceInLeft",
"bounceInRight",
"bounceInUp",
"flipInX",
"flipInY",
"lightSpeedIn",
"rotateIn",
"rotateInDownLeft",
"rotateInDownRight",
"rotateInUpLeft",
"rotateInUpRight",
"rollIn",
"zoomIn",
"zoomInDown",
"zoomInLeft",
"zoomInRight",
"zoomInUp",
"slideInDown",
"slideInLeft",
"slideInRight",
"slideInUp",
]

var animations_out=[
    "fadeIn",
        "fadeInDown",
        "fadeInDownBig",
        "fadeInLeft",
        "fadeInLeftBig",
        "fadeInRight",
        "fadeInRightBig",
        "fadeInUp",
        "fadeInUpBig",
        "fadeOut",
        "fadeOutDown",
        "fadeOutDownBig",
        "fadeOutLeft",
        "fadeOutLeftBig",
        "fadeOutRight",
        "fadeOutRightBig",
        "fadeOutUp",
    "lightSpeedOut",
    "fadeOutUpBig",
    "bounceOut",
    "bounceOutDown",
    "bounceOutLeft",
    "bounceOutRight",
    "bounceOutUp",
    "rotateOut",
    "rotateOutDownLeft",
    "rotateOutDownRight",
    "rotateOutUpLeft",
    "rotateOutUpRight",
    "rollOut",
    "zoomOut",
    "zoomOutDown",
    "zoomOutLeft",
    "zoomOutRight",
    "zoomOutUp",
    "slideOutDown",
    "slideOutLeft",
    "slideOutRight",
    "slideOutUp",
    "flipOutX",
    "flipOutY",
    "hinge"


]