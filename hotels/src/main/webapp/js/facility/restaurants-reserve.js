$(function () {
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
		
		
                var dates = $("#date_reserve")
                    .datepicker(
                        {
                            prevText: '이전 달',
                            nextText: '다음 달',
                            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월',
                                '7월', '8월', '9월', '10월', '11월', '12월'],
                            monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
                                '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                            dateFormat: 'yy-mm-dd',
                            showMonthAfterYear: true,
                            yearSuffix: '년',
                            maxDate: '+60d',
                            onSelect: function (selectedDate) {
                                document.querySelector('.right_date_text').innerText = selectedDate;
                                var option = this.id == "from" ? "minDate"
                                    : "maxDate", instance = $(this).data(
                                        "datepicker"), date = $.datepicker
                                            .parseDate(
                                                instance.settings.dateFormat
                                                || $.datepicker._defaults.dateFormat,
                                                selectedDate, instance.settings);
                                dates.not(this).datepicker("option", option,
                                    date);
                            }
                        });
            });

            function mealOnChange(e) {
                const value = e.value;
                document.querySelector('.right_meal_text').innerText = value;
            }
            function reserveOnChange(e) {
                const value = e.value;
                document.querySelector('.right_reserve_text').innerText = value;
            }
            function adultOnChange(e) {
                const value = e.value;
                document.querySelector('.right_adult_text').innerText = value;
				fnSumPerson('adultType', 'right_adult_text');
            }
            function elementaryOnChange(e) {
                const value = e.value;
                document.querySelector('.right_elementary_text').innerText = value;
				fnSumPerson('stdnType','right_elementary_text');
            }
            function childOnChange(e) {
                const value = e.value;
                document.querySelector('.right_child_text').innerText = value;
				fnSumPerson('childType', 'right_child_text');
            }
//인원 체크시 text 변화 및 4인만 받기 - 진행중
function fnSumPerson(t, id){//받은 값을 구분
	var text = "";
	if(t =="adultType"){
		text = "성인 ";
	}else if(t =="stdnType"){
		text = "어린이 ";
	}else{
		text = "유아 ";
	}
	var cA = $('#right_adult_text').html()*1;
	var cE = $('#right_elementary_text').html()*1;
	var cC = $('#right_child_text').html()*1;
	var cnt = cA + cE + cC;
	console.log("cA 카운트 : " + cA);
    console.log("cE 카운트 : " + cE);
    console.log("cC 카운트 : " + cC);
    console.log("cnt 카운트 : " + cnt);
	if(cnt > 4){//5인 이상인 경우 alert
		alert("객실은 최대 4인까지 수용 가능합니다.\n 현재선택인원 :"+cnt);
		//선택해제
		$(".selectBox.person option").prop("selected", false);
	
	}
}

            function rtFromSubmit() {
                //필수 입력확인
                var rsvDate = document.querySelector("#date_reserve");
                if (rsvDate.value == "") {
                    alert("방문 희망 일자는 필수 입력입니다.");
                    return false;
                }
                var rsvMeal = document.querySelector("#time_meal");
                if (rsvMeal.value == "") {
                    alert("중식 / 석식은 필수 입력입니다.");
                    return false;
                }
                var rsvTime = document.querySelector("#time_reserve");
                if (rsvTime.value == "") {
                    alert("예약 시간은 필수 입력입니다.");
                    return false;
                }
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
				
                var cnt = ($('#count_adult').val() * 1) + ($('#count_elementary').val() * 1) + ($('#count_child').val() * 1);
                var count_all = document.querySelector("#count_all");
                //count_all.value = cnt.toString();

                if (!$("#AGREE1_1").is(":checked")) {
                    alert("온라인 예약 안내에 대한 동의해주세요.");
                    return false;
                }
                if (!$("#AGREE2_1").is(":checked")) {
                    alert("개인정보 수집 및 이용에 대한 동의해주세요.");
                    return false;
                }

                rtFrom.submit();

                return true;
            }