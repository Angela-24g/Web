<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="adm-header.jsp"></jsp:include>
        <div class="wrapper">
            <jsp:include page="adm-nav.jsp"></jsp:include>
            <div class="adm_content">
                <div class="view_wrap">
                    <h2 class="view_title">${lifestyle.type}</h2>
                    <section class="view_info">
                        <div class="view_info_block">
                            <p><span class="">등록일</span> : <strong>${lifestyle.wdate}</strong></p>
                            <p><span class="">수정일</span> : <strong>${lifestyle.modify_date}</strong></p>
                        </div>
                        <!-- View 버튼 시작 { -->
                        <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/lifestyle/list" class="btn_item" title="목록">
                                        <span class="">목록</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/lifestyle/delete/${lifestyle.no}" class="btn_item" title="삭제" onclick="return confirm('삭제하시겠습니까?')">
                                        <span class="">삭제</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/lifestyle/goUpdate/${lifestyle.no}" class="btn_item" title="수정">
                                        <span class="">수정</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- } View 버튼 끝 -->
                    </section>
                    <!-- View 내용 시작 { -->
                    <section class="view_con">
                        <div class="view_block"><p>서브타입</p>${lifestyle.subtype}</div>
                        <div class="view_block"><p>이름</p>${lifestyle.name}</div>
                        <!-- 가격출력 -->
                        <c:if test="${not empty lifestyle.lifestylePrices}">
                        <div class="view_block"><p>가격</p>
                        	<ul>
                                <c:forEach var="lifestylePrice" items="${lifestyle.lifestylePrices}">
                                    <li>${lifestylePrice.price_type}</p> ${lifestylePrice.price}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        </c:if>
                        <!-- 첨부파일이 있으면 출력 -->
                        <c:if test="${not empty lifestyle.lifestyleImages}">
                            <div class="view_block"><p>첨부</p>
	                        	<ul>
	                        		<c:forEach var="lifestyleImage" items="${lifestyle.lifestyleImages}">
		                        		<li>
		                        			<a target="blank" href="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleImage.name}"><img src="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleImage.name}" width="300px"></a>
		                        		</li>
	                        		</c:forEach>
	                        	</ul>
                        </div>
                        </c:if>
                        <!-- 부가시설 있으면 출력 -->
                        <c:if test="${not empty lifestyle.lifestyleFacilities}">
                            <div class="view_block"><p>세부&부가시설</p>
                        		<ul>
	                                <c:forEach var="lifestyleFacility" items="${lifestyle.lifestyleFacilities}">
		                                <div class="detailInfo">
		                                    <li><p class="subtitle">${lifestyleFacility.lifeFacility_title}</p></li>
		                                    <li>${lifestyleFacility.lifeFacility_info}</li>
		                                    <li>
			                                    <a target="blank" href="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleFacility.lifeFacility_image_name}">
			                                    	<img src="/display?type=lifestyle&no=${lifestyle.no}&filename=${lifestyleFacility.lifeFacility_image_name}" width="200px">
			                                    </a>
			                                </li>
	                                    </div>
	                                </c:forEach>
                           	 	</ul>
                        	</div>
                        </c:if>
                    </section>
                    <!-- } View 내용 끝 -->
                    <!-- View 이전다음글 시작 -->
                    <ul class="view_pn">
                    	<c:choose>
	                    	<c:when test="${lifestyle.no gt 1}">
		                        <li class="btn_prev">
		                            <a href="/adm/lifestyle/view/${lifestyle.no-1}">
			                            <span class="pn_tit">이전글</span>
		                            </a>
		                        </li>
	                        </c:when>
	                        <c:otherwise>
	                        	<li class="btn_prev"><a href="#none"><span class="pn_tit">이전글</span>이 없습니다.</a></li>
	                        </c:otherwise>
                        </c:choose>
                        <c:choose>
	                        <c:when test="${lifestyle.no lt countAll}">
		                        <li class="btn_next">
		                            <a href="/adm/lifestyle/view/${lifestyle.no+1}">
			                            <span class="pn_tit">다음글</span>
		                            </a>
		                        </li>
	                        </c:when>
	                        <c:otherwise>
		                        <li class="btn_next"><a href="#none"><span class="pn_tit">다음글</span>이 없습니다.</a></li>
	                        </c:otherwise>
                        </c:choose>
                    </ul>
                    <!-- View 이전다음글 끝 -->
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>