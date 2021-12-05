<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!-- 푸터 시작 -->
		<footer class="footer">
			<div class="underline">
				<div class="footer_social">
					<ul>
						<li><a href="javascript:;" onclick="jsTapChange('site-map')">사이트맵</a></li>
						<li><a href="javascript:;" onclick="jsTapChange('notice','location')">오시는길</a></li>
						<li><a href=""><i class="fab fa-instagram"></i></a></li>
						<li><a href="" ><i class="fab fa-youtube"></i></a></li>
						<li class="last"><a href=""><i class="fab fa-facebook-f"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="footer_box">
				<a href="/policy/privacy">개인정보취급방침</a><span>l</span><a href="/policy/agreement">이용약관</a>
				<p>상호 : (주)호텔 / 대표자명 : 가나다 서울시 강남구 역삼동 아무로 99길 11 (서울시 강남구 역삼동 777번지)</p>
				<p>TEL : 02-2050-6000 / 사업자등록번호 : 211-81-61213</p>
				<p>Copyright 2021 Mercure Seoul Ambassador Gangnam Sodowe All Rights Reserved</p>

			</div>

		</footer>
		<!-- 푸터 끝 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/js/common.js?ver=2"></script>
<c:if test="${not empty js}">
	<script type="text/javascript" src="/js/${js}?ver=2"></script>
</c:if>
<!-- slick slider -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>