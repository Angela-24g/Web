$(function(){
	tapBox(); 
	tapInnerBox();
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
	$('.facilityVisual').slick({
		dots: true,
		infinite: true,
		speed: 300,
		slidesToShow: 1,
		adaptiveHeight: true
	});
	$('.eventSlider').slick({
		dots: true,
		infinite: true,
		speed: 900,
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 3,
		adaptiveHeight: true
	});
})

