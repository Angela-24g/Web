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
				<span>TO GO BOX</span>델루나부산 호텔에 오신 것을 환영합니다.
			</h1>
			<div class="eventBox">
				<div class="searchTab clearFixed">
					<p>
						총 <span class="txtRed">5</span>건
					</p>
					<div class="ui-select-wrapper">
						<select class="selectBox" id="ORDER_COLUMN" name="ORDER_COLUMN"
							style="width: 152px; display: none;">
							<option value="1">인기순</option>
							<option value="2">최신순</option>
							<option value="3">마감임박순</option>
						</select>
						<div class="selectBox" style="width: 152px;">
							<a href="#" class="ui-select-trigger">인기순</a>
							<ul class="ui-select-options" style="display: none;">
								<li class=""><a href="#" class="ui-select-option"
									data-value="1">인기순</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="2">최신순</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="3">마감임박순</a></li>
							</ul>
						</div>
					</div>
				</div>
				<ul class="eventList clearFixed">
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum1.jpg" alt="">
							</p>
							<div class="txt">
								<strong>마스터 셰프 프리미엄 TO-GO [3종]</strong> <span class="sub">프리미엄
									투 고 박스는기력회복에 좋은 민물장어와 한우, 송이버섯, 해삼, 전복 등을 활용해 만든 메뉴로 마치 호텔에서
									식사하는 듯한 셰프의 정성과 맛의 진미를 즐기실 수 있습니다.</span> <span class="rate">53,000
									원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum2.jpg" alt="">
							</p>
							<div class="txt">
								<strong>파인다이닝 시그니처 TO-GO [3종]</strong> <span class="sub">델루나호텔
									셰프가 만든 미식 도시락, 다양한 메뉴와 합리적인 가격의 투고 박스를 즐겨보세요.</span> <span
									class="rate">35,000 원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum1.jpg" alt="">
							</p>
							<div class="txt">
								<strong>마스터 셰프 프리미엄 TO-GO [3종]</strong> <span class="sub">프리미엄
									투 고 박스는기력회복에 좋은 민물장어와 한우, 송이버섯, 해삼, 전복 등을 활용해 만든 메뉴로 마치 호텔에서
									식사하는 듯한 셰프의 정성과 맛의 진미를 즐기실 수 있습니다.</span> <span class="rate">53,000
									원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum2.jpg" alt="">
							</p>
							<div class="txt">
								<strong>파인다이닝 시그니처 TO-GO [3종]</strong> <span class="sub">델루나호텔
									셰프가 만든 미식 도시락, 다양한 메뉴와 합리적인 가격의 투고 박스를 즐겨보세요.</span> <span
									class="rate">35,000 원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum1.jpg" alt="">
							</p>
							<div class="txt">
								<strong>마스터 셰프 프리미엄 TO-GO [3종]</strong> <span class="sub">프리미엄
									투 고 박스는기력회복에 좋은 민물장어와 한우, 송이버섯, 해삼, 전복 등을 활용해 만든 메뉴로 마치 호텔에서
									식사하는 듯한 셰프의 정성과 맛의 진미를 즐기실 수 있습니다.</span> <span class="rate">53,000
									원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum2.jpg" alt="">
							</p>
							<div class="txt">
								<strong>파인다이닝 시그니처 TO-GO [3종]</strong> <span class="sub">델루나호텔
									셰프가 만든 미식 도시락, 다양한 메뉴와 합리적인 가격의 투고 박스를 즐겨보세요.</span> <span
									class="rate">35,000 원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum1.jpg" alt="">
							</p>
							<div class="txt">
								<strong>마스터 셰프 프리미엄 TO-GO [3종]</strong> <span class="sub">프리미엄
									투 고 박스는기력회복에 좋은 민물장어와 한우, 송이버섯, 해삼, 전복 등을 활용해 만든 메뉴로 마치 호텔에서
									식사하는 듯한 셰프의 정성과 맛의 진미를 즐기실 수 있습니다.</span> <span class="rate">53,000
									원~</span>
							</div>
					</a></li>
					<li data-animation="fadeInUp" class="animated fadeInUp"><a
						href="/takeout-list/1">
							<p class="img">
								<img src="/images/facility/takeout/takeout_thum2.jpg" alt="">
							</p>
							<div class="txt">
								<strong>파인다이닝 시그니처 TO-GO [3종]</strong> <span class="sub">델루나호텔
									셰프가 만든 미식 도시락, 다양한 메뉴와 합리적인 가격의 투고 박스를 즐겨보세요.</span> <span
									class="rate">35,000 원~</span>
							</div>
					</a></li>
				</ul>
				<div class="paginate">
					<a href="javascript:jsSearch(1);" class="direction prev">처음</a> <a
						href="javascript:jsSearch(1);" class="direction prev">이전</a><a
						href="#" class="num active">1</a><a href="javascript:jsSearch(1);"
						class="direction next">다음</a> <a href="javascript:jsSearch(1);"
						class="direction next">끝</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->