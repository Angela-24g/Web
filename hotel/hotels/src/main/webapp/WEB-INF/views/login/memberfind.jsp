<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/js/login/findmember.js"></script>
<script src="/js/login/findid.js"></script>


<section id="container">
	<div class="loginWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			<h1><span>아이디/비밀번호 찾기</span>아이디 혹은 비밀번호를 잊으셨나요?<br>이메일 인증을 통하여 찾으세요.</h1>
		</div>
		<div class="fullBg">
			<div class="innerBox findIDPWD">
				<!-- 아이디 찾기 -->
				<div class="findId">
					<form name="form1" method="post">
					<h2><label for="findID">아이디 찾기</label></h2>
					<div class="inp">
				<input type="text" id="name1" name="name1" placeholder="이름" title="이름">
						<button type="button" class="btnDelete" style="display: none;">삭제</button>
					</div>
					
					<div class="phone">
						
						<div class="inp">
							<!-- <select class="select">
								    <option value="010">010</option>
								    <option value="011">011</option>
								    <option value="016">016</option>
								    <option value="017">017</option>
							</select> -->
						 <input type="text" maxlength="4" id="id_tel1" name="tel"> -->
					<button type="button" class="btnDelete" style="display: none;">삭제</button> 
						</div>
						<div class="inp">
							<input type="text" id="id_tel2" name="tel" maxlength="4" placeholder="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="휴대 전화 가운데 번호">
							<button type="button" class="btnDelete" style="display: none;">삭제</button>
						</div>
						<div class="inp">
							<input type="text" id="id_tel3" name="tel" maxlength="4" placeholder="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="휴대 전화 마지막 번호">
							<button type="button" class="btnDelete" style="display: none;">삭제</button>
						</div>
						
					</div>
					
					<input type="button" onclick="idfind()" class="btn btnFull disabled" value="확인" />
					</form>
				</div>
				<!-- //아이디 찾기 -->
				
				<div class="findPWD">
				 <!--  <form onsubmit="/login" method="get">  --><!-- 얘는 submit할 때 유용한 코드이다 지금은 전혀 도움이 안되는 코드 -->
						<div class="tapView form formEmail" style="display: block;">
							<h3 class="blind">이메일 인증 상세보기</h3>
							<h2><label for="findID">비밀번호 찾기</label></h2>
							<div class="inp">
								<input type="text" id="id" name="id" placeholder="아이디" title="아이디">
								<button type="button" class="btnDelete">삭제</button>
							</div>
							<div class="inp mt">
								<input type="text" id="name" name="name" placeholder="이름" title="이름">
								<button type="button" class="btnDelete">삭제</button>
							</div>
							<div class="email">
								<div class="inp">
									<input type="text" id="email" name="email" placeholder="가입시 입력한 이메일 주소" title="아이디">
									<button type="button" class="btnDelete">삭제</button>
								</div>
							
								<input type="button" onclick="confirmAndSendEmail1()" class="btn small" value="이메일인증"/>
								
							</div>
						</div>
				<!-- 	</form> -->
				</div>
				
			</div>
		</div>
			<div class="lastdiv"></div> 
	</div>
</section>
	<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->
