function addCommaStr(str) {
	var num = "";
	var sign = "";

	if (str.charAt(0) == "+" || str.charAt(0) == "-") {
		sign = str.charAt(0);
		str = str.substr(1);
	}

	var index = str.indexOf('.');

	if (index != -1) {
		num = str.substr(index);
	} else {
		index = str.length;
	}

	for (var i = index - 3; i > 0; ) {
		num = ',' + str.substr(i, 3) + num;

		index = i;
		i -= 3;
	}

	num = sign + str.substr(0, index) + num;

	return	num;
}
function fnReservation(){
	if($(":input:radio[name=room_bedtype]:checked").val() == undefined || $(":input:radio[name=room_location]:checked").val() == undefined || $(":input:radio[name=room_view]:checked").val() == undefined ){
		alert('객실을 선택하여 주시기 바랍니다.');
		return false;
	}

	$('#writeFrm').submit();
}
//옵션 블럭에만 들어가는 스크립트.
//var eb_msg = ''; //어디에 있는지 확인해야 함
function msgpopup() {
//	if (eb_msg != '' && $("#extraBed1").is(":checked")) {
//		alert(eb_msg);
//		return false;
//	}
	fnReservation();
	return true;
}
function fnRoomChange(v) {
	$('#bedPrice').val(v);
	fnPrice();
}
function fnPrice() {
	$('#pkrw').text(addCommaStr($('#roomPrice').val()) + '원');
	$('#tkrw').text(addCommaStr($('#taxPrice').val()) + '원');
	$('#bkrw').text(addCommaStr($('#bedPrice').val()) + '원');
	$('#okrw').text(addCommaStr($('#optionPrice').val()) + '원');
	$('#totalPrice').val((($('#roomPrice').val() * 1) + ($('#taxPrice').val() * 1) + ($('#bedPrice').val() * 1) + ($('#optionPrice').val() * 1)) + "");
	$('#totalkrw').text(addCommaStr($('#totalPrice').val()));
}

$(document).ready(
	function () {//날짜선택
		$("#check_in")
			.datepicker(
				{
				monthNames: ['1월', '2월', '3월', '4월',
					'5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월',
					'5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금',
					'토'],
				dayNamesShort: ['일', '월', '화', '수', '목',
					'금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목',
					'금', '토'],
				dateFormat: 'yy-mm-dd',
				showMonthAfterYear: true,
				yearSuffix: '년',
				minDate: 0,
				maxDate: '+60d',
				numberOfMonths: 2,
				onSelect: function (selected) {
					$("#check_out").datepicker("option",
						"0", selected)//$("#check_out").datepicker("option", "minDate", selected)
				}
			});
	$("#check_out")
		.datepicker(
			{
				monthNames: ['1월', '2월', '3월', '4월',
					'5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월',
					'5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금',
					'토'],
				dayNamesShort: ['일', '월', '화', '수', '목',
					'금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목',
					'금', '토'],
				dateFormat: 'yy-mm-dd',
				showMonthAfterYear: true,
				yearSuffix: '년',
				minDate: 1,
				maxDate: '+60d',
				numberOfMonths: 2,
				onSelect: function (selected) {
					$("#check_in").datepicker("option",
						"+60d", selected)//$("#check_in").datepicker("option", "maxDate", selected)
				}
			});
});

$(function () {//예약상품 보기&닫기버튼 활성&비활성
var txt1 = '예약상품 닫기';
var txt2 = '예약상품 보기';
$('.offersList > li .toggleBtn').click(function (e) {
	var progress = $('#progress').val();
	if (progress == "false") {
		return false;
	}
	var $this = $(this).closest('li');
	$this.removeClass('off').toggleClass('on');
	$('.offersList > li .toggleBtn').find('span').text(txt2);
	if ($this.hasClass('on')) {
		$(this).find('span').text(txt1);
		$this.siblings().removeClass('on').addClass('off');
		$('html,body').stop().animate({ 'scrollTop': $this.offset().top + 200 });
	} else {
		$(this).find('span').text(txt2);
		$this.siblings().removeClass('off');
	}
	$('.offersList > li').each(function () {
		if ($(this).hasClass('on')) {
			$(this).css({ height: 'auto' });
			$this.find('.offers li:eq(0) > a').trigger('click');
		} else {
			$(this).css({ height: 231 });
		}
	});
	//e.preventDefault();
});
$(document).on('click', '.offers li > a', function (e) {
	var $par = $(this).closest('.offers');
	var $this = $(this).parent();
	$par.find('li').removeClass('on');
	$this.addClass('on');
	$('.offersList > li.on').css({ height: 'auto' });
	});
});

