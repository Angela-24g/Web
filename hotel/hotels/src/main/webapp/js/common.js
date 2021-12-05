
/* 각 상세뷰로 넘어가기 */
function jsTapChange(FCATE1, FCATE2, FCATE3) {
	if(FCATE2==undefined&&FCATE3==undefined){
		location.href = "/"+FCATE1;
	}else if(FCATE3==undefined){
		location.href = "/"+FCATE1+"/"+FCATE2;
	}else {
		location.href = "/"+FCATE1+"/"+FCATE2+"/"+FCATE3;
	}
}

/* form select */
function selectMake(){
	$("select.selectBox").each(function(e,i){
		if($(this).is(':visible')){
			if($(this).parents('pre').length < 1){
				var classes = $(this).attr("class"),
				id      = $(this).attr("id"),
				name    = $(this).attr("name");
				style	= $(this).attr('style');
				
				var template  = '<div class="' + classes + '" style="' +  style + '">';
				template += '<a href="#" class="ui-select-trigger">' + $(this).find(':selected').text() + '</a>';
				template += '<ul class="ui-select-options">';
				$(this).find("option").each(function(){
					var cl = '';
					$(this).attr('class') ? cl = $(this).attr('class') : cl;
					template += '<li class="' + cl + '"><a href="#" class="ui-select-option" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</a></li>';
				});
				template += '</ul></div>';
				
				$(this).wrap('<div class="ui-select-wrapper"></div>');
				$(this).hide().after(template);
				if($(this).is(':disabled')){
					$(this).next('.selectBox').addClass('disabled');
				}
			}
		}
	});
}


function selectMakeUI(){
	$(document).on("hover",".ui-select-option:first-of-type",function(){
		$(this).closest(".ui-select-options").addClass("ui-select-option-hover");
	}, function(){
		$(this).closest(".ui-select-options").removeClass("ui-select-option-hover");
	});
	$(document).on("click",".ui-select-trigger", function(e){
		if($(this).closest('.disabled').length == 0){
			if (typeof jsCheckDrpOpened    == 'function') jsCheckDrpOpened();
			$('.ui-select-options').not($(this).next()).hide();
			$('.ui-select-trigger').removeClass('active');
			$(this).addClass('active').next().show();
		}else{
			$('.ui-select-options').not($(this).next()).hide();
		}
		return false;
	});
	$(document).click(function(e){
		$('.ui-select-options').hide();
		$('.ui-select-trigger').removeClass('active');
	});
	$(document).on("click",".ui-select-option", function(e){
		var $val= $(this).data("value"),
		$select = $(this).closest(".ui-select-wrapper").find("select");
		if(!$(this).parent().hasClass('disabled')){
			if (typeof jsChangeSelectUi == 'function') {
				var isValid = jsChangeSelectUi($(this));
				if (!isValid) {
					$(this).closest('.ui-select-options').hide();
					$('.ui-select-trigger').removeClass('active');
					return false;
				}
			}
			$select.val($val);
			$(this).addClass("selection").parent().siblings().find(".ui-select-option").removeClass("selection");
			var ths_text = $(this)[0].childNodes[0].textContent;
			
			$(this).closest('.ui-select-options').hide().siblings(".ui-select-trigger").text(ths_text);;
			$('.ui-select-trigger').removeClass('active');
		}
		return false;
	});
}

function tooltip(){
	if($('.tooltipLink').size() != 0){
		$('.tooltipLink').click(function(e){
			e.preventDefault();
		});
		$('.tooltipLink').hover(function(e){
			var $target = $(this).next('.tooltipBox');
			var top = $(this).position().top;
			var left = $(this).position().left;
			$target.show().css({'left':left});
		},function(e){
			var $target = $(this).next('.tooltipBox');
			$target.hide();
		});
		$('.tooltipLink').focus(function(e){
			var $target = $(this).next('.tooltipBox');
			var top = $(this).position().top;
			var left = $(this).position().left;
			$target.show().css({'left':left});
		}).blur(function(){
			var $target = $(this).next('.tooltipBox');
			$target.hide();
		});
	};
	if($('.mark').size() != 0){
		$('.mark').hover(function(e){
			var target = $(this).data('tooltip');
			var top = $(this).position().top;
			var left = $(this).position().left;
			
			$('#'+target).show().css({'left':left});
		},function(e){
			var target = $(this).data('tooltip');
			$('#'+target).hide();
		});
	};
};
// Hide Header on on scroll down 
var didScroll; 
var lastScrollTop = 0; 
var delta = 5; 
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
	didScroll = true; 
});

setInterval(function() { 
	if (didScroll) { 
		hasScrolled();
		didScroll = false; 
	} 
}, 250);

function hasScrolled() {
	var st = $(this).scrollTop(); 
	
	if(Math.abs(lastScrollTop - st) <= delta) 
		return;
	
	if (st > lastScrollTop && st > navbarHeight){ 
	$('header').removeClass('nav-down').addClass('nav-up'); 
	$('.subGnb').removeClass('nav-down1').addClass('nav-up1'); 
	} else { 
		if(st + $(window).height() < $(document).height()) { 
			$('header').removeClass('nav-up').addClass('nav-down'); 
			$('.subGnb').removeClass('nav-up1').addClass('nav-down1'); 
			}
		}
	lastScrollTop = st; 
}


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

$(function(){

	/* ==============================
	 * 실행 
	 * ============================== */
	gnbHeader();
	gnbNone();
	headerM();
	/* ==============================
	 *실행 끝
	 * ============================== */

	
    function gnbHeader(){
        var target = '#header';
        
        $('.nav > ul > li > a').hover(function(){
            $(this).parent().addClass('on').siblings().removeClass('on');
            $('#header').addClass('on');
            if($(this).next('.gnbDepth2').length > 0){
                $('#header .gnbDepth2').not($(this).next('.gnbDepth2')).stop().hide();
                $(this).next('.gnbDepth2').stop().slideDown('fast');
                $('#header .bgDepth').stop().slideDown('fast');
            }else{
                $('#header .bgDepth').stop().slideUp('fast');
                $('#header .gnbDepth2').hide();
            }
        });
        
        $('#header .nav').mouseleave(function(){
            gnbNone();
        });
        
    
    };
    
    function gnbNone(){
		$('#header .nav > ul > li').removeClass('on');
		//$('#header .gnbDepth2').stop().slideUp('fast');
		$('#header .gnbDepth2').hide();
		$('#header .bgDepth').stop().slideUp('fast');
		$('#header').removeClass('on');
	}
    
	function headerM(){
		$(window).scroll(function(){
			var scrollW = $(window).scrollLeft();
			$('#header').css('margin-left',-scrollW);
			$('.subGnb').css('margin-left',-scrollW);
		});
	};
});

