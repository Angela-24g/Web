$(function(){


})

function fnOption(roomType_no) {
	$('#roomType_no').val(roomType_no);
	
	$("#detail_block").html("");
	$.ajax({
		url: "/adm/rooms/room-option"
		, method: "post"
		, async: true
		, data: $("#writeRoom").serialize()
		, success: function (data, stat, xhr) {
			if (stat == "success") {
				if (data != "") {
					var html = data;
					$("#detail_block").html(html);
					selectMake(); //셀렉트박스 
					selectMakeUI(); //셀렉트박스 액션
					tooltip(); //툴팁 액션
				}
			}
		}
	});
}

//'뷰' 라디오버튼에 있는 함수
function fnCView(){
	var html = "";
	//serialize() 는 JSON 객체가 아닌 "room_type_no=1" 이런식의 쿼리문으로 넘어간다.
	//그래서 받는측이 @RequestBody 이 아닌 @RequestParam 다!(쿼리문으로 받을때처럼 생략도 가능)
	//참조변수의 변수(ex.RoomDetail의 roomType 참조변수) 도 받을 수 있다.(name = roomType.no)
	$.ajax({
		url : "/reservation/rsv-view"
    , method : "post"
    , async : true
		, data : $("#writeRoom").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data != null) {
					//'위치' 라디오버튼 활성화
					for(var i =0; i < data.length ; i++){
						html +="<div class='radioBox'>";
						html +="<input type='radio' id='LOCATION"+i+"' name='room_location' tabindex='0' value='"+data[i]+"' onclick='fnTView();' /><label for='LOCATION"+i+"'>"+data[i] +"</label>";
						html +="</div> ";
					}
					$('#locationRadio').html(html);
				}
			}
		}
	});
}
//'위치' 라디오버튼에 있는 함수
function fnTView(){
	var html = "";
	$.ajax({
		url : "/reservation/rsv-location"
	    , method : "post"
	    , async : true
		, data : $("#writeRoom").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data != null) {
					for(var i =0; i < data.length ; i++){
						html +="<div class='radioBox' >";
						html +="<input type='radio' id='BEDTYPE"+i+"' name='room_bedtype' tabindex='0' value='"+data[i]+"' onclick='fnRoomSelect();'/><label for='BEDTYPE"+i+"'>"; 
						html += data[i];
						html +="</label></div> ";
					}
					$('#bedRadio').html(html);
				}
			}
		}
	});
}

//'베드타입' 라디오버튼에 있는 함수
function fnRoomSelect(){
}

//adm/rooms/mainList 필터링 시작
filterSelection("all") // Execute the function and show all columns
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

// Show filtered elements
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }
}

// Hide elements that are not selected
function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
//adm/rooms/mainList 필터링 끝

//adm/rooms/list 필터링 시작
function chageLangSelect(_obj){
	var selectBox = _obj;
	
	// select element에서 선택된 option의 value가 저장된다. 
	var selectValue = selectBox.options[selectBox.selectedIndex].value; 
	// select 의 name 이 저장된다.
	var selectName = _obj.name;
	if(selectValue=='전체'){
		location.href="/adm/rooms/list";
	}else{
		location.href="/adm/rooms/list?a=search&page=1&col="+selectName+"&kwd="+selectValue;
	}
}
//adm/rooms/list 필터링 끝
function addAttach(e) {
	var 첨부리스트 = document.querySelector("#attachlist");

	if (첨부리스트.childNodes.length > 0
			&& 첨부리스트.childNodes[첨부리스트.childNodes.length - 1].childNodes[0].value == "") {
		return 0;
	}

	var li = document.createElement("li");
	var fileInput = document.createElement("input");
	fileInput.type = "file";
	var btnDelete = document.createElement("input");
	btnDelete.type = "button";
	btnDelete.value = "삭제";
	btnDelete.containerLi = li;

	btnDelete.addEventListener("click", function(event) {
		var li=event.target.containerLi;
		var ul=li.parentNode;
		ul.removeChild(li);
	})

	li.appendChild(fileInput);
	li.appendChild(btnDelete);

	첨부리스트.appendChild(li);
	
	if(첨부리스트.childNodes != null){
		var i = 첨부리스트.childNodes.length - 1;
		var fileInput = 첨부리스트.childNodes[i].childNodes[0];
		fileInput.name = "attachFiles[" + i +  "]";
	}
}
    

function addRooms(e) {
	var 첨부리스트 = document.querySelector("#roomList");

	if (첨부리스트.childNodes.length > 0
			&& 첨부리스트.childNodes[첨부리스트.childNodes.length - 1].childNodes[0].value == "") {
		return 0;
	}

	var li = document.createElement("li");
	var fileInput = document.createElement("input");
	fileInput.type = "text";
	var btnDelete = document.createElement("input");
	btnDelete.type = "button";
	btnDelete.value = "삭제";
	btnDelete.containerLi = li;

	btnDelete.addEventListener("click", function(event) {
		var li=event.target.containerLi;
		var ul=li.parentNode;
		ul.removeChild(li);
	})

	li.appendChild(fileInput);
	li.appendChild(btnDelete);

	첨부리스트.appendChild(li);
	
	if(첨부리스트.childNodes != null){
		var i = 첨부리스트.childNodes.length - 1;
		var fileInput = 첨부리스트.childNodes[i].childNodes[0];
		fileInput.name = "room_numbers[" + i +  "]";
	}
}
	
/* 숫자만 입력 + 3자리 마다 콤마(,) */
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {//컴마없애기
	str = String(str);
	return str.replace(/[^\d]+/g, '');
} 

function inputNumberFormat(obj) {
	obj.value = comma(uncomma(obj.value));
}

function onlynumber(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
}

	