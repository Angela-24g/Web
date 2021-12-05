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
											<option value="">객실1</option>
										</select>
									</dd>
								</dl>
								<dl class="adultType">
									<dt>성인</dt>
									<dd>
										<select class="selectBox" name="search_abult" id="search_abult">
											<option value="1" selected>성인 1</option>
											<option value="2">성인 2</option>
											<option value="3">성인 3</option>
										</select>
									</dd>
								</dl>
								<dl class="elementaryType">
									<dt>초등학생</dt>
									<dd>
										<select class="selectBox" name="search_elementary" id="search_elementary">
											<option value="0" selected>초등학생 0</option>
											<option value="1">초등학생 1</option>
											<option value="2">초등학생 2</option>
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
											<option value="0" selected>어린이 0</option>
											<option value="1">어린이 1</option>
											<option value="2">어린이 2</option>
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
											<option value="0" selected>유아 0</option>
											<option value="1">유아 1</option>
											<option value="2">유아 2</option>
										</select>
									</dd>
								</dl>
								<!-- 옵션이 다 선택되면 .btnFull 추가 -->
								<a href="#none" onclick="rsvSearch()" class="btn small"><span>검색</span></a>
							</div>
						</div>
					</form>
					<c:if test="${not empty rsvByDateList}">
						<form name="writeFrm" method="get" id="writeFrm" action="/reservation-reserve">
							<input type="hidden" id="rezAdm_no" name="rezAdm_no" value="" />
							<input type="hidden" id="roomType_no" name="roomType.no" value="" />
							<input type="hidden" id="date_start" name="date_start" value="" />
							<input type="hidden" id="date_end" name="date_end" value="" />
							<input type="hidden" id="count_adult" name="count_adult" value="" />
							<input type="hidden" id="count_elementary" name="count_elementary" value="" />
							<input type="hidden" id="count_child" name="count_child" value="" />
							<input type="hidden" id="count_baby" name="count_baby" value="" />
							<input type="hidden" id="daily_str" name="daily_str" value="" />
							<input type="hidden" id="pro_progress" name="pro_progress" value="">
							<ul class="offersList">
								<c:forEach var="rsv_list" items="${rsvByDateList}" varStatus="status">
									<li>
										<div class="img">
											<img src="/images/reservation/thum_list.jpg" alt="">
											<p class="clearFixed">
												<span>시즌</span>
											</p>
										</div>
										<div class="txt">
											<strong>${rsv_list.title}</strong>
											<p class="pointColor ellipsis">${rsv_list.title_s}</p>
											<p class="sub">
												<span>${rsv_list.date_start} ~ ${rsv_list.date_end}</span>
											</p>
											<div class="desc">
												<ul class="dotList">
													<li>디럭스 (성인 2인 + 어린이 2인) / 프리미엄 디럭스ㆍ스위트 (성인 3인 + 어린이 1인)</br>
														</br></li>
													<li>[A타입] 기본 혜택 + 소프트 음료</li>
													<li>[B타입] 기본 혜택 + 소프트 음료 + 조식 (성인 2인)</li>
													<li>* 스위트 예약 고객에게 [랑방 걸 인 카프리(A GIRL IN CAPRI) 플레그런스] 를
														제공해 드립니다. (소진시 까지)</li>
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
										<div class="spreadWrap">
											<!-- 상품선택 -->
											<div class="offers" id="offers${rsv_list.rezAdm_no}">
												<div class="rsvtype type2">
													<h2>상품 타입 선택</h2>
													<div aria-live="polite">
														<a href="#none" onclick="fnOption(505571, ${rsv_list.rezAdm_no});">
															<div class="txt" style="height: 216px;">
																<strong><span class="type_tit">디럭스</span></strong>
																<span class="sub type_content">
																	ㆍ패밀리 모닝 밀박스<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈
																	드라이빙
																</span>
															</div>
														</a>
														<a href="#none" onclick="fnOption(510467, ${rsv_list.rezAdm_no});">
															<div class="txt" style="height: 216px;">
																<strong><span class="type_tit">프리미엄 디럭스</span></strong>
																<span class="sub type_content">
																	ㆍ패밀리 모닝 밀박스<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈
																	드라이빙
																</span>
															</div>
														</a>
														<a href="#none" onclick="fnOption(510511, ${rsv_list.rezAdm_no});">
															<div class="txt" style="height: 216px;">
																<strong><span class="type_tit">스위트</span></strong>
																<span class="sub type_content">
																	ㆍ패밀리 모닝 밀박스<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈
																	드라이빙
																</span>
															</div>
														</a>
													</div>
												</div>
											</div>
											<!-- //상품선택 -->
											<!-- 객실옵션선택 -->
											<div class="rsvWrap" id="rsvWrap${rsv_list.rezAdm_no}">

												<div class="reservationBox">
													<div class="choiceWrap">
														<h2>객실 선택</h2>
														<dl>
															<dt>뷰 *</dt>
															<dd>
																<div class="radioBox">
																	<input type="radio" id="view_type0" name="view_type"
																		tabindex="0" value="C"
																		onclick="fnCView();"><label for="view_type0">
																		시티</label>
																</div>

																<div class="radioBox">
																	<input type="radio" id="view_type1" name="view_type"
																		tabindex="0" value="T"
																		onclick="fnCView();"><label for="view_type1">
																		오션테라스</label>
																</div>
															</dd>
														</dl>
														<dl>
															<dt>위치 *</dt>
															<dd id="wingRadio">
																<div class="radioBox">
																	<input type="radio" id="wing0" name="wing"
																		tabindex="0" value="01"
																		disabled="disabled"><label
																		for="wing0">본관</label>
																</div>
																<div class="radioBox">
																	<input type="radio" id="wing1" name="wing"
																		tabindex="0" value="02"
																		disabled="disabled"><label
																		for="wing1">신관</label>
																</div>
															</dd>
														</dl>
														<dl>
															<dt>타입 *</dt>
															<dd id="bedRadio">
																<div class="radioBox">
																	<input type="radio" id="bed_type0" name="bed_type"
																		tabindex="0" value="11" disabled="disabled">
																	<label for="bed_type0">
																		더블
																	</label>
																</div>
																<div class="radioBox">
																	<input type="radio" id="bed_type1" name="bed_type"
																		tabindex="0" value="02" disabled="disabled">
																	<label for="bed_type1">
																		트윈
																	</label>
																</div>
															</dd>
														</dl>
													</div>
													<div class="choiceWrap add">
														<dl>
															<dt>추가베드 *</dt>
															<dd>
																<input type="hidden" id="bedPrice" name="bedPrice"
																	value="0">
																<div class="radioBox">
																	<input type="radio" id="extraBed1" name="extraBed"
																		tabindex="0" value="Y"
																		onclick="fnRoomChange(435600);"><label
																		for="extraBed1"><span class="_bad">엑스트라
																			베드</span> (+ 72,600원)</label>
																</div>
																<div class="radioBox">
																	<input type="radio" id="extraBed2" name="extraBed"
																		tabindex="0" value="N" checked="checked"
																		onclick="fnRoomChange(0);"><label
																		for="extraBed2">선택 안함</label>
																</div>
															</dd>
														</dl>
													</div>
													<div class="cautionBox">
														<ul class="dotList">
															<li>추가베드 (본관: 엑스트라 베드 / 신관: 소파베드 메이킹) 이용시, 오션스파 씨메르 &amp; 풀
																1회 무료, 실내 사우나 50% 할인 혜택(1회 한정) 제공.</li>
															<li>13세 이하 어린이의 경우 별도 요금없이 객실당 2명까지 투숙 가능합니다. (단, 성인 3인 투숙시
																어린이 1명 투숙가능)</li>
															<li>단, 패키지 전용 혜택은 제외됩니다.</li>
														</ul>
													</div>
												</div>
												<div class="reservationAside">
													<section class="reservationSection">
														<div class="productWrap">
															<div class="productPrice">
																<dl>
																	<dt>상품요금
																		<!-- 2019.07.09 G1 추가  -->
																		<a href="#" class="tooltipLink">툴팁</a>
																		<div class="tooltipBox daily_rate_tooltip">
																			<!-- <p>10%봉사료 추가 후 10% 세금이 더해집니다.</p> -->
																		</div>
																		<!-- 2019.07.09 G1 추가  -->
																	</dt>
																	<dd id="pkrw">0원</dd>
																</dl>
																<dl>
																	<dt>세금 및 봉사료
																		<!-- 추가 : 2019.02.26 -->
																		<a href="#" class="tooltipLink">툴팁</a>
																		<div class="tooltipBox">
																			<p>10%봉사료 추가 후 10% 세금이 더해집니다.</p>
																		</div>
																		<!-- //추가 : 2019.02.26 -->
																	</dt>
																	<dd id="tkrw">0원</dd>
																</dl>
																<dl>
																	<dt>추가베드</dt>
																	<dd id="bkrw">0원</dd>
																</dl>
																<dl>
																	<dt>추가옵션</dt>
																	<dd id="okrw">0원</dd>
																</dl>
															</div>
														</div>
														<div class="productTotal">
															<dl>
																<dt>최종 금액</dt>
																<dd><span id="totalkrw">0</span>원</dd>
															</dl>
															<!-- <p class="smallText">- 박 수, 객실 수, 옵션 포함, 세금 및 봉사료 <br />  각 10% 포함</p> -->
														</div>
														<a href="#none" onclick="msgpopup()"
															class="btn btnFull layerPopOpen"><span>다음</span></a>
													</section>
												</div>
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
		<!-- 푸터  -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<!-- 푸터 끝  -->