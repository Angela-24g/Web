
		$(function(){
			var txt1 = '예약상품 닫기';
			var txt2 = '예약상품 보기';
			$('.offersList > li .toggleBtn').click(function(e){
				var progress = $('#progress').val();
				 if(progress == "false"){
        		   return false;
        	   }
				var $this = $(this).closest('li');		
				$this.removeClass('off').toggleClass('on');
				$('.offersList > li .toggleBtn').find('span').text(txt2);
				if($this.hasClass('on')){
					$(this).find('span').text(txt1);
					$this.siblings().removeClass('on').addClass('off');
					$('html,body').stop().animate({'scrollTop':$this.offset().top + 200});
				}else{
					$(this).find('span').text(txt2);
					$this.siblings().removeClass('off');
				}
				$('.offersList > li').each(function(){
					if($(this).hasClass('on')){
						$(this).css({height:'auto'});
						$this.find('.offers li:eq(0) > a').trigger('click');
					}else{
						$(this).css({height:231});
					}
				});
				//e.preventDefault();
			});
			$(document).on('click','.offers li > a',function(e){
				var $par = $(this).closest('.offers');
				var $this = $(this).parent();
				$par.find('li').removeClass('on');
				$this.addClass('on');
				$('.offersList > li.on').css({height:'auto'});
			});
		});
	
var eb_msg = '';
function msgpopup(){
	if(eb_msg != '' && $("#extraBed1").is(":checked")){
		alert(eb_msg);
		return false;
	}

	
		$('#noMemberBtn').show();
		layerPopOpen('#loginPop');
	
		
	
	return true;
}


function fnRoomChange(v){
	$('#bedPrice').val(v);
	fnPrice();
}
function fnPrice(){
	$('#pkrw').text(addCommaStr($('#roomPrice').val())+ '원');
	$('#tkrw').text(addCommaStr($('#taxPrice').val())+ '원');
	$('#bkrw').text(addCommaStr($('#bedPrice').val())+ '원');
	$('#okrw').text(addCommaStr($('#optionPrice').val())+ '원');
	var total = (($('#roomPrice').val()*1) + ($('#taxPrice').val()*1) + ($('#bedPrice').val()*1) + ($('#optionPrice').val()*1))+"";
	$('#totalkrw').text(addCommaStr(total));
}

function fnCView(){
	var html = "";
	$.ajax({
		url : "/front/reservation/getWingType"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.data != "") {
					
					for(var i =0; i < data.data.length ; i++){
						html +="<div class='radioBox'>";
						html +="<input type='radio' id='WING"+i+"' name='WING' tabindex='0' value='"+data.data[i].WING+"' onclick='fnTView();' /><label for='WING"+i+"'>"+data.data[i].WING_DESC+"</label>";
						html +="</div> ";
					}
					$('#wingRadio').html(html);
					$('#roomPrice').val(0);
					$('#taxPrice').val(0);
					fnPrice();
				}
			}
		}
	});
}

