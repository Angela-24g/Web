<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/common_header.jsp"></jsp:include>

<section id="container">

	<jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="rooms" name="submenu" />
		<jsp:param value="deluxe" name="ssubmenu1" />
		<jsp:param value="premium deluxe" name="ssubmenu2" />
		<jsp:param value="suite" name="ssubmenu3" />
	</jsp:include>
	<!-- contents -->
	<div class="hotelParadiseWrap">
		<div class="innerBox">
			<h1 class="contTitle">
					<span>rooms</span>
					파라다이스호텔 부산에서 격이 다른<br>휴식과 여유를 경험해보세요.
			</h1>
			<div class="roomWrap">
				<h2>디럭스</h2>
				<p class="text">모던하면서도 세련된 최신 트렌드의 인테리어가 돋보이는 객실</p>
				<div class="descBox">
					<section class="jsSwiperMotion keyVisual" style="display: block;">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="/images/rooms/list/1555489275637.jpg" alt=""></li>
								<li><img src="/images/rooms/list/1555488905245.jpg" alt=""></li>
								<li><img src="/images/rooms/list/1555901458847.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<div class="text on">
									<p class="title"><span>디럭스 시티</span>은은한 조명과 어우러진 다크 브라운의 조화</p>
									<div class="info">
										<p><span>전망</span>시티</p>
										<p><span>인원</span>성인 2인</p>
										<p><span>베드타입</span>더블, 트윈, 온돌</p>
										<p><span>건물</span>
											본관,신관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','city')" class="btn small2"><span>상세 보기</span></a>
								</div>
								<div class="text">
									<p class="title"><span>디럭스 오션</span>은은한 조명과 어우러진 다크 브라운의 조화</p>
									<div class="info">
										<p><span>전망</span>오션</p>
										<p><span>인원</span>성인 2인</p>
										<p><span>베드타입</span>더블, 온돌</p>
										<p><span>건물</span>
											신관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','ocean-new')" class="btn small2"><span>상세 보기</span></a>
								</div>
								<div class="text">
									<p class="title"><span>디럭스 오션 테라스</span>은은한 조명과 어우러진 다크 브라운의 조화</p>
									<div class="info">
										<p><span>전망</span>오션테라스</p>
										<p><span>인원</span>성인 2인</p>
										<p><span>베드타입</span>더블,트윈</p>
										<p><span>건물</span>
											본관,신관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','ot')" class="btn small2"><span>상세 보기</span></a>
								</div>
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>
			<div class="roomWrap">
				<h2>프리미엄 디럭스</h2>
				<p class="text">더욱 여유로워져 최상의 아늑함을 느낄 수 있는 객실</p>
				<div class="descBox">
					<section class="jsSwiperMotion keyVisual" style="display: block;">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="/images/rooms/list/1554963881483.jpg" alt=""></li>
								<li><img src="/images/rooms/list/1554963832061.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<div class="text on">
									<p class="title"><span>프리미엄 디럭스 오션 더블</span>해운대 해변의 아름다운 해안선을 만끽할 수 있는 객실</p>
									<div class="info">
										<p><span>전망</span>오션</p>
										<p><span>인원</span>성인 3인</p>
										<p><span>베드타입</span>더블</p>
										<p><span>건물</span>
											신관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe','double-new')" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<div class="text">
									<p class="title"><span>프리미엄 디럭스 오션 트윈</span>부서지는 파도를 감싸안는 해운대 해변을 정면으로 마주할 수 있는 객실</p>
									<div class="info">
										<p><span>전망</span>오션</p>
										<p><span>인원</span>성인 3인</p>
										<p><span>베드타입</span>트윈</p>
										<p><span>건물</span>
											신관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe','tween-new')" class="btn small2"><span>상세 보기</span></a>
								</div>
								
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>
			
			<div class="roomWrap">
				<h2>스위트</h2>
				<p class="text">편안한 침실과 안락한 거실에서 품격 있는 휴식을 누릴 수 있는 객실</p>
				<div class="descBox">
					<section class="jsSwiperMotion keyVisual" style="display: block;">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="/images/rooms/list/1555901117512.jpg" alt=""></li>
								<li><img src="/images/rooms/list/1554964067066.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<div class="text on">
									<p class="title"><span>스위트 시티</span>편안한 침실과 안락한 거실이 분리되어 품격 있는 휴식을 누릴 수 있는 스위트 룸</p>
									<div class="info">
										<p><span>전망</span>시티</p>
										<p><span>인원</span>성인 2인</p>
										<p><span>베드타입</span>더블, 온돌</p>
										<p><span>건물</span>
											본관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','suite','city')" class="btn small2"><span>상세 보기</span></a>
								</div>
								<div class="text">
									<p class="title"><span>스위트 오션 테라스</span>발코니에서 더 가까이 바다를 느낄 수 있고 편안한 침실과 안락한 거실이 분리되어<br>품격 있는 휴식을 누릴 수 있는 스위트 룸</p>
									<div class="info">
										<p><span>전망</span>오션</p>
										<p><span>인원</span>성인 2인</p>
										<p><span>베드타입</span>더블</p>
										<p><span>건물</span>
											본관,신관
										</p>
									</div>
									<a href="javascript:;" onclick="jsTapChange('rooms','suite','ot')" class="btn small2"><span>상세 보기</span></a>
								</div>
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- slick slider -->
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- //컨텐츠 영역 -->
<!-- 본문 끝 -->
<jsp:include page="../common/footer.jsp"></jsp:include>