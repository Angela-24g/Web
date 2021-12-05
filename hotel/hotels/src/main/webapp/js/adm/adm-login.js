document.querySelector("#form1").addEventListener('submit', function(e) {
    e.preventDefault();

});
function idfind() {
	var kind = "";
	var name1 = $('#name1').val();
	var tel = $('#id_tel1').val() + $('#id_tel2').val() + $('#id_tel3').val();
	var object = {'name':name1, 'tel':tel};
	if ($("#name1").val() == "") {
		alert("이름을 입력해 주세요.");
		$("#name1").focus();
		return;
	}

	if (tel == "" || tel.length < 10) {
		alert("전화번호를 입력해 주세요.");
		return;
	}
	$.ajax({
		url : "/adm/member/findId"
        , method : "post"
		, data : JSON.stringify(object)
		, contentType:"application/json; charset=utf-8"
		, success : function(result) {
					if (result != "N") {
						alert('회원님의 ID는 '+result+'입니다.');
					} else {
						alert("입력하신 정보와 일치하는 회원 정보가 없습니다.");
					}
				
			}
		
	});
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
				data: JSON.stringify({'id':id,'name':name,'email':email,'type':'findAdmPw'}),
				success:function(data){
					
						if(data=="Yes")
						{
							alert("메일이 전송되었습니다.");
							location.href="/adm/member/login";
						}
						else if(data=="No")
						{
							alert("회원 정보가 일치하지 않습니다.");
						}
				}
			});
		}
	}


/* 스페이스바 방지 */
function checkSpacebar(){
	var kcode = event.keyCode;
	
	if(kcode == 32) {
		event.returnValue = false;
	}
	
}

function adminlogin() {

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
		return false;
	} else if ($('#pw').val() == null || $('#pw').val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$('#pw').focus();
		return false;
	} else {
		
	  $.ajax({
			url :"/adm/member/login",
			type:"POST", 
			data : JSON.stringify(object), 
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if(data=="Y"){
					alert('로그인 되었습니다.');
					location.href = "/adm/index";
				}else{
					alert(data);
					
				}
				
					
            }
		});
   
		
	}
	
}