function fnOptionPrice(){
    var total = 0;
	$("form[name=writeFrm]").find(":input[name^='option']").each(function(index){
        var thisObj = $(this);
        if( thisObj.data('price') != undefined ){
        	total += thisObj.data('price') * thisObj.val();
        	//console.log("가격 : "+thisObj.data('price') +" 인원 : "+thisObj.val() + " 합계가격 : "+ ( thisObj.data('price') * thisObj.val()) );
 		}
    });
	console.log(total);
	$('#optionPrice').val(total);
	fnPrice();
}
function fnTView(){
	var html = "";
	$.ajax({
		url : "/front/reservation/getBedType"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.data != "") {
					
					for(var i =0; i < data.data.length ; i++){
						console.log(data.data[i].BEDTYPE);
						html +="<div class='radioBox' >";
						html +="<input type='radio' id='BEDTYPE"+i+"' name='BEDTYPE' tabindex='0' value='"+data.data[i].BEDTYPE+":"+data.data[i].ATTR7+"' onclick='fnRoomSelect();'/><label for='BEDTYPE"+i+"'>"; 
						if(data.data[i].BEDTYPE == "11"){
							html += "더블";
						}else if(data.data[i].BEDTYPE == "02"){ 
							html += "트윈";
						}else if(data.data[i].BEDTYPE == "01"){ 
							html += "온돌";
						}else if(data.data[i].BEDTYPE == "05"){
							if(data.data[i].ATTR7 == "JSUITE"){ 
								html += "더블";
							}else{
								html += "온돌";
							}
						}else if(data.data[i].BEDTYPE == "04"){
							if(data.data[i].ATTR7 == "DOUBLE"){ 
								html += "더블";
							}else{
								html += "트윈";
							}
							
						}else { 
							html += data.data[i].BEDTYPE_DESC;
						}
						html +="</label></div> ";
					}
					$('#bedRadio').html(html);
					$('#roomPrice').val(0);
					$('#taxPrice').val(0);
					if($(":input:radio[name=WING]:checked").val() == '02'){
						$('._bad').text('소파베드 메이킹');
					}else{
						$('._bad').text('엑스트라 베드');
					}
					fnPrice();
				}
			}
		}
	});
}
function fnRoomSelect(){
	var viewtype = $(":input:radio[name=VIEWTYPE]:checked").val();
	var wing = $(":input:radio[name=WING]:checked").val();
	var bedtype = $(":input:radio[name=BEDTYPE]:checked").val();
	
	if(wing == undefined || bedtype == undefined){
		return false;
	}
	
	$.ajax({
		url : "/front/reservation/getRoomPrice"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				console.log(data);
				if (data.result == "cancel") {
					alert('예약이 가능한 객실이 없습니다.');
				}else if (data.result == "success") {
					if($('#ADULT_CNT').val() == '1'){
						$('#roomPrice').val(data.price[0].A1_AMT);
						$('#taxPrice').val(data.price[0].A1_TAX);
					}else if($('#ADULT_CNT').val() == '2'){
						$('#roomPrice').val(data.price[0].A2_AMT);
						$('#taxPrice').val(data.price[0].A2_TAX);
					}else if($('#ADULT_CNT').val() == '3'){
						$('#roomPrice').val(data.price[0].A3_AMT);
						$('#taxPrice').val(data.price[0].A3_TAX);
					}else if($('#ADULT_CNT').val() == '4'){
						$('#roomPrice').val(data.price[0].A4_AMT);
						$('#taxPrice').val(data.price[0].A4_TAX);
					}else{
						$('#roomPrice').val(data.price[0].A5_AMT);
						$('#taxPrice').val(data.price[0].A5_TAX);
					}
					
					/* 2019.07.09 G1 추가 -- 2019.07.22 반영 */
					var daily_rate = data.DAILY;
					if(daily_rate){
						var adult_cnt = $('#ADULT_CNT').val();
						var len = daily_rate.RATEDATE.length;
						
						var tooltip_text = '';
						var amt = '';
						
						var hidden_str = '';
						for(var i=0;i<len;i++){
							if(adult_cnt == '1'){
								amt = addCommaStr(daily_rate.DAILY_A1_AMT[i].toString());
							}else if(adult_cnt == '2'){
								amt = addCommaStr(daily_rate.DAILY_A2_AMT[i].toString());
							}else if(adult_cnt == '3'){
								amt = addCommaStr(daily_rate.DAILY_A3_AMT[i].toString());
							}else if(adult_cnt == '4'){
								amt = addCommaStr(daily_rate.DAILY_A4_AMT[i].toString());
							}else{
								amt = addCommaStr(daily_rate.DAILY_A5_AMT[i].toString());
							}
							tooltip_text += '<p>'+daily_rate.RATEDATE[i]+' : '+amt+'원</p>';
							hidden_str += '<p>'+daily_rate.RATEDATE[i]+' : '+amt+'원</p>';
							
						}
						$('#DAILY_STR').val(hidden_str);
						$('.daily_rate_tooltip').empty();
						$('.daily_rate_tooltip').append(tooltip_text);
						
					}
					/* 2019.07.09 G1 추가 -- 2019.07.22 반영 */

					fnPrice();
				}
			}
		}
	});
}

$(document).ready(function() {
	$(function(){
		$(document).on("click",".optionSelect .ui-select-option", function(e){
			fnOptionPrice();
		});
	});
});



var viewSeq = "";
function fnMappingView(RP_SEQ, _obj, COMPOSITION){
	$('#progress').val("true");
	$('#PRO_PROGRESS').val(COMPOSITION);
	if(COMPOSITION == 'A'){
	   var STDN = $('#STDN_CNT').val();
	   var CHILD = $('#CHILD_CNT').val();
	   var BABY = $('#BABY_CNT').val();
	   if(STDN != "0" || CHILD != "0" || BABY != "0"){
	      $('#progress').val('false');
	      alert('해당상품은 성인전용 상품입니다.\n 문의사항 RESERVATION : 051-749-2111~3');
	      return false;
	   }        
	}
	if(viewSeq != ''){
		$("#offers"+viewSeq).html("");
		$("#reservationWrap"+viewSeq).html("");
	}
	viewSeq = RP_SEQ;
	if(!$(_obj).parent().parent().hasClass('on')){
		$('#RP_SEQ').val(RP_SEQ);
		$.ajax({
			url : "/front/reservation/getMappingHtml"
	        , method : "post"
	        , async : true
			, data : $("#writeFrm").serialize()
			, success : function(data, stat, xhr) {
				if (stat == "success") {
					if (data != "") {
						var html = data;
						$("#offers"+RP_SEQ).html(html);
						$("#offers"+RP_SEQ).find("li:eq(0) a").click();
						jsSwiperMotion(); //슬라이드 셋팅
					}
				}
			}
		});
	}else{
		$("#offers"+RP_SEQ).html("");
		$("#reservationWrap"+RP_SEQ).html("");
	}
}

