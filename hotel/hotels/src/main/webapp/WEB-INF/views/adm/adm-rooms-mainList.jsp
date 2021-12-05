<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adm-header.jsp"></jsp:include>
	<div class="wrapper">
    <jsp:include page="adm-nav.jsp"></jsp:include>
        <div class="adm_content">
        	<div class="list_wrap">
				<div class="list_top">
	                <div class="btn_top">
	                    <ul class="btn_wrap">
	                        <li>
	                            <a href="/adm/rooms/type-write" class="btn_item" title="타입등록">
	                                <span class="">옵션등록</span>
	                            </a>
	                        </li>
	                    </ul>
	                 </div>
                </div>
	            <h1>룸 목록</h1>
				<div id="myBtnContainer">
				  <button class="btn active" onclick="filterSelection('all')"> 전체</button>
				  <button class="btn" onclick="filterSelection('deluxe')"> 디럭스</button>
				  <button class="btn" onclick="filterSelection('premiumDeluxe')"> 프리미엄 디럭스</button>
				  <button class="btn" onclick="filterSelection('suite')"> 스위트</button>
				</div>
				
				<!-- Portfolio Gallery Grid -->
				<div class="row">
				<c:forEach var="deluxe" items="${deluxeList}" varStatus="status">
				  <div class="column deluxe">
				    <div class="content">
					    <img src="/display?type=rooms&no=1&filename=${deluxe}" style="width:90%">
					    <h4>디럭스</h4>
				    </div>
				  </div>
				</c:forEach>
				
				<c:forEach var="premiumdeluxe" items="${premiumdeluxeList}" varStatus="status">
				  <div class="column premiumDeluxe">
				    <div class="content">
				      <img src="/display?type=rooms&no=2&filename=${premiumdeluxe}" style="width:90%">
				      <h4>프리미엄 디럭스 오션</h4>
				    </div>
				  </div>
				</c:forEach>
				
				<c:forEach var="suite" items="${suiteList}" varStatus="status">
				  <div class="column suite">
				    <div class="content">
				      <img src="/display?type=rooms&no=3&filename=${suite}" style="width:90%">
				      <h4>스위트</h4>
				    </div>
				  </div>
				</c:forEach>
				<!-- END GRID -->
				</div>
        	</div>
            <!-- 예약 목록 끝 -->
          
        </div>
  	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>