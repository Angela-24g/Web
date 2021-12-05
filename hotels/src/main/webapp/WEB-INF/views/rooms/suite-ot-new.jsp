<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/common_header.jsp"></jsp:include>
<form id="form1" name="form1">
	<input type="hidden" id="SBU_CD" name="SBU_CD" value="000001" /> <input
		type="hidden" id="P_SEQ" name="P_SEQ" />
</form>
<!-- 본문 시작 -->
<section id="container">

	<jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="rooms" name="submenu" />
		<jsp:param value="deluxe" name="ssubmenu1" />
		<jsp:param value="premium deluxe" name="ssubmenu2" />
		<jsp:param value="suite" name="ssubmenu3" />
	</jsp:include>
	
	<div class="hotelParadiseWrap">
		<div class="innerBox">
			<h1 class="contTitle">
				<span>객실</span>파라다이스호텔 부산에서 격이 다른 <br />휴식과 여유를 경험해보세요.
			</h1>

			<div class="tapBox">
				<ul>
					<li>
						<a href="javascript:;" onclick="jsTapChange('rooms','suite','city')">스위트 시티</a>
					</li>
					<li class="on">
						<a href="javascript:;" onclick="jsTapChange('rooms','suite','ot')">스위트 오션 테라스</a>
					</li>
				</ul>
			</div>

			<ul class="eventTab clearFixed">
				<li>
					<a href="javascript:;" onclick="jsTapChange('rooms','suite','ot')">본관</a>
				</li>
				<li class="on">
					<a href="javascript:;" onclick="jsTapChange('rooms','suite','ot-new')">신관</a>
				</li>
			</ul>

			<section class="jsSwiperMotion keyVisual">
				<div class="swiperWrap">
					<ul>
						<li>
							<p class="img">
								<img src="/images/rooms/suite/1554963697950.jpg" alt="" />
							</p>
						</li>
						<li>
							<p class="img">
								<img src="/images/rooms/suite/1554963698026.jpg" alt="" />
							</p>
						</li>
						<li>
							<p class="img">
								<img src="/images/rooms/suite/1554963698078.jpg" alt="" />
							</p>
						</li>
						<li>
							<p class="img">
								<img src="/images/rooms/suite/1554963698364.jpg" alt="" />
							</p>
						</li>
					</ul>
				</div>
				<div class="btnArrow">
					<a href="#" class="btnLeft">좌측</a>
					<a href="#" class="btnRight">우측</a>
				</div>
			</section>

			<div class="detailTextBox">
				<h2>스위트 오션 테라스</h2>
				<p class="subTit">발코니에서 더 가까이 바다를 느낄 수 있고 편안한 침실과 안락한 거실이 분리되어</br> 품격 있는 휴식을 누릴 수 있는 스위트 룸</p>
				<div class="text">문을 열고 들어서면 내 집 같은 포근함이 있습니다. 통 유리창으로 푸른 바다 장관이 펼쳐지는 침실과 창을 열고 발코니로 나가<br/>바닷바람을 맞을 수 있는 거실이 분리되어 있어 더욱 아늑한 느낌을 전합니다. 신관 특유의 은은한 파스텔 톤으로 꾸며져 있습니다. <br/></div>
				<div class="btnGroup">
					
					<a href="/images/rooms/common/1554959488244.pdf"
						target="Inroom" class="btn small layerPopOpen"><span>인룸다이닝</span></a>
					<a href="#map" class="btn small layerPopOpen"><span>도면보기</span></a>
					<a href="/reservation" class="btn small btnFull"><span>예약하기</span></a>
					
					
				</div>
			</div>

			<div class="detailInfo">
				<h3>
					상세정보
				</h3>
				<div class="infoDetail">
					<dl>
						<dt>
							객실 서비스
						</dt>
						<dd>
							<ul class="dotList type2">
								<li>개인용 금고</li><li>1회용 커피,녹차,홍차</li><li>미네랄 워터 2병</li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>
							어메니티
						</dt>
						<dd>
							<ul class="dotList">
								<li>베쓰 어메니티 5종</li><li>목욕용 가운 2개</li><li>페이스, 핸드 타올</li><li>베스 타올</li><li>샤워캡</li><li>빗</li><li>면봉</li><li>헤어드라이어</li><li>에머리보드</li><li>소잉 킷 등</li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>
							기본정보
						</dt>
						<dd>
							<ul class="dotList">
								<li>정상가 : 1,200,000원 <br />
								<span class="smallText">* 세금 및 봉사료 별도</span></li>
								<li>문의 및 예약 : 051) 749-2111~3</li>
								<li>기준인원 : 성인 2인</li>
								<li>배드타입 : 더블 <br />
								
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>
							체크인 아웃
						</dt>
						<dd>
							<dl>
								<dl class="tbl">
									<dt>Check in</dt>
									<dd>03:00 PM</dd>
								</dl>
								<dl class="tbl">
									<dt>Check out</dt>
									<dd>11:30 AM
										
									</dd>
								</dl>
								<span class="smallText"> </span>
						</dd>
					</dl>
				</div>
				
			</div>
			
			<div class="detailInfo">
				<h3>
					혜택 및 특전
				</h3>
				<section class="jsSwiperMotion type2">
					<div class="swiperWrap" data-show="2">
						<ul>
							
							<li>
								<p class="img">
									<img src="/images/rooms/common/1553928997738.jpg" alt="" />
								</p>
								<h4>야외 오션스파 풀 무료 이용 (1회)</h4>
								<p class="text">
									하늘 위 작은 바다, 야외 오션스파 풀.<br/>낮과 밤의 각기 다른 매력을 가진 파라다이스호텔 부산 야외 오션스파 풀에서<br/>사계절 내내 궁극의 휴양을 경험해보세요.<br/>
								</p>
							</li>
							
							<li>
								<p class="img">
									<img src="/images/rooms/common/1620110421314.jpg" alt="" />
								</p>
								<h4>PLAY LAB</h4>
								<p class="text">
									PLAY LAB(플레이 랩)은 콘솔 게임과 더불어 슈팅, 보드, 액션, 스포츠 등의 아케이드 엑티비티 게임 콘텐츠들로 구비되어 있어 남녀노소 모두가 즐길 수 있는 패밀리 엔터테인먼트 공간입니다.
								</p>
							</li>
							
						</ul>
					</div>
					<div class="btnArrow">
						<a href="#" class="btnLeft">좌측</a> <a href="#" class="btnRight">우측</a>
					</div>
				</section>
			</div>
			
			<div class="cautionBox type2">
				<h2>
					안내사항
				</h2>
				<ul class="dotList">
					<li>Check out 시간 초과 시 추가 요금 부과됩니다. (15:00 까지 : 객실 요금 50% / 15:00 이후 : 객실 요금 100%)</li><li>Late Check out은 사전 요청 시 한함. (체크 아웃 시간에 따라 요금이 부과됩니다.)</li><li>전 객실은 금연구역으로 지정되어 있습니다.</li><li>호텔 내 스파 부대시설(씨메르, 오션풀, 사우나, 피트니스 클럽, 실내골프 등)은 매월 넷째주 수요일 휴무입니다.  </br>호텔 사정에 따라 변경될 수 있으니 예약 시 참고하시기 바랍니다.</li>
				</ul>
			</div>
			
			<div class="events">
				<div class="jsSwiperMotion type2 eventSwipe">
					<h2>
						이벤트
					</h2>
					<div class="swiperWrap" data-show="3">
						<ul>
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('3061')">
									<p class="img">
										<img src="/images/rooms/common/1625101261137.jpg" alt="" />
									</p>
									<h4>REVIATALSING! SUMMER LEMON SPA</h4>
									<p class="text">여름엔 상큼하게 레몬!! 생기를 깨우는 상쾌한 레몬 씨메르</p>
									<span class="date">상시</span> 
								</a>
							</li>
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('3041')">
									<p class="img">
										<img src="/images/rooms/common/1625039183767.jpg" alt="" />
									</p>
									<h4>파라다이스 하와이 위크</h4>
									<p class="text">올해 해운대 가고, 내년에 하와이 가자!</p>
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('3021')">
									<p class="img">
										<img src="/images/rooms/common/1624603384238.jpg" alt="" />
									</p>
									<h4>GREEN PARADISE KIDS PARADISE</h4>
									<p class="text">환경의 소중함과 자연을 사랑하는 마음을 키우는 시간!</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2981')">
									<p class="img">
										<img src="/images/rooms/common/1623745353839.jpg" alt="" />
									</p>
									<h4>SUMMER HEALING GARDEN</h4>
									<p class="text">올 여름 푸른 바다와 싱그러운 녹음이 함께 하는 '치휴'의 공간, 썸머 힐링 가든을 만나보세요.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2861')">
									<p class="img">
										<img src="/images/rooms/common/1619056590880.jpg" alt="" />
									</p>
									<h4>MR. MEN LITTLE MISS 체험존</h4>
									<p class="text">국내에서 EQ의 천재들로 불리는 '미스터맨 리틀미스'의 캐릭터들이 파라다이스호텔 부산으로 찾아옵니다.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2961')">
									<p class="img">
										<img src="/images/rooms/common/1623223611868.jpg" alt="" />
									</p>
									<h4>이그제큐티브 라운지 애프터눈 티 타임 서비스</h4>
									<p class="text">스위트(SUITE) 객실 고객을 위한 스위트(SUITE) 한 여유</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2901')">
									<p class="img">
										<img src="/images/rooms/common/1621484014915.jpg" alt="" />
									</p>
									<h4>FICKLE PICKLE & MALIBU BEACH BAR</h4>
									<p class="text">파라다이스 오션풀과 피클피클의 만남</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2885')">
									<p class="img">
										<img src="/images/rooms/common/1624606074230.jpg" alt="" />
									</p>
									<h4>크리스탈 가든 빙수</h4>
									<p class="text">소복하게 갈아낸 우유 눈꽃 위에 태국산 프리미엄 마하차녹 망고를 듬뿍 올린 '망고빙수' 홈메이드 팥과 우유얼음, 아이스크림이 어우러져 완벽한 빙수 본연의 맛을 즐길 수 있는 '클래식 빙수'</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2843')">
									<p class="img">
										<img src="/images/rooms/common/1617352861420.jpg" alt="" />
									</p>
									<h4>LAVENDER HEALING & FLOWERY SPA</h4>
									<p class="text">5월엔 여기를 보라보라! 보랏빛 향기 품은 라벤더 힐링 봄 꽃 스파</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2862')">
									<p class="img">
										<img src="/images/rooms/common/1619168393646.jpg" alt="" />
									</p>
									<h4>PLAY LAB RENEWAL OPENING</h4>
									<p class="text">아이취향부터 어른취향까지 본격 취향저격 가족놀이 체험공간</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2821')">
									<p class="img">
										<img src="/images/rooms/common/1616044923986.jpg" alt="" />
									</p>
									<h4>파라디안 플래티넘 온라인 서비스 오픈!</h4>
									<p class="text">연회비 보다 더 큰 혜택, 파라디안 플래티넘을 이제 온라인으로 만나보세요.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2841')">
									<p class="img">
										<img src="/images/rooms/common/1617258921646.jpg" alt="" />
									</p>
									<h4>HAPPY TAPAS</h4>
									<p class="text">닉스 그릴 & 와인 에서 즐기는 타파스 타임</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2802')">
									<p class="img">
										<img
											src="/images/rooms/common/1615856861724.jpg"
											alt="" />
									</p>
									<h4>THE DAZZLING MOMENT</h4>
									<p class="text">프리미엄 위스키, 샴페인과 3대 진미 플래터 마리아주</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2762')">
									<p class="img">
										<img src="/images/rooms/common/1614326121581.jpg" alt="" />
									</p>
									<h4>SUKIYAKI SPECIAL</h4>
									<p class="text">일식당 사까에에서 새롭게 라이브 스키야키를 선보입니다.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2661')">
									<p class="img">
										<img src="/images/rooms/common/1614326133160.jpg" alt="" />
									</p>
									<h4>양념 소갈비 밀키트 투고 박스</h4>
									<p class="text">파라다이스호텔 부산 온 더 플레이트 No.1 인기 메뉴 '양념 소갈비' 이제 집에서도 간편하게 즐겨보세요.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2345')">
									<p class="img">
										<img src="/images/rooms/common/1616741839556.jpg" alt="" />
									</p>
									<h4>THE SIGNATURE STEAK ENTREE!</h4>
									<p class="text">최상의 육질과 맛, 미국산 최고급 블랙 앵거스만을 사용한 시그니처 토마호크 스테이크를 경험해 보세요!</p>
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2344')">
									<p class="img">
										<img src="/images/rooms/common/1616744804916.jpg" alt="" />
									</p>
									<h4>3代가함께하는 중식당 남풍</h4>
									<p class="text">웃음과 감사, 사랑이 함께하는 가족과의 만남 삼대가 함께라면 더욱 좋은 남풍에서 준비하세요!</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2343')">
									<p class="img">
										<img src="/images/rooms/common/1616744179308.jpg" alt="" />
									</p>
									<h4>모던 차이니즈 중식의 명가, 남풍(南風)</h4>
									<p class="text">귀한 분을 위한 ‘건강한 중식’ 코스요리를 선사합니다.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('2342')">
									<p class="img">
										<img src="/images/rooms/common/1616743240168.jpg" alt="" />
									</p>
									<h4>최고의 와인 페어링 공간, 닉스</h4>
									<p class="text">참숯에 구운 최상급 한우 안심스테이크와 랍스타, 감각적인 와인 페어링과 함께 즐겨보세요.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('1401')">
									<p class="img">
										<img src="/images/rooms/common/1614327577429.jpg" alt="" />
									</p>
									<h4>파라디안 리워드 가입시, 1만원 할인쿠폰 지급</h4>
									<p class="text">지금 파라다이스호텔 공식 홈페이지에서는  모든 회원에게 1만원 할인 쿠폰 지급!!</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('1601')">
									<p class="img">
										<img src="/images/rooms/common/1614324764092.jpg" alt="" />
									</p>
									<h4>VACANCE CREDIT</h4>
									<p class="text">오직 파라다이스에서만 누릴 수 있는 스마트한 바캉스 크래딧</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('1981')">
									<p class="img">
										<img src="/images/rooms/common/1616746832444.jpg" alt="" />
									</p>
									<h4>STOP COVID-19</h4>
									<p class="text">안심 클린 호텔 파라다이스호텔 부산</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
								<a href="javascript:jsView('1391')">
									<p class="img">
										<img src="/images/rooms/common/1614924455346.jpg" alt="" />
									</p>
									<h4>EUROPEAN BRUNCH</h4>
									<p class="text">닉스그릴에서 건강한 맛이 더해진 브런치를 즐기며 소중한 사람들과 특별한 추억을 만들어 보세요.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
							<li data-animation="fadeInUp">
							<a href="javascript:jsView('1390')">
									<p class="img">
										<img src="/images/rooms/common/1614925372135.jpg" alt="" />
									</p>
									<h4>DENMARK BREAD</h4>
									<p class="text">덴마크 브래드는 부드럽고 담백한 맛을 전해드립니다.</p>
									
									<span class="date">상시</span> 
								</a>
							</li>
							
						</ul>

						<div class="swiperArrow">
							<button class="btnLeft">
								<span>좌측</span>
							</button>
							<p class="number">
								<em>1</em><span></span>
							</p>
							<button class="btnRight">
								<span>우측</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->
<!-- 도면보기 -->
<div class="layerPopWrap normalLayer" id="map">
	<div class="bg"></div>
	<!-- layerPopCont -->
	<div class="layerPopCont" style="width: 864px;">
		<h1 class="popHeader">
			도면보기
		</h1>
		<div class="mapPop tc">
			<img src="/images/rooms/common/1554963707100.jpg" alt="" />
		</div>

		<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
	</div>
	<!-- //layerPopCont -->
</div>
<!-- //도면보기 -->

<!-- 본문 끝 -->
<jsp:include page="../common/footer.jsp"></jsp:include>