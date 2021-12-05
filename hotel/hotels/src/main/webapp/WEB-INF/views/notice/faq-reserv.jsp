<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include> 
	<style>
	div.faqWrap ul.categoryIcon li:nth-of-type(2) a:link, a:visited, active, a:focus, .icon2{
      opacity: 1.0;
	}
	</style>
<!-- 헤더끝  -->
<section id="container">
		<!-- 서브헤더 : 필요시 사용! -->
		<section class="subGnb">
			<div class="innerSubGnb">
				<h1>
					<a href="/notice/faq">Customer Serivce</a>
				</h1>
				<ul>
					<li class="tabcontent"><a href="/notice/faq">FAQ</a></li>
					<li class="tabcontent"><a href="/notice/qna">Q&amp;A</a></li>
					<li class="tabcontent"><a href="/notice/location">MAP</a></li>
					
				</ul>
			</div>
		</section>

<form id="form1" name="form1">
		<input type="hidden" id="SBU_CD" name="SBU_CD" value="">
		<input type="hidden" id="P_SEQ" name="P_SEQ" value="">
		<input type="hidden" id="PAGE_SIZE" name="PAGE_SIZE" value="9">
		<input type="hidden" id="PAGE_NO" name="PAGE_NO" value="1">
		
		<input type="hidden" id="F_ORDER_COLUMN" name="ORDER_COLUMN" value="1">
	</form>
	
	<div class="faqWrap">
		<h1 class="contTitle">
			<span>FAQ/Q&amp;A</span>
			회원님들께서 자주 문의하시는 <br>질문과 답변입니다. 
		</h1>
		<!-- 버튼 위치 변경 -->
		<div class="rightButton">
		
			 
				<a href="/notice/qna" onclick="fnMemberLogin();return false;" class="btn layerPopOpen small">
					<span>1:1문의 하기</span>
				</a> 
			 
		
</div>
		<ul class="categoryIcon clearFixed">
			<li class="active"><a href="/notice/faq" onclick="jsSearch('1', 'null', '')"><span></span>전체</a></li>
			
			<li><a href="/notice/faq/reservation" onclick="jsSearch('1', '000001', '')"><span class="icon2"></span>
					
					예약/포인트
					</a>
			</li>
			
			<li><a href="/notice/faq/room" onclick="jsSearch('1', '000002', '')"><span class="icon3"></span>
					
					객실/패키지
					</a>
			</li>
			
			<li><a href="/notice/faq/lifestyle" onclick="jsSearch('1', '000003', '')"><span class="icon4"></span>
					
					라이프스타일
					</a>
			</li>
			
			
			
			<li><a href="/notice/faq/others" onclick="jsSearch('1', '000005', '')"><span class="icon6"></span>
					
					기타
					</a>
			</li>
			
			
			
		</ul>
		<div class="faqBox">
			<div class="utilMenu">
				<button class="accordion" id="accordion"><strong class="listTit">예약</strong><span class="opValue">예약 취소는 언제까지 가능한가요?</span></button>
				<div class="panel">
				  <p>일반 예약은 체크인 1일전 15:00시 이전까지 연락 주시면
						별도의 요금 지불 없이 취소 가능합니다만, 예약 조건에 따라 취소규정이 상이하므로 예약시
						확인 부탁드립니다.
						
						문의 및 예약: 02.310.7710</p></div>
				
				<button class="accordion"><strong class="listTit">예약</strong><span class="opValue">제가 예약한 객실 번호를 미리 알 수 있을까요?</span></button>
				<div class="panel">
				  <p>객실 배정은 당일 프론트에서 진행하기 때문에 체크인 전에 미리 알기는 어렵습니다.</p></div>
				
				</div>
			
			<!-- 결과 없음-->
			<div class="no_result" style="display: none;">
				<i class="ico_noresult"></i> <strong> <span>“”
				</span> 에 대한 검색결과가 없습니다.
				</strong>
				<div>
					단어의 철자가 정확한지 확인해 보세요.<br> 한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.
				</div>
			</div>
		</div>
			<div class="lastdiv"></div> 
	</div>

</section>
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->