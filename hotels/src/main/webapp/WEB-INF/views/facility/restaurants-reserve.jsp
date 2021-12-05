<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <div class="innerBox reservationWrap detail">
                        <h1 class="contTitle">
                            <span>RESERVATION</span>델루나호텔 부산에 오신 것을 환영합니다.
                        </h1>

                        <div class="reservationBox">
                            <h1 class="contTitle dining_title">
                                ${rtName} <br> <span>신관 2F | 051-749-2274</span>
                            </h1>
                            <div class="cautionBox type2 mb-50">
                                <h2>안내사항</h2>
                                <ul class="dotList">
                                    <li>예약 신청을 위한 페이지로, 예약 신청 후 레스토랑 직원이 확인하여 연락 드립니다.</li>
                                    <li>좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.</li>
                                    <li>8인 이상 단체 및 프라이빗 룸 예약은 전화 문의 부탁드립니다.</li>
                                    <li>예약 취소를 원하실 경우 최소 하루 전까지 온라인 취소 또는 해당 레스토랑으로 전화 주시기 바랍니다.</li>
                                </ul>
                            </div>
                            <form id="rtFrom" name="rtFrom" action="/restaurants-reserve" enctype="multipart/form-data"
                                method="post">
                                <input type="hidden" name="writer.no" value="${member.no}" />
                                <input type="hidden" name="cooName" value="${cooName}" />
                                <input type="hidden" id="member_tel" name="origin_tel" value="${member.tel}" />
                                <input type="hidden" name="restaurant_name" value="${rtName}" />
                                <input type="hidden" name="count_all" value="0" />
                                <div class="paymentWrap">
                                    <div class="paymentForm clearFixed">
                                        <h2>예약 정보</h2>
                                        <p class="formImportant">
                                            <span class="color">*</span> 필수입력항목
                                        </p>
                                        <div class="reservationPopCont">
                                            <div class="reservationSelect">
                                                <dl>
                                                    <dt>
                                                        <label for="date_reserve">방문 희망 일자</label><span
                                                            class="color">*</span>
                                                    </dt>
                                                    <dd>
                                                        <div class="inp calendar ontheplate" id="ReservationPopCont">
                                                            <input type="text" name="date_reserve" id="date_reserve"
                                                                autocomplete="off" onchange="dateOnChange(this)">
                                                            <button class="btnCalendar" type="button">달력</button>
                                                        </div>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>
                                                        <label for="time_meal">중식 / 석식</label><span
                                                            class="color">*</span>
                                                    </dt>
                                                    <dd>
                                                        <div class="ui-select-wrapper">
                                                            <select class="selectBox" id="time_meal" name="time_meal"
                                                                required="" onchange="mealOnChange(this)">
                                                                <option value="">선택</option>
                                                                <option value="Lunch">Lunch</option>
                                                                <option value="Dinner">Dinner</option>
                                                            </select>
                                                        </div>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>
                                                        <label for="time_reserve">예약 시간</label><span
                                                            class="color">*</span>
                                                    </dt>
                                                    <dd>
                                                        <div class="ui-select-wrapper">
                                                            <select class="selectBox" id="time_reserve"
                                                                name="time_reserve" required=""
                                                                onchange="reserveOnChange(this)">
                                                                <option value="">선택</option>
                                                                <option value="12:00">12:00</option>
                                                                <option value="12:30">12:30</option>
                                                                <option value="13:00">13:00</option>
                                                            </select>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                            <div class="reservationSelect">
                                                <dl>
                                                    <dt>
                                                        성인
                                                        <button type="button" class="tooltipLink"
                                                            data-tooltip="tip2">툴팁</button>
                                                        <div class="tooltipBox" id="tip2"
                                                            style="display: none; left: 738.625px;">
                                                            <p>성인 : 14세 이상</p>
                                                        </div>
                                                    </dt>
                                                    <dd>
                                                        <div class="ui-select-wrapper">
                                                            <select class="selectBox person" id="count_adult"
                                                                name="count_adult" onchange="adultOnChange(this)">
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                            </select>
                                                        </div>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>
                                                        어린이
                                                        <button type="button" class="tooltipLink"
                                                            data-tooltip="tip2">툴팁</button>
                                                        <div class="tooltipBox" id="tip2"
                                                            style="display: none; left: 738.625px;">
                                                            <p>어린이 : 49개월 ~ 13세 이하</p>
                                                        </div>
                                                    </dt>
                                                    <dd>
                                                        <div class="ui-select-wrapper">
                                                            <select class="selectBox person" id="count_elementary"
                                                                name="count_elementary"
                                                                onchange="elementaryOnChange(this)">
                                                                <option value="0">0</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                            </select>
                                                        </div>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>
                                                        유아
                                                        <button type="button" class="tooltipLink"
                                                            data-tooltip="tip2">툴팁</button>
                                                        <div class="tooltipBox" id="tip2"
                                                            style="display: none; left: 738.625px;">
                                                            <p>유아 : 48개월 이하</p>
                                                        </div>
                                                    </dt>
                                                    <dd>
                                                        <div class="ui-select-wrapper">
                                                            <select class="selectBox person" id="count_child"
                                                                name="count_child" onchange="childOnChange(this)">
                                                                <option value="0">0</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                            </select>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                        <div class="useCheckOk">
                                            <div class="formInfoPop">
                                                <dl class="requestText">
                                                    <dt>
                                                        <label for="add_request">추가 요청사항(선택)</label>
                                                    </dt>
                                                    <dd>
                                                        <textarea class="textarea" id="add_request"
                                                            name="add_request"></textarea>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="paymentWrap">
                                    <div class="paymentForm clearFixed">
                                        <h2>고객 정보</h2>
                                        <div class="clearFixed mt0">
                                            <div class="left">
                                                <dl class="nameType">
                                                    <dt>
                                                        <label for="name">이름 <span class="color">*</span></label>
                                                    </dt>
                                                    <!-- 에러시 dd의 error 클래스 추가 -->
                                                    <dd class="">
                                                        <div class="inp">
                                                            <input type="text" id="name" name="name" required=""
                                                                title="이름" value="${member.name}">
                                                            <button type="button" class="btnDelete">삭제</button>
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
                                                    <dt>
                                                        <label for="tel1">휴대폰 번호 <span class="color">*</span></label>
                                                    </dt>
                                                    <dd>

                                                        <div class="ui-select-wrapper">
                                                            <select class="selectBox" id="tel1" name="tel1"
                                                                title="핸드폰 첫째자리 선택">
                                                                <option value="010">010</option>
                                                                <option value="011">011</option>
                                                                <option value="016">016</option>
                                                                <option value="017">017</option>
                                                                <option value="018">018</option>
                                                                <option value="019">019</option>
                                                            </select>
                                                        </div>

                                                        <div class="inp">
                                                            <input type="text" id="tel2" name="tel2" required=""
                                                                title="핸드폰 가운데자리 입력" maxlength="4" value="">
                                                            <button type="button" class="btnDelete">삭제</button>
                                                        </div>
                                                        <span>-</span>
                                                        <div class="inp">
                                                            <input type="text" id="tel3" name="" tel3"" required=""
                                                                title="핸드폰 끝자리 입력" maxlength="4" value="">
                                                            <button type="button" class="btnDelete">삭제</button>
                                                        </div>
                                                        <input type="hidden" name="tel" id="tel" />
                                                        <div class="errorText">에러메시지 노출</div>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                        <div>
                                            <dl class="email">
                                                <dt>
                                                    <label for="email">이메일 <span class="color">*</span></label>
                                                </dt>
                                                <dd>
                                                    <div class="inp">
                                                        <input type="text" class="emailClass" id="email" name="email"
                                                            value="${member.email}">
                                                        <button type="button" class="btnDelete">삭제</button>
                                                    </div>

                                                    <div class="errorText">이메일 형식이 잘못되었습니다.</div>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <div class="paymentTerm clearFixed">
                                        <h2>약관 동의</h2>
                                        <div class="termArea">
                                            <div>
                                                <h3>온라인 예약 안내에 대한 동의</h3>
                                                <div class="agreeWrap">
                                                    <div class="checkbox">
                                                        <input type="checkbox" id="AGREE1_1"><label
                                                            for="AGREE1_1">동의합니다</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <h3>개인정보 수집 및 이용에 대한 동의</h3>
                                                <div class="termTxt" tabindex="0">
                                                    <p>델루나호텔 부산은 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제
                                                        15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.</p>

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
                                                                <li>- 예약내역 : 상법, 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 5년관 보관
                                                                    됩니다. (단, 취소된 예약 관련 내역은 6개월 보관)</li>
                                                            </ul>
                                                        </li>
                                                        <li>4. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시
                                                            회원가입에 제한이 있을 수 있음을 알려드립니다.</li>
                                                    </ul>

                                                </div>
                                                <div class="agreeWrap">
                                                    <div class="checkbox">
                                                        <input type="checkbox" id="AGREE2_1"><label
                                                            for="AGREE2_1">동의합니다</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="reservationAside">
                                    <h1>예약정보</h1>
                                    <section class="reservationSection">
                                        <div class="productWrap noScroll">
                                            <div class="productListBox">
                                                <article class="productItem">
                                                    <div class="productListC">
                                                        <h3>레스토랑</h3>
                                                        <p>${rtName}</p>
                                                    </div>
                                                    <div class="productListC">
                                                        <h3>방문 희망 일자</h3>
                                                        <p class="right_date_text"></p>
                                                    </div>
                                                    <div class="productListC">
                                                        <h3>중식 / 석식</h3>
                                                        <p class="right_meal_text"></p>
                                                    </div>
                                                    <div class="productListC">
                                                        <h3>예약 시간</h3>
                                                        <p class="right_reserve_text"></p>
                                                    </div>
                                                    <div class="productListC">
                                                        <h3>인원</h3>
                                                        <p>
                                                            성인 <span class="right_adult_text">1</span>명 / 어린이 <span
                                                                class="right_elementary_text">0</span>명 / 유아 <span
                                                                class="right_child_text">0</span>명
                                                        </p>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        <button class="btn btnFull" type="button" onclick="javascript:rtFromSubmit();"
                                            style="margin-top: 25px;">
                                            <span>레스토랑 예약하기</span>
                                        </button>
                                    </section>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
        </section>

        <script>
            
        </script>
        <!-- 푸터  -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        <!-- 푸터 끝  -->