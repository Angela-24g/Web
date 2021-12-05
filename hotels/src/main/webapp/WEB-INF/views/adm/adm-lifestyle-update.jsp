<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<form onsubmit="return requiredForm()" action="/adm/lifestyle/update" enctype="multipart/form-data" method="post">
					<input type="hidden" id="no" name="no" value="${lifestyle.no}"/>
					<div class="form_block">
						<h4>타입 *</h4>
						<div class="radioBox">
							<input type="radio" id="LIFETYPE0" name="type" ${lifestyle.type eq 'spa' ? "checked": ""}/>
							<label for="LIFETYPE0">spa</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="LIFETYPE1" name="type" ${lifestyle.type eq 'kids village' ? "checked": ""}/>
							<label for="LIFETYPE1">kids village</label>
						</div>
					</div>
					<div class="form_block">
						<label for="subtype">서브타입 *</label> 
						<input type="text" name="subtype" id="subtype" size="45" value="${lifestyle.subtype}"/>
					</div>
					<div class="form_block">
						<label for="name">이름 *</label> 
						<input type="text" name="name" id="name" size="45" value="${lifestyle.name}"/>
					</div>
					<div class="form_block">
						<label for="info">간단한 소개</label> 
						<textarea name="info" id="info">${lifestyle.info}</textarea>
					</div>
					<div class="form_block">
						<label for="info_detail">내용</label>
						<textarea name="info_detail" id="info_detail">${lifestyle.info_detail}</textarea>
					</div>
					<div class="form_block">
						<label for="guide">운영 안내</label>
						<textarea name="guide" id="guide">${lifestyle.guide}</textarea>
					</div>
					<div class="form_block">
						<label for="hours">영업시간</label>
						<textarea name="hours" id="hours">${lifestyle.hours}</textarea>
					</div>
					<div class="form_block">
						<label for="location">위치</label> 
						<input type="text" name="location" id="location" size="45" value="${lifestyle.location}"/>
					</div>
					<div class="form_block">
						<label for="contact">연락처</label> 
						<input type="text" name="contact" id="contact" size="45" value="${lifestyle.contact}"/>
					</div>
					<div class="form_block">
						<label for="attachlist1">세부이미지</label>
						<ul id="attachlist1"><c:if test="${not empty lifestyle.lifestyleImages}"><c:forEach var="lifestyleImage" items="${lifestyle.lifestyleImages}" varStatus="status"><li>
						<input type="hidden" value="${lifestyleImage.no}" name="lifestyleImages[${status.index}].no" class="forLength1"/>
						<input type="hidden" value="${lifestyleImage.name}" name="lifestyleImages[${status.index}].name">
						<input type="hidden" value="${lifestyleImage.size}" name="lifestyleImages[${status.index}].size"><a target="blank" href="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleImage.name}">${lifestyleImage.name}</a>
						<input type="button" value="삭제" class="delete"></li></c:forEach></c:if></ul>
						<input type="button" onclick="addImages()" value="첨부추가">
					</div>
					<div class="form_block">
						<label for="pricelist">요금</label>
						<ul id="pricelist"><c:if test="${not empty lifestyle.lifestylePrices}"><c:forEach var="lifestylePrice" items="${lifestyle.lifestylePrices}" varStatus="status"><li class="addLi"><input type="hidden" value="${lifestylePrice.no}" name="lifestylePrices[${status.index}].no" class="forLength2"/>
						<input type="text" placeholder="요금기준" name="lifestylePrices[${status.index}].price_type" class="inputH" value="${lifestylePrice.price_type}">
						<textarea placeholder="원단위" name="lifestylePrices[${status.index}].price" class="inputH2">${lifestylePrice.price}</textarea>
						<input type="button" value="삭제" class="delete" id="deleteButton"></li></c:forEach></c:if></ul>
						<input type="button" onclick="addPrices()" value="요금추가">
					</div>
					<div class="form_block">
						<label for="attachlist2">세부시설</label>
						<ul id="attachlist2"><c:if test="${not empty lifestyle.lifestyleFacilities}"><c:forEach var="lifestyleFacility" items="${lifestyle.lifestyleFacilities}" varStatus="status"><li class="addLi">
						<input type="hidden" value="${lifestyleFacility.lifeFacility_no}" name="lifestyleFacilities[${status.index}].lifeFacility_no">
						<input type="hidden" value="${lifestyleFacility.lifeFacility_image_name}" name="lifestyleFacilities[${status.index}].lifeFacility_image_name">
						<input type="hidden" value="${lifestyleFacility.lifeFacility_image_size}" name="lifestyleFacilities[${status.index}].lifeFacility_image_size">
						<a target="blank" href="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleFacility.lifeFacility_image_name}">${lifestyleFacility.lifeFacility_image_name}</a>
						<br><br><input type="text" placeholder="세부시설 타이틀" name="lifestyleFacilities[${status.index}].lifeFacility_title" value="${lifestyleFacility.lifeFacility_title}" class="forLength3">
						<textarea placeholder="세부시설 내용" name="lifestyleFacilities[${status.index}].lifeFacility_info">${lifestyleFacility.lifeFacility_info}</textarea>
						<input type="button" value="삭제" class="delete" id="deleteButton">
						</li></c:forEach></c:if></ul>
						<input type="button" onclick="addFacilities()" value="시설추가">
					</div>
					<div class="form_block">
						<input type="submit" value="수정하기" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function requiredForm(){
		if($("input:radio[id=LIFETYPE0]").is(":checked") == false&&$("input:radio[id=LIFETYPE1]").is(":checked") == false){
			alert('타입은 필수기입 사항입니다.')
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
	$(".delete").on("click", function(e) {
		var ul = e.target.parentNode.parentNode;
		var li = e.target.parentNode;
		ul.removeChild(li);
	})
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
		
		li.appendChild(fileInput);
		li.appendChild(btnDelete);

		리스트.appendChild(li);

		
		var i = $(".forLength1").length;//기존 파일 출력된 길이
		var Index = 리스트.childNodes.length;//기존 + 새파일 = 총길이
		var forNewIndex = Index - i;//새파일 길이만
		
		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
			
			i = $(".forLength1").length;
			Index = 리스트.childNodes.length;
			forNewIndex = Index - i;
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var fileInput = 리스트.childNodes[i+idx].childNodes[0];
				fileInput.name = "imagesFiles[" + idx + "]";
			}
		})

		
		for (var idx = 0; idx < forNewIndex; idx++) {
			var fileInput = 리스트.childNodes[i+idx].childNodes[0];
			fileInput.name = "imagesFiles[" + idx + "]";
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

		li.appendChild(input1);
		li.appendChild(textarea);
		li.appendChild(btnDelete);

		리스트.appendChild(li);
		
		var i = $(".forLength2").length;//기존 파일 출력된 길이
		var Index = 리스트.childNodes.length;//기존 + 새파일 = 총길이
		var forNewIndex = Index - i;//새파일 길이만
		
		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
			
			i = $(".forLength2").length;
			Index = 리스트.childNodes.length;
			forNewIndex = Index - i;
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var input = 리스트.childNodes[i+idx].childNodes[0];
				input.name = "price_types[" + idx +  "]";
				input.className = "inputH";
			}
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var textarea = 리스트.childNodes[i+idx].childNodes[1];
				textarea.name = "prices[" + idx +  "]";
				textarea.className = "inputH2";
			}
			
		})

			for (var idx = 0; idx < forNewIndex; idx++) {
				var input = 리스트.childNodes[i+idx].childNodes[0];
				input.name = "price_types[" + idx +  "]";
				input.className = "inputH";
			}
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var textarea = 리스트.childNodes[i+idx].childNodes[1];
				textarea.name = "prices[" + idx +  "]";
				textarea.className = "inputH2";
			}
		
		
	}
	
	function addFacilities(e) {
		var 리스트 = document.querySelector("#attachlist2");
		var ulChild = 리스트.childNodes;
		if (ulChild.length > 0
				&& ulChild[리스트.childNodes.length - 1].childNodes[0].value == "") {
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

		li.appendChild(fileInput);
		li.appendChild(input1);
		li.appendChild(input2);
		li.appendChild(btnDelete);

		리스트.appendChild(li);
		
		var i = $(".forLength3").length;//기존 파일 출력된 길이
		var Index = 리스트.childNodes.length;//기존 + 새파일 = 총길이
		var forNewIndex = Index - i;//새파일 길이만
		
		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
			
			i = $(".forLength3").length;
			Index = 리스트.childNodes.length;
			forNewIndex = Index - i;
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var fileInput = 리스트.childNodes[i+idx].childNodes[0];
				fileInput.name = "facilityFiles[" + idx +  "]";
			}
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var input = 리스트.childNodes[i+idx].childNodes[1];
				input.name = "facility_titles[" + idx +  "]";
			}
			
			for (var idx = 0; idx < forNewIndex; idx++) {
				var textarea = 리스트.childNodes[i+idx].childNodes[2];
				textarea.name = "facility_infos[" + idx +  "]";
			}
		})

		
		for (var idx = 0; idx < forNewIndex; idx++) {
			var fileInput = 리스트.childNodes[i+idx].childNodes[0];
			fileInput.name = "facilityFiles[" + idx +  "]";
		}
		
		for (var idx = 0; idx < forNewIndex; idx++) {
			var input = 리스트.childNodes[i+idx].childNodes[1];
			input.name = "facility_titles[" + idx +  "]";
		}
		
		for (var idx = 0; idx < forNewIndex; idx++) {
			var textarea = 리스트.childNodes[i+idx].childNodes[2];
			textarea.name = "facility_infos[" + idx +  "]";
		}
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>