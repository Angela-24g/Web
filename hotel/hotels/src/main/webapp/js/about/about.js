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
})