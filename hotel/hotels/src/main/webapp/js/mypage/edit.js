$(function(){
	regexpForm();
});

/* 스페이스바 방지 */
function checkSpacebar(){
	var kcode = event.keyCode;
	
	//keyCode 32번이 스페이스바
	if(kcode == 32) {
		event.returnValue = false;
	}
	
}

var isId = false;
var isPass = false;
var isPass2 = false;
var isName = false;
var isName_eng1 = false;
var isName_eng2 = false;
//var isBirth = false;
var isTel = false;
var isAddress = false;
var isId2 = false;

function regexpForm(){
	
	/* 초점 블러시 에러메시지 숨김 */
	$('input').on('blur',function(){
		$('.errorText').each(function(){
			$(this).css({
				'display':"none"
			});
		});
	});
	
	
	
	var pw
	/* 비밀번호 유효성 검사 */
	$("#pw").on('keyup',function(){
		 pw = $(this).val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-zA-Z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		 document.querySelector('.errorText').style.display ="none";
		 
		 if(pw.length < 8 || pw.length > 20){
			 msg = "8자리 ~ 20자리 이내로 입력해주세요.";
			 document.querySelector('.pw1 > .errorText').style.display = "block";
			 document.querySelector('.pw1 > .errorText').innerHTML = msg;
			 isPass = false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){//포함 안되었으면 에러메시지
			 msg = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";
			 document.querySelector('.pw1 > .errorText').style.display = "block";
			 document.querySelector('.pw1 > .errorText').innerHTML = msg;
			 isPass = false;
		 }else {
			 document.querySelector('.pw1 > .errorText').style.display = "none";
			 isPass = true;
		 }
	});
	$("#pw2").on('keyup',function(){
		var pw2 = $(this).val();
		
		if(pw2 != pw){
			msg = "비밀번호가 일치하지 않습니다.";
			document.querySelector('.pw2 > .errorText').style.display = "block";
			document.querySelector('.pw2 > .errorText').innerHTML = msg;
			isPass2 = false;
		}else {
			document.querySelector('.pw2 > .errorText').style.display = "none";
			isPass2 = true;
		}
	});
	
	/* 한글이름 유효성 검사 */
	$("#name").on('keyup',function(){
		var name = $(this).val();
		var num = name.search(/[0-9]/g);
		var eng = name.search(/[a-z]/ig);
		var spe = name.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		 document.querySelector('.errorText').style.display ="none";
		 
		 if(name.length < 2){
			 msg = "2자리 이상 입력해주세요.";
			 document.querySelector('.nameType1 .errorText').style.display = "block";
			 document.querySelector('.nameType1 .errorText').innerHTML = msg;
			 isName = false;
		 }else if(num >= 0 || eng >= 0 || spe >= 0 ){
			 msg = "특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력해주세요.";
			 document.querySelector('.nameType1 .errorText').style.display = "block";
			 document.querySelector('.nameType1 .errorText').innerHTML = msg;
			 isName = false;
		 }else {
			 document.querySelector('.nameType1 .errorText').style.display = "none";
			 isName = true;
		 }
	});
	/* 이름(영어) 유효성 검사 */
	$("#first_name").on('keyup',function(){
		var name_eng = $(this).val();
		
		var num = name_eng.search(/[0-9]/g);
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var spe = name_eng.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		
		document.querySelector('.errorText').style.display ="none";
		
		if(name_eng.length < 2){
			msg = "2자리 이상 입력해주세요.";
			document.querySelector('.nameType2 .errorText').style.display = "block";
			document.querySelector('.nameType2 .errorText').innerHTML = msg;
			isName_eng1 = false;
		}else if(num >= 0 || spe >= 0 || check.test(name_eng)){
			msg = "특수문자,한글,숫자는 사용할수 없습니다. 영어만 입력해주세요.";
			document.querySelector('.nameType2 .errorText').style.display = "block";
			document.querySelector('.nameType2 .errorText').innerHTML = msg;
			isName_eng1 = false;
		}else {
			document.querySelector('.nameType2 .errorText').style.display = "none";
			isName_eng1 = true;
		}
	});
	$("#last_name").on('keyup',function(){
		var name_eng2 = $(this).val();
		
		var num = name_eng2.search(/[0-9]/g);
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var spe = name_eng2.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		
		document.querySelector('.errorText').style.display ="none";
		
		if(name_eng2.length < 2){
			msg = "2자리 이상 입력해주세요.";
			document.querySelector('.nameType2 .errorText').style.display = "block";
			document.querySelector('.nameType2 .errorText').innerHTML = msg;
			isName_eng2 = false;
		}else if(num >= 0 || spe >= 0 || check.test(name_eng2)){
			msg = "특수문자,한글,숫자는 사용할수 없습니다. 영어만 입력해주세요.";
			document.querySelector('.nameType2 .errorText').style.display = "block";
			document.querySelector('.nameType2 .errorText').innerHTML = msg;
			document.querySelector('.nameType2 .errorText').innerHTML = msg;
			isName_eng2 = false;
		}else {
			document.querySelector('.nameType2 .errorText').style.display = "none";
			isName_eng2 = true;
		}
	});
	var year;
	var month;
	var day;
	// 생일 유효성 검사 
	$("#birth").on('keyup',function(){
			var dateStr = $(this).val();
		    year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 연도 가져옴
		    
			var msg = "유효하지 않은 생년월일입니다.";
		    if (1900 > year || year > yearNow){
		    	document.querySelector('.birthday .errorText').style.display = "block";
		    	$('.birthday .errorText').html(msg);
		    	isBirth = false;
		    }else if (month < 1 || month > 12) {
		    	document.querySelector('.birthday .errorText').style.display = "block";
		    	$('.birthday .errorText').html(msg);
		    	isBirth = false;
		    
		    }else if (day < 1 || day > 31) {
		    	document.querySelector('.birthday .errorText').style.display = "block";
		    	$('.birthday .errorText').html(msg);
		    	isBirth = false;
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	document.querySelector('.birthday .errorText').style.display = "block";
		    	$('.birthday .errorText').html(msg);
		    	isBirth = false;
		    	 
		    }else if(dateStr.length != 8){
		    	document.querySelector('.birthday .errorText').style.display = "block";
		    	$('.birthday .errorText').html(msg);
		    	isBirth = false;
			}else{
				//2월 윤년계산
		    	if (month == 2) {
					var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
					var is = day>29 || (day==29 && !isleap);
					var iss =day>29;
					var is2 = (day==29 && !isleap);
					
					if(day>29 || (day==29 && !isleap)){
						document.querySelector('.birthday .errorText').style.display = "block";
						$('.birthday .errorText').html(msg);
						isBirth = false;
					}else{
						document.querySelector('.birthday .errorText').style.display = "none";
						$('.birthday .errorText').html('');
						isBirth = true;
					}
		    	}else{
		    		document.querySelector('.birthday .errorText').style.display = "none";
		    		$('.birthday .errorText').html('');
		    		isBirth = true;
		    	} //end of 2월 윤년계산
			}//dateStr.length == 8, 
	});
	 
	/* 휴대폰 번호 유효성 검사 */
	$("#tel").on('keyup',function(){
	    var msg = '유효하지 않는 전화번호입니다.';
	    var reg = /(^01.{1})([0-9]{3,4})([0-9]{4})/;
		
	    if (!reg.test($(this).val())) {
	    	document.querySelector('.phone .errorText').style.display = "block";
	    	$('.phone .errorText').html(msg);
	    	isTel = false;
	    }else{
	    	document.querySelector('.phone .errorText').style.display = "none";
	    	$('.phone .errorText').html('');
	    	isTel = true;
	    }
	});
	
	/* 주소 유효성 검사 */
	$("#detail_address").on('keyup',function(){
		var detail_address = $(this).val();
		var msg = '유효하지 않는 주소입니다.';
		var spe = detail_address.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		
		if (spe >= 0) {
			document.querySelector('.address .errorText').style.display = "block";
			$('.address .errorText').html(msg);
			isAddress = false;
		}else{
			document.querySelector('.address .errorText').style.display = "none";
			$('.address .errorText').html('');
			isAddress = true;
		}
		
	});
	
}

