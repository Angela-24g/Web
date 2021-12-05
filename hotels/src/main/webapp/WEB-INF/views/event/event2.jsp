<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<style>
ul.eventTab li:nth-of-type(1) a:link, a:visited, active, a:focus{
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
		<input type="hidden" id="PAGE_NO" name="PAGE_NO" value="2" />
		
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
						<a href="javascript:jsView('10')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1624606545544.jpg" alt=""></p>
							<div class="txt">
								<strong>시원한 여름을 보내기 위한 남풍 해물 냉짬뽕</strong>
								<span class="sub">살얼음이 동동, 담백하고 시원한 특제 육수에 탱글탱글한 면발과 다양한 해산물이 어우러진 남풍 여름철 별미를 즐겨보세요!</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('11')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202106/1624606376321.jpg" alt=""></p>
							<div class="txt">
								<strong>부티크 베이커리 망고 디저트</strong>
								<span class="sub">달콤하면서도 싱그러운 여름 열대과일 망고로 만든 디저트를 선보입니다.</span>
								
								<span class="date">상시</span>
								
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
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('14')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202104/1619168393646.jpg" alt=""></p>
							<div class="txt">
								<strong>PLAY LAB RENEWAL OPENING</strong>
								<span class="sub">아이취향부터 어른취향까지 본격 취향저격 가족놀이 체험공간</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('15')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202104/1617258921646.jpg" alt=""></p>
							<div class="txt">
								<strong>HAPPY TAPAS</strong>
								<span class="sub">닉스 그릴 & 와인 에서 즐기는 타파스 타임</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('16')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202103/1615856861724.jpg" alt=""></p>
							<div class="txt">
								<strong>THE DAZZLING MOMENT</strong>
								<span class="sub">프리미엄 위스키, 샴페인과 3대 진미 플래터 마리아주</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('17')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202102/1614326121581.jpg" alt=""></p>
							<div class="txt">
								<strong>SUKIYAKI SPECIAL</strong>
								<span class="sub">일식당 사까에에서 새롭게 라이브 스키야키를 선보입니다.</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					<li data-animation="fadeInUp">
						<a href="javascript:jsView('18')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202102/1614326133160.jpg" alt=""></p>
							<div class="txt">
								<strong>양념 소갈비 밀키트 투고 박스</strong>
								<span class="sub">파라다이스호텔 부산 온 더 플레이트 No.1 인기 메뉴 '양념 소갈비' 이제 집에서도 간편하게 즐겨보세요.</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
				</ul>
			
			<div class='paginate'><a href='javascript:jsSearch(1);' class='direction prev'>처음</a>
<a href='javascript:jsSearch(1);' class='direction prev'>이전</a><a href='javascript:jsSearch(1);' class='num' >1</a>
<a href='#' class='num active'>2</a><a href='javascript:jsSearch(3);' class='num'>3</a>
<a href='javascript:jsSearch(3);' class='direction next'>다음</a>
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