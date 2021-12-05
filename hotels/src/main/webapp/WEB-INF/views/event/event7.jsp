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
						<a href="javascript:jsView('18')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202102/1614326133160.jpg" alt=""></p>
							<div class="txt">
								<strong>양념 소갈비 밀키트 투고 박스</strong>
								<span class="sub">파라다이스호텔 부산 온 더 플레이트 No.1 인기 메뉴 '양념 소갈비' 이제 집에서도 간편하게 즐겨보세요.</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
							<li data-animation="fadeInUp">
						<a href="javascript:jsView('19')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202103/1616741839556.jpg" alt=""></p>
							<div class="txt">
								<strong>THE SIGNATURE STEAK ENTREE!</strong>
								<span class="sub">최상의 육질과 맛, 미국산 최고급 블랙 앵거스만을 사용한 시그니처 토마호크 스테이크를 경험해 보세요!</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
						<li data-animation="fadeInUp">
						<a href="javascript:jsView('22')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202103/1616743240168.jpg" alt=""></p>
							<div class="txt">
								<strong>최고의 와인 페어링 공간, 닉스</strong>
								<span class="sub">참숯에 구운 최상급 한우 안심스테이크와 랍스타, 감각적인 와인 페어링과 함께 즐겨보세요.</span>
								
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
					
					
				
				</ul>
		<div class='paginate'>
			<a href='javascript:jsSearch(5);' class='direction prev'>처음</a>
<a href='javascript:jsSearch(5);' class='direction prev'>이전</a>
<a href='javascript:jsSearch(5);' class='num'>1</a>
<a href='javascript:jsSearch(7);' class='num active'>2</a>
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