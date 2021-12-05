<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<div class="form_relative">
				<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
				<form onsubmit="return forSubmit()" action="/adm/rooms/register" method="post" id="writeRoom">
				<input type="hidden" id="roomType_no" name="roomType.no"/>
					<div class="form_block">
						<div class="form_block">
							<label for="roomList">객실번호 *</label><span>('-호' 를 제외한 객실번호)</span>
							<ul id="roomList"><li><input type="text" name="room_numbers[0]" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" placeholder="ex) 101"></li></ul>
							<input type="button" onclick="addRooms()" value="객실추가">
						</div>
						<div class="reservationBox">
							<div id="rsvWrap">
								<dl class="form_block">
									<dt>타입 *</dt>
									<dd>
										<div class="radioBox">
											<input type="radio" id="ROOMTYPE0" name="type" value="1" onclick="fnOption(1);"/>
											<label for="ROOMTYPE0">디럭스</label>
										</div>
										<div class="radioBox">
											<input type="radio" id="ROOMTYPE1" name="type" value="2" onclick="fnOption(2);"/>
											<label for="ROOMTYPE1">프리미엄 디럭스</label>
										</div>
										<div class="radioBox">
											<input type="radio" id="ROOMTYPE2" name="type" value="3" onclick="fnOption(3);"/>
											<label for="ROOMTYPE2">스위트</label>
										</div>
									</dd>
								</dl>
								<div id="detail_block">
									<dl class="form_block">
										<dt>뷰 *</dt>
										<dd>
											<div class="radioBox">
												<input type="radio" id="VIEWTYPE0" name="room_view" value="시티" />
												<label for="VIEWTYPE0">시티</label>
											</div>
											<div class="radioBox">
												<input type="radio" id="VIEWTYPE1" name="room_view" value="오션" />
												<label for="VIEWTYPE1">오션</label>
											</div>
											<div class="radioBox">
												<input type="radio" id="VIEWTYPE2" name="room_view" value="오션 테라스"/>
												<label for="VIEWTYPE2">오션테라스</label>
											</div>
										</dd>
									</dl>
									<dl class="form_block">
										<dt>위치 *</dt>
										<dd>
											<div class="radioBox">
												<input type="radio" id="LOCATION0" name="room_location" value="본관" />
												<label for="LOCATION0">본관</label>
											</div>
											<div class="radioBox">
												<input type="radio" id="LOCATION1" name="room_location" value="신관" />
												<label for="LOCATION1">신관</label>
											</div>
										</dd>
									</dl>
									<dl class="form_block">
										<dt>베드타입 *</dt>
										<dd>
											<div class="radioBox">
												<input type="radio" id="BEDTYPE0" name="room_bedtype" value="더블" />
												<label for="BEDTYPE0">더블</label>
											</div>
											<div class="radioBox">
												<input type="radio" id="BEDTYPE1" name="room_bedtype" value="트윈" />
												<label for="BEDTYPE1">트윈</label>
											</div>
											<div class="radioBox">
												<input type="radio" id="BEDTYPE2" name="room_bedtype" value="온돌" />
												<label for="BEDTYPE2">온돌</label>
											</div>
										</dd>
									</dl>
								</div>
							</div>
						</div>
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
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>