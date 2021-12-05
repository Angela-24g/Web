<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- 헤더  -->
        <jsp:include page="../common/common_header.jsp"></jsp:include>
        <!-- 헤더끝  -->

        <input type="hidden" name="progress" id="progress" value="">
        <input type="hidden" name="select_rsv_list_no" id="select_rsv_list_no" value="">
        <!-- 컨텐츠 영역 -->
        <section id="container">

            <div class="hotelParadiseWrap">
                <div class="innerBox">
                    <h1 class="contTitle">
                        <span>RESERVATION</span>델루나호텔 부산에 오신 것을 환영합니다.
                    </h1>
                    <div class="reservationBox">
                        <form id="rsvFrom" name="rsvFrom" action="/reservation-reserve" enctype="multipart/form-data"
                            method="post">
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
                                                            value="${name}">
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
                                                        <input type="text" id="tel1" name="tel1" required=""
                                                            title="핸드폰 첫째자리" value="010">
                                                    </div>
                                                    <span>-</span>

                                                    <div class="inp">
                                                        <input type="text" id="tel2" name="tel2" required=""
                                                            title="핸드폰 가운데자리 입력" onkeyup="onlyNum(this);" maxlength="4"
                                                            value="0000">

                                                    </div>
                                                    <span>-</span>
                                                    <div class="inp">
                                                        <input type="text" id="tel3" name="tel3" required=""
                                                            title="핸드폰 끝자리 입력" onkeyup="onlyNum(this);" maxlength="4"
                                                            value="0000">

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
                                            <dt><label for="Email">이메일 <span class="color">*</span></label></dt>
                                            <dd>
                                                <div class="inp">
                                                    <!-- 2019.07.12 G1 수정 -->
                                                    <input type="text" id="email" name="email" required=""
                                                        value="${email}">
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
                                            <dt><label for="add_request">요청사항</label></dt>
                                            <dd>
                                                <textarea name="add_request" id="add_request" required=""
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
                                        <li>이용일자 <em id="cancelDate">하루 전</em>까지 취소 가능하며, 이후 취소 시 상품 요금의 100% 수수료가 발생합니다.</li>
                                        <li>이용일자 당일 미수령 시 동일한 위약금이 청구될 수 있습니다.</li>
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
                                            <input type="text" id="price" value="" name="will_use"
                                                onkeyup="calcNow()" />
                                        </p>
                                        <p class="payment_point_block">
                                            <label for="before_use">포인트 잔액</label>
                                            <input type="text" id="price" value="30000" name="before_use" />
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
                                                    <p>얼리 썸캉스 (디럭스 A타입)</p>
                                                </div>
                                                <div class="productListC">
                                                    <h3>체크인/아웃</h3>
                                                    <p>2021.07.15
                                                        ~ 2021.07.16
                                                    </p>
                                                    <p>1박 2일</p>
                                                </div>
                                                <div class="productListC">
                                                    <h3>객실수/인원</h3>
                                                    <p>객실 1개</p>
                                                    <p>성인 1명
                                                        / 초등학생 0명
                                                        / 어린이 0명
                                                        / 유아 0명
                                                    </p>
                                                </div>
                                                <div class="productListC">
                                                    <h3>상품선택</h3>
                                                    ㆍ소프트 음료 (2잔)<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈 드라이빙<br>ㆍPlay
                                                    LAB<br>ㆍHABA &amp; 웅진북클럽
                                                </div>
                                                <div class="productListC">
                                                    <h3>객실타입</h3>
                                                    <p>디럭스 /
                                                        오션테라스 /
                                                        신관 /
                                                        더블
                                                    </p>
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
                                                                    <p>2021.07.15 : 360,000원</p>
                                                                </div>
                                                                <!-- 2019.07.09 G1 추가 -->
                                                            </dt>
                                                            <dd>360,000원</dd>
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
                                                            <dd>75,600원</dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>추가베드</dt>
                                                            <dd>72,600원</dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>추가옵션</dt>
                                                            <dd>0원</dd>
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
                                                            <dd id="memberPriceText">- 8,712원</dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>포인트 사용</dt>
                                                            <dd class="txtRed" id="pointPriceText">- 0P</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                    <!-- 토탈 설정 -->
                                    <input type="hidden" id="resultPrice" value="499488">
                                    <input type="hidden" id="totalPrice" value="508200">
                                    <input type="hidden" id="bedPrice" value="72600">
                                    <input type="hidden" id="roomPrice" value="435600">
                                    <input type="hidden" id="memberPrice" value="8712">
                                    <input type="hidden" id="pointPrice" value="0">
                                    <div class="productFooter">
                                        <dl>
                                            <dt>총 액</dt>
                                            <dd>508,200원</dd>
                                        </dl>
                                        <dl>
                                            <dt>할인액</dt>
                                            <dd class="txtRed" id="dPriceText">- 8,712원</dd>
                                        </dl>
                                    </div>
                                    <!-- 토탈 금액 -->
                                    <div class="productTotal">
                                        <dl>
                                            <dt>최종 금액</dt>
                                            <dd><span id="tPriceText">499,488</span>원</dd>
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

        <script>
            $(".payment_point_box").hide();
            function paymentOnChange(e) {
                var value = e.value;
                if (value == "포인트결제") {
                    $(".payment_point_box").show();
                }
            }
            function calcNow() {
                rsvFrom.after_use.value = calc_minus(rsvFrom.before_use.value, rsvFrom.will_use.value);
            }
            function calc_minus(before_use, will_use) {
                return setComma(before_use - will_use);
            }
            //천단위 콤마 나타내기
            function setComma(str) {
                var returnVal = String(str);

                while (returnVal.match(/^(-?\d+)(\d{3})/)) {
                    returnVal = returnVal.replace(/^(-?\d+)(\d{3})/, '$1,$2');
                }
                return returnVal;
            }
            //입력과 동시에 천단위 콤마 찍기-아직 적용 못했음! onkeypress="Incredit_comma(this)"
            function Incredit_comma(obj) {
                var s = parseFloat(obj.value.replace(/\,/g, ""));
                var ns = s.toString();
                var dp;
                if (isNaN(ns))
                    return "";
                dp = ns.search(/\./);
                if (dp < 0)
                    dp = ns.length;
                dp -= 2;
                while (dp > 0) {
                    ns = ns.substr(0, dp) + "," + ns.substr(dp);
                    dp -= 3;
                }
                obj.value = ns;
                return true;
            }

            //특정문자 제거
            function filter(str) {
                re = /^\$|,|-/g;
                // "$" and "," and "-"입력 제거
                return str.replace(re, "");
            }

            function fnPrice() {
                var tp = $('#totalPrice').val() * 1;
                var rp = $('#roomPrice').val() * 1;
                var pp = $('#pointPrice').val() * 1;
                var bp = $('#bedPrice').val() * 1;
                var result = 0;
                var memberResult = 0;

                if (cp == 0 && $('#member_id').val() != '') {
                    memberResult = Math.floor((rp * 2) / 100);
                    result = tp - memberResult;
                    $('#memberPrice').val(memberResult);
                } else {
                    result = tp;
                    $('#memberPrice').val(memberResult);
                }

                console.log(tp);
                console.log(rp);
                console.log(cp);
                console.log(ap);
                console.log(result);
                console.log(memberResult);
                console.log(bp);

                console.log(result);
                var dResult = memberResult;
                $('#resultPrice').val(result);
                $('#memberPriceText').text("- " + addCommaStr(memberResult + "") + "원");
                $('#dPriceText').text("- " + addCommaStr(dResult + "") + "원");
                $('#tPriceText').text(addCommaStr(result + ""));

            }
            function jsPayment() {
                //필수 입력확인
                var rsvName = document.querySelector("#name");
                if (rsvName.value == "") {
                    alert("이름은 필수 입력입니다.");
                    return false;
                }

                var txtTel1 = document.querySelector("#tel1");
                var txtTel2 = document.querySelector("#tel2");
                var txtTel3 = document.querySelector("#tel3");
                var txtTel = document.querySelector("#tel");
                txtTel.value = txtTel1.value + "-" + txtTel2.value + "-"
                    + txtTel3.value;
                var rsvTel2 = document.querySelector("#tel2");
                var rsvTel3 = document.querySelector("#tel3");
                if (rsvTel2.value == "" || rsvTel3.value == "") {
                    alert("번호는 필수 입력입니다.");
                    return false;
                }

                var rsvEmail = document.querySelector("#email");
                if (rsvEmail.value == "") {
                    alert("이메일은 필수 입력입니다.");
                    return false;
                }

                if (!$("#AGREE1_1").is(":checked")) {
                    alert("온라인 예약 안내에 대한 동의해주세요.");
                    return false;
                }
                if (!$("#AGREE3_1").is(":checked")) {
                    alert("상품 정보 및 취소 규정에 관한 동의해주세요.");
                    return false;
                }

                rsvFrom.submit();

                return true;
            }


        </script>