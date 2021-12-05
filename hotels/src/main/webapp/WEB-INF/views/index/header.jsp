<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<jsp:include page="../common/header_inc.jsp"></jsp:include>
	<!-- 헤더시작 -->
	<header class="header" id="header">
			<h1 class="logo">
				<a href="index.html"></a>
			</h1>
			<nav class="nav">
				<div class="nav_menu">
					<ul class="mainnav">
						<li>
							<a href="javascript:;" onclick="jsTapChange('reservation')">RESERVATION</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('reservation')">
											RESERVATION
										</a>
									</h2>
								</div>
							</div>
						</li>
					</ul>

					<ul class="mainnav">
						<li>
							<a href="javascript:;" onclick="jsTapChange('rooms')">ROOMS</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('rooms','deluxe')">
											DELUXE
										</a>
									</h2>
									<ul>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','city')">디럭스 시티</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','ocean-new')">디럭스 오션</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','deluxe','ot')">디럭스 오션 테라스</a>
										</li>
									</ul>
								</div>
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe')">
											PREMIUN DELUXE
										</a>
									</h2>
									<ul>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe','double-new')">프리미엄 디럭스 오션 더블</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe','tween-new')">프리미엄 디럭스 오션 트윈</a>
										</li>
									</ul>
								</div>
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('rooms','suite')">
											SWEET
										</a>
									</h2>
									<ul>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','suite','city')">스위트 시티</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('rooms','suite','ot')">스위트 오션 테라스</a>
										</li>
									</ul>
								</div>
							</div>
						</li>
					</ul>

					<ul class="mainnav">
						<li>
							<a href="/event">EVENTS</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="/event">
											EVENTS
										</a>
									</h2>
									<ul>
										<li>
											<a href="/event">전체</a>
										</li>
										<li>
											<a href="/event">시즌이벤트</a>
										</li>
										<li>
											<a href="/event">다이닝이벤트</a>
										</li>
									</ul>
								</div>
							</div>
						</li>
					</ul>

					<ul class="mainnav">
						<li>
							<a href="javascript:;" onclick="jsTapChange('lifestyle')">LIFESTYLE</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('lifestyle','spa')">
											spa
										</a>
									</h2>
									<ul>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','spa','씨메르')">씨메르</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','spa','풀')">풀</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','spa','사우나')">사우나</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','spa','피트니스')">피트니스</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','spa','리트리트 스파')">리트리트 스파</a>
										</li>
									</ul>
								</div>
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('lifestyle','kids village')">
											kids village
										</a>
									</h2>
									<ul>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','kids village','BMW 키즈 드라이빙')">BMW 키즈 드라이빙</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','kids village','PLAY LAB')">PLAY LAB</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','kids village','하바 키즈 라운지')">하바 키즈 라운지</a>
										</li>
										<li>
											<a a href="javascript:;" onclick="jsTapChange('lifestyle','kids village','웅진 북클럽')">웅진 북클럽</a>
										</li>
										<li>
											<a href="javascript:;" onclick="jsTapChange('lifestyle','kids village','가족형키즈카페 키즈앤 패밀리')">가족형키즈카페 키즈앤 패밀리</a>
										</li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
					<ul class="mainnav">
						<li>
							<a href="javascript:;" onclick="jsTapChange('restaurants-nyx')">RESTAURANTS</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('restaurants-nyx')">
											NIX
										</a>
									</h2>
								</div>
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('restaurants-nam')">
											nampung
										</a>
									</h2>
								</div>
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('restaurants-sakca')">
											sakae
										</a>
									</h2>
								</div>
							</div>
						</li>
					</ul>
					<ul class="mainnav">
						<li>
							<a href="/notice/faq">CUSTOMER SERVICE</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="/notice/faq">
											FAQ
										</a>
									</h2>
								</div>
								<div>
									<h2>
										<a href="/notice/qna">
											QnA
										</a>
									</h2>
								</div>
								<div>
									<h2>
										<a href="/notice/location">
											MAP
										</a>
									</h2>
								</div>
							</div>

						</li>
					</ul>
					<ul class="mainnav">
						<li>
							<a href="javascript:;" onclick="jsTapChange('about-us')">ABOUT US</a>
							<div class="gnbDepth2">
								<div>
									<h2>
										<a href="javascript:;" onclick="jsTapChange('about-us')">
											ABOUT US
										</a>
									</h2>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			<div class="header_member">
				<div class="more">
					<ul class="header_member_up">
				<c:choose>
				  <c:when test="${no==0 || no==null}">
				    <li><a href="/login">LOGIN</a></li>
					<li><a href="javascript:;" onclick="jsTapChange('member','joinStep1')">JOIN</a></li>
				  </c:when>
				  <c:otherwise>
				    <li><a href="/logout">LOGOUT</a></li>
					<li><a href="javascript:;" onclick="jsTapChange('mypage')">My Page</a></li>
<%--  					<c:if test="${grade==null && grade>=8}">
						 <li><a href="javascript:;" onclick="jsTapChange('adm')">ADMIN</a></li>
					</c:if>  --%>
				  </c:otherwise>
				</c:choose>
					</ul>
				</div>
			</div>
			<div class="bgDepth"></div>
	</header>
	<script src="/js/index/index_header.js"></script>