var viewSeq = "";
function fnMappingView(rezAdm_no, _obj, composition) {
	$('#progress').val("true");
	$('#pro_progress').val(composition);
	$("#title").val($(_obj).siblings('strong').text());
	if (composition == 'A') {//상품이 성인전용인경우
		var elementary = $('#count_elementary').val();
		var child = $('#count_child').val();
		var baby = $('#count_baby').val();
		if (elementary != "0" || child != "0" || baby != "0") {
			$('#progress').val('false');
			alert('해당상품은 성인전용 상품입니다.\n 문의사항 RESERVATION : 000-000-000~9');
			return false;
		}
	}
	if (viewSeq != '') {//이 메서드를 한번이상 사용하고 다시 사용시 html 를 비워줌
		$("#offers" + viewSeq).html("");
		$("#rsvWrap" + viewSeq).html("");
	}
	viewSeq = rezAdm_no;
	if (!$(_obj).parent().parent().hasClass('on')) {//상품을 선택한 경우 mapping(type)을 불러옴
		$('#rezAdm_no').val(rezAdm_no);
		$.ajax({
			url: "/reservation/rsv-mapping"
			, method: "post"
			, async: true
			, data: $("#writeFrm").serialize()
			, success: function (data, stat, xhr) {
				if (stat == "success") {
					if (data != "") {
						var html = data;
						$("#offers" + rezAdm_no).html(html);
						$("#offers" + rezAdm_no).find("div a:eq(0)").click();//fnOption 실행
						//jsSwiperMotion(); //슬라이드 셋팅
					}else {
						alert('예약 가능한 방이 없습니다.');
					}
				}
			}
		});
	} else {
		$("#offers" + rezAdm_no).html("");
		$("#rsvWrap" + rezAdm_no).html("");
	}
}
function fnOption(roomType_no, rezAdm_no, _obj) {//mapping(type)에서 선택한 경우 맞는 옵션을 불러옴
	//a 태그들을 on 클래스를 먼저 지워주고
	if ($(".rsvtype a").hasClass('on')){
			$(".rsvtype a").removeClass("on")
	}
	//선택한 얘만 on 생성
	$(_obj).addClass("on")
	$('#roomType_no').val(roomType_no);
	$("#rezAdmRoomType_title").val($("#type_tit"+roomType_no).text());
	$("#rezAdmRoomType_benefit").val($("#type_content"+roomType_no).html());
	$("#rsvWrap" + rezAdm_no).html("");
	$.ajax({
		url: "/reservation/rsv-option"
		, method: "post"
		, async: true
		, data: $("#writeFrm").serialize()
		, success: function (data, stat, xhr) {
			if (stat == "success") {
				if (data != "") {
					var html = data;
					$("#rsvWrap" + rezAdm_no).html(html);
					selectMake(); //셀렉트박스 
					selectMakeUI(); //셀렉트박스 액션
					tooltip(); //툴팁 액션
				}
			}
		}
	});
}

