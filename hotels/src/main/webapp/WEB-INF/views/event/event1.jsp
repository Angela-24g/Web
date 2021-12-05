<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<style>
ul.eventTab li:nth-of-type(1) a:link, a:visited, active, a:focus{
 	color: #9c836a;
    text-decoration: underline;
    border: none;
}</style>
<!-- 헤더끝  -->
<section id="container">
	<form id="form0" name="form0">
		<input type="hidden" id="PAGE_NO0" name="PAGE_NO0" value="1"/>
	</form>
		
	</form>
	<form id="form1" name="form1">
		<input type="hidden" id="SBU_CD" name="SBU_CD" value=""/>
		<input type="hidden" id="P_SEQ" name="P_SEQ" value=""/>
		<input type="hidden" id="PAGE_SIZE" name="PAGE_SIZE" value="9" />
		<input type="hidden" id="PAGE_NO" name="PAGE_NO" value="1" />
		
		<input type="hidden" id="F_ORDER_COLUMN" name="ORDER_COLUMN" value="1" />
	</form>


	<div class="eventWrap">
		<h1 class="contTitle"><span>EVENTS</span>델루나호텔부산에서 진행되는 <br> 다양한 이벤트를 만나보세요. </h1>
		
		<div class="eventBox">
			<div class="tapBox">
				<ul class="eventTab clearFixed">
				<li class="_"><a href="javascript:$('#SBU_CD').val('');jsSearch(1);" class="t">전체</a></li>
				
					
						<li class="_000001"><a href="javascript:$('#SBU_CD').val('000001');jsSearch(4);" class="k">
						
						
						시즌 이벤트
						
						</a></li>
					
						<li class="_000002"><a href="javascript:$('#SBU_CD').val('000002');jsSearch(5);" class="d">
						
						다이닝 이벤트
						
						</a></li>
					 
				</ul>
			</div>
			
			<div class="searchTab clearFixed">
				<p>총 <span class="txtRed">23</span>건</p>
			</div>
			
			
				<ul class="eventList clearFixed">
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('1')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202107/1625101261137.jpg" alt=""></p>
							<div class="txt">
								<strong>REVIATALSING! SUMMER LEMON SPA</strong>
								<span class="sub">여름엔 상큼하게 레몬!! 생기를 깨우는 상쾌한 레몬 씨메르</span>
								
								<span class="date">2021.07.16~2021.08.31</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('2')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1625039183767.jpg" alt=""></p>
							<div class="txt">
								<strong>파라다이스 하와이 위크</strong>
								<span class="sub">올해 해운대 가고, 내년에 하와이 가자!</span>
								
								<span class="date">2021.06.30~2021.09.03</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('3')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1624603384238.jpg" alt=""></p>
							<div class="txt">
								<strong>GREEN PARADISE KIDS PARADISE</strong>
								<span class="sub">환경의 소중함과 자연을 사랑하는 마음을 키우는 시간!</span>
								
								<span class="date">2021.07.31~2021.08.15</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('4')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1623745353839.jpg" alt=""></p>
							<div class="txt">
								<strong>SUMMER HEALING GARDEN</strong>
								<span class="sub">올 여름 푸른 바다와 싱그러운 녹음이 함께 하는 '치휴'의 공간, 썸머 힐링 가든을 만나보세요.</span>
								
								<span class="date">2021.07.16~2021.08.21</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('5')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202104/1619056590880.jpg" alt=""></p>
							<div class="txt">
								<strong>MR. MEN LITTLE MISS 체험존</strong>
								<span class="sub">국내에서 EQ의 천재들로 불리는 '미스터맨 리틀미스'의 캐릭터들이 파라다이스호텔 부산으로 찾아옵니다.</span>
								
								<span class="date">2021.05.01~2021.08.31</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('6')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1623223611868.jpg" alt=""></p>
							<div class="txt">
								<strong>이그제큐티브 라운지 애프터눈 티 타임 서비스</strong>
								<span class="sub">스위트(SUITE) 객실 고객을 위한 스위트(SWEET) 한 여유</span>
								
								<span class="date">2021.07.16~2021.08.21</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('7')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202105/1621484014915.jpg" alt=""></p>
							<div class="txt">
								<strong>FICKLE PICKLE & MALIBU BEACH BAR</strong>
								<span class="sub">파라다이스 오션풀과 피클피클의 만남</span>
								
								<span class="date">2021.05.21~2021.07.15</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('8')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1624932159302.jpg" alt=""></p>
							<div class="txt">
								<strong>사까에 명품 냉면</strong>
								<span class="sub">깔끔하고 담백한 육수와 높은 메밀함량으로 부드러운 면이 특징이며, 주방장 특제 양념갈비와 함께 제공됩니다.</span>
								
								<span class="date">2021.07.05~</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('9')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1624606074230.jpg" alt=""></p>
							<div class="txt">
								<strong>크리스탈 가든 빙수</strong>
								<span class="sub">소복하게 갈아낸 우유 눈꽃 위에 태국산 프리미엄 마하차녹 망고를 듬뿍 올린 '망고빙수' 홈메이드 팥과 우유얼음, 아이스크림이 어우러져 완벽한 빙수 본연의 맛을 즐길 수 있는 '클래식 빙수'</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
				</ul>
			
			<div class='paginate'><a href='javascript:jsSearch(1);' class='direction prev'>처음</a>
<a href='javascript:jsSearch(1);' class='direction prev'>이전</a>
<a href='#' class='num active'>1</a>
<a href='javascript:jsSearch(2);' class='num'>2</a>
<a href='javascript:jsSearch(3);' class='num'>3</a>
<a href='javascript:jsSearch(2);' class='direction next'>다음</a>
<a href='javascript:jsSearch(3);' class='direction next'>끝</a>
</div>

		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->

<script src="js/event/jquery.waypoints.min.js"></script>
<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->