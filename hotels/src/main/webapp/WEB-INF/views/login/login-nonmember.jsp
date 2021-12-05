<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <% 
      if(request.getAttribute("retry")!=null){
    	  out.println("<script>alert('회원 정보가 일치하지 않습니다.');</script>");
      }
      %>
<jsp:include page="../common/common_header.jsp"></jsp:include>

<section id="container">
	<div class="loginWrap">
		<div class="innerBox">
			<h1><span>로그인</span>델루나호텔 부산에 오신 것을 환영합니다.</h1>
		</div>
		<div class="fullBg">
			<div class="innerBox">
				<div class="reserveLogin clearFixed">

					<div>
						<div class="tapBox">
							<ul>
								<li class=""><a href="/login">회원</a></li>
								 
								<li class="on"><a href="#">비회원 (예약확인)</a></li>
								
							</ul>
						</div>
						
						<div class="tapView" style="display: block;">
						<form id="form2" name="form2" method="post" onsubmit="/loginstranger">
							<div class="loginBox">
								<div class="inp">
									
									<div class="radioBox" style="margin-left:20px;">
                              <input type="radio" id="TOGOBOX" name="INQ_TYPE" value="TOGOBOX" title="TO GO BOX" style="height: 20px;">
                              <label for="TOGOBOX">TO GO BOX</label>
                           </div>
									<div class="radioBox" style="margin-left:20px;">
										<input type="radio" id="DINE" name="INQ_TYPE" value="DINE" title="DINE &amp; DRINK" style="    height: 20px;">
										<label for="DINE">DINE &amp; DRINK</label>
									</div>
								</div>								
								<div class="inp">
									<input type="text" id="USER_NM" name="USER_NM" placeholder="이름" required="">
									<button type="button" class="btnDelete" style="display: none;">삭제</button>
								</div>
								
								<div class="phone clearFixed">
									<div class="ui-select-wrapper"><select id="USER_TEL1" name="USER_TEL1" class="selectBox" title="핸드폰 첫째자리 선택" style="display: none;">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select><div class="selectBox" style="undefined"><a href="#" class="ui-select-trigger">010</a><ul class="ui-select-options" style="display: none;"><li class=""><a href="#" class="ui-select-option" data-value="010">010</a></li><li class=""><a href="#" class="ui-select-option" data-value="011">011</a></li><li class=""><a href="#" class="ui-select-option" data-value="016">016</a></li><li class=""><a href="#" class="ui-select-option" data-value="017">017</a></li><li class=""><a href="#" class="ui-select-option" data-value="018">018</a></li><li class=""><a href="#" class="ui-select-option" data-value="019">019</a></li></ul></div></div>
									<div class="inp">
										<input type="text" id="USER_TEL2" name="USER_TEL2" title="핸드폰 가운데자리 입력" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" required="">
										<button class="btnDelete" style="display: none;">삭제</button>
									</div>
									<div class="inp">
										<input type="text" id="USER_TEL3" name="USER_TEL3" title="핸드폰 끝자리 입력" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" required="">
										<button class="btnDelete" style="display: none;">삭제</button>
									</div>
								</div>
								
								<input type="submit" class="btn btnFull btnLogin disabled" value="예약내역조회"/> 
							</div>
						</form>
						</div>
					</div>

					<div>
						<div class="joinBox">
							<h2>아직 회원이 아니신가요?</h2>
							<p>회원이 되시면 델루나 호텔의 온라인 회원으로서<br>더 큰 혜택과 편리함을 누릴 수 있습니다.</p>
							<button class="btn btnJoin" onclick="location.href='/member/joinStep1'">회원가입</button>
						</div>
					</div>
				</div>
			</div>				
		</div>
		<div class="lastdiv"></div> 
	</div>
</section>

	<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->
<script>
/* function isreal(){


		
		var name = $('#"USER_NM"').val();
		var tel = $('#USER_TEL1').val()+$('#USER_TEL2').val()+$('#USER_TEL3').val();
		var object = {'name':name,'tel':tel}
		id = id.trim();
	
			
		  $.ajax({
				url : "/login",
				type:"POST", 
				data : JSON.stringify(object), 
				contentType : "application/json; charset=utf-8",
				dataType:"json",
				success : function(data) { //data가 외부에서 들어온 값이 됨(여기서는 controller가 되겠지.)괄호 안에는 객체 이름이고 해당 값은 객체.result로 하면 됨!
				
				 	if(data.result=="Y"){
						alert('로그인 되었습니다.');
						location.href = "/index";
					}
					else if(data.result=="F" ){
						alert('일치하는 회원정보가 없습니다. 회원 가입 후 진행해주세요.');
						location.href="/index";
					}
					
						
	            }
			});
	   
			
		
	
} */
</script>