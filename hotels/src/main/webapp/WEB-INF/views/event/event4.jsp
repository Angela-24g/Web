<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<style>
ul.eventTab li:nth-of-type(1) a:link, a:visited, active, a:focus{
 	color: #999999;
    text-decoration: none;
    border: none;
}
ul.eventTab li:nth-of-type(2) a:link, a:visited, active, a:focus{
 	color: #9c836a;
    text-decoration: underline;
    border: none;
}
</style>
<!-- 헤더끝  -->
<!-- 컨텐츠 영역 -->
<section id="container">
	<form id="form0" name="form0">
		<input type="hidden" id="PAGE_NO0" name="PAGE_NO0" value="1"/>
	</form>
	<form id="form1" name="form1">
		<input type="hidden" id="SBU_CD" name="SBU_CD" value=""/>
		<input type="hidden" id="P_SEQ" name="P_SEQ" value=""/>
		<input type="hidden" id="PAGE_SIZE" name="PAGE_SIZE" value="9" />
		<input type="hidden" id="PAGE_NO" name="PAGE_NO" value="3" />
		
		<input type="hidden" id="F_ORDER_COLUMN" name="ORDER_COLUMN" value="1" />
	</form>


	<div class="eventWrap">
		<h1 class="contTitle"><span>EVENTS</span>델루나호텔부산에서 진행되는 <br> 다양한 이벤트를 만나보세요. </h1>
		
		<div class="eventBox">
			<div class="tapBox">
				<ul class="eventTab clearFixed">
				<li class="_"><a href="javascript:$('#SBU_CD').val('');jsSearch(1);">전체</a></li>
				
					
						<li class="_000001"><a href="javascript:$('#SBU_CD').val('000001');jsSearch(4);">
						
						시즌 이벤트
						
						</a></li>
					
						<li class="_000002"><a href="javascript:$('#SBU_CD').val('000002');jsSearch(5);">
						
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
						<a href="javascript:jsView('12')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202105/1622102866121.jpg" alt=""></p>
							<div class="txt">
								<strong>ALOHA! TROPICAL WEDDING</strong>
								<span class="sub">트로피칼 무드의 이국적인 데코레이션과 함께 특별한 웨딩을 합리적인 가격으로 파라다이스 호텔 부산에서 제안합니다.</span>
								
								<span class="date">2021.07.17~2021.09.26</span>
								
							</div>
						</a>
					</li>
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('13')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202104/1617352861420.jpg" alt=""></p>
							<div class="txt">
								<strong>LAVENDER HEALING & FLOWERY SPA</strong>
								<span class="sub">5월엔 여기를 보라보라! 보랏빛 향기 품은 라벤더 힐링 봄 꽃 스파</span>
								
								<span class="date">2021.05.01~2021.07.15</span>
								
							</div>
						</a>
					</li>
				</ul>


<div class='paginate'>	
<a href='javascript:jsSearch(4);' class='direction prev'>처음</a>
<a href='javascript:jsSearch(4);' class='direction prev'>이전</a>
<a href='javascript:jsSearch(4);' class='num active'>1</a>
<a href='javascript:jsSearch(6);' class='num'>2</a>
<a href='javascript:jsSearch(6);' class='direction next'>다음</a>
<a href='javascript:jsSearch(6);' class='direction next'>끝</a>
</div>

		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->

<script src="js/event/jquery.waypoints.min.js"></script>
<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->