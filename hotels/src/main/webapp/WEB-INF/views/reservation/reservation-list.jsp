<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 헤더  -->
		<jsp:include page="../common/common_header.jsp"></jsp:include>
		<!-- 헤더끝  -->

		<input type="hidden" name="progress" id="progress" value="">
		<input type="hidden" name="select_no" id="select_no" value="">
		<!-- 컨텐츠 영역 -->
		<section id="container">

			<div class="hotelParadiseWrap reservationWrap">
				<div class="innerBox">
					<!-- 컨텐츠 머리글 -->
					<h1 class="contTitle">
						<span>RESERVATION</span>델루나호텔 부산에 오신 것을 환영합니다.
					</h1>
					<!-- //컨텐츠 머리글 -->
					<form name="searchFrm" method="get" id="searchFrm" action="reservation-list">
						<input type="hidden" id="page" name="page" value="1" />
						<input type="hidden" id="search_no" name="search_no" value="" />
						<input type="hidden" id="member_no" name="member_no" value="${member_no}" />
						<div class="offerSelectBox rvt">
							<div class="selectChoice">
								<dl>
									<dt>체크인 &amp; 체크아웃</dt>
									<dd>
										<div class="inp calendar reservation" id="test" data-startdate="true">
											<input type="text" id="check_in" name="check_in" value="${check_in}">
											<input type="text" id="check_out" name="check_out" value="${check_out}">
											<button type="button" class="btnCalendar">달력</button>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>객실</dt>
									<dd>
										<select class="selectBox" id="search_room_type" name="search_room_type"
											disabled="disabled">
											<option value="1">객실1</option>
										</select>
									</dd>
								</dl>
								<dl class="adultType">
									<dt>성인</dt>
									<dd>
										<select class="selectBox" name="search_abult" id="search_abult">
											<option value="1" ${search_abult eq "1" ? "selected": ""}>성인 1</option>
											<option value="2" ${search_abult eq "2" ? "selected": ""}>성인 2</option>
											<option value="3" ${search_abult eq "3" ? "selected": ""}>성인 3</option>
										</select>
									</dd>
								</dl>
								<dl class="elementaryType">
									<dt>초등학생</dt>
									<dd>
										<select class="selectBox" name="search_elementary" id="search_elementary">
											<option value="0" ${search_elementary eq "0" ? "selected": ""}>초등학생 0</option>
											<option value="1" ${search_elementary eq "1" ? "selected": ""}>초등학생 1</option>
											<option value="2" ${search_elementary eq "2" ? "selected": ""}>초등학생 2</option>
										</select>
									</dd>
								</dl>
								<dl class="childType">
									<dt>
										어린이
										<button type="button" class="tooltipLink" data-tooltip="tip2">툴팁</button>
										<div class="tooltipBox" id="tip2" style="display: none; left: 738.625px;">
											<p>어린이 : 49개월 ~ 7세</p>
										</div>
									</dt>
									<dd>
										<select class="selectBox" name="search_child" id="search_child">
											<option value="0" ${search_child eq "0" ? "selected": ""}>어린이 0</option>
											<option value="1" ${search_child eq "1" ? "selected": ""}>어린이 1</option>
											<option value="2" ${search_child eq "2" ? "selected": ""}>어린이 2</option>
										</select>
									</dd>
								</dl>
								<dl class="babyType">
									<dt>
										유아
										<button type="button" class="tooltipLink" data-tooltip="tip3">툴팁</button>
										<div class="tooltipBox" id="tip3">
											<p>유아 : 48개월 이하</p>
										</div>
									</dt>
									<dd>
										<select class="selectBox" name="search_baby" id="search_baby">
											<option value="0" ${search_baby eq "0" ? "selected": ""}>유아 0</option>
											<option value="1" ${search_baby eq "1" ? "selected": ""}>유아 1</option>
											<option value="2" ${search_baby eq "2" ? "selected": ""}>유아 2</option>
										</select>
									</dd>
								</dl>
								<!-- 옵션이 다 선택되면 .btnFull 추가 -->
								<a href="#none" onclick="rsvSearch()" class="btn small"><span>검색</span></a>
							</div>
						</div>
					</form>
					<c:if test="${not empty rsvByDateList}">
						<form name="writeFrm" method="post" id="writeFrm" action="/reservation-reserve">
							<input type="hidden" id="rezAdm_no" name="rezAdm_no" value="" />
							<input type="hidden" id="roomType_no" name="roomType.no"/>
							<input type='hidden' id='roomdetail_no' name='roomdetail_no' value="0"/>
							<input type="hidden" id="date_start" name="check_in" value="" />
							<input type="hidden" id="date_end" name="check_out" value="" />
							<input type="hidden" id="room_count" name="room_count" value="" />
							<input type="hidden" id="count_adult" name="count_adult" value="" />
							<input type="hidden" id="count_elementary" name="count_elementary" value="" />
							<input type="hidden" id="count_child" name="count_child" value="" />
							<input type="hidden" id="count_baby" name="count_baby" value="" />
							<input type="hidden" id="pro_progress" name="pro_progress" value="">
							<input type="hidden" id="title" name="rezAdm.title" value="">
							<ul class="offersList">
								<c:forEach var="rsv_list" items="${rsvByDateList}" varStatus="status">
									<li>
										<div class="img">
											<img src="/images/reservation/thum_list${rsv_list.rezAdm_no}.jpg" alt="">
											<p class="clearFixed">
												<span>시즌</span>
											</p>
										</div>
										<div class="txt">
											<strong class="rez_title">${rsv_list.title}</strong>
											<p class="pointColor ellipsis">${rsv_list.title_s}</p>
											<p class="sub">
												<span>${rsv_list.date_start} ~ ${rsv_list.date_end}</span>
											</p>
											<div class="desc">
												<ul class="dotList">
													<li>${rsv_list.content}</li></br></br>
													<li>${rsv_list.benefits}</li>
												</ul>
											</div>
											<span class="price">260,000<em>원</em> ~
											</span> <span class="price"
												style="color: #9C8B6D; font-size: 15px; margin-top: 41px;">회원
												할인가 254,800원 ~ </span> <a href="#none"
												onclick="fnMappingView(${rsv_list.rezAdm_no}, this, '');"
												class="btn small2 toggleBtn" id="offer${rsv_list.rezAdm_no}"
												style="top: 168px;"><span>예약상품
													보기</span></a> <br />
										</div> <!-- 예약 펼침 영역 -->
										<div class="spreadWrap" id="add_input">
											<input type="hidden" id="roomPrice" name="price_product">
											<input type="hidden" id="taxPrice" name="price_service">
											<input type="hidden" id="optionPrice" name="price_options">
											<input type="hidden" id="totalPrice" name="price_total">
											<!-- 상품선택 -->
											<div class="offers" id="offers${rsv_list.rezAdm_no}">
											</div>
											<!-- //상품선택 -->
											<!-- 객실옵션선택 -->
											<div class="rsvWrap" id="rsvWrap${rsv_list.rezAdm_no}">
											</div>
											<!-- //객실옵션선택 -->
										</div> <!-- //예약 펼침 영역 -->
									</li>
								</c:forEach>
							</ul>
						</form>
					</c:if>
					<c:if test="${empty rsvByDateList}">
						<!-- 리스트 공통 내역없음 -->
						<div class="listNone bigSize">
							<p>예약을 원하시는 날짜, 객실, 인원을 선택 후 검색 버튼을 눌러주세요. </p>
						</div>
						<!-- //리스트 공통 내역없음 -->
					</c:if>

					<!-- 안내사항 인클루드 -->
					<jsp:include page="./reservation-info.jsp"></jsp:include>
				</div>
			</div>
		</section>
		<!-- 컨텐츠 영역 -->
		<script>

		function rsvSearch() {//날짜선택 완료 후 체크인&아웃을 범위에 포함하는 예약가능상품 불러옴.
			if(searchFrm.member_no.value==''){
				alert('회원만 이용 가능합니다.');
				location.href='/login';
				return false;
			}
		
			if ($('#check_in').val() == '') {
				alert('체크인 날짜를 선택하여 주시기 바랍니다.');
				return false;
			}
			if ($('#check_out').val() == '') {
				alert('체크아웃 날짜를 선택하여 주시기 바랍니다.');
				return false;
			}

			
			$('#page').val("1");
			$('#searchFrm').submit();
		}


		
		</script>
		<!-- 푸터  -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<!-- 푸터 끝  -->
		
