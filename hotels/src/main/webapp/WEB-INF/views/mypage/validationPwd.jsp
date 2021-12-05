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
			<span>비밀번호 확인</span>
			<h1>
			회원님의 개인정보 보호를 위한 확인절차입니다.<br>
			회원 로그인 시 사용하시는 비밀번호를 입력해주세요
			</h1>
		</div>
		
		<div class="loginBox">
			<form action="/mypage/edit" method="post">
				<input type="text" name="id" value="${member.id}" readonly>
				<input type="password" name="pw" placeholder="비밀번호">
				<input type="submit" value="확인">
			</form> 
		</div>
				
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->