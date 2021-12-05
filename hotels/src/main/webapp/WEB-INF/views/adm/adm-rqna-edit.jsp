<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<style>
		#result{text-align:right;}
	</style>
	<script type="text/javascript">
$(document).ready(function(){
	$('#content').on('keyup',function(){
		$('#result').html("("+$(this).val().length+"/200)");
		
		if($(this).val().length>200){
			$(this).val($(this).val().substring(0,200));
			$('#result').html("(200/200)");	
		}
	});
});
	function requiredForm(){
		if($('#content').value()=='')
			{
				alert("답변 내용을 입력하세요.");
				$('#content').focus();
			}
		return true;
	}
</script>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<form action="/adm/adm-rqna-update" method="post">
				<div class="form_block">
					<h2>답변 수정</h2>
					</div>
					<div class="form_block">
						<label for="name">제목</label> 
						<input type="text" name="title" id="title" size="100" value="${title}" readonly style="width:600px;"/>
						<input type="hidden" id="no" name="no" value="${no}">
					</div>
					<div class="form_block">
						<label for="name">질문 내용</label> 
						<textarea rows="2" cols="100" style="width:600px;" readonly>${content}</textarea>
						</div>
					<div class="form_block">
						<label for="info_detail">답변 내용</label>
						<textarea rows="10" cols="100" style="width:600px;" name="content" id="content" >${response}</textarea>
						<div id="result">(<c:out value="${fn:length(response)}"/>/200)</div>			
					</div>
					<br>
					<div class="form_block">
						<c:choose>
							<c:when test="${sign ne 'sign'}">	
								<input type="submit" id="upbtn" name="upbtn" value="답변 수정" style="width:190px; margin:3px;">
								<input type="button" onClick="location.href='/adm/adm-rqna-list'" style="width:190px; margin:3px;" value="답변목록">
								<input type="button" onClick="location.href='/adm/adm-qna-list'" style="width:190px; margin:3px;" value="이전으로 가기">	
							</c:when>
							<c:otherwise>
								<input type="submit" id="upbtn" name="upbtn" value="답변 수정" style="width:290px; margin:3px;">
								<input type="button" onClick="location.href='/adm/adm-rqna-list'" style="width:290px; margin:3px;" value="답변목록">
							</c:otherwise>
						</c:choose>
					</div>
					</form>
			
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>