<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="adm-header.jsp"></jsp:include>
        <div class="wrapper">
            <jsp:include page="adm-nav.jsp"></jsp:include>
            <div class="adm_content">
                <div class="view_wrap">
                    <h2 class="view_title">${rtView.name}님의 ${rtView.restaurant_name}예약 상세입니다.</h2>
                    <section class="view_info">
                        <div class="view_info_block">
                            <p><span class="">작성일</span> : <strong>${rtView.date_write}</strong></p>
                        </div>
                        <!-- View 버튼 시작 { -->
                        <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/user-rt-list" class="btn_item" title="목록">
                                        <span class="">목록</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/user-rt-update/${rtView.no}" class="btn_item" title="수정">
                                        <span class="">수정</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/user-rt-delete/${rtView.no}" class="btn_item" title="삭제">
                                        <span class="">삭제</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- } View 버튼 끝 -->
                    </section>
                    <!-- View 내용 시작 { -->
                    <section class="view_con">
                        <div class="view_block">
                        	<p class="view_tit_block">예약상태</p>
                        	<p class="view_con_block">${rtView.state}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">예약일</p>
                        	<p class="view_con_block">${rtView.date_reserve}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">예약시</p>
                        	<p class="view_con_block">${rtView.time_meal}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">총 인원 : ${rtView.count_all}</p>
                        	<p class="view_con_block">성인 : ${rtView.count_adult}, 초등학생 : ${rtView.count_elementary}, 어린이 : ${rtView.count_child}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">연락처</p>
                        	<p class="view_con_block">${rtView.tel}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">이메일</p>
                        	<p class="view_con_block">${rtView.email}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">상세내용</p>
                        	<p class="view_con_block">${rtView.add_request}</p>
                        </div>
                    </section>
                    <!-- } View 내용 끝 -->
                    <!-- View 이전다음글 시작 -->
                    <ul class="view_pn">
                    	<c:if test="${not empty viewPrev}">
	                        <li class="btn_prev">
	                            <a href="/adm/user-rt-view/${viewPrev.no}">
		                            <span class="pn_tit">이전글</span>${viewPrev.name}님의 ${viewPrev.restaurant_name}예약 상세
		                            <span class="pn_date">${viewPrev.date_write}</span>
	                            </a>
	                        </li>
                        </c:if>
                        <c:if test="${empty viewPrev}">
                        	<li class="btn_prev"><a href="#none"><span class="pn_tit">이전글</span>이 없습니다.</a></li>
                        </c:if>
                        <c:if test="${not empty viewNext}">
	                        <li class="btn_next">
	                            <a href="/adm/user-rt-view/${viewNext.no}">
	                            	<span class="pn_tit">다음글</span>${viewNext.name}님의 ${viewNext.restaurant_name}예약 상세
		                            <span class="pn_date">${viewNext.date_write}</span>
	                            </a>
	                        </li>
                        </c:if>
                        <c:if test="${empty viewNext}">
	                        <li class="btn_next"><a href="#none"><span class="pn_tit">다음글</span>이 없습니다.</a></li>
                        </c:if>
                    </ul>
                    <!-- View 이전다음글 끝 -->
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>