function fnOption(SALESTYPE_SEQ, RP_SEQ){
	$('#SALESTYPE_SEQ').val(SALESTYPE_SEQ);
	$("#reservationWrap"+RP_SEQ).html("");
	$.ajax({
		url : "/front/reservation/getOptionHtml"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data != "") {
					var html = data;
					$("#reservationWrap"+RP_SEQ).html(html);
					selectMake(); //셀렉트박스 
					selectMakeUI(); //셀렉트박스 액션
					tooltip(); //툴팁 액션
				}
			}
		}
	});
}/* 20190903 g1 파라미터 추가 */
function fnView(RP_SEQ, RATE_PLAN_TYPE){
	$('#RP_SEQ').val(RP_SEQ);
	$.ajax({
		url : "/front/reservation/getOfferHtml"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data != "") {
					var html = data;
					$("#pop1").html(html);
					/* 20190903 g1추가 */
					if(RATE_PLAN_TYPE == 'C'){
                  $('#select_rp_seq').val(RP_SEQ);
                  jsShowCalendar(RP_SEQ);
               }
				}
			}
		}
	});
}

/* S : 20190903 G1 추가 */
function jsShowCalendar(RP_SEQ){
   //getOfferCalendar
   /*$.ajax({
      method : 'POST'
     , url : '/front/offers/getOfferCalendar'
     , data : "RP_SEQ="+RP_SEQ
     , success : function(data, stat, xhr){
        
        var div_len = $('.roomsPrice').length;
        if(div_len >1){
           for(var i=2;i<=div_len;i++){
              $( '.roomsPrice:nth-child('+i+')' ).empty(); 
           }
        }
        $( '.roomsPrice:nth-child(1) .title' ).empty(); 
        $( '.roomsPrice:nth-child(1) .title' ).append('일별 상세 요금표'); 
        $('.scrollTbl').empty();
        $('.scrollTbl').append(data);
        
     }
   })*/
	var str = '';
	$.ajax({
	   type : 'POST'
	 , url : '/front/offers/getOfferCalendarSize'
	 , data : "RP_SEQ="+RP_SEQ
	 , async : false
	 , success : function (data, stat, xhr){
	    console.log(data); 
	    var cnt = data.CNT;
	    if(cnt > 0){
	 	   str = '';
	    }else{
	 	   var re_date = data.RE_DATE;
	 	   str = re_date.split('.')[0]+'.' + re_date.split('.')[1];
	    }
	   }
	});

	
	$.ajax({
      method : 'POST'
     , url : '/front/offers/getOfferCalendar'
     , data : "RP_SEQ="+RP_SEQ+"&today_text="+str
     , success : function(data, stat, xhr){
        console.log('calendar');
        var div_len = $('.roomsPrice').length;
        if(div_len >1){
           for(var i=2;i<=div_len;i++){
              $( '.roomsPrice:nth-child('+i+')' ).empty(); 
           }
        }
        $( '.roomsPrice:nth-child(1) .title' ).empty(); 
        $( '.roomsPrice:nth-child(1) .title' ).append('일별 상세 요금표'); 
        $('.scrollTbl').empty();
        $('.scrollTbl').append(data);
        
     }
   })
	   
	return false;
}
$(document).on('click', '.price_next', function(){
   calendar_change('next', 'DATE');
});
$(document).on('click', '.price_prev', function(){
   calendar_change('prev', 'DATE');
});

