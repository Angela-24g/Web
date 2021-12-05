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
			<span>예약내역</span>
			<h1>
			델루나 호텔 부산에서 예약한 내역을<br>
			확인하실 수 있습니다.
			</h1>
		</div>
		
		<div class="tapBox">
			<ul>
				<li>
					<a href="/mypage/reservation">OFFERS</a>
				</li>
				<li class="on">
					<a href="/mypage/reservationBox">TO GO BOX</a>
				</li>
				<li>
					<a href="/mypage/reservationDin">DINE & DRINK</a>
				</li>
			</ul>
		</div>
		
		<div class="mypointInfo">
			<dl>
				<dt>전체</dt>
				<dd><a href="">0</a>건</dd>
			</dl>
			<dl>
				<dt>예정</dt>
				<dd><a href="">0</a>건</dd>
			</dl>
			<dl>
				<dt>확인</dt>
				<dd><a href="">0</a>건</dd>
			</dl>
			<dl>
				<dt>취소</dt>
				<dd><a href="">0</a>건</dd>
			</dl>

		</div>
		
		<section class="searchBoxWrap">
			<h2>기간선택</h2>
			<form action="" method="get">
			<input type="date" value="${beforeDate}">
			<span>~</span>
			<input type="date" value="${nowDate}">
			<select name="kind">
				<option value="all">전체</option>
				<option value="save">예정</option>
				<option value="pay">확인</option>
				<option value="expire">취소</option>
			</select>
			<input type="submit" value="조회">
			</form>
		</section>
		
		<div class="listNone">
			<img src="/images/mypage/noneList.png" alt="noList">
			<p>내역이 없습니다.</p>
 		</div>

		<div class="cautionBox">
			<h2>유의사항</h2>
			<ul>
				<li>취소에 따른 환불정책 및 수수료는 상품마다 상이합니다. 자세한 내용은 예약 상세 내역에서 확인해주세요.</li>
			</ul>
		</div>
				
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->