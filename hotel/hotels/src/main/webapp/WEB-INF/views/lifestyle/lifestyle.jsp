<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 본문 시작 -->
<section id="container">

	<jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="lifestyle" name="submenu" />
		<jsp:param value="spa" name="ssubmenu1" />
		<jsp:param value="kids village" name="ssubmenu2" />
	</jsp:include>
	<!-- contents -->
	<div class="hotelParadiseWrap">
		<div class="innerBox">
			<h1 class="contTitle">
					<span>${lifestyle.type}</span>
					<c:choose>
						<c:when test="${lifestyle.type eq 'spa'}">
							아름다운 바다풍경과 환상의 조화를 이루어내는<br/>델루나호텔 부산의 대표적인 힐링공간 입니다.
						</c:when>
						<c:when test="${lifestyle.type eq 'kids village'}">
							게임! 안전교육! 드라이빙! 독서! 교구놀이! <br />약 400평 규모의 초대형 실내 키즈 테마 체험 월드
						</c:when>
					</c:choose>
			</h1>
			<!-- 컨텐츠 TAB import-->
				<div class="tapBox">
					<ul>
					<c:forEach var="typeSubtypeLifestyle" items="${typeSubtypeLifestyles}" varStatus="status">
						<li class="${lifestyle.subtype eq typeSubtypeLifestyle.subtype ? 'on': ''}">
							<a href="javascript:;" onclick="jsTapChange('lifestyle','${typeSubtypeLifestyle.type}','${typeSubtypeLifestyle.subtype}')">${typeSubtypeLifestyle.subtype}</a>
						</li>
					</c:forEach>
					</ul>
				</div>

			<!-- //컨텐츠 TAB -->
			<section class="jsSwiperMotion keyVisual contents" style="display: block;">
				<ul class="lifestyle-slick">
				<c:forEach var="lifestyleImage" items="${lifestyle.lifestyleImages}">
					<li>
						<p class="img">
							<img src="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleImage.name}" alt="${lifestyleImage.name}" />
						</p>
					</li>
				</c:forEach>
				</ul>
			</section>

			<div class="detailTextBox">
				<h2>
					${lifestyle.name}
				</h2>
				<p class="subTit">${lifestyle.info}</p>
				<div class="text">
					${lifestyle.info_detail}
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<c:if test="${not empty lifestyle.guide}">
					<p><span style="color:#e66045;">${lifestyle.guide}</span></p>
					</c:if>
				</div>
			</div>

			<!-- 상세정보 -->
			<div class="detailInfo">
				<h3>
					상세정보
				</h3>
				<div class="infoDetail">
					<dl class="${lifestyle.type eq 'spa' ? 'type3':''}">
						<dt>
							영업시간
						</dt>
						<dd>
							${lifestyle.hours}
						</dd>
					</dl>
					<c:if test="${lifestyle.type eq 'kids village'}">
					<dl>
						<dt>
							요금
						</dt>
						<dd>
							<c:forEach items="${lifestyle.lifestylePrices}" var="lifestyleprice">
							<p>${lifestyleprice.price}</p>
							</c:forEach>
						</dd>
					</dl>
					</c:if>
					<dl>
						<dt>
							위치
						</dt>
						<dd>${lifestyle.location}</dd>
					</dl>

					<dl>
						<dt>
							연락처
						</dt>
						<dd>${lifestyle.contact}</dd>
					</dl>
				</div>
			</div>
			<!-- //상세정보 -->

			<!-- 요금안내 spa만-->
			<c:if test="${lifestyle.type eq 'spa'}">
				<div class="detailInfo priceInfo">
					<h3>
						요금안내
					</h3>
						
					<table class="priceList">
						<colgroup>
							<%-- 요금구분란이 없어서 2개 컬럼일 경우   --%>
							<c:if test="${empty lifestyle.lifestylePrices[0].price_type}">
							<col style="width:25%" />
							<col style="width:75%" />
							</c:if>
							<%-- //요금구분란이 없어서 2개 컬럼일 경우   --%>
							
							<%-- 요금구분란까지 3개 컬럼일 경우   --%>
							<c:if test="${not empty lifestyle.lifestylePrices[0].price_type}">
							<col style="width:18%" />
							<col style="width:18%" />
							<col style="" />
							</c:if>
							<%-- //요금구분란까지 3개 컬럼일 경우   --%>
						</colgroup>
						
						<%-- 요금구분란까지 3개 컬럼일 경우   --%>
						<c:if test="${not empty lifestyle.lifestylePrices[0].price_type}">
						<thead>
							<tr>
								<th colspan="2" scope="col">구분</th>
								<th scope="col">객실 투숙객</th>
							</tr>
						</thead>
						</c:if>
						<%-- //요금구분란까지 3개 컬럼일 경우   --%>
						
						<tbody>
						<c:forEach var="lifestylePrice" items="${lifestyle.lifestylePrices}" varStatus="status">
							<tr>
							<c:if test="${status.count eq 1}">
								<td class="tbg" rowspan="${fn:length(lifestyle.lifestylePrices)}">입장요금</td>
							</c:if>
							<c:if test="${not empty lifestylePrice.price_type}">
								<td class="sort">${lifestylePrice.price_type}</td>
							</c:if>
								<td>${lifestylePrice.price}</td>
							</tr>
						</c:forEach>
						</tbody>
						
					</table>
					<c:if test="${lifestyle.subtype ne '리트리트 스파'}">
						<p class="smallText tr">(단위:원 / 세금 포함)</p>
						<p class="smallText">* 1박 1회 이용가능</p>
						
						<c:choose>
						<c:when test="${lifestyle.subtype eq '피트니스'}">
						<p class="smallText">* 객실 기준 인원에 한하여 적용가능</p>
						</c:when>
						<c:otherwise>
						<p class="smallText">* 객실 투숙객 50% 할인 (객실 기준 인원에 한하여 적용가능 / 단, 성수기 제외)</p>
						</c:otherwise>
						</c:choose>
						<c:if test="${lifestyle.subtype eq '씨메르' || lifestyle.subtype eq '풀'}">
						<p class="smallText">* 어린이 : 49개월 ~ 초등학생</p>
						</c:if>
					</c:if>
				</div>
			<!-- //요금안내 -->
			
			<!-- 세부시설 spa만  -->
			<div class="detailInfo detailFacility">
				<h3>
					세부시설
				</h3>
				<section class="jsSwiperMotion keyVisual incFacility">
					<ul class="lifestyle-slick table" data-show="2">
						<c:forEach var="lifestyleFacility" items="${lifestyle.lifestyleFacilities}" varStatus="status">
							<%-- 1개 ~ 3개일 때 공통  --%>
							<c:if test="${status.count < 4}">
								<li>
									<p class="img"><img src="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleFacility.lifeFacility_image_name}" alt="${lifestyleFacility.lifeFacility_title}" /></p>
									<h4>${lifestyleFacility.lifeFacility_title}</h4>
									<p class="text">${lifestyleFacility.lifeFacility_info}</p>
								</li>
								<!-- 1개일 때 빈 li 하나 추가  -->
								<c:if test="${fn:length(lifestyle.lifestyleFacilities) == 1}">
								<li>
									<p class=""><img src="" alt="" /></p>
									<h4></h4>
									<p class="text"></p>
								</li>
								</c:if>
							</c:if>
							<%-- //1개 ~ 3개일 때 공통  --%>
							
							<%-- 5개 ~ 6개일 때 공통  --%>
							<c:if test="${status.count >= 4}">
								<li>
									<p class="img"><img src="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleFacility.lifeFacility_image_name}" alt="${lifestyleFacility.lifeFacility_title}" /></p>
									<h4>${lifestyleFacility.lifeFacility_title}</h4>
									<p class="text">${lifestyleFacility.lifeFacility_info}</p>
								</li>
							</c:if>
							<%-- //5개 ~ 6개일 때 공통  --%>
						</c:forEach>
					</ul>
					<%-- 4개일 때 ul 추가 --%>
					<c:if test="${fn:length(lifestyle.lifestyleFacilities) == 4}">
					<ul class="table" style="margin-top: 20px;">
						<c:forEach var="lifestyleFacility" items="${lifestyle.lifestyleFacilities}" varStatus="status">
							<c:if test="${status.count == 4}">
								<li>
									<p class="img"><img src="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleFacility.lifeFacility_image_name}" alt="${lifestyleFacility.lifeFacility_title}" /></p>
									<h4>${lifestyleFacility.lifeFacility_title}</h4>
									<p class="text">${lifestyleFacility.lifeFacility_info}</p>
								</li>
								<li>
									<p class=""><img src="" alt="" /></p>
									<h4></h4>
									<p class="text"></p>
								</li>
								<li>
									<p class=""><img src="" alt="" /></p>
									<h4></h4>
									<p class="text"></p>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					</c:if>
					<%-- //4개일 때 ul 추가 --%>
				</section>
			</div>
			<!-- //세부시설 spa만  -->
			</c:if>
			
			<!-- 안내사항 시작  -->
			<div class="cautionBox type2">
				<h2>안내사항</h2>
				<ul class="dotList">
				<c:choose>
					<%-- spa 일 때 --%>
					<c:when test="${lifestyle.type eq 'spa' }">
					
						<c:choose>
							<%-- spa: '리트리트 스파' 만 --%>
							<c:when test="${lifestyle.subtype eq '리트리트 스파'}">
							<li>스파프로그램은 사전예약 필수 (마지막 예약 가능 시간 : 21:00)</li>
							<li>자세한 프로그램 내용은 해당 영업장으로 문의하여 주시기 바랍니다.</li>
							</c:when>
							<%-- //spa: '리트리트 스파' 만 --%>
							
							<%-- spa: 리트리트 스파 제외 모두 --%>
							<c:otherwise>
							<li>투숙객 전용 시설로 외부 고객 이용이 불가 합니다.</li>
								
								<%-- spa: 씨메르와 풀 추가 사항 --%>
								<c:if test="${lifestyle.subtype eq '씨메르' || lifestyle.subtype eq '풀'}">
								<li>객실 슬리퍼는 실내용으로, 착용시 씨메르 / 오션풀 입장이 제한되며, 이용시 개별 아쿠아 슈즈 또는 슬리퍼를 미리 준비하여 주시기 바랍니다.</li>
								<li>안전하고 편안한 휴양을 위하여 물놀이 기구 및 음식물 반입 그리고 흡연 및 오일 사용을 금 하오니 양해하여 주시기 바랍니다.</li>
								<li>분실위험이 있는 귀중품은 데스크에 보관해주시길 바랍니다.</li>
								</c:if>
								<%-- //spa: 씨메르와 풀 추가 사항 --%>
								
								<%-- spa: 피트니스 추가 사항 --%>
								<c:if test="${lifestyle.subtype eq '피트니스'}">
								<li>입장시 실내 운동화를 반드시 착용해 주시기 바랍니다.</li><li>무료대여품목 : 남·여 운동복, 양말</li>
								</c:if>
								<%-- //spa: 피트니스 추가 사항 --%>
									
							<li>호텔 내 스파 부대시설(씨메르, 오션풀, 사우나, 피트니스 클럽 등)은 매월 넷째주 수요일 휴무입니다.  
							</br>호텔 사정에 따라 변경될 수 있으니 예약 시 참고하시기 바랍니다.</li>
								
							</c:otherwise>
							<%-- //spa: 리트리트 스파 제외 모두 --%>
						</c:choose>
					</c:when>
					<%-- //spa 일 때 --%>
					
					<%-- kids village 일 때 --%>
					<c:when test="${lifestyle.type eq 'kids village'}">
						<c:choose>
						
							<%-- kids village : '가족형키즈카페' 만 --%>
							<c:when test="${lifestyle.subtype eq '가족형키즈카페 키즈앤 패밀리' }">
							<li>자세한 내용은 해당 영업장으로 문의하여 주시기 바랍니다.</li>
							</c:when>
							<%-- //kids village : '가족형키즈카페' 만 --%>
							
							<%-- kids village : '가족형키즈카페' 제외 모두 --%>
							<c:otherwise>
							<li>투숙객 전용 시설로 외부 고객 이용이 불가 합니다.</li>
							
								<%-- kids village : 'BMW 키즈 드라이빙' 만 --%>
								<c:if test="${lifestyle.subtype eq 'BMW 키즈 드라이빙' }">
								<li>사전 예약에 한하며, 한정된 인원으로 인하여 조기 마감될 수도 있습니다.</li><li>안전하고 원활한 운영을 위하여 어린이 나이 증명 서류 (가족관계증명서 등) 지참 필수. 미지참 시 입장이 제한될 수 있습니다.</li><li>동의서 작성 후 이용하실 수 있습니다.</li><li>안전 사고 예방을 위하여, 시승 차종은 어린이의 신장 및 체중에 따라 변경 가능하며, 체험에 제한이 있을 수 있습니다.</li>
								</c:if>
								<%-- //kids village : 'BMW 키즈 드라이빙' 만 --%>
							
							<li>호텔 사정에 의하여 일정이 변경 될 수 있습니다.</li>
							</c:otherwise>
							<%-- //kids village : '가족형키즈카페' 제외 모두 --%>
							
						</c:choose>
					</c:when>
					<%-- //kids village 일 때 --%>
				</c:choose>
				
				</ul>
			</div>
			<!-- 안내사항 끝  -->
		</div>
	</div>
	<!-- //contents -->
</section>
<!-- slick slider -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- //컨텐츠 영역 -->
<!-- 본문 끝 -->
<jsp:include page="../common/footer.jsp"></jsp:include>