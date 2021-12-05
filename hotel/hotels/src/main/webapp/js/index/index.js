var slides = document.querySelector(".slides"),
    slide = document.querySelectorAll(".slides li"),
    currentIdx = 0,
    slideCount = slide.length,
    slideWidth = 400,
    slideMargin = 30,
    prevBtn = document.querySelector('.prev'),
    nextBtn = document.querySelector('.next');

makeClone();

function makeClone() {
    for (var i = 0; i < slideCount; i++) {
        var cloneSlide = slide[i].cloneNode(true);
        cloneSlide.classList.add('clone');
        slides.appendChild(cloneSlide);
    }
    for (var i = slideCount - 1; i >= 0; i--) {
        var cloneSlide = slide[i].cloneNode(true);
        cloneSlide.classList.add('clone');
        slides.prepend(cloneSlide);
    }

    updateWidth();
    seInitialPos();

    setTimeout(function(){
        slides.classList.add('animated');
    },100);
}
function updateWidth(){
    var currentSlides = document.querySelectorAll(".slides li");//li배열
    var newSlideCount = currentSlides.length;//배열길이이며 총 15 이다.
    var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + "px";
    slides.style.width = newWidth;
}


function seInitialPos(){
    var initialTranslateValue = -(slideWidth + slideMargin) * slideCount;
    slides.style.transform = 'translateX('+initialTranslateValue+'px)';
}
function moveSlides(num){
    slides.style.left = - num * (slideWidth + slideMargin) + 'px';
    currentIdx = num;

    if(currentIdx == slideCount || currentIdx == -slideCount){
        setTimeout(function(){
            
            slides.style.left='0px'
            slides.classList.remove('animated');
            slides.style.left='0px';
            currentIdx = 0;
        },500);
        setTimeout(function(){
            slides.classList.add('animated');
        },600);
    }
}

var timer = undefined;

function autoSlide(){
    if(timer==undefined){
        timer = setInterval(function(){
            moveSlides(currentIdx + 1)
        }, 2800);
    }
}

autoSlide();

slides.addEventListener('mouseleave',function(){
    autoSlide();
});

var $header = $('header');

$(window).scroll(function () {
    if ($(this).scrollTop() > 0) {
        $header.addClass('fixed');
    } else {
        $header.removeClass('fixed');
    }
});

var nav_div = $('.nav_menuDetail');
var nav_li = $('.nav_menu>li');
$('.header').mouseover(function () {
    $('.header').addClass('show');
}).mouseout(function () {
    $('.header').removeClass('show');
});