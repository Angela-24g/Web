$(function(){
	if($(".contents .lifestyle-slick li").length==1){
		$(".contents .lifestyle-slick").slick({	
			infinite: true,
			speed: 300,
			slidesToShow: 1,
			adaptiveHeight: true});
	}else{
		$(".contents .lifestyle-slick").slick({	
			dots: true,
			infinite: true,
			speed: 300,
			slidesToShow: 1,
			adaptiveHeight: true});
	}
	if($(".incFacility .lifestyle-slick li").length > 4){
		$(".incFacility .lifestyle-slick").slick({	
			dots: true,
			infinite: true,
			speed: 300,
			slidesToShow: 2,
			slidesToScroll: 2,
			adaptiveHeight: true});
	}
});
	