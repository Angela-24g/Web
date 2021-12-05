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
					델루나 리워즈 멤버십 회원이 되신 것을<br/>축하 드립니다.
				</h1>
				<!-- 스텝박스 시작 -->
				<div class="stepWrap">
					<ul class="clearFixed">
						<li>
							<i class="far fa-check-circle fa-2x"></i>
							<span>약관동의</span>
						</li>
						<li>
							<i class="far fa-check-circle fa-2x"></i>
							<span>본인인증</span>
						</li>
						<li>
							<i class="far fa-check-circle fa-2x"></i>
							<span>정보입력</span>
						</li>
						<li class="last_step">
							<i class="fas fa-circle fa-2x ing"></i>
							<span>가입완료</span>
						</li>
					</ul>
				</div>
			<!-- 스텝박스 끝 -->
			</div>
			<div class="fullBg">
				<div class="innerBox formJoinWrap">
					<div class="completeBox">
						<p>
							<strong>${name} 고객님,</strong>
							<br/>
							회원가입에 감사드립니다.
							<br/>
							이제부터 파라디안 리워드 회원만의 다양한 혜택과 서비스를 누릴 수 있습니다.
						</p>
						<p class="memberNum">
							회원번호
							<strong>${no}</strong>
						</p>
						<ul class="dotList">
							<li>파라디안 리워드 실물카드는 회원 본인 요청 시, 델루나호텔 부산 본관 프론트에서 발급 가능합니다.</li>
						</ul>
						<div class="membershipCard type1 animated fadeInUp" data-animation="fadeInUp"></div>
					</div>
				</div>
				<div class="btnJoin">
					<button type="button" class="btn btnFull" onclick="location.href='/index'"><span>확인</span></button>
				</div>
			</div>
		</div>
	</section>

<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->
