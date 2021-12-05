<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<style>
		#result{text-align:right;}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){

		$('#rqna').on('keyup',function(){
			$('#result').html("("+$(this).val().length+"/200)");
			
			if($(this).val().length>200){
				$(this).val($(this).val().substring(0,200));
				$('#result').html("(200/200)");	
			}
		});
	});
	
	function requiredForm(){
		if($('#rqna').val()=="")
			{
				alert("답변을 입력하여 주시기 바랍니다.");
				$('#rqna').focus();
				return false;
			}
		return true;
	}
</script>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<form onsubmit="return requiredForm()" action="/adm/adm-rqna-save" method="post">

					<div class="form_block">
						<label for="subtype">질문 번호</label> 
						<input type="text" name="no" id="no" value="${no}" style="width:600px;" readonly />
					</div>
					<div class="form_block">
						<label for="name">제목</label> 
						<input type="text" name="name" id="name" size="45" value="${title}" style="width:600px;" readonly/>
						
					</div>
					<div class="form_block">
						<label for="info_detail">작성 날짜</label>
						<input type="date" id="date" value="${date}" style="width:600px;" readonly>
						
					</div>
					<div class="form_block">
						<label for="info_detail">질문 내용</label>
						<textarea rows="2" cols="100" style="width:600px;" readonly>${content}</textarea>
					</div>
					<div class="form_block">
						<label for="guide">답변 내용</label>
						<textarea rows="5" cols="100" style="width:600px;" name="rqna" id="rqna"></textarea>
						<div id="result">(0/200)</div>
					</div>
					
					<div class="form_block">
						<input type="submit" style="width:290px; margin:3px;" value="등록하기" />
						<input type="button" onclick="location.href='/adm/adm-qna-list'" style="width:290px;" value="이전으로 가기" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>