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
						<a href="javascript:jsView('14')">
							<p class="img"><img src="https://www.busanparadisehotel.co.kr/upload/202104/1619168393646.jpg" alt=""></p>
							<div class="txt">
								<strong>PLAY LAB RENEWAL OPENING</strong>
								<span class="sub">아이취향부터 어른취향까지 본격 취향저격 가족놀이 체험공간</span>
								
								<span class="date">상시</span>
								
							</div>
						</a>
					</li>
					
				</ul>
			
					<div class='paginate'>
			<a href='javascript:jsSearch(4);' class='direction prev'>처음</a>
<a href='javascript:jsSearch(4);' class='direction prev'>이전</a>
<a href='javascript:jsSearch(4);' class='num'>1</a>
<a href='javascript:jsSearch(6);' class='num active'>2</a>
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