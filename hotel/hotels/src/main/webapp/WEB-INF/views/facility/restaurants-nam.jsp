<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->

<section id="container">

	<!-- 서브헤더 : 필요시 사용! -->
	<%-- <jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="facility" name="submenu" />
		<jsp:param value="restaurants" name="ssubmenu1" />
		<jsp:param value="take out" name="ssubmenu2" />
	</jsp:include> --%>
	<!-- 서브헤더 끝  -->

	<div class="hotelParadiseWrap">
		<div class="innerBox">

			<h1 class="contTitle">
				<span> RESTAURANTS </span>델루나호텔 부산의 다양한 레스토랑에서<br>마스터 쉐프들이
				펼치는 화려한 미식의 세계로 초대합니다.
			</h1>
			<div class="tapBox">
				<ul>
					<li><a href="/restaurants-nyx"> 닉스 </a></li>
					<li class="on"><a href="/restaurants-nam"> 남풍 </a></li>
					<li><a href="/restaurants-sakca"> 사까에 </a></li>
				</ul>
			</div>
			<div class="facilityVisualWrap jsSwiperMotion keyVisual"
				style="display: block;">
				<ul class="facilityVisual">
					<li><p class="img">
							<img src="/images/facility/restaurants/nam1.jpg" />
						</p></li>
					<li><p class="img">
							<img src="/images/facility/restaurants/nam2.jpg" />
						</p></li>
					<li><p class="img">
							<img src="/images/facility/restaurants/nam3.jpg" />
						</p></li>
				</ul>
			</div>

			<div class="detailTextBox">
				<h2>남풍</h2>
				<p class="subTit">
					광동식 모던 차이니즈 중식을 완성한 정통과 품격의 남풍
					<!-- 서브타이틀이 있을때 노출 -->
				</p>
				<div class="text subinfo">
					<p>
						정통 광동식 중화요리를 한국식으로 재해석해 선보이는 남풍은 ‘건강한 중식’을 추구합니다.
						전국 산지에서 공수한 신선한 식재료가 조화롭게 어우러져 깊은 풍미를 자아내며, 남풍만의 특별한 레시피로 선보이는 어자해삼, 광동식 송아지 갈비요리는
						맛과 더불어 몸에 좋은 음식으로 다양한 연령과 취향의 고객을 만족시켜 드립니다.
						오랜 명성과 함께 ‘3대(代)가 함께 하는 중식당 남풍’은 다양한 규모의 별실이 마련되어 있어 돌잔치, 비즈니스, 가족 모임으로 더할 나위 없이 좋습니다.
					</p>
				</div>
				<div class="btnGroup" id="btnGroup">
					<a href="javascript:alert('서비스 준비중입니다.');" onfocus="this.blur()" class="btn small btnFull "
						id=""><span>Take Out 예약하기</span></a>
					<!--예약하기-->
					<%-- <c:if test=" ${(not empty member_no) or (not empty setCookie)}"> --%>
					<a href="/restaurants-reserve?rtName=nam"
						class="btn small btnFull layerPopOpen" id="popUpBtn"> <span>레스토랑
							예약하기</span></a>
					<%-- </c:if> --%>
				</div>
			</div>
			<div class="detailInfo">
				<h3>상세정보</h3>
				<div class="infoDetail">
					<dl>
						<dt>운영시간</dt>
						<dd>
							[중식]<br>월~금요일 12:00 ~ 14:30<br>토,일요일 및 공휴일 12:00~15:00<br>
							<br>[석식] <br>월~금요일 18:00 ~ 21:30<br>토~일요일 및 공휴일
							18:00 ~ 22:00
						</dd>
					</dl>
					<dl>
						<dt>좌석수</dt>
						<dd>
							76석<br>(별실 10석 1실 / 16석 1실)
						</dd>
					</dl>
					<dl>
						<dt>위치</dt>
						<dd>신관 2F</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>051-749-2274/2275</dd>
					</dl>
				</div>
			</div>

			<div class="events" style="margin-bottom: 20px;">
				<div class="eventSliderWrap jsSwiperMotion type2 eventSwipe"
					style="display: block;">
					<h2>이벤트</h2>
					<ul class="eventSlider">
						<li>
							<p class="img">
								<img src="/images/facility/restaurants/event1.jpg" />
							</p>
							<h4>THE SIGNATURE STEAK ENTREE!</h4>
							<p class="text subinfo2">최상의 육질과 맛, 미국산 최고급 블랙 앵거스만을 사용한 시그니처
								토마호크 스테이크를 경험해 보세요!</p> <span class="date">상시</span>
						</li>
						<li>
							<p class="img">
								<img src="/images/facility/restaurants/event2.jpg" />
							</p>
							<h4>STEAK WEEK</h4>
							<p class="text subinfo2">뉴욕 3대 스테이크로 꼽히는 울프강 스테이크하우스의 시그니처
								메뉴와 함께 닉스의 전문 셰프들이 제철 식재료를 활용해 선보이는 스테이크 축제!</p> <span class="date">상시</span>
						</li>
						<li>
							<p class="img">
								<img src="/images/facility/restaurants/event3.jpg" />
							</p>
							<h4>최고의 와인 페어링 공간, 닉스</h4>
							<p class="text subinfo2">참숯에 구운 최상급 한우 안심스테이크와 랍스타, 감각적인 와인
								페어링과 함께 즐겨보세요.</p> <span class="date">상시</span>
						</li>
						<li>
							<p class="img">
								<img src="/images/facility/restaurants/event1.jpg" />
							</p>
							<h4>THE SIGNATURE STEAK ENTREE!</h4>
							<p class="text subinfo2">최상의 육질과 맛, 미국산 최고급 블랙 앵거스만을 사용한 시그니처
								토마호크 스테이크를 경험해 보세요!</p> <span class="date">상시</span>
						</li>
						<li>
							<p class="img">
								<img src="/images/facility/restaurants/event2.jpg" />
							</p>
							<h4>STEAK WEEK</h4>
							<p class="text subinfo2">뉴욕 3대 스테이크로 꼽히는 울프강 스테이크하우스의 시그니처
								메뉴와 함께 닉스의 전문 셰프들이 제철 식재료를 활용해 선보이는 스테이크 축제!</p> <span class="date">상시</span>
						</li>
						<li>
							<p class="img">
								<img src="/images/facility/restaurants/event3.jpg" />
							</p>
							<h4>최고의 와인 페어링 공간, 닉스</h4>
							<p class="text subinfo2">참숯에 구운 최상급 한우 안심스테이크와 랍스타, 감각적인 와인
								페어링과 함께 즐겨보세요.</p> <span class="date">상시</span>
						</li>
					</ul>
				</div>
			</div>

			<div class="detailInfo">
				<h3>메뉴 소개</h3>
				<section class="jsSwiperMotion" style="display: block;">
					<div class="swiperWrap" data-show="2">
						<ul class="slick-initialized slick-slider">


							<div aria-live="polite" class="slick-list draggable">
								<div class="slick-track"
									style="opacity: 1; width: 1152px; transform: translate3d(0px, 0px, 0px);"
									role="listbox">
									<li class="slick-slide slick-current slick-active"
										data-slick-index="0" aria-hidden="false" style="width: 545px;"
										tabindex="-1" role="option" aria-describedby="slick-slide20">
										<p class="img">
											<img
												src="https://www.busanparadisehotel.co.kr/upload/202008/1597373458986.jpg"
												alt="">
										</p>
										<h4 class="row2">자연주의 브런치</h4>
										<p class="text subinfo">철저한 위생관리와 수경재배를 통한 농산물 우수관리 인증 유럽
											특수채소와 천연발효빵 등 유럽 본토의 건강한 맛을 담은 자연주의 브런치를 경험해 보세요.</p>
									</li>
									<li class="slick-slide slick-active" data-slick-index="1"
										aria-hidden="false" style="width: 545px;" tabindex="-1"
										role="option" aria-describedby="slick-slide21">
										<p class="img">
											<img
												src="https://www.busanparadisehotel.co.kr/upload/202008/1597373463506.jpg"
												alt="">
										</p>
										<h4 class="row2">디너 코스</h4>
										<p class="text subinfo">닉스 마스터쉐프 ‘다니엘 황’이 선보이는 트렌디한 유러피안
											감성의 시그니쳐 코스요리로 사랑하는 사람과의 하루를 더욱 특별하게 만들어보세요.</p>
									</li>
								</div>
							</div>





						</ul>
					</div>
					<div class="btnArrow" style="display: none;">
						<a href="#" class="btnLeft slick-arrow slick-hidden"
							aria-disabled="true" tabindex="-1">죄측</a> <a href="#"
							class="btnRight slick-arrow slick-hidden" aria-disabled="true"
							tabindex="-1">우측</a>
					</div>
				</section>
				<div class="btnDownloadLink">
					<a
						href="/images/facility/restaurants/menu.pdf"
						target="menu" class="btnDownload">Menu</a> <a
						href="/images/facility/restaurants/brunchMenu.pdf"
						target="menu" class="btnDownload">Brunch Menu</a> <a
						href="/images/facility/restaurants/lunchCourse.pdf"
						target="menu" class="btnDownload">Lunch Course</a> <a
						href="/images/facility/restaurants/dinnerCourse.pdf"
						target="menu" class="btnDownload">Dinner Course</a>
				</div>
			</div>

			<div class="detailInfo">
				<h3>쉐프</h3>
				<ul class="col2ListWrap chef">

					<li>
						<div class="img">
							<img
								src="/images/facility/restaurants/chef.jpg"
								alt="">
						</div>
						<div class="txt chef">
							<h4>마스터 셰프 ‘다니엘 황’</h4>
							<p class="text subinfo">
								이탈리안, 프렌치, 아메리칸 스타일의 다양한 요리를 틀에 정하지 않은 요리법으로 트렌디하게 재해석하여 선보이는<br>
								다니엘 황 셰프는 좋은 재료에 대한 남다른 이해도를 잘 표현함과 동시에 편안하게 즐길 수 있는 수준 높은 요리,<br>
								가장 잘 어울리는 와인을 매칭하여 환상적인 만찬을 선사합니다.
							</p>
						</div>
					</li>

				</ul>
			</div>

			<div class="cautionBox type2">
				<h2>안내사항</h2>

				<ul class="dotList">
					<li>성수기 및 연말연시 기간 중에는 영업장 상황에 따라 영업시간 및 가격이 변동될 수 있습니다.</li>
				</ul>
			</div>

		</div>
	</div>
</section>
<!-- slick slider -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->