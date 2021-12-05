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
				<li>
					<a href="/mypage/point">포인트 사용내역</a>
				</li>
				<li class="on">
					<a href="/mypage/pointExchange">포인트 교환신청(이용불가)</a>
				</li>
			</ul>
		</div>
		
		<div class="mypointInfo">
			<dl>
				<dt>루나 포인트</dt>
				<dd><a href="">0</a><span class="icon">포인트</span></dd>
			</dl>
			<dl>
				<dt>총 적립 포인트</dt>
				<dd><a href="">0</a><span class="icon">포인트</span></dd>
			</dl>
			<dl>
				<dt>사용 포인트</dt>
				<dd><a href="">0</a><span class="icon">포인트</span></dd>
			</dl>
			<dl>
				<dt>소멸 예정 포인트</dt>
				<dd><a href="">0</a><span class="icon">포인트</span></dd>
			</dl>

		</div>
		
		<div class="coupon">
			<ul>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>30,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>55,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>65,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>10,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>35,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>100,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
				<li><a href="" onclick="nomore()">
					<div class="couponCard">
						<div class="couponCard_point">
							<h2>40,000포인트</h2>
							<img src="/images/mypage/download.svg">
						</div>
						<h2>Ocean Terrace View Upgrade</h2>
						<p>Deluxe 객실 한정</p>
					</div>
				</a></li>
			</ul>
		</div>

		<div class="cautionBox">
			<h2>안내사항</h2>
			<ul>
				<li>포인트는 5,000점부터 1,000포인트 단위로 사용할 수 있으며, 일정 포인트 이상 시 호텔 내 사용 가능한 바우처로 교환하여 이용 가능합니다.</li>
				<li>모든 바우처는 여름성수기 및 연말연시 사용이 불가합니다.</li>
				<li>모든 바우처의 유효 기간은 발급일로부터 6개월이며, 바우처의 분실 및 도난, 파손 등의 어떠한 경우에도 재발행은 불가합니다.</li>
			</ul>
		</div>
				
		</div>
	</div>
</section>
<script type="text/javascript">
function nomore(){
	alert("쿠폰 구매기한이 지났습니다. 다음에 이용해주세요!");
}
</script>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->