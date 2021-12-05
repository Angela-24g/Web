<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../adm/adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="../adm/adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
				<form id="writeFrm" onsubmit="forSubmit()" action="/adm-rooms-register" enctype="multipart/form-data" method="post">
					<div class="form_block" id="form_block1">
						<h4>타입 *</h4>
						<div class="radioBox">
							<input type="radio" id="ROOMTYPE0" name="roomType.type" value="디럭스"/>
							<label for="ROOMTYPE0">디럭스</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="ROOMTYPE1" name="roomType.type" value="프리미엄 디럭스"/>
							<label for="ROOMTYPE1">프리미엄 디럭스</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="ROOMTYPE2" name="roomType.type" value="스위트"/>
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
						<label for="title">제목</label> 
						<input type="text" name="title" id="title" size="45" />
					</div>
					<div class="form_block">
						<label for="info">간단한 소개</label> 
						<textarea name="info" id="info"></textarea>
					</div>
					<div class="form_block">
						<h4>전망 *</h4>
						<div class="radioBox">
							<input type="radio" id="VIEWTYPE0" name="view" value="시티"/>
							<label for="VIEWTYPE0">시티</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="VIEWTYPE1" name="view" value="오션"/>
							<label for="VIEWTYPE1">오션</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="VIEWTYPE2" name="view" value="오션 테라스"/>
							<label for="VIEWTYPE2">오션테라스</label>
						</div>
						<input type="button" onclick="ajaxTest()" value="ajax테스트">
					</div>
					<div class="form_block">
						<h4>위치 *</h4>
						<div class="radioBox">
							<input type="radio" id="LOCATION0" name="location" value="본관"/>
							<label for="LOCATION0">본관</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="LOCATION1" name="location" value="신관"/>
							<label for="LOCATION1">신관</label>
						</div>
					</div>
					<div class="form_block">
						<h4>베드타입 *</h4>
						<div class="radioBox">
							<input type="radio" id="BEDTYPE0" name="bedtype" value="더블"/>
							<label for="BEDTYPE0">더블</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="BEDTYPE1" name="bedtype" value="트윈"/>
							<label for="BEDTYPE1">트윈</label>
						</div>
						<div class="radioBox">
							<input type="radio" id="BEDTYPE2" name="bedtype" value="온돌"/>
							<label for="BEDTYPE2">온돌</label>
						</div>
					</div>
					<div class="form_block">
						<label for="price">가격</label> 
						<input type="text" name="price" id="price" size="45" />
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
						<label for="roomList">객실번호 *</label><span>('-호' 를 제외한 객실번호)</span>
						<ul id="roomList"><li><input type="text" name="room_numbers[0]" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" placeholder="ex) 101"></li></ul>
						<input type="button" onclick="addRooms()" value="객실추가">
					</div>
					<div class="form_block">
						<input type="submit" value="객실등록하기" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function forSubmit(){
		var price = document.querySelector("#price").value;
		price = parseInt(price.replace(/[^\d]+/g, ''));
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>