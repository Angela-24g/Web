<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- 헤더  -->
        <jsp:include page="../common/common_header.jsp"></jsp:include>
        <!-- 헤더끝  -->

        <!-- 컨텐츠 영역 -->
        <section id="container">

            <div class="hotelParadiseWrap">
                <div class="innerBox">
                    <h1 class="contTitle">
                        <span>RESERVATION</span>델루나호텔 부산에 오신 것을 환영합니다.
                    </h1>
                    <div class="reservationBox">
                        <form id="rsvForm" name="rsvForm" action="/reservation-update" enctype="multipart/form-data"
                            method="post">
                            <input type="hidden" name="progress" id="progress" value="">
                            <input type="hidden" id="rsv_adm_no" name="rsv_adm_no.rezAdm_no" value="${rezAdm_no}" />
                            <input type="hidden" id="writer" name="writer.no" value="${writer_no}" />
                            <input type="hidden" id="roomdetail_no" name="rooms_no.no" value="${rooms_no}" />
                            <input type="hidden" id="member_tel" name="origin_tel" value="${member.tel}" />
                            
                            <div class="paymentWrap">
                                <!-- 회원정보 -->
                                <div class="paymentForm clearFixed">
                                    <h2>고객 정보</h2>
                                    <p class="formImportant"><span class="color">*</span> 필수입력항목</p>
                                    <div class="clearFixed mt0">
                                        <div class="left">
                                            <dl class="nameType">
                                                <dt><label for="name">이름 <span class="color">*</span></label></dt>
                                                <!-- 에러시 dd의 error 클래스 추가 -->
                                                <dd class="">
                                                    <div class="inp">
                                                        <input type="text" id="name" name="name" title="이름"
                                                            value="${member.name}">
                                                    </div>
                                                    <div class="errorText">
                                                        <!-- 에러 메시지 -->
                                                        에러메시지 노출
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <div class="right">
                                            <dl class="phone">
                                                <dt><label for="tel1">휴대폰 번호 <span class="color">*</span></label>
                                                </dt>
                                                <dd>

                                                    <div class="inp" style="width: 100px;">
                                                        <input type="text" id="tel1" name="tel1" required="" title="핸드폰 첫째자리" value="010">
                                                    </div>
                                                    <span>-</span>

                                                    <div class="inp">
                                                        <input type="text" id="tel2" name="tel2" required=""
                                                            title="핸드폰 가운데자리 입력" maxlength="4" value="0000">

                                                    </div>
                                                    <span>-</span>
                                                    <div class="inp">
                                                        <input type="text" id="tel3" name="tel3" required=""
                                                            title="핸드폰 끝자리 입력" maxlength="4" value="0000">

                                                    </div>
                                                    <input type="hidden" name="tel" id="tel" />
                                                    <div class="errorText">
                                                        <!-- 에러 메시지 -->
                                                        에러메시지 노출
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <div>
                                        <dl class="email">
                                            <dt><label for="email">이메일 <span class="color">*</span></label></dt>
                                            <dd>
                                                <div class="inp">
                                                    <!-- 2019.07.12 G1 수정 -->
                                                    <input type="text" id="email" name="email" required=""
                                                        value="${member.email}">
                                                    <!-- 2019.07.12 G1 수정 -->

                                                </div>
                                                <span class="smallText">* 이벤트 정보를 받아보실 수 있습니다.</span>
                                                <div class="errorText">
                                                    <!-- 에러 메시지 -->
                                                    이메일 형식이 잘못되었습니다.
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="request">
                                            <dt><label for="add_requests">요청사항</label></dt>
                                            <dd>
                                                <textarea name="add_requests" id="add_requests" required=""
                                                    placeholder="객실 투숙 시 필요한 비품 관련 요청은 한정된 수량으로 인하여 서비스 이용이 제한될 수 있사오니  유선상으로 문의하여 주시기 바랍니다."></textarea>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                <!-- //회원정보 -->

                                <!-- 취소규정 -->
                                <div class="rullBox">
                                    <h2>취소 규정</h2>
                                    <ul class="dotList">

                                        <li>투숙 일로부터

                                            2일전 <em id="cancelDate">2021.07.13

                                                18:00</em>까지 취소 가능하며, 이후 도착일 기준 하루 전 18시까지 1박 요금의 50%, 이후 취소 시 1박 요금의
                                            100%
                                            수수료가 발생합니다.</li>


                                        <li>투숙 당일 노쇼(No Show) 발생 시 동일한 위약금이 청구될 수 있습니다.</li>
                                    </ul>
                                </div>
                                <!-- //취소규정 -->

                                <!-- 결제방법 -->
                                <div class="paymentOption clearFixed">
                                    <h2>결제방법</h2>
                                    <select class="selectBox" id="payment_option" name="payment_option"
                                        onchange="paymentOnChange(this)">
                                        <option value="계좌이체">계좌이체</option>
                                        <option value="포인트결제">포인트결제</option>
                                    </select>
                                    <div class="payment_point_box">
                                        <p class="payment_point_block">
                                            <label for="will_use">사용할 금액 입력</label>
                                            <input type="text" id="price" value="0" name="will_use"
                                                onkeyup="calcNow()" />
                                        </p>
                                        <p class="payment_point_block">
                                            <label for="before_use">포인트 잔액</label>
                                            <input type="text" id="price" value="${before_use}" name="before_use" />
                                        </p>
                                        <p class="payment_point_block">
                                            <label for="after_use">사용 후 남는 잔액</label>
                                            <input type="text" id="sum_price" value="" name="after_use" />
                                        </p>
                                    </div>
                                </div>
                                <!-- //결제방법 -->

                                <!-- 약관동의 -->
                                <div class="paymentTerm clearFixed">
                                    <h2>약관 동의</h2>
                                    <div class="termArea">
                                        <div>
                                            <h3>개인정보 수집 및 이용에 대한 동의</h3>
                                            <div class="termTxt" tabindex="0">
                                                <p>델루나호텔 부산은 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라
                                                    귀하의
                                                    동의를 받고자 합니다.</p>

                                                <h3>개인정보 수집 및 이용 동의</h3>

                                                <ul>
                                                    <li>1. 수집 및 이용 목적 : 본인 식별, 서비스 및 정보제공, 민원처리, 고객문의 안내</li>
                                                    <li>2. 수집 항목
                                                        <ul>
                                                            <li>필수항목 : 성명, 휴대전화번호, 이메일</li>
                                                        </ul>
                                                    </li>
                                                    <li>3. 보유 기간 및 파기시점
                                                        <ul>
                                                            <li>- 예약내역 : 상법, 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 5년관 보관 됩니다.
                                                                (단,
                                                                취소된 예약 관련 내역은 6개월 보관)</li>
                                                        </ul>
                                                    </li>
                                                    <li>4. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시 회원가입에 제한이 있을
                                                        수
                                                        있음을 알려드립니다.</li>
                                                </ul>

                                            </div>
                                            <div class="agreeWrap">
                                                <div class="checkbox">
                                                    <input type="checkbox" id="AGREE1_1"><label
                                                        for="AGREE1_1">동의합니다</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <h3>상품 정보 및 취소 규정에 대한 동의 </h3>
                                            <div class="termTxt" tabindex="0">
                                                <p>예약 취소 및 변경은 상기 [취소 규정] 기간 내 가능하며, 이후 도착일 기준 하루 전 18시까지 1박 요금의 50%, 이후
                                                    취소
                                                    시 1박 요금의 100%수수료가 발생합니다.<br>
                                                    투숙 당일 노쇼(No Show) 발생 시 동일한 위약금이 청구될 수 있습니다.</p>

                                            </div>
                                            <div class="agreeWrap">

                                                <div class="checkbox">
                                                    <input type="checkbox" id="AGREE3_1"><label
                                                        for="AGREE3_1">동의합니다</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 우측메뉴 -->
                            <div class="reservationAside">
                                <h1>예약정보</h1>
                                <section class="reservationSection">
                                    <div class="productWrap noScroll">
                                        <!-- 상품이 없는 경우 -->
                                        <!-- <div class="productNone">담긴 상품이 없습니다.</div> -->
                                        <!-- //상품이 없는 경우 -->
                                        <!-- 상품 리스트 -->
                                        <div class="productListBox">
                                            <article class="productItem">
                                                <div class="productListC">
                                                    <h3>상품명</h3>
                                                    <p>${title} (${type_title})</p>
                                                </div>
                                                <div class="productListC">
                                                    <h3>체크인/아웃</h3>
                                                    <p>
                                                    <p><input type="text" id="check_in" name="check_in"
                                                            value="${check_in}" readonly /></p>
                                                    ~
                                                    <input type="text" id="check_out" name="check_out"
                                                        value="${check_out}" readonly />
                                                    </p>
                                                    <p>1박 2일</p>
                                                </div>
                                                <div class="productListC">
                                                    <h3>객실수/인원</h3>
                                                    <p>객실 <span id="cRoom">${room_count}</span>개</p>
                                                    <p>성인 <span id="cAdul">${count_adult}</span>명
                                                        / 초등학생 <span id="cElem">${count_elementary}</span>명
                                                        / 어린이 <span id="cChil">${count_child}</span>명
                                                        / 유아 <span id="cBaby">${count_baby}</span>명
                                                    </p>
                                                </div>
                                                <div class="productListC">
                                                    <h3>상품선택</h3>
                                                    ${type_benefit}
                                                </div>
                                                <div class="productListC">
                                                    <h3>객실타입</h3>
                                                    <p>${room_type}/${room_view}/${room_location}/${room_bedtype}</p>
                                                </div>
                                            </article>

                                            <article class="productItem">
                                                <div class="productListH">
                                                    <h2><span>총 예약금액</span></h2>
                                                </div>
                                                <div class="productListC">
                                                    <div class="productPrice">
                                                        <dl>
                                                            <dt>상품요금
                                                                <!-- 2019.07.09 G1 추가 -->
                                                                <button type="button" class="tooltipLink">툴팁</button>
                                                                <div class="tooltipBox daily_rate">
                                                                    <p>2021.07.15 : ${price_product}원</p>
                                                                </div>
                                                                <!-- 2019.07.09 G1 추가 -->
                                                            </dt>
                                                            <dd><span id="textPriceProduct">${price_product}원</span></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>세금 및 봉사료
                                                                <!-- 추가 2019.03.12 -->
                                                                <button type="button" class="tooltipLink">툴팁</button>
                                                                <div class="tooltipBox">
                                                                    <p>10%봉사료 추가 후 10% 세금이 더해집니다.</p>
                                                                </div>
                                                                <!-- //추가 2019.03.12 -->
                                                            </dt>
                                                            <dd><span id="textPriceService">${price_service}원</span></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>추가베드</dt>
                                                            <dd><span id="textPriceBed">${price_bed}원</span></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>추가옵션</dt>
                                                            <dd><span id="textPriceOption">${price_options}원</span></dd>
                                                        </dl>
                                                    </div>
                                                </div>

                                                <div class="productListC">
                                                    <div class="optionListWrap">
                                                        <dl class="cont">

                                                        </dl>
                                                    </div>
                                                </div>
                                                <div class="productListC">
                                                    <div class="productPrice">
                                                        <dl>
                                                            <dt>회원 할인</dt>
                                                            <!-- 회원할인율 -5% 예상 -->
                                                            <dd id="price_memberText">- ${price_total}원</dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>포인트 사용</dt>
                                                            <!-- 회원인경우 포인트 사용할금액 -->
                                                            <dd class="txtRed" id="textPricePoint">- ${before_use}P
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                    <!-- 토탈 금액 설정 -->
                                    <input type="hidden" id="price_result" name="price_result" value="0">
                                    <!-- total 금액에서 멤버 할인과 포인트가를 제외한 가격 -->
                                    <input type="hidden" id="price_total" name="price_total" value="${price_total}">
                                    <input type="hidden" id="price_product" name="price_product" value="${price_product}">
                                    <input type="hidden" id="price_service" name="price_service" value="${price_service}">
                                    <input type="hidden" id="price_bed" name="price_bed" value="${price_bed}">
                                    <input type="hidden" id="price_options" name="price_options" value="${price_options}">
                                    <input type="hidden" id="price_member" name="price_member" value="0"><!-- 회원할인 -5%예상 -->
                                    <input type="hidden" id="price_point" name="price_point" value="0"><!-- 사용할 포인트 #will_use -->
                                    <!-- 토탈 룸&인원 설정 -->
                                    <input type="hidden" id="room_count" name="room_count" value="${room_count}" />
                                    <input type="hidden" id="count_adult" name="count_adult" value="${count_adult}" />
                                    <input type="hidden" id="count_elementary" name="count_elementary" value="${count_elementary}" />
                                    <input type="hidden" id="count_child" name="count_child" value="${count_child}" />
                                    <input type="hidden" id="count_baby" name="count_baby" value="${count_baby}" />
                                    <input type="hidden" id="count_all" name="count_all" value="0" />

                                    <div class="productFooter">
                                        <dl>
                                            <dt>총 액</dt>
                                            <dd><span id="textPriceTotal">${price_total} 원</span></dd>
                                        </dl>
                                        <dl>
                                            <dt>할인액</dt>
                                            <dd class="txtRed" id="textPriceMember"></dd>
                                        </dl>
                                        <dl>
                                            <dt>포인트사용</dt>
                                            <dd class="txtRed" id="textPricePoint2">- 0P</dd>
                                        </dl>
                                    </div>
                                    <!-- 토탈 금액 -->
                                    <div class="productTotal">
                                        <dl>
                                            <dt>최종 금액</dt>
                                            <dd><span id="textPriceResult"> 0</span>원</dd>
                                        </dl>
                                    </div>
                                    <button class="btn btnFull" type="button" onclick="javascript:jsPayment();"><span>상품
                                            결제하기</span></button>
                                </section>
                            </div>
                            <!-- //우측메뉴 -->

                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- 컨텐츠 영역 -->
        <!-- 푸터  -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        <!-- 푸터 끝  -->