function submitInfo(){
	
	
	if($('#pw').val() == ''){
		alert('비밀번호는 필수기입 사항입니다.');
		$('#pw').focus();
		return false;
	}else if(!isPass){
		alert('유효하지 않은 비밀번호입니다.');
		$('#pw').focus();
		return false;
	}
	
	if(!isPass2){
		alert('비밀번호를 확인해주세요.');
		$('#pw2').focus();
		return false;
	}
	
	if($('#name').val()==''){
		alert('성명은 필수기입 사항입니다.')
		$('#name').focus();
		return false;
	}else if(!isName){
		alert('유효하지 않은 성명입니다.');
		$('#name').focus();
		return false;
	}
	
	if(!isName_eng1 && $('#first_name').val().trim() != ""){
		alert('유효하지 않은 영문명입니다.');
		$('#first_name').focus();
		return false;
	}
	
	if($('#first_name').val().trim() != ""){
		if(!isName_eng2 || $('#last_name').val().trim() == ""){
			alert('유효하지 않은 영문명입니다.');
			$('#last_name').focus();
			return false;
		}
	}
	
	if($('#birth').val()==''){
		alert('생년월일은 필수기입 사항입니다.')
		$('#birth').focus();
		return false;
	} else if(!isBirth){
		alert('유효하지 않은 생년월일입니다.');
		$('#birth').focus();
		return false;
	}
	
	if(!isTel && $('#tel').val().trim() != ""){
		alert('유효하지 않은 휴대폰 번호입니다.');
		$('#tel').focus();
		return false;
	}
	
	if(!isAddress && $("#detail_address").val().trim() != ""){
		alert($("#detail_address").val().length);
		alert('유효하지 않은 주소입니다.');
		$('#detail_address').focus();
		return false;
	}
	$('#address').val($('#address1').val()+' '+$('#address2').val());
	$('#marketing').val('${marketing}');
	
	document.form1.submit();

}



