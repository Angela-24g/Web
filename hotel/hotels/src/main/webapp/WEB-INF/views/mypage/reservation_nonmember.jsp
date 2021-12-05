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
				<li class="on">
					<a href="/mypage/reservation">OFFERS</a>
				</li>
				<li>
					<a href="/mypage/reservationBox">TO GO BOX</a>
				</li>
				<li>
					<a href="/mypage/reservationDin">DINE & DRINK</a>
				</li> 
			</ul>
		</div>
		
		<div class="list">
			<c:forEach var="rv" items="${rvL}">
			<div class="listHead">
				<p><span class="strong">접수일: ${rv.date_write} </span></p>
				<a href="/mypage/reservationCheck/${rv.no}"><span class="strong click">예약내용 상세보기</span></a>
			</div>
			<div class="listBody">
				<div class="listBodyLeft">
					<p><span class="strong">상품번호: ${rv.no}</span></p>
					<p>${rv.check_in} ~ ${rv.check_out}</p>
				</div>
				<div class="listBodyRight">
					<p>성인: ${rv.count_adult}명, 청소년: ${rv.count_elementary}명 , 어린이 ${rv.count_child}명, 아기: ${rv.count_baby}명</p>
					<p><span id="check">${rv.state}</span></p>
				</div>
			</div>
			</c:forEach>
		</div>
		
		
		<c:if test="${empty rvL}">
		<div class="listNone">
			<img src="/images/mypage/noneList.png" alt="noList">
			<p>내역이 없습니다.</p>
 		</div>
 		</c:if>

		<div class="cautionBox">
			<h2>유의사항</h2>
			<ul>
				<li>취소에 따른 환불정책 및 수수료는 상품마다 상이합니다. 자세한 내용은 예약 상세 내역에서 확인해주세요.</li>
			</ul>
		</div>
				
		</div>
	</div>
</section> 
 
<style>
p,a{margin:auto 0; word-break: break-all; }
.strong{font-weight: bold; color:#9c836a;}
.click{text-decoration:underline;}
.list{width:100%; margin:50px 0;}
.listHead{border-top:2px solid #9c836a;}
.listBody{border-bottom:1px solid #9c836a;}
.listHead, .listBody{height:60px;}
.listHead, .listBody , .listBodyLeft, .listBodyRight{display:flex; justify-content:space-between;}
.listBody{background-color:white; border-top:1px solid #e6e3df;}
.listBodyLeft, .listBodyRight, .listHead{padding:10px;}
.listBodyLeft, .listBodyRight{width:50%;}
</style>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->