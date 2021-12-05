<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->

<section id="container">
	<div class="hotelParadiseWrap">
		<div class="innerBox">
			<h1 class="contTitle">
				<span>델루나 회원가입</span>
				회원이 되시면 델루나 호텔의 온라인 회원으로서 <br />더 큰 혜택과 편리함을 누리실 수 있습니다.
			</h1>
			<!-- 스텝박스 시작 -->
			<div class="stepWrap">
				<ul class="clearFixed">
					<li>
						<i class="far fa-check-circle fa-2x"></i>
						<span>약관동의</span>
					</li>
					<li>
						<i class="fas fa-circle fa-2x ing"></i>
						<span>본인인증</span>
					</li>
					<li>
						<i class="far fa-circle fa-2x"></i>
						<span>정보입력</span>
					</li>
					<li class="last_step">
						<i class="far fa-circle fa-2x"></i>
						<span>가입완료</span>
					</li>
				</ul>
			</div>
			<!-- 스텝박스 끝 -->
		</div>
		<!-- 이메일인증 시작 -->
			<form action="/member/joinStep3" onsubmit="return submitEmail()" method="post">
				<input type="hidden" name="marketing" id="marketing"/>
				<div class="fullBg">
				<div class="innerBox formJoinWrap">
					<div class="formJoin">
						<h2>이메일 인증</h2>
						<dl class="email">
							<dt><label for="id">이메일</label></dt>
							<dd>
								<div class="email_in">
									<div class="inp">
										<input type="text" name="email" id="email" placeholder="이메일" onkeydown="checkSpacebar()" maxlength="64"/>
									</div>
									<button onclick="confirmAndSendEmail()" type="button" id="reqCodebtn" class="btn small"><span>인증번호 요청</span></button>
									<div class="errorText">
										<!-- 에러 메시지 -->
									</div>
								</div>
							</dd>
						</dl>
						<dl class="code">
							<dt><label for="pw">인증번호</label></dt>
							<dd>
								<div class="email_in">
									<div class="inp">
										<input type="text" placeholder="인증번호를 입력하세요." name="authenticode" id="authenticode" />
									</div>
									<button onclick="return confirmCode()" type="button" class="btn small"><span>인증확인</span></button>
									<div class="errorText" id="authcode">
										<!-- 에러 메시지 -->
									</div>
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="btnJoin">
					<input type="submit" value="다음" class="btn btnFull"/>
				</div>
			</div>
		</form>
		<!-- 이메일인증 끝 -->
	</div>
</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->

<!-- 뒤로가기 방지 -->
<script>
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	};
</script>

<script>

/* 인증확인 후 submit하기  */
function submitEmail(){
	if(!codeConfirm){
		alert('인증이 필요합니다.');
		return false;
	}
	$('#marketing').val("${marketing}");
	
	return true;
}
</script>