function calendar_change(type, change_type){
   var today_text = $('.today').text();
   var RP_SEQ = $('#RP_SEQ').val();
   var search_type = $('#SEARCH_TYPE').val();
   var search_view = $('#SEARCH_VIEW').val();
   var search_type_text = $("#SEARCH_TYPE option:checked").text();
   var view_type_text = $("#SEARCH_VIEW option:checked").text();
   $.ajax({
      method : 'POST'
     , url : '/front/offers/getOfferCalendar'
     , data : "RP_SEQ="+RP_SEQ+"&type="+type+"&today_text="+today_text+"&SALESTYPE_SEQ="+search_type+"&VIEWTYPE="+search_view+"&CHANGE_TYPE="+change_type
     , async : false
     , success : function(data, stat, xhr){
       
        var div_len = $('.roomsPrice').length;
        $('.scrollTbl').empty();
        $('.scrollTbl').append(data);
        $('#SEARCH_TYPE').val(search_type);
        $('#SEARCH_VIEW').val(search_view);
   
        $('.active_title').empty();
        $('.active_title').append(search_type_text);
        $('.active_title_view').empty();
        $('.active_title_view').append(view_type_text);
     }
   });
}

function search_type_change(){
   var search_type = $('#SEARCH_TYPE').val();
   var search_view = $('#SEARCH_VIEW').val();
   var RP_SEQ = $('#RP_SEQ').val();
   
   $.ajax({
      type : 'POST'
     , url : '/front/offers/search_type_chagne'
     , data : "RP_SEQ="+RP_SEQ+"&SALESTYPE_SEQ="+search_type
     , async : false
     , success : function(data, stat, xhr){
       
        var mapping = data.MAPPING.data;
        if(mapping){
           var text = '';
           var str = '';
           var li_text = '';
           for(var i=0;i<mapping.length;i++){
              if(i==0){
                 str = 'selected';
              }else{
                 str = '';
              }
              text += '<option value="'+mapping[i].RMTYPE_RPT1+'" '+str+'>'+mapping[i].RMTYPE_RPT1_DESC+'</option>';
              li_text += "<li class='' onclick=mapping_select_change('"+mapping[i].RMTYPE_RPT1+"')><a href='#' class='ui-select-option' data-value=''>"+mapping[i].RMTYPE_RPT1_DESC+"</a></li>";
           }
           $('#SEARCH_VIEW').empty();
           $('#SEARCH_VIEW').append(text);     
           
           $('.view_select_div .ui-select-options').empty();
           $('.view_select_div .ui-select-options').append(li_text);
           
           calendar_change('', '');
        }
     }
   })
}
function mapping_select_change(val){
   $('#SEARCH_TYPE').val(val);   
   search_type_change();
}

function view_select_change(val){   
   $('#SEARCH_VIEW').val(val);
   calendar_change('','');
}
/* E : 20190903 G1 추가 */

function fnSumPerson(t, id){
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
	var cnt = ($('#SEARCH_ADULT').val()*1) + ($('#SEARCH_STDN').val()*1) + ($('#SEARCH_CHILD').val()*1) + ($('#SEARCH_BABY').val()*1);
	
	if(cnt > 4){
		alert("객실은 최대 4인까지 수용 가능합니다.");
		var html = "<select class='selectBox' name='"+ id + "' id='"+ id + "'>";
		if(t !="adultType"){
			html += "<option value='0'>"+ text +"0</option>";
		}
		html += "<option value='1'>"+ text +"1</option>";
		html += "<option value='2'>"+ text +"2</option>";
		if(t =="adultType"){
			html += "<option value='3'>"+ text +"3</option>";
		}
		html += '</select>';
		$('.'+t+' > dd').html(html);
		selectMake();
	}
}

function fnSearch(){
	if($('#SEARCH_P_CODE').val() != '' && $('#SEARCH_P_SEQ').val() == ''){
		alert('프로모션을 선택해주세요');
		return false;
	}
	
	if($('#SEARCH_P_CODE').val() == '' && $('#SEARCH_P_SEQ').val() != ''){
		alert('프로모션코드를 입력해주세요');
		return false;
	}
	if($('#TODATE').val() == ''){
		alert('체크인 & 체크아웃 날짜를 선택하여 주시기 바랍니다.');
		return false;
	}
	$('#PAGE').val("1");
	$('#searchFrm').submit();
}

function fnReservation(){
	if($(":input:radio[name=BEDTYPE]:checked").val() == undefined || $(":input:radio[name=WING]:checked").val() == undefined || $(":input:radio[name=VIEWTYPE]:checked").val() == undefined ){
		alert('객실을 선택하여 주시기 바랍니다.');
		return false;
	}
	$.ajax({
		url : "/front/reservation/step1Proc"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.result == "success") {
					$('#writeFrm').submit();
				}else{
					alert('예약이 가능한 객실이 없습니다.');
				}
			}
		}
	});
}

