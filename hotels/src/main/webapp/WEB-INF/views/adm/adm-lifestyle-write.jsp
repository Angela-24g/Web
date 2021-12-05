<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<form onsubmit="return requiredForm()" action="/adm/lifestyle/register" enctype="multipart/form-data" method="post">
					<div class="form_block">
						<h4>타입 *</h4>
						<div class="radioBox">
							<input type="radio" id="LIFETYPE0" name="type" value="spa"/>
							<label for="LIFETYPE0">spa</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="LIFETYPE1" name="type" value="kids village"/>
							<label for="LIFETYPE1">kids village</label>
						</div>
					</div>
					<div class="form_block">
						<label for="subtype">서브타입 *</label> 
						<input type="text" name="subtype" id="subtype" size="45" />
					</div>
					<div class="form_block">
						<label for="name">이름 *</label> 
						<input type="text" name="name" id="name" size="45" />
					</div>
					<div class="form_block">
						<label for="info">간단한 소개</label> 
						<textarea name="info" id="info"></textarea>
					</div>
					<div class="form_block">
						<label for="info_detail">내용</label>
						<textarea name="info_detail" id="infoDetail"></textarea>
					</div>
					<div class="form_block">
						<label for="guide">운영 안내</label>
						<textarea name="guide" id="guide"></textarea>
					</div>
					<div class="form_block">
						<label for="hours">영업시간</label>
						<textarea name="hours" id="hours"></textarea>
					</div>
					<div class="form_block">
						<label for="location">위치</label> 
						<textarea name="location" id="location"></textarea>
					</div>
					<div class="form_block">
						<label for="contact">연락처</label> 
						<input type="text" name="contact" id="contact" size="45" />
					</div>
					<div class="form_block">
						<label for="attachlist1">세부이미지</label>
						<ul id="attachlist1"></ul>
						<input type="button" onclick="addImages()" value="첨부추가">
					</div>
					<div class="form_block">
						<label for="pricelist">요금</label>
						<ul id="pricelist"></ul>
						<input type="button" onclick="addPrices()" value="요금추가">
					</div>
					<div class="form_block">
						<label for="attachlist2">세부시설</label>
						<ul id="attachlist2"></ul>
						<input type="button" onclick="addFacilities()" value="시설추가">
					</div>
					<div class="form_block">
						<input type="submit" value="등록하기" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function requiredForm(){
		if($("input:radio[id=LIFETYPE0]").is(":checked") == false&&$("input:radio[id=LIFETYPE1]").is(":checked") == false){
			alert('타입은 필수 사항입니다.')
			$('#LIFETYPE0').focus();
			return false;
		}
		if($('#subtype').val().trim()==''){
			alert('서브타입은 필수기입 사항입니다.')
			$('#subtype').focus();
			return false;
		}
		if($('#name').val().trim()==''){
			alert('이름은 필수기입 사항입니다.')
			$('#name').focus();
			return false;
		}
		return true;
	}
	function addImages(e) {
		var 리스트 = document.querySelector("#attachlist1");

		if (리스트.childNodes.length > 0
				&& 리스트.childNodes[리스트.childNodes.length - 1].childNodes[0].value == "") {
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

		리스트.appendChild(li);
		
		if(리스트.childNodes != null){
			var i = 리스트.childNodes.length - 1;
			var fileInput = 리스트.childNodes[i].childNodes[0];
			fileInput.name = "imagesFiles[" + i +  "]";
		}
	}
	
	function addPrices(e) {
		var 리스트 = document.querySelector("#pricelist");
		
		if (리스트.childNodes.length > 0
				&& 리스트.childNodes[리스트.childNodes.length - 1].childNodes[1].value == "") {
			return 0;
		}

		var li = document.createElement("li");
		li.className = "addLi";
		
		var input1 = document.createElement("input");
		input1.type = "text";
		input1.placeholder = "요금기준";
		
		var textarea = document.createElement("textarea");
		textarea.placeholder = "원단위";
		
		var btnDelete = document.createElement("input");
		btnDelete.type = "button";
		btnDelete.value = "삭제";
		btnDelete.id = "deleteButton";

		btnDelete.containerLi = li;

		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
		})

		li.appendChild(input1);
		li.appendChild(textarea);
		li.appendChild(btnDelete);

		리스트.appendChild(li);
		
		var i = 리스트.childNodes.length - 1;
		
		if(리스트.childNodes != null){
			var select = 리스트.childNodes[i].childNodes[0];
			select.name = "price_types[" + i +  "]";
			select.className = "inputH";
		}
		
		if(리스트.childNodes != null){
			var input = 리스트.childNodes[i].childNodes[1];
			input.name = "prices[" + i +  "]";
			input.className = "inputH2";
		}
	}
	
	function addFacilities(e) {
		var 리스트 = document.querySelector("#attachlist2");

		if (리스트.childNodes.length > 0
				&& 리스트.childNodes[리스트.childNodes.length - 1].childNodes[0].value == "") {
			return 0;
		}

		var li = document.createElement("li");
		li.className = "addLi";
		
		var fileInput = document.createElement("input");
		fileInput.type = "file";
		
		var input1 = document.createElement("input");
		input1.type = "text";
		input1.placeholder = "세부시설 타이틀";
		
		var input2 = document.createElement("textarea");
		input2.placeholder = "세부시설 내용";
		
		
		var btnDelete = document.createElement("input");
		btnDelete.type = "button";
		btnDelete.value = "삭제";
		btnDelete.id = "deleteButton";
		btnDelete.containerLi = li;

		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
		})

		li.appendChild(fileInput);
		li.appendChild(input1);
		li.appendChild(input2);
		li.appendChild(btnDelete);

		리스트.appendChild(li);
		
		var i = 리스트.childNodes.length - 1;
		
		if(리스트.childNodes != null){
			var fileInput = 리스트.childNodes[i].childNodes[0];
			fileInput.name = "facilityFiles[" + i +  "]";
		}
		
		if(리스트.childNodes != null){
			var input = 리스트.childNodes[i].childNodes[1];
			input.name = "facility_titles[" + i +  "]";
		}
		
		if(리스트.childNodes != null){
			var textarea = 리스트.childNodes[i].childNodes[2];
			textarea.name = "facility_infos[" + i +  "]";
		}
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>