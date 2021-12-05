
		//초기 전화번호 셋팅
		var originTelVal = $('#member_tel').val();
		//var otvArr = originTelVal.split("-");  // 구분자를 통해 나뉜 결과는 배열로 저장 reservation과 restaurant의 tel은 구분자가 있지만 member에는 구분자가 없음.
		//console.log(otvArr);
		var otvArr1 = originTelVal.substr(0,3);
		var otvArr2 = originTelVal.substr(4,4);
		var otvArr3 = originTelVal.substr(7,4);
		console.log(otvArr1);
		console.log(otvArr2);
		console.log(otvArr3);
		$('#tel1').val(otvArr1);
		$('#tel2').val(otvArr2);
		$('#tel3').val(otvArr3);
		//초기 전화번호 셋팅 끝


            //천단위 콤마 나타내기-포인트 합계계산에만 들어감.
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
            function addCommaStr(str) {
            	var num = "";
            	var sign = "";

            	if (str.charAt(0) == "+" || str.charAt(0) == "-") {
            		sign = str.charAt(0);
            		str = str.substr(1);
            	}

            	var index = str.indexOf('.');

            	if (index != -1) {
            		num = str.substr(index);
            	} else {
            		index = str.length;
            	}

            	for (var i = index - 3; i > 0; ) {
            		num = ',' + str.substr(i, 3) + num;

            		index = i;
            		i -= 3;
            	}

            	num = sign + str.substr(0, index) + num;

            	return	num;
            }
            function fnPrice() {//넘어온 값으로 계산 후 우측 박스에 금액 표기
                var tp = $('#price_total').val() * 1;
                var pp = $('#price_product').val() * 1;
                var sp = $('#price_service').val() * 1;
                var bp = $('#price_bed').val() * 1;
                var op = $('#price_options').val() * 1;
                var mp = $('#price_member').val() * 1;
                var beforePpoint = $("input[name='before_use']").val() * 1;
                var willPoint = $("input[name='will_use']").val() * 1;
                var result = 0;
                var memberResult = 0;

                if (beforePpoint == 0 && $('#writer').val() != '') {
                    memberResult = Math.floor(((pp + sp + bp + op) * 2) / 100);
                    result = tp - willPoint - memberResult;
                    $('#price_member').val(memberResult);
                } else {
                    result = tp;
                    $('#price_member').val(memberResult);
                }

                // console.log(tp);
                // console.log(pp);
                // console.log(sp);
                // console.log(bp);
                // console.log(op);
                // console.log(mp);
                // console.log(result);

                var mResult = memberResult;
                var pResult = willPoint;
                $('#price_result').val(result);
				
				$('#textPriceProduct').text(addCommaStr(pp + "") + "원");
				$('#textPriceService').text(addCommaStr(sp + "") + "원");
				$('#textPriceBed').text(addCommaStr(bp + "") + "원");
				$('#textPriceOption').text(addCommaStr(op + "") + "원");
				$('#textPriceTotal').text(addCommaStr(tp + "") + "원");
				
                $('#price_memberText').text("- " + addCommaStr(mResult + "") + "원");
                $('#textPriceMember').text("- " + addCommaStr(mResult + "") + "원");
                $('#textPriceResult').text(addCommaStr(result + ""));

            }
            fnPrice();
            function fnCount() {//객실수, 인원수 강제입력
                var cRNum = $('#cRoom').html() * 1;
                var cANum = $('#cAdul').html() * 1;
                var cENum = $('#cElem').html() * 1;
                var cCNum = $('#cChil').html() * 1;
                var cBNum = $('#cBaby').html() * 1;
                var cAllNum = cANum + cENum + cCNum + cBNum;

                console.log("룸 카운트 : " + cRNum);
                console.log("어른 카운트 : " + cANum);
                console.log("초딩 카운트 : " + cENum);
                console.log("아이 카운트 : " + cCNum);
                console.log("베이비 카운트 : " + cBNum);
                console.log("전부 카운트 : " + cAllNum);

                $('input[name=room_count]').attr('value',cRNum);
                $('input[name=count_adult]').attr('value',cANum);
                $('input[name=count_elementary]').attr('value',cENum);
                $('input[name=count_child]').attr('value',cCNum);
                $('input[name=count_baby]').attr('value',cBNum);
                $('input[name=count_all]').attr('value',cAllNum);
            }
            fnCount();

			$(".payment_point_box").hide();
            function paymentOnChange(e) {
                var value = e.value;
                if (value == "포인트결제") {
                    $(".payment_point_box").show();
                }
                alert("포인트 결제는 회원만 이용 가능한 옵션입니다.");
            }
            function calcNow() {
                rsvForm.after_use.value = calc_minus(rsvForm.before_use.value, rsvForm.will_use.value);
            }
            function calc_minus(before_use, will_use) {
                return setComma(before_use - will_use);
            }
            // 하나 입력 시 동시에 입력되게 한다.
            $("input[name='will_use']").keydown(function () {
				var ppoint = $(this).val();
				$('#textPricePoint').text("- " + addCommaStr(ppoint + "") + "P");
				$('#textPricePoint2').text("- " + addCommaStr(ppoint + "") + "P");
            });
            // 마지막에 입력 시 입력되게 한다.
            $("input[name='will_use']").change(function () {
                var ppoint2 = $(this).val();
				$('#textPricePoint').text("- " + addCommaStr(ppoint2 + "") + "P");
				$('#textPricePoint2').text("- " + addCommaStr(ppoint2 + "") + "P");
				//console.log(ppoint2);
				var tp = $('#price_total').val() * 1;
                var pp = $('#price_product').val() * 1;
                var sp = $('#price_service').val() * 1;
                var bp = $('#price_bed').val() * 1;
                var op = $('#price_options').val() * 1;
                var mp = $('#price_member').val() * 1;
                var beforePpoint = $("input[name='before_use']").val() * 1;
                var willPoint = $("input[name='will_use']").val() * 1;
                var result = 0;
                var memberResult = 0;
				//console.log("result : "+result);
                if (beforePpoint > 0 && $('#writer').val() != '') {
                    memberResult = Math.floor(((pp + sp + bp + op) * 2) / 100);
                    result = tp - ppoint2 - memberResult;
                    $('#price_member').val(memberResult);
                } else if (beforePpoint == 0 && $('#writer').val() != '') {
                    memberResult = Math.floor(((pp + sp + bp + op) * 2) / 100);
                    result = tp - memberResult;
                    $('#price_member').val(memberResult);
                } else {
                    result = tp;
                    $('#price_member').val(memberResult);
                }
				//console.log("result : "+result);
				$('#textPriceResult').text(addCommaStr(result + ""));
            });

            function jsPayment() {
                //사용한 포인트
                var txtPrice_point = document.querySelector("#price_point");
                var txtPrice_val = document.querySelector("input[name='will_use']");
                txtPrice_point.value = txtPrice_val.value;
                //console.log(txtPrice_val);
                //console.log(txtPrice_point);
                //console.log(txtPrice_val.value);
                //console.log(txtPrice_point.value);

                //필수 입력확인
                var rsvName = document.querySelector("#name");
                if (rsvName.value == "") {
                    alert("이름은 필수 입력입니다.");
                    return false;
                }

                //tel합치기
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

                //check start
                console.log("check_in val : " + rsvForm.check_in.value);
                console.log("check_out val : " + rsvForm.check_out.value);
                console.log("room_count val : " + rsvForm.room_count.value);
                console.log("count_adult val : " + rsvForm.count_adult.value);
                console.log("count_elementary val : " + rsvForm.count_elementary.value);
                console.log("count_child val : " + rsvForm.count_child.value);
                console.log("count_baby val : " + rsvForm.count_baby.value);
                console.log("count_all val : " + rsvForm.count_all.value);
                console.log("price_product val : " + rsvForm.price_product.value);
                console.log("price_service val : " + rsvForm.price_service.value);
                console.log("price_options val : " + rsvForm.price_options.value);
                console.log("price_member val : " + rsvForm.price_member.value);
                console.log("price_point val : " + rsvForm.price_point.value);
                console.log("price_bed val : " + rsvForm.price_bed.value);
                console.log("price_total val : " + rsvForm.price_total.value);
                console.log("price_result val : " + rsvForm.price_result.value);
                console.log("name val : " + rsvForm.name.value);
                console.log("email val : " + rsvForm.email.value);
                console.log("tel val : " + rsvForm.tel.value);
                console.log("add_requests val : " + rsvForm.add_requests.value);
                //check end

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

                rsvForm.submit();

                return true;
            }