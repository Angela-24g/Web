

$(function(){

	/* ==============================
	 * 실행 
	 * ============================== */

	headerM();
	gnbHeader();
	subMainVisual();
	
	/* ==============================
	 *실행 끝
	 * ============================== */

	
    function gnbHeader(){
        var target = '#header';
        
        $('.nav .nav_menu > ul > li > a').hover(function(){
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
		$('#header .nav .nav_menu > ul > li').removeClass('on');
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
	
	function subMainVisual(){
		var winH = $(window).outerHeight(),
			headerH =  $('#headerWrap').outerHeight(),
			subGnbH = $('.subGnb').outerHeight(),
			target = $('.subMain .visual'),
			img = target.find('.img > div'),
			btnLeft = target.find('.btnArrowLeft'),
			btnRight = target.find('.btnArrowRight'),
			idx = 0,
			length = img.length -1,
			check = true,
			ease = "easeInOutQuint",
			time = 1000;
		
		target.css('height',winH-headerH-subGnbH);
		$('.subGnb').addClass('type2');
		
		if(length == 0){
			btnLeft.hide();
			btnRight.hide();
		}
		
		btnLeft.click(function(){
			if(check){
				check = false;
				target.find('.img > div').eq(idx).animate({'left':'100%'},time,ease);
				idx >= length ? idx = 0 : idx++;
				target.find('.img > div').eq(idx).css('left','-100%').animate({'left':'0%'},time,ease,function(){
					check = true;
				});
				
				target.find('.textWrap .textBox').fadeOut().eq(idx).delay(500).fadeIn();
			}
			return false;
		});
		
		btnRight.click(function(){
			if(check){
				check = false;
				target.find('.img > div').eq(idx).animate({'left':'-100%'},time,ease);
				idx <= 0 ? idx = length : idx--;
				target.find('.img > div').eq(idx).css('left','100%').animate({'left':'0%'},time,ease,function(){
					check = true;
				});
				target.find('.textWrap .textBox').fadeOut().eq(idx).delay(500).fadeIn();
			}
			return false;
		});
	};
});
