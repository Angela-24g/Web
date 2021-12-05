<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->

<section id="container">

<!-- 서브헤더 : 필요시 사용! -->
	<jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="mypage" name="submenu" />

		<jsp:param value="reservation" name="ssubmenu1" />
		<jsp:param value="point" name="ssubmenu2" />
        <jsp:param value="service" name="ssubmenu3" />
        <jsp:param value="edit" name="ssubmenu4" />
        <jsp:param value="delete" name="ssubmenu5" />

	</jsp:include>
<!-- 서브헤더 끝  -->
	
	<div class="hotelParadiseWrap">
		<div class="innerBox">
	
		<div class="contTitle">
			<span>탈퇴 신청</span>
			<h1>
			델루나 리워즈 멤버십 회원을 탈퇴하시겠습니까?<br>
			회원탈퇴를 하면 델루나 호텔 부산 회원자격이 상실됩니다.
			</h1>
		</div>
		
		<div class="loginBox">
			<form action="/mypage/delete/complete" method="post">
				<input type="text" name="id" placeholder="아이디" required="required">
				<input type="password" name="pw" placeholder="비밀번호" required="required">
				<input type="submit" value="확인">
			</form> 
		</div>
				
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->