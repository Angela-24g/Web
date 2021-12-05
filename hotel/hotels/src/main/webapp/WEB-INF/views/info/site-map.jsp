<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 헤더  -->
		<jsp:include page="../common/common_header.jsp"></jsp:include>
		<!-- 헤더끝  -->

		<input type="hidden" name="progress" id="progress" value="">
		<input type="hidden" name="select_no" id="select_no" value="">
		<!-- 컨텐츠 영역 -->
		<section id="container">

			<div class="hotelParadiseWrap reservationWrap">
				<div class="innerBox">
					<!-- 컨텐츠 머리글 -->
					<h1 class="contTitle"><span>사이트맵</span>호텔델루나에서 전체 메뉴를 <br>보여드립니다.</h1>
					<!-- //컨텐츠 머리글 -->
					<div class="siteMapBox">
						<div>
							<h2>RESERVATION</h2>
							<dl>
								<dt><a href="javascript:;" onclick="jsTapChange('reservation')">RESERVATION</a></dt>
							</dl>
						</div>
						<div>
							<h2>ROOMS</h2>
							<dl>
								<dt><a href=""><span>ROOMS</span>ROOMS</a></dt>
								<dd><a href="javascript:;" onclick="jsTapChange('rooms','deluxe')">DELUXE</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('rooms','premiumdeluxe')">PREMIUN DELUXE</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('rooms','suite')">SUITE</a></dd>
							</dl>
						</div>
						<div>
							<h2>RESTAURANTS</h2>
							<dl>
								<dd><a href="javascript:;" onclick="jsTapChange('restaurants-nyx')">NIX</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('restaurants-nam')">nampung</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('restaurants-sakca')">sakae</a></dd>
							</dl>
						</div>
					</div>
					<div class="siteMapBox">
						<div>
							<h2>SPA</h2>
							<dl>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','spa','cimer')">씨메르</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','spa','pool')">풀</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','spa','sauna')">사우나</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','spa','fitness')">피트니스</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','spa','retreatspa')">리트리트 스파</a></dd>
							</dl>
						</div>
						<div>
							<h2>KIDS VILLAGE</h2>
							<dl>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','kidsvillage','driving')">BMW 키즈 드라이빙</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','kidsvillage','playlab')">PLAY LAB</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','kidsvillage','rounge')">하바 키즈 라운지</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','kidsvillage','book')">웅진 북클럽</a></dd>
								<dd><a href="javascript:;" onclick="jsTapChange('lifestyle','kidsvillage','family')">가족형키즈카페 키즈앤 패밀리</a></dd>
							</dl>
						</div>
						<div>
							<h2>EVENT</h2>
							<dl>
								<dd><a href="event?PAGE_NO0=5" >이벤트</a></dd>
								<dd><a href="/event?PAGE_NO0=4" >시즌이벤트</a></dd>
								<dd><a href="/event?PAGE_NO0=5" >다이닝이벤트</a></dd>
							</dl>
						</div>
					</div>
					<div class="siteMapBox">
						<div>
							<h2>MY PAGE</h2>
							<dl>
								<dd><a href="javascript:alert('회원만 이용 가능합니다.');" onfocus="this.blur()">My Page</a></dd>
							</dl>
						</div>
						<div>
							<h2>ABOUT US</h2>
							<dl>
								<dd><a href="javascript:;" onclick="jsTapChange('about-us')"> ABOUT US </a></dd>
							</dl>
						</div>
						<div>
							<h2>CUSTOMER SERVICE</h2>
							<dl>
								<dd><a href="javascript:;" onclick="jsTapChange('notice','faq')">FAQ</a></dd>
								<dd><a href="javascript:alert('서비스 준비중입니다.');" onfocus="this.blur()">Q&A</a></dd>
							</dl>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		<!-- 컨텐츠 영역 -->
		<!-- 푸터  -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<!-- 푸터 끝  -->
