<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<div class="form_wrap write">
			<form onsubmit="return admSubmitRsv()" action="/adm/adm-rsv-write"
				enctype="multipart/form-data" method="post">
				<div class="form_block">
					<label for="title">제목</label> <input type="text" name="title"
						id="title" value="" size="150" />
				</div>
				<div class="form_block">
					<label for="title_s">소제목</label>
					<textarea name="title_s" id="title_s" value=""></textarea>
				</div>
				<div class="form_block">
					<label for="date_start">룸 예약 시작일</label> <input type="text"
						name="date_start" id="date_start" value="" />
				</div>
				<div class="form_block">
					<label for="date_end">룸 예약 마감일</label> <input type="text"
						name="date_end" id="date_end" value="" />
				</div>
				<div class="form_block">
					<label for="">파일</label>
					<ul id="attachlist"></ul>
					<input type="button" onclick="addAttach()" value="첨부추가">
				</div>
				<!-- <div class="form_block">
					<label for="">타입</label>
					<p class="checkbox_block"><label for="deluxe">디럭스</label><input type="checkbox" name="pro_type[]" value="deluxe" id="deluxe"></p>
					<p class="checkbox_block"><label for="premium">프리미엄 디럭스</label><input type="checkbox" name="pro_type[]" value="premium" id="premium"></p>
					<p class="checkbox_block"><label for="sweet">스위트</label><input type="checkbox" name="pro_type[]" value="sweet" id="sweet"></p>
				</div> -->
				<div class="form_block">
					<label for="content">내용</label>
					<textarea name="content" id="content" value=""></textarea>
				</div>
				<div class="form_block">
					<label for="benefits">혜택</label>
					<textarea name="benefits" id="benefits" value=""></textarea>
				</div>
				<div class="form_block">
					<label for="pkg_rate">할인율</label>
					<input type="text" name="pkg_rate" id="pkg_rate" value="" />
				</div>
				<div class="form_block">
					<input type="submit" value="등록" />
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#date_start")
						.datepicker(
								{
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNames : [ '일', '월', '화', '수', '목', '금',
											'토' ],
									dayNamesShort : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dateFormat : 'yy-mm-dd',
									showMonthAfterYear : true,
									yearSuffix : '년',
									minDate : 0,
									maxDate : '+60d',
									numberOfMonths : 2,
									onSelect : function(selected) {
										$("#date_end").datepicker("option",
												"0", selected)//$("#check_out").datepicker("option", "minDate", selected)
									}
								});
				$("#date_end")
						.datepicker(
								{
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNames : [ '일', '월', '화', '수', '목', '금',
											'토' ],
									dayNamesShort : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dateFormat : 'yy-mm-dd',
									showMonthAfterYear : true,
									yearSuffix : '년',
									minDate : 1,
									maxDate : '+60d',
									numberOfMonths : 2,
									onSelect : function(selected) {
										$("#date_start").datepicker("option",
												"+60d", selected)//$("#check_in").datepicker("option", "maxDate", selected)
									}
								});
			});
	function addAttach() {
		var attachList = document.querySelector("#attachlist");
		if (attachList.childNodes.length > 0
				&& attachList.childNodes[attachList.childNodes.length - 1].childNodes[0].value == "") {
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
			var hadBtnli = event.target.containerLi;
			var attachListul = hadBtnli.parentNode;
			attachListul.removeChild(hadBtnli);
		});
		li.appendChild(fileInput);
		li.appendChild(btnDelete);
		attachList.appendChild(li);
		
		var attachList = document.querySelector("#attachlist");
		for (var idx = 0; idx < attachList.childNodes.length; idx++) {
			var fileInput = attachList.childNodes[idx].childNodes[0];
			fileInput.name = "rsv_atc_file[" + idx + "]";
		}
	}

	function admSubmitRsv() {
		return true;
	}
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>