function jsLogin() {
	var genURL = "";
	var sslURL = "";
	
	var USER_ID = $('#USER_ID').val();
	USER_ID = USER_ID.trim();
	$('#USER_ID').val(USER_ID);
	
	if ($('#USER_ID').val() == null || $('#USER_ID').val() == "") {
		alert("아이디를 입력해 주세요.");
		$('#USER_ID').focus();
	} else if ($('#USER_PWD').val() == null || $('#USER_PWD').val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$('#USER_PWD').focus();
	} else {
		$.ajax({
			url : sslURL + '/front/loginProc'
	        , method : "post"
			, data : $('#loginFrm').serialize()
			, success : function(data, stat, xhr) {
				if($("#USER_ID").val() == ""){
               $("#USER_ID").val(USER_ID);
            }
				if (data.result != null) {
					if (data.result == "success") {
						if (data.pwd_chg_yn != null && data.pwd_chg_yn == "Y") {
							alert("비밀번호 변경 후 6개월이 경과되었습니다.\n비밀번호 재설정을 위한 화면으로 이동합니다.");
							document.location.href = genURL + "/auth/front/mypage/validationPwd";
						} else {
							alert("로그인 되었습니다.");
							location.reload();
						}
					} else if( data.result == "info") {
						alert("해당 아이디로 로그인 할 수 없습니다. 회원관리과 051-749-2200 (월~금 09:00~18:00 / 공휴일 제외)로 문의바랍니다.");
					} else if( data.result == "dormant") {
						alert("휴면회원입니다. 계속 이용하시려면 인증후 이용 가능합니다.");
						location.href = '/front/member/human';
					} else if(data.result == "passChange"){ /*20190926 G1 추가 */
                  $('#passChangePop').addClass('on');
					} else {
						if (data.pwd_err_cnt != null && data.pwd_err_cnt >= 5) {
							alert("비밀번호 5회 오류입니다.\n보안상 로그인을 제한합니다.\n[비밀번호찾기]에서 비밀번호를 재발급 받으세요.");
							location.reload();
						} else {
							alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
						}
					}
				} else {
					alert("Login을 처리하는데 실패하였습니다.");
				}
			}
		});
	}
}
function fnMemberLogin(COMPOSITION){
	$('#PRO_PROGRESS').val(COMPOSITION);
	$('#progress').val('true');
	if(COMPOSITION == 'A'){
		var STDN = $('#STDN_CNT').val();
	   var CHILD = $('#CHILD_CNT').val();
	   var BABY = $('#BABY_CNT').val();
	   if(STDN != "0" || CHILD != "0" || BABY != "0"){
	      $('#progress').val('false');
	      alert('해당상품은 성인전용 상품입니다.\n 문의사항 RESERVATION : 051-749-2111~3');
	      return false;
	   }        
   }
	$('#noMemberBtn').hide();
	layerPopOpen('#loginPop');
}

function redirectToJoin() {
	 window.location.href="/front/member/joinStep1";
}

function init(){
	console.info(true);
	
		
	

}

$(document).ready(function() {
	$('#TODT').val($('#TODATE').val());
	$('#FROMDT').val($('#FROMDATE').val());
	$('#TODT').val($('#TODATE').val());
	$('#ADULT_CNT').val($('#SEARCH_ADULT').val());
	$('#STDN_CNT').val($('#SEARCH_STDN').val());
	$('#CHILD_CNT').val($('#SEARCH_CHILD').val());
	$('#BABY_CNT').val($('#SEARCH_BABY').val());
	$('#BABY_CNT').val($('#SEARCH_BABY').val());
	$('#PRO_SEQ').val($('#SEARCH_P_SEQ').val());
	$('#PRO_CODE').val($('#SEARCH_P_CODE').val());

	$(function(){
		$(document).on("click",".adultType .ui-select-option", function(e){
			fnSumPerson('adultType', 'SEARCH_ADULT');
		});
		$(document).on("click",".stdnType .ui-select-option", function(e){
			fnSumPerson('stdnType','SEARCH_STDN');		
		});
		$(document).on("click",".childType .ui-select-option", function(e){
			fnSumPerson('childType', 'SEARCH_CHILD');
		});
		$(document).on("click",".babyType .ui-select-option", function(e){
			fnSumPerson('babyType', 'SEARCH_BABY');
		});
		
		$(document).on('change', '#TODATE', function() {
		  if($('#TODATE').val() == $('#FROMDATE').val()){
			  alert('체크인과 체크아웃은 동일한 날짜로 설정하실 수 없습니다');
			  $('#TODATE').val('');
			  $('#FROMDATE').val('')
			  $('#textCal').val('')
		  }
		});
		
		init();
	}); 
});
