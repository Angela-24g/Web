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
		url : "/member/find/id"
        , method : "post"
		, data : JSON.stringify(object)
		, contentType:"application/json; charset=utf-8"
		, success : function(result) {
					if (result.result != "N") {
						alert('회원님의 ID는 '+result.result+'입니다.');
					
					} else {
						alert("입력하신 정보와 일치하는 회원 정보가 없습니다.");
					}
				
			}
		
	});
}
