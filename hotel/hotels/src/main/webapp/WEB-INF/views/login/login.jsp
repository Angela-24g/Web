<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- 헤더  -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
		request.setCharacterEncoding("UTF-8");
		if(session.getAttribute("f")!=null){
			System.out.println("f");
		  out.println("<script>alert('로그인 후 이용이 가능합니다.');</script>");
		  session.setAttribute("f", null);
		}
		
%> 
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/js/login/login.js"></script>

<section id="container">

	<div class="loginWrap">
		<div class="innerBox">
			<h1><span>로그인</span>델루나 호텔 부산에 오신 것을 환영합니다.</h1>
		</div>
		<div class="fullBg">
			<div class="innerBox">
				<div class="reserveLogin clearFixed">

					<div>
						<div class="tapBox">
							 <ul>
								<li class="on"><a href="#">회원</a></li>
								 
								<li><a href="/loginstranger">비회원 (예약확인)</a></li>
								
							</ul>
					
						</div>
						<div class="tapView" style="display: block;">
						<form id="form1" name="form1" onsubmit="ggg()" method="post">
							<div class="loginBox">
								<div class="inp">
									<input type="text" id="id" name="id"  placeholder="아이디" required="">
									<button class="btnDelete" style="display: none;">삭제</button>
								</div>									
								<div class="inp">
									<input type="password" id="pw" name="pw"  placeholder="비밀번호" required="">
									<button class="btnDelete" style="display: none;">삭제</button>
								</div>
								
								<input type="submit" class="btn btnFull btnLogin disabled" value="로그인"  />
								<div class="loginSave">
									<!-- <div class="checkbox">
										<input type="checkbox" id="loginchk" name="loginchk" onclick="rememberid()"><label for="check">로그인 상태 유지</label>
									</div> -->
									<p class="findPWD"><a href="/member/find">아이디/비밀번호 찾기</a></p>
								</div>
							</div>
						</form>
						</div>
						<div class="tapView"></div>
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

        document.querySelector("#form1").addEventListener('submit', function(e) {
            e.preventDefault();

          //  resetPassword();
        });
 </script>  