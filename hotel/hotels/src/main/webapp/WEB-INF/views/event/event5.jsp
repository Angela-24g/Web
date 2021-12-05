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
ul.eventTab li:nth-of-type(3) a:link, a:visited, active, a:focus{
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
						<a href="javascript:jsView('23')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202103/1614924455346.jpg" alt=""></p>
							<div class="txt">
								<strong>EUROPEAN BRUNCH</strong>
								<span class="sub">닉스그릴에서 건강한 맛이 더해진 브런치를 즐기며 소중한 사람들과 특별한 추억을 만들어 보세요.</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
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
						<a href="javascript:jsView('21')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202103/1616744179308.jpg" alt=""></p>
							<div class="txt">
								<strong>모던 차이니즈 중식의 명가, 남풍(南風)</strong>
								<span class="sub">귀한 분을 위한 ‘건강한 중식’ 코스요리를 선사합니다.</span>
								
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
				</ul>
		
			<div class='paginate'>
			<a href='javascript:jsSearch(5);' class='direction prev'>처음</a>
<a href='javascript:jsSearch(5);' class='direction prev'>이전</a>
<a href='javascript:jsSearch(5);' class='num active'>1</a>
<a href='javascript:jsSearch(7);' class='num'>2</a>
<a href='javascript:jsSearch(7);' class='direction next'>다음</a>
<a href='javascript:jsSearch(7);' class='direction next'>끝</a>
</div>
		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->

<script src="js/event/jquery.waypoints.min.js"></script>
<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->