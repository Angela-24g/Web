/**
 * 
 */

function saveqna(){
	var question = $('#question').val();
	var title = $('#title').val();
	var contents = $('#contents').val();
	var name = $('#name').val();
	var tel = $('#TEL1').val()+$('#TEL2').val()+$('#TEL3').val();
	var email = $('#email').val();
	var object = {'question':question, 'title':title, 'contents':contents, 'name':name, 'tel':tel, 'email':email};
	
	if ($('#question').val() == "" ||$('#question').val() == "선택" ) {
		alert("유형을 선택해주세요.");
		$('#question').focus();
		return false;
	} else if ($('#title').val() == null || $('#title').val() == "") {
		alert("제목을 입력해 주세요.");
		$('#title').focus();
		return false;
	}	else if ($('#contents').val() == null || $('#contents').val().trim() == "") {
		alert("내용을 입력해 주세요.");
		$('#contents').focus();
		return false;
	

	} else {

	$.ajax({
		url : "/notice/qna"
        , method : "post"
		, data : JSON.stringify(object)
		, contentType:"application/json; charset=utf-8"
		, success : function(result) {
					if (result == "Y") {
						alert('문의가 정상적으로 등록되었습니다.');
						location.href="/notice/faq";
					} 
				}
			});
		}
	}