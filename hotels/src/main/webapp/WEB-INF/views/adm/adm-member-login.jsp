<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/adm/adm.css?ver=2" />

	<section id="container">
	
		<div class="loginWrap">
			<div class="innerBox">
				<h1><span>로그인</span>델루나 호텔 관리자 로그인입니다.</h1>
			</div>
			<div class="fullBg">
				<div class="innerBox">
					<div class="reserveLogin clearFixed">
	
						<div>
							<div class="tapBox">
								 <ul>
									<li class="on"><a href="#">회원</a></li>
								</ul>
						
							</div>
							<div class="tapView" style="display: block;">
							<form id="form1" name="form1" method="post" onsubmit="return adminlogin();">
								<div class="loginBox">
									<div class="inp">
										<input type="text" id="id" name="id" onkeydown="checkSpacebar();" placeholder="아이디">
										<button class="btnDelete" style="display: none;">삭제</button>
									</div>									
									<div class="inp">
										<input type="password" id="pw" name="pw" onkeydown="checkSpacebar();" placeholder="비밀번호">
										<button class="btnDelete" style="display: none;">삭제</button>
									</div>
									
									<input type="submit" class="btn btnFull btnLogin disabled" value="로그인"/>
									<div class="loginSave">
										<p class="findPWD"><a href="/adm/member/find">아이디/비밀번호 찾기</a></p>
									</div>
								</div>
							</form>
							</div>
							<div class="tapView"></div>
						</div>
	
						<div>
							<div class="joinBox">
								<h2>관리자 회원가입</h2>
								<p>회원가입 후 승인을 기다려주세요.</p>
								<button class="btn btnJoin" onclick="location.href='/adm/member/join'">회원가입</button>
							</div>
						</div>
					</div>
				</div>				
			</div>
			<div class="lastdiv"></div> 
		</div>
	</section>

</div>
<jsp:include page="../common/footer.jsp"></jsp:include>