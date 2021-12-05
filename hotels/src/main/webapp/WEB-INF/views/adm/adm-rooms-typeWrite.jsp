<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
				<form onsubmit="return forSubmit()" action="/adm/rooms/typeRegister" enctype="multipart/form-data" method="post">
					<div class="form_block">
						<h4>타입 *</h4>
						<div class="radioBox">
							<input type="radio" id="ROOMTYPE0" name="type" value="디럭스"/>
							<label for="ROOMTYPE0">디럭스</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="ROOMTYPE1" name="type" value="프리미엄 디럭스"/>
							<label for="ROOMTYPE1">프리미엄 디럭스</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="ROOMTYPE2" name="type" value="스위트"/>
							<label for="ROOMTYPE2">스위트</label>
						</div>
					</div>
					<div class="form_block">
						<label for="adult_cnt">인원(성인기준) *</label>
						<select class="selectBox" name="adult_cnt" id="adult_cnt">
							<option class="ui-select-trigger" value="1" selected>성인 1</option>
							<option class="ui-select-trigger" value="2" >성인 2</option>
							<option class="ui-select-trigger" value="3" >성인 3</option>
						</select>
					</div>
					<div class="form_block">
						<label for="title">제목 *</label> 
						<input type="text" name="title" id="title" size="45" />
					</div>
					<div class="form_block">
						<label for="info">간단한 소개</label> 
						<textarea name="info" id="info"></textarea>
					</div>
					<div class="form_block">
						<h4>전망 *</h4>
						<div class="radioBox">
							<input type="radio" id="VIEWTYPE0" name="room_view" value="시티"/>
							<label for="VIEWTYPE0">시티</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="VIEWTYPE1" name="room_view" value="오션"/>
							<label for="VIEWTYPE1">오션</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="VIEWTYPE2" name="room_view" value="오션 테라스"/>
							<label for="VIEWTYPE2">오션테라스</label>
						</div>
					</div>
					<div class="form_block">
						<h4>위치 *</h4>
						<div class="radioBox">
							<input type="radio" id="LOCATION0" name="room_location" value="본관"/>
							<label for="LOCATION0">본관</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="LOCATION1" name="room_location" value="신관"/>
							<label for="LOCATION1">신관</label>
						</div>
					</div>
					<div class="form_block">
						<h4>베드타입 *</h4>
						<div class="radioBox">
							<input type="radio" id="BEDTYPE0" name="room_bedtype" value="더블"/>
							<label for="BEDTYPE0">더블</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="BEDTYPE1" name="room_bedtype" value="트윈"/>
							<label for="BEDTYPE1">트윈</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="BEDTYPE2" name="room_bedtype" value="온돌"/>
							<label for="BEDTYPE2">온돌</label>
						</div>
					</div>
					<div class="form_block">
						<label for="price">가격 *</label> 
						<input type="text" name="room_price" id="price" size="45" />
					</div>
					<div class="form_block">
						<label for="thumbnailFile">썸네일</label>
						<input type="file" id="thumbnailFile" name="thumbnailFile"/>
					</div>
					<div class="form_block">
						<label for="attachlist">세부이미지</label>
						<ul id="attachlist"></ul>
						<input type="button" onclick="addAttach()" value="첨부추가">
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
	function forSubmit(){
		if($(":input:radio[name=type]:checked").val() == undefined){
			alert('타입을 선택하여 주시기 바랍니다.');
			$("#ROOMTYPE0").focus();
			return false;
		}
		
		
		if($(":input:text[name=title]").val().trim() == ''){
			alert('제목을 작성하여 주시기 바랍니다.');
			$("#title").focus();
			return false;
		}
		
		if($(":input:radio[name=room_view]:checked").val() == undefined){
			alert('전망을 선택하여 주시기 바랍니다.');
			$("#VIEWTYPE0").focus();
			return false;
		}
		
		if($(":input:radio[name=room_location]:checked").val() == undefined){
			alert('위치를 선택하여 주시기 바랍니다.');
			$("#LOCATION0").focus();
			return false;
		}
		
		if($(":input:radio[name=room_bedtype]:checked").val() == undefined){
			alert('베드타입을 선택하여 주시기 바랍니다.');
			$("#BEDTYPE0").focus();
			return false;
		}
		
		if($(":input:text[name=room_price]").val().trim() == ''){
			alert('가격을 작성하여 주시기 바랍니다.');
			$("#price").focus();
			return false;
		}
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>