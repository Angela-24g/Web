
/* 스페이스바 방지 */
function checkSpacebar(){
	var kcode = event.keyCode;
	
	if(kcode == 32) {
		event.returnValue = false;
	}
	
}  
function ggg() {

	var genURL = "";
	var sslURL = "";
	var id = $('#id').val();
	var pw = $('#pw').val();
	var object = {'id':id,'pw':pw}
	id = id.trim();
	$('#id').val(id);
	if ($('#id').val() == null || $('#id').val() == "") {
		alert("아이디를 입력해 주세요.");
		$('#id').focus();
	} else if ($('#pw').val() == null || $('#pw').val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$('#pw').focus();
	} else {
		
	  $.ajax({
			url : "/login",
			type:"POST", 
			data : JSON.stringify(object), 
			contentType : "application/json; charset=utf-8",
			dataType:"json",
			success : function(data) { //data가 외부에서 들어온 값이 됨(여기서는 controller가 되겠지.)괄호 안에는 객체 이름이고 해당 값은 객체.result로 하면 됨!
				if(data.result=="Y"){
					alert('로그인 되었습니다.');
					location.href = "/index";
				}
				else if(data.result=="F" ){
					alert('일치하는 회원정보가 없습니다. 회원 가입 후 진행해주세요.');
					location.href="/index";
				}
				else if(data.result=="N" && (data.tryno < 5 && data.tryno ==0)){
					alert('아이디 혹은 비밀번호가 일치하지 않습니다.(check)');
					location.href="/login";
				}
				else if(data.result=="N" && (data.tryno < 5 && data.tryno >=0)){
					alert('아이디 혹은 비밀번호가 일치하지 않습니다 '+data.tryno+'회 실패했습니다.');
					location.href="/login";
				}
				else if(data.result=="N" && data.tryno >= 5){

					var strTest = "5회 이상의 로그인 오류\n보안상 로그인을 제한합니다.\n[비밀번호찾기]에서 비밀번호를 재발급 받으세요.";
					strTest.replace(/\n/g, '<br/>');

					alert(strTest);
					location.href="/member/find";
				}
					
            }
		});
   
		
	}
	
}
