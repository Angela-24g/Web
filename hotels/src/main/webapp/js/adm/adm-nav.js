$(function(){
	$(".adm_menu_box").mouseover(function(){
		$(".fc_menu").removeClass('on');
		$(this).children('.fc_menu').addClass('on');
	}).mouseleave(function(){
		$(".fc_menu").removeClass('on');
	})
})