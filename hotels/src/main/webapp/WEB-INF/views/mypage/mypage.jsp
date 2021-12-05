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
				<span>MY PAGE</span>
				<h1>
				<em>${name}</em>님 안녕하세요.<br>
				회원님의 정보를 확인할 수 있습니다.
				</h1>
			</div>
			
			<div class="purchaseBox">
				<h3>회원번호</h3>
				<p>${no}</p>
			</div>
			
			<section class="mypagePoint">
				<div class="mypagePoint_head">
					<h2>나의 보유 포인트</h2>
					<span><a href="/mypage/point">+ 더보기</a></span>
				</div>
				<div class="mypagePoint_body">
					<ul>
						<li class="usepoint">
							<strong>사용가능 포인트</strong>
							<span>${remainPoint}<span id="icon">포인트</span></span>
						</li>
						<li class="deletepoint">
							<strong>다음달 소멸 예정 포인트</strong>
							<span>${soonExpirePoint}<span id="icon">포인트</span></span>
						</li>
					</ul>
				</div>
			</section>
			
			
			<div class="mypageNoticeWrap">
				<section class="mypageNotice mypageReservation">
					<h2>예약내역</h2>
					<ul>
						<c:forEach var="rv" items="${rvL}" varStatus="status">
						<li>
						<c:out value="${rv.date_write}"/>
						<a href="/mypage/reservationCheck/${rv.no}">상품번호: <c:out value="${rv.no}"/></a>
						</li>
						</c:forEach>
						
					</ul>
					<c:if test="${empty rvL && empty rtL}">
					예약내역이 없습니다.
					</c:if>
				</section>
				
				<section class="mypageNotice">
					<h2>이용문의</h2>
					<ul>
						<c:forEach var="qna" items="${qnaList}">
						<li>
						<c:out value="${qna.wdate}"/>
						<a href="/mypage/service/${qna.no}"><c:out value="${qna.title}"/></a>
						</li>
						</c:forEach>
					</ul>
					<c:if test="${empty qnaList}">
					문의내역이 없습니다.
					</c:if>
				</section>
			</div>
				
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->