//'뷰' 라디오버튼에 있는 함수
function fnCView(){
	var html = "";
	//serialize() 는 JSON 객체가 아닌 "room_type_no=1" 이런식의 쿼리문으로 넘어간다.
	//그래서 받는측이 @RequestBody 이 아닌 @RequestParam 다!(쿼리문으로 받을때처럼 생략도 가능)
	//참조변수의 변수(ex.RoomDetail의 roomType 참조변수) 도 받을 수 있다.(name = roomType.no)
	$.ajax({
		url : "/reservation/rsv-view"
      , method : "post"
      , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data != null) {
					//'위치' 라디오버튼 활성화
					for(var i =0; i < data.length ; i++){
						html +="<div class='radioBox'>";
						html +="<input type='radio' id='LOCATION"+i+"' name='room_location' tabindex='0' value='"+data[i]+"' onclick='fnTView();' /><label for='LOCATION"+i+"'>"+data[i] +"</label>";
						html +="</div> ";
					}
					$('#locationRadio').html(html);
					$('#roomPrice').val(0);
					$('#taxPrice').val(0);
					fnPrice();
				}
			}
		}
	});
}
//'위치' 라디오버튼에 있는 함수
function fnTView(){
	var html = "";
	$.ajax({
		url : "/reservation/rsv-location"
      , method : "post"
      , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data != null) {
					for(var i =0; i < data.length ; i++){
						html +="<div class='radioBox' >";
						html +="<input type='radio' id='BEDTYPE"+i+"' name='room_bedtype' tabindex='0' value='"+data[i]+"' onclick='fnRoomSelect(this);'/><label for='BEDTYPE"+i+"'>"; 
						html += data[i];
						html +="</label></div> ";
					}
					$('#bedRadio').html(html);
					$('#roomPrice').val(0);
					$('#taxPrice').val(0);
					fnPrice();
				}
			}
		}
	});
}

//'베드타입' 라디오버튼에 있는 함수
function fnRoomSelect(_obj){
	var viewtype = $(":input:radio[name=room_view]:checked").val();
	var location = $(":input:radio[name=room_location]:checked").val();
	var bedtype = $(":input:radio[name=room_bedtype]:checked").val();
	if(location == undefined || bedtype == undefined){
		return false;
	}
	$.ajax({
		url : "/reservation/rsv-bedtype"
    , method : "post"
    , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if(data.price_product==0){
					alert("품절된 객실입니다.");
					 $(_obj).attr("checked", false);
					return false;
				}
				//console.log(data);
				$('#roomPrice').val(data.price_product);
				$('#taxPrice').val(data.price_service);
				$('#roomdetail_no').val(data.roomdetail_no);
				$('#optionPrice').val(0);
				
				fnPrice();
				
			}
		}
	});
}
$(document).ready(function () {
	//검색 기본값셋팅 - Reservation 객체에 넣을 값
	$('#date_start').val($('#check_in').val());
	$('#date_end').val($('#check_out').val());
	$('#room_count').val($('#search_room_type').val());
	$('#count_adult').val($('#search_abult').val());
	$('#count_elementary').val($('#search_elementary').val());
	$('#count_child').val($('#search_child').val());
	$('#count_baby').val($('#search_baby').val());
	
	$(function(){//클릭시 선택한 값을 계산할 fnSumPerson실행
		$(document).on("click","#search_abult", function(e){
			fnSumPerson('adultType', 'search_abult');
		});
		$(document).on("click","#search_elementary", function(e){
			fnSumPerson('stdnType','search_elementary');
		});
		$(document).on("click","#search_child", function(e){
			fnSumPerson('childType', 'search_child');
		});
		$(document).on("click","#search_baby", function(e){
			fnSumPerson('babyType', 'search_baby');
		});
	}); 
});
//인원 체크시 text 변화 및 4인만 받기
function fnSumPerson(t, id){//받은 값을 구분
	var text = "";
	if(t =="adultType"){
		text = "성인 ";
	}else if(t =="stdnType"){
		text = "초등학생 ";
	}else if(t =="childType"){
		text = "어린이 ";
	}else{
		text = "유아 ";
	}
	var cnt = ($('#search_abult').val()*1) + ($('#search_elementary').val()*1) + ($('#search_child').val()*1) + ($('#search_baby').val()*1);
	
	if(cnt > 4){//5인 이상인 경우 alert
		alert("객실은 최대 4인까지 수용 가능합니다.\n 현재선택인원 :"+cnt);
		//html시작
		var html = "<select class='selectBox' name='"+ id + "' id='"+ id + "'>";
		if(t !="adultType"){
			html += "<option value='0' selected>"+ text +"0</option>";
		}
		html += "<option value='1'>"+ text +"1</option>";
		html += "<option value='2'>"+ text +"2</option>";
		if(t =="adultType"){
			html += "<option value='3'>"+ text +"3</option>";
		}
		html += '</select>';
		$('.'+t+' > dd').html(html);
		//선택해제
		$(".selectBox option").prop("selected", false);
	
	}
}