
/* 스페이스바 방지 */
function checkSpacebar(){
	var kcode = event.keyCode;
	
	if(kcode == 32) {
		event.returnValue = false;
	}
	
}







/* 인증번호 이메일 전송 스크립트 */
const authcode = document.querySelector('#authcode');


function confirmAndSendEmail1(){	
	var id = $('#id').val();
	var name =  $('#name').val();
	var email = $('#email').val();
	id = id.trim();
	$('#id').val(id);
	if ($('#id').val() == null || $('#id').val() == "") {
		alert("아이디를 입력해 주세요.");
		$('#id').focus();
	}
	
	else if ($('#name').val() == null || $('#name').val() == "") {
		alert("이름을 입력해 주세요.");
		$('#name').focus();
	}  
	
	else if ($('#email').val() == null || $('#email').val() == "") {
		alert("이메일을 입력해 주세요.");
		$('#email').focus();
	}
	 else {
			$.ajax({
				url:"/member/mailcode",
				type:"POST",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify({'id':id,'name':name,'email':email,'type':'findPw'}),
				success:function(data){
					
						if(data=="Yes")
						{
							alert("메일이 전송되었습니다.");
							location.href="/login-change";
						}
						else if(data=="No")
						{
							alert("회원 정보가 일치하지 않습니다.");
						}
				}
			});
		}
	}



