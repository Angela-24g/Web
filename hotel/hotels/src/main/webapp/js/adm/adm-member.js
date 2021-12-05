//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

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

var isId = true;
var isPass = true;
var isName = true;
var isName_eng1 = true;
var isName_eng2 = true;
var isBirth = true;
var isTel = true;
var isAddress = true;

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
	
	
	/* 한글이름 유효성 검사 */
	$("#name").on('keyup',function(){
		var name = $(this).val();
		var num = name.search(/[0-9]/g);
		var eng = name.search(/[a-z]/ig);
		var spe = name.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		 document.querySelector('.errorText').style.display ="none";
		 
		 if(name.length < 2){
			 msg = "2자리 이상 입력해주세요.";
			 document.querySelector('#errorName').style.display = "block";
			 document.querySelector('#errorName').innerHTML = msg;
			 isName = false;
		 }else if(num >= 0 || eng >= 0 || spe >= 0 ){
			 msg = "특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력해주세요.";
			 document.querySelector('#errorName').style.display = "block";
			 document.querySelector('#errorName').innerHTML = msg;
			 isName = false;
		 }else {
			 document.querySelector('#errorName').style.display = "none";
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
			document.querySelector('#errorEng').style.display = "block";
			document.querySelector('#errorEng').innerHTML = msg;
			isName_eng1 = false;
		}else if(num >= 0 || spe >= 0 || check.test(name_eng)){
			msg = "특수문자,한글,숫자는 사용할수 없습니다. 영어만 입력해주세요.";
			document.querySelector('#errorEng').style.display = "block";
			document.querySelector('#errorEng').innerHTML = msg;
			isName_eng1 = false;
		}else {
			document.querySelector('#errorEng').style.display = "none";
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
			document.querySelector('#errorEng2').style.display = "block";
			document.querySelector('#errorEng2').innerHTML = msg;
			isName_eng2 = false;
		}else if(num >= 0 || spe >= 0 || check.test(name_eng2)){
			msg = "특수문자,한글,숫자는 사용할수 없습니다. 영어만 입력해주세요.";
			document.querySelector('#errorEng2').style.display = "block";
			document.querySelector('#errorEng2').innerHTML = msg;
			document.querySelector('#errorEng2').innerHTML = msg;
			isName_eng2 = false;
		}else {
			document.querySelector('#errorEng2').style.display = "none";
			isName_eng2 = true;
		}
	});
	
	/* 휴대폰 번호 유효성 검사 */

	$("#tel").on('keyup',function(){
	    var msg = '유효하지 않는 전화번호입니다.';
	    var reg = /(^01.{1})([0-9]{3,4})([0-9]{4})/;
		
	    if (!reg.test($(this).val())) {
	    	document.querySelector('#errorTel').style.display = "block";
	    	$('#errorTel').html(msg);
	    	isTel = false;
	    }else{
	    	document.querySelector('#errorTel').style.display = "none";
	    	$('#errorTel').html('');
	    	isTel = true;
	    }
	});

	
	/* 주소 유효성 검사 */
	$("#detail_address").on('keyup',function(){
		var detail_address = $(this).val();
		var msg = '유효하지 않는 주소입니다.';
		var spe = detail_address.search(/[`~!@@#$%^&*()|₩₩₩'₩";:₩/?]/gi);
		
		if (spe >= 0) {
			document.querySelector('#errorAddress').style.display = "block";
			$('#errorAddress').html(msg);
			isAddress = false;
		}else{
			document.querySelector('#errorAddress').style.display = "none";
			$('#errorAddress').html('');
			isAddress = true;
		}
		
	});
	
}

function submitInfo(){
	
	if($('#pw').val() == ''){
		alert('비밀번호는 필수기입 사항입니다.');
		$('#pw').focus();
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
		alert('유효하지 않은 영문명입니다.1');
		$('#first_name').focus();
		return false;
	}
	
	if($('#first_name').val().trim() != ""){
		if(!isName_eng2 || $('#last_name').val().trim() == ""){
			alert('유효하지 않은 영문명입니다.2');
			$('#last_name').focus();
			return false;
		}
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
	
	document.form1.submit();
}




