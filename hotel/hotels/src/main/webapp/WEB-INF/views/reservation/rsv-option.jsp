<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <script type="text/javascript">

        function fnRoomChange(v) {
            $('#bed_price').val(v);
            fnPrice();
        }
        function fnPrice() {
            $('#pkrw').text(addCommaStr($('#roomPrice').val()) + '원');
            $('#tkrw').text(addCommaStr($('#taxPrice').val()) + '원');
            $('#bkrw').text(addCommaStr($('#bed_price').val()) + '원');
            $('#okrw').text(addCommaStr($('#optionPrice').val()) + '원');
            var total = (($('#roomPrice').val() * 1) + ($('#taxPrice').val() * 1) + ($('#bed_price').val() * 1) + ($('#optionPrice').val() * 1)) + "";
            $('#totalkrw').text(addCommaStr(total));
        }

        function fnCView() {
            var html = "";
            $.ajax({
                url: "/front/reservation/getWingType"
                , method: "post"
                , async: true
                , data: $("#writeFrm").serialize()
                , success: function (data, stat, xhr) {
                    if (stat == "success") {
                        if (data.data != "") {

                            for (var i = 0; i < data.data.length; i++) {
                                html += "<div class='radioBox'>";
                                html += "<input type='radio' id='location" + i + "' name='location' tabindex='0' value='" + data.data[i].location + "' onclick='fnTView();' /><label for='location" + i + "'>" + data.data[i].location_DESC + "</label>";
                                html += "</div> ";
                            }
                            $('#wingRadio').html(html);
                            $('#roomPrice').val(0);
                            $('#taxPrice').val(0);
                            fnPrice();
                        }
                    }
                }
            });
        }

        function fnOptionPrice() {
            var total = 0;
            $("form[name=writeFrm]").find(":input[name^='option']").each(function (index) {
                var thisObj = $(this);
                if (thisObj.data('price') != undefined) {
                    total += thisObj.data('price') * thisObj.val();
                    //console.log("가격 : "+thisObj.data('price') +" 인원 : "+thisObj.val() + " 합계가격 : "+ ( thisObj.data('price') * thisObj.val()) );
                }
            });
            console.log(total);
            $('#optionPrice').val(total);
            fnPrice();
        }
        function fnTView() {
            var html = "";
            $.ajax({
                url: "/front/reservation/getBedType"
                , method: "post"
                , async: true
                , data: $("#writeFrm").serialize()
                , success: function (data, stat, xhr) {
                    if (stat == "success") {
                        if (data.data != "") {

                            for (var i = 0; i < data.data.length; i++) {
                                console.log(data.data[i].bed_type);
                                html += "<div class='radioBox' >";
                                html += "<input type='radio' id='bed_type" + i + "' name='bed_type' tabindex='0' value='" + data.data[i].bed_type + ":" + data.data[i].ATTR7 + "' onclick='fnRoomSelect();'/><label for='bed_type" + i + "'>";
                                if (data.data[i].bed_type == "11") {
                                    html += "더블";
                                } else if (data.data[i].bed_type == "02") {
                                    html += "트윈";
                                } else if (data.data[i].bed_type == "01") {
                                    html += "온돌";
                                } else if (data.data[i].bed_type == "05") {
                                    if (data.data[i].ATTR7 == "JSUITE") {
                                        html += "더블";
                                    } else {
                                        html += "온돌";
                                    }
                                } else if (data.data[i].bed_type == "04") {
                                    if (data.data[i].ATTR7 == "DOUBLE") {
                                        html += "더블";
                                    } else {
                                        html += "트윈";
                                    }

                                } else {
                                    html += data.data[i].bed_type_DESC;
                                }
                                html += "</label></div> ";
                            }
                            $('#bedRadio').html(html);
                            $('#roomPrice').val(0);
                            $('#taxPrice').val(0);
                            if ($(":input:radio[name=location]:checked").val() == '02') {
                                $('._bad').text('소파베드 메이킹');
                            } else {
                                $('._bad').text('엑스트라 베드');
                            }
                            fnPrice();
                        }
                    }
                }
            });
        }
        function fnRoomSelect() {
            var viewtype = $(":input:radio[name=view_type]:checked").val();
            var wing = $(":input:radio[name=location]:checked").val();
            var bedtype = $(":input:radio[name=bed_type]:checked").val();

            if (wing == undefined || bedtype == undefined) {
                return false;
            }

            $.ajax({
                url: "/front/reservation/getRoomPrice"
                , method: "post"
                , async: true
                , data: $("#writeFrm").serialize()
                , success: function (data, stat, xhr) {
                    if (stat == "success") {
                        console.log(data);
                        if (data.result == "cancel") {
                            alert('예약이 가능한 객실이 없습니다.');
                        } else if (data.result == "success") {
                            if ($('#count_adult').val() == '1') {
                                $('#roomPrice').val(data.price[0].A1_AMT);
                                $('#taxPrice').val(data.price[0].A1_TAX);
                            } else if ($('#count_adult').val() == '2') {
                                $('#roomPrice').val(data.price[0].A2_AMT);
                                $('#taxPrice').val(data.price[0].A2_TAX);
                            } else if ($('#count_adult').val() == '3') {
                                $('#roomPrice').val(data.price[0].A3_AMT);
                                $('#taxPrice').val(data.price[0].A3_TAX);
                            } else if ($('#count_adult').val() == '4') {
                                $('#roomPrice').val(data.price[0].A4_AMT);
                                $('#taxPrice').val(data.price[0].A4_TAX);
                            } else {
                                $('#roomPrice').val(data.price[0].A5_AMT);
                                $('#taxPrice').val(data.price[0].A5_TAX);
                            }



                            fnPrice();
                        }
                    }
                }
            });
        }

        $(document).ready(function () {
            $(function () {
                $(document).on("click", ".optionSelect .ui-select-option", function (e) {
                    fnOptionPrice();
                });
            });
        });
    </script>
    <input type="hidden" id="roomType" name="roomType" value="DELUXE">
    <input type="hidden" id="roomPrice" value="0">
    <input type="hidden" id="taxPrice" value="0">
    <input type="hidden" id="optionPrice" value="0">
    <div class="reservationBox">
        <div class="choiceWrap">
            <h2>객실 선택</h2>
            <dl>
                <dt>뷰 *</dt>
                <dd>

                    <div class="radioBox">
                        <input type="radio" id="view_type0" name="view_type" tabindex="0" value="C"
                            onclick="fnCView();"><label for="view_type0">
                            시티</label>
                    </div>

                    <div class="radioBox">
                        <input type="radio" id="view_type1" name="view_type" tabindex="0" value="O"
                            onclick="fnCView();"><label for="view_type1">
                            오션</label>
                    </div>

                    <div class="radioBox">
                        <input type="radio" id="view_type2" name="view_type" tabindex="0" value="T"
                            onclick="fnCView();"><label for="view_type2">
                            오션테라스</label>
                    </div>

                </dd>
            </dl>
            <dl>
                <dt>위치 *</dt>
                <dd id="wingRadio">

                    <div class="radioBox">
                        <input type="radio" id="location0" name="location" tabindex="0" value="01"
                            disabled="disabled"><label for="location0">본관</label>
                    </div>

                    <div class="radioBox">
                        <input type="radio" id="location1" name="location" tabindex="0" value="02"
                            disabled="disabled"><label for="location1">신관</label>
                    </div>

                </dd>
            </dl>
            <dl>
                <dt>타입 *</dt>
                <dd id="bedRadio">

                    <div class="radioBox">
                        <input type="radio" id="bed_type0" name="bed_type" tabindex="0" value="11" disabled="disabled">
                        <label for="bed_type0">
                            더블
                        </label>
                    </div>

                    <div class="radioBox">
                        <input type="radio" id="bed_type1" name="bed_type" tabindex="0" value="02" disabled="disabled">
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

                    <input type="hidden" id="bed_price" name="bed_price" value="0">
                    <div class="radioBox">
                        <input type="radio" id="extra_bed1" name="extra_bed" tabindex="0" value="Y"
                            onclick="fnRoomChange(435600);"><label for="extra_bed1"><span class="_bad">엑스트라 베드</span> (+
                            72,600원)</label>
                    </div>
                    <div class="radioBox">
                        <input type="radio" id="extra_bed2" name="extra_bed" tabindex="0" value="N" checked="checked"
                            onclick="fnRoomChange(0);"><label for="extra_bed2">선택 안함</label>
                    </div>

                </dd>
            </dl>
        </div>
        <div class="cautionBox">
            <ul class="dotList">
                <li>추가베드 (본관: 엑스트라 베드 / 신관: 소파베드 메이킹) 이용시, 오션스파 씨메르 &amp; 풀 1회 무료, 실내 사우나
                    50% 할인 혜택(1회 한정) 제공.</li>
                <li>13세 이하 어린이의 경우 별도 요금없이 객실당 2명까지 투숙 가능합니다. (단, 성인 3인 투숙시 어린이 1명 투숙가능)
                </li>
                <li>단, 패키지 전용 혜택은 제외됩니다.</li>
            </ul>
        </div>
        <!-- 옵션 선택 -->

        <!-- //옵션 선택 -->
    </div>
    <div class="reservationAside">
        <section class="reservationSection">
            <div class="productWrap">
                <div class="productPrice">
                    <dl>
                        <dt>상품요금
                        </dt>
                        <dd id="pkrw">0원</dd>
                    </dl>
                    <dl>
                        <dt>세금 및 봉사료
                            <a href="#" class="tooltipLink">툴팁</a>
                            <div class="tooltipBox">
                                <p>10%봉사료 추가 후 10% 세금이 더해집니다.</p>
                            </div>
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
            <a href="#none" onclick="msgpopup()" class="btn btnFull layerPopOpen"><span>다음</span></a>


        </section>
    </div>