<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<form onsubmit="return admSubmitTypeRsv()" action="/adm/adm-rsv-write-type"
				enctype="multipart/form-data" method="post">
				<input type="hidden" name="rezAdm.rezAdm_no" value="${rsvWriteType.rezAdm_no}" />
				<div class="form_block">
					<label for="title">제목</label> <input type="text" name="title"
						id="title" size="45" />
				</div>

				<div class="form_block">
					<label for="">타입</label>
					<c:forEach var="room_type" items="${roomType}" varStatus="status">
						<p class="checkbox_block"><label for="type${room_type.no}">${room_type.type}</label><input type="radio" name="roomType.no" value="${room_type.no}" id="type${room_type.no}"></p>
					</c:forEach>
 					<!-- <p class="checkbox_block"><label for="deluxe">디럭스</label><input type="radio" name="roomType.no" value="1" id="deluxe"></p>
					<p class="checkbox_block"><label for="premium">프리미엄 디럭스</label><input type="radio" name="roomType.no" value="2" id="premium"></p>
					<p class="checkbox_block"><label for="sweet">스위트</label><input type="radio" name="roomType.no" value="3" id="sweet"></p> -->
				</div>
				
				<div class="form_block">
					<label for="benefits">혜택</label>
					<textarea name="benefit" id="benefit" ></textarea>
				</div>
				
				<div class="form_block">
					<input type="submit" value="등록" />
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function admSubmitTypeRsv() {
		return true;
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>