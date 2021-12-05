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
			<span>포인트</span>
			<h1>
			회원님이 보유한 루나 포인트를<br>
			확인하실 수 있습니다.
			</h1>
		</div>
		
		<div class="tapBox">
			<ul>
				<li class="on">
					<a href="/mypage/point">포인트 사용내역</a>
				</li>
				<li>
					<a href="/mypage/pointExchange">포인트 교환신청(이용불가)</a>
				</li>
			</ul>
		</div>
		
		<div class="mypointInfo">
			<dl>
				<dt>루나 포인트</dt>
				<dd><a href="/mypage/point">${remainPoint}</a><span class="icon">포인트</span></dd>
			</dl>
			<dl>
				<dt>총 적립 포인트</dt>
				<dd><a href="/mypage/point?startDate=&endDate=&col=save">${totalPoint}</a><span class="icon">포인트</span></dd>
			</dl>
			<dl>
				<dt>사용 포인트</dt>
				<dd><a href="/mypage/point?startDate=&endDate=&col=pay">${usedPoint}</a><span class="icon">포인트</span></dd>
			</dl>
			<dl>
				<dt>소멸 예정 포인트</dt>
				<dd>${soonExpirePoint}<span class="icon">포인트</span></dd>
			</dl>

		</div>
		
		<section class="searchBoxWrap">
			<h2>기간선택</h2>
			<form action="/mypage/point" method="get">
			<input type="date" name="startDate" value="${startDate}">
			<span>~</span>
			<input type="date" name="endDate" value="${endDate}">
			<select name="col">
				<option value="all">전체</option>
				<option value="save">적립</option>
				<option value="pay">사용</option>
				<option value="expire">소멸</option>
			</select>
			<input type="submit" value="조회">
			</form>
		</section>
		<table class="pointList" border="1" style="text-align:center; margin-bottom:48px;">
		<thead>
			<tr>
				<th>순번</th>
				<th>상품번호</th>
				<th>포인트량</th>
				<th>상태여부</th>
				<th>거래일자</th>
				<th>만료일자</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="point" items="${pointList}" varStatus="status">
			<tr>
				<c:if test="${not empty point}">
					<td><c:out value="${status.count}"/></td>
					<td><a href="/mypage/reservationCheck/${point.reservation_no.no}"><c:out value="${point.reservation_no.no}"/></a></td>
					<td><c:out value="${point.amount}"/></td>
						<c:if test ="${point.state eq 1}">
						<td>적립</td>
						</c:if>
						<c:if test ="${point.state eq 2}">
						<td>사용</td>
						</c:if>
						<c:if test ="${point.state eq 3}">
						<td>만료</td>
						</c:if>
					<td><c:out value="${point.trans_date}"/></td>
					<td><c:out value="${point.expire_date}"/></td>
				</c:if>
			</tr>
				<c:if test="${empty point}">
					<div class="listNone">
						<img src="/images/mypage/noneList.png" alt="noList">
						<p>내역이 없습니다.</p>
			 		</div>
				</c:if>
		</c:forEach>
		</tbody>
		</table>

		<div class="cautionBox">
			<h2>안내사항</h2>
			<ul>
				<li>세부 포인트 확인이 필요한 고객님께서는 마일리지 센터(TEL. 123-456-7890)또는 홈페이지 내 <a href="/mypage/service">1:1문의하기</a>를 이용바랍니다.</li>
			</ul>
		</div>
				
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->