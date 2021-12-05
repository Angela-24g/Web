$(function(){
	//전체선택 체크박스 클릭
	$("#allCheck").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allCheck").prop("checked")) {
		//해당화면에 전체 checkbox들을 체크해준다 
		$(".requiredChecks").prop("checked",true); 
		// 전체선택 체크박스가 해제된 경우 
		} else {
		//해당화면에 모든 checkbox들의 체크를해제시킨다. 
		$(".requiredChecks").prop("checked",false); 
		}
	})
})

function required(){
	
	if($('#requiredCheck1').is(":checked")== false){
		alert("홈페이지 회원 이용약관 동의가 필요합니다.")
		return false;
	}
	
	if($('#requiredCheck2').is(":checked")== false){
		alert("Paradise Rewards 회원 이용약관 동의가 필요합니다.")
		return false;
	}
	
	if($('#requiredCheck3').is(":checked")== false){
		alert("개인정보수집 및 이용에 대한 동의 동의가 필요합니다.")
		return false;
	}
	
	if($('#requiredCheck4').is(":checked")== false){
		alert("마일리지 포인트 공유를 위한 개인정보 제 3자 제공 동의 동의가 필요합니다.")
		return false;
	}
	
	if($('#marketing').is(":checked")){
		$('#YN').val('Y');
	}else{
		$('#YN').val('N');
	}
	return true;
}

/* 스페이스바 방지 */
function checkSpacebar(){
	var kcode = event.keyCode;
	
	if(kcode == 32) {
		event.returnValue = false;
	}
	
}
/* 인증번호 이메일 전송 스크립트 */
const authcode = document.querySelector('#authcode');
var email;

function confirmAndSendEmail(){
	email = document.getElementById('email').value;
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*(.[a-zA-Z]{2,6}$)/i;

	if(codeConfirm){
		alert('이미 인증되었습니다.');
		return;
	}
	
	if (email == '' || !regExp.test(email)) {
		alert("올바른 이메일 주소를 입력하세요");
		return false;
	}else{
		$.ajax({
			url:"/member/mailcode",
			type:"POST",
			contentType:"application/json; charset=utf-8",
			data: JSON.stringify({'email':email,'type':'verify'}),
			success:function(result){
				if(result=='No'){
					alert('이미 존재하는 이메일입니다.');
					codeConfirm=false;
				}else if(tid!=undefined){//재인증시 타이머 재시작.
					clearInterval(tid);
					SetTime = 1200;//타임재설정
					authcode.style.display = "none";
					authcode.innerHTML = '';
					TimerStart();//타이머
					$('#reqCodebtn>span').text('인증번호 재전송');
				}else{
					TimerStart();//타이머
					alert("인증번호가 전송되었습니다.");
				}
			}
		});
	}
}


/* 인증코드 확인 스크립트 */
//숫자만 받는 정규식 + keyup(타자쓸때마다이벤트)
$('#authenticode').keyup(function(){
	var regexp = /^[0-9]*$/;
		v = $(this).val();
		if( !regexp.test(v) ) {
			alert("숫자만 입력하세요");
			$(this).val(v.replace(v,''));
		}
});

var codeConfirm = false;
//controller 에서 String 반환시 dataType 을 아예 안쓰거나 "text" 로 써야 인식된다.
function confirmCode(){
	var authenticode = document.querySelector("#authenticode").value;

	if(codeConfirm){
		alert('이미 인증되었습니다.');
		return;
	}
	
	if(authenticode==null||authenticode.trim()==""){
		alert('인증번호를 입력하세요');
	}else{
		var code = {'code':authenticode};
		$.ajax({
			url:"/member/authcode",
			type:"POST",
			dataType:"text",
			data:JSON.stringify(code),
			contentType: "application/json; charset=utf-8",
			success:function(result){
				if(result=='Y'){
					clearInterval(tid);
					authcode.innerHTML = '인증이 완료되었습니다.';
					alert('인증이 완료되었습니다.');
					codeConfirm=true;
				}else if(result=='N'){
					alert('인증번호가 일치하지 않습니다.');
					codeConfirm=false;
				}else if(result =='E'){
					alert('인증시간이 초과했습니다. 다시 시도해주세요.');
					codeConfirm=false;
				}
			}
		});
	}
}
/* 인증코드 타이머 */
var SetTime = 1200;// 최초 설정 시간(기본 : 초)//20분 설정

function msg_time() {	// 1초씩 카운트
	m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
	var msg = "인증확인까지 남은 시간은 " + m + "입니다.";
	authcode.style.display = "block";
	authcode.innerHTML = msg;
	SetTime--;					// 1초씩 감소
	if (SetTime < 0) {// 시간이 종료 되면 해제
		msg = "인증시간이 초과했습니다. 다시 시도해주세요.";
		authcode.innerHTML = msg;
		clearInterval(tid);
	}
}
var tid;

function TimerStart(){ 
	tid=setInterval('msg_time()',1000);
};


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
	
	/* 아이디 유효성 검사 */
	$("#id").on('keyup',function(){
		var id = $(this).val();
		//정규식 포함되었는지 갯수 확인
		var reg = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
		var spe = id.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		 if(id.length < 4 || id.length > 12){
			 msg = "4자리 ~ 12자리 이내로 입력해주세요.";
			 document.querySelector('#errorId').style.display = "block";
			 document.querySelector('#errorId').innerHTML = msg;
			 isId = false;
		 }else if(spe >= 0 || reg >= 0){
			 msg = "영문 대소문자와 숫자로만 입력해주세요.";
			 document.querySelector('#errorId').style.display = "block";
			 document.querySelector('#errorId').innerHTML = msg;
			 isId = false;
		 }else{
			 document.querySelector('#errorId').style.display = 'none';
			 isId = true;
		 }
	});
	
	/* 아이디 중복 검사  */
	$("#id").on('blur',function(){
		var id = $(this).val();
		$.ajax({
			url:"/member/id",
			type:"POST",
			contentType:"application/json; charset=utf-8",
			data: JSON.stringify({'id':id }),
			success:function(result){
				if(result=='Y'){//사용가능한 아이디
					isId2 = true;
				}else{//사용중인 아이디
					isId2 = false;
				}
			}
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



