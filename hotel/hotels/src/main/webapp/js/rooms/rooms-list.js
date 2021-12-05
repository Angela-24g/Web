$(function(){
	jsSwiperMotion();
	layerpopup();
	tapBox(); 
	tapInnerBox();

//	/* 이벤트view가기 */
//	function jsView(P_SEQ) {
//		$("#P_SEQ").val(P_SEQ);
//		$("#form1").attr("action", "/front/event/eventView");
//		$("#form1").submit();
//	}
	
	/* 탭박스 add클래스,remove클래스: on */
	function tapBox(){
			$(".tabView:eq(0)").show();
			$('.tapBox li a').click(function(){
				if($(this).closest('.tapBox').siblings('.tapView').length){
					var idx = $(this).parent().index();
					$(this).parent().addClass('on').siblings().removeClass('on');
					$(this).closest('.tapBox').siblings('.tapView').eq(idx).addClass('on').siblings('.tapView').removeClass('on');
					return false;
				}
			});		
	};
	function tapInnerBox(){
		$('.innerTab li a').click(function(){
			if($(this).closest('.innerTab').siblings('.tapView').length){
				var idx = $(this).parent().index();
				$(this).parent().addClass('on').siblings().removeClass('on');
				$(this).closest('.innerTab').siblings('.tapView').eq(idx).addClass('on').siblings('.tapView').removeClass('on');
				return false;
			}
		});	
	};
	
	/*	팝업창:도면  */
	if($('#main').length != 0){
		Main();
		$(document).on('click','.mainPop .btnPopClose',function(e){
			$('.mainPop').hide();
			e.preventDefault();
		});
	}
	if($('.subMain').length != 0){
		subMain();
	}
	
	function autoHeight(){
		var len = [];
		$('.spreadWrap .swiperWrap .slick-slide').each(function(){
			len.push($(this).height());
		})
		
		$('.spreadWrap .swiperWrap .slick-slide div.txt').css('height',Math.max.apply(null,len));
	}
	
	function layerPopOpen(target){
		var winH = $(window).outerHeight(),popH;
		var cont = $(target).find('.layerPopCont');
		$(target).addClass('on');
		popContposition();
		$(window).resize(function(){popContposition();});
		
		function popContposition(){
			popH = cont.outerHeight();
			winH = $(window).outerHeight();
			if(popH > winH){
				cont.css({'top':'0','margin-top':0});
			}else{
				cont.css({'top':'50%','margin-top':-popH/2});
			}	
		}
		console.log('layerPopOpen');
		$('body').addClass('hidden');
	}
	
	function layerpopup(){
		$('.layerPopOpen').click(function(e){
			var href = $(this).attr('href');
			if(href != '#'){
				layerPopOpen(href);
				$('.layerPopWrap').scrollTop(0);
			}
			e.preventDefault();
		});
		layerPopClose();
	}
	
	function layerPopClose(){
		$(document).on('click','.btnPopClose, .layerPopWrap .bg',function(){
			$(this).closest('.layerPopWrap').removeClass('on');
			$('body').removeClass('hidden');
			return false;
		});
	}
	
	/* 이미지slick */
	function jsSwiperMotion(){
		$('.jsSwiperMotion .swiperWrap').each(function(){
			var $par = $(this).closest('.spreadWrap');
			var target = $(this),
			ul = target.find('ul'),
			list = ul.find('li'),
			bnt_left = target.closest('.jsSwiperMotion').find('.btnLeft'),
			bnt_right = target.closest('.jsSwiperMotion').find('.btnRight'),
			number = target.closest('.jsSwiperMotion').find('.swiperArrow .number'),
			show = 1,
			toScroll=1,
			dot = true;
			
			target.data('show') ? show = target.data('show') : show;
			target.data('toscroll') ? toScroll = target.data('toscroll') : toScroll = show;
			
			
			if(target.closest('.jsSwiperMotion').hasClass('type2')){
				number.find('span').text(' / ' + Math.ceil(list.length/show));
				ul.on("afterChange", function(event, slick, currentSlide){
					target.find('.swiperArrow .number em').text(currentSlide/show +1);
				});
				target.css('height','auto');
				
				dot = false;
			}
			
			ul.slick({
				prevArrow: bnt_left,
				nextArrow: bnt_right,
				infinite: false,
				slidesToShow: show,
				slidesToScroll: toScroll,
				dots: dot
			});
			
			target.closest('.jsSwiperMotion').show();
			
			if(target.hasClass('imageWrap')){
				ul.on("beforeChange", function(event, slick, currentSlide){
					target.children('.textBox').find('> div').removeClass('on');
				});
				
				ul.on("afterChange", function(event, slick, currentSlide){
					target.children('.textBox').find('> div').eq(currentSlide).addClass('on');
				});
			};
			
			if($par.length > 0){
				setTimeout(function(){autoHeight();},100);
			}
			
			//console.log(list.length/show)
			if(list.length/show <= 1){
				target.next().hide();
			};
		});
	};
});

