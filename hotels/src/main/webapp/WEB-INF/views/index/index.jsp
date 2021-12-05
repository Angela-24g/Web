<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
		<!-- 대문 시작 -->
		<div class="main">

			<!-- Full-width images with number and caption text -->
			<div class="main-inner fade">
				<img src="/images/index/index_top.jpg">
			</div>

		</div>
		<!-- 대문 끝 -->
		<!-- offer 시작 -->
		<section class="info">
			<div class="hotel_info">
				<div class="hotel_info_title">
					<h1>rooms</h1>
					<p>호텔에서 특별한 하루를 보내세요.</p>
				</div>

				<div class="hotel_info_detail">
					<ul class="hotel_info_ul">
						<li>
							<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','city')" class="photolink">
								<div class="photozone">
									<img src="/images/index/index_offer1.jpg" alt="" width="350px" height="211px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">디럭스 시티</strong>
									<span class="info_detail_content">모던하면서도 세련된 최신 트렌드와 은은한 조명과 어우러진 다크 브라운의 조화</span>
									<p class="info_detail_price">330,000원 ~</p>
								</div>
							</a>
						</li>
						<li>
							<a  href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe','double-new')" class="photolink">
								<div class="photozone">
									<img src="/images/index/index_offer2.jpg" alt="" width="350px" height="211px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">프리미엄 디럭스 오션 더블</strong>
									<span class="info_detail_content">해운대 해변의 아름다운 해안선을 만끽할 수 있는 객실</span>
									<p class="info_detail_price">420,000원 ~</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:;" onclick="jsTapChange('rooms','suite','ot')" class="photolink">
								<div class="photozone">
									<img src="/images/index/index_offer3.jpg" alt="" width="350px" height="211px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">스위트 오션 테라스</strong>
									<span class="info_detail_content">편안한 침실과 안락한 거실이 분리되어 품격 있는 휴식을 누릴 수 있는 스위트
										룸</span>
									<p class="info_detail_price">220,000원 ~</p>
								</div>
							</a>
						</li>
					</ul>
				</div>
				<a href="javascript:;" onclick="jsTapChange('rooms')">전체보기</a>
			</div>

		</section>
		<!-- offer 끝 -->


		<!-- 이벤트소개 시작 -->
		<section class="event">
			<div class="event_info">

				<div class="event_info_title">
					<h1>EVENT</h1>
					<p>호텔에서 진행중인 이벤트를 참고하세요.</p>
				</div>

				<div class="event_info_detail">
					<ul class="event_info_ul">
						<li>
							<a href="/event/eventView?SBU_CD=&P_SEQ=17&PAGE_SIZE=9&PAGE_NO=2&ORDER_COLUMN=1" class="eventlink">
								<div class="eventzone">
									<img src="/images/index/index_event1.jpg" alt="" width="280px" height="183px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">SUKIYAKI SPECIAL</strong>
									<span class="info_detail_content">일식당 사까에에서 새롭게 라이브 스키야키를 선보입니다.</span>
								</div>
							</a>
						</li>
						<li>
							<a href="/event/eventView?SBU_CD=&P_SEQ=20&PAGE_SIZE=9&PAGE_NO=3&ORDER_COLUMN=1" class="eventlink">
								<div class="eventzone">
									<img src="/images/index/index_event2.jpg" alt=""width="280px" height="183px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">3代가함께하는 중식당 남풍</strong>
									<span class="info_detail_content">웃음과 감사, 사랑이 함께하는 가족과의 만남 삼대가 함께라면 더욱 좋은 남풍에서
										준비하세요!</span>
								</div>
							</a>
						</li>
						<li>
							<a href="/event/eventView?SBU_CD=&P_SEQ=22&PAGE_SIZE=9&PAGE_NO=3&ORDER_COLUMN=1" class="eventlink">
								<div class="eventzone">
									<img src="/images/index/index_event3.jpg" alt="" width="280px" height="183px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">HAPPY TAPAS</strong>
									<span class="info_detail_content">닉스 그릴 & 와인 에서 즐기는 타파스 타임</span>
								</div>
							</a>
						</li>
						<li>
							<a href="/event/eventView?SBU_CD=&P_SEQ=15&PAGE_SIZE=9&PAGE_NO=3&ORDER_COLUMN=1" class="eventlink">
								<div class="eventzone">
									<img src="/images/index/index_event4.jpg" alt="" width="280px" height="183px">
								</div>
								<div class="txt">
									<strong class="info_detail_title">HAPPY TAPAS</strong>
									<span class="info_detail_content">닉스 그릴 & 와인 에서 즐기는 타파스 타임</span>
								</div>
							</a>
						</li>
					</ul>
				</div>
				<a href="#" class="top">전체보기</a>
			</div>
		</section>
		<!-- 이벤트소개 끝 -->

		<!-- 슬라이드 시작 -->
		<section class="slide">
			<div class="slide_info">

				<div class="slide_title">
					<h1>GALLERY</h1>
				</div>
				<div class="slide_wrapper">
					<ul class="slides">
						<li><img src="/images/index/index_gallery1.png" alt=""></li>
						<li><img src="/images/index/index_gallery3.jpg" alt=""></li>
						<li><img src="/images/index/index_gallery4.png" alt=""></li>
						<li><img src="/images/index/index_gallery5.png" alt=""></li>
						<li><img src="/images/index/index_gallery6.png" alt=""></li>
						<li><img src="/images/index/index_gallery7.png" alt=""></li>
						<li><img src="/images/index/index_gallery8.jpg" alt=""></li>
					</ul>
				</div>
			</div>
		</section>
		<!-- 슬라이드 끝 -->
	</div>
    	<script src="/js/index/index.js"></script>
    	<jsp:include page="../common/footer.jsp"></jsp:include>