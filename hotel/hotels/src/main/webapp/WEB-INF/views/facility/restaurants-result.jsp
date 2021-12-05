<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->

<section id="container">

	<div class="hotelParadiseWrap">
		<div class="innerBox">

			<div class="reservationResult">
				<h1 class="contTitle">
					<span>RESERVATION</span>델루나호텔 부산에 오신 것을 환영합니다.
				</h1>
				<div class="purchaseBox">
					<ul class="basicList">
						<li class="clearFixed"><span>예약상태</span> <span><strong
								class="txtRed">${rtState}</strong></span></li>
						<li class="clearFixed"><span>예약일시</span> <span>${rtDate}</span>
						</li>
					</ul>
				</div>
				<ul class="buttonBox clearFixed">
					<li><a href="/mypage/reservationDin" class="btn"><span>예약 확인하기</span></a></li>
					<li><a href="/index" class="btn btnFull"><span>메인으로</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->