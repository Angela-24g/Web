<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="adm-header.jsp"></jsp:include>
        <div class="wrapper">
            <jsp:include page="adm-nav.jsp"></jsp:include>
            <div class="adm_content">
                <div class="view_wrap">
                    <h2 class="view_title">${rsvView.title}</h2>
                    <section class="view_info">
                        <div class="view_info_block">
                            <p><span class="">작성일</span> : <strong>${rsvView.rsv_write}</strong></p>
                        </div>
                        <!-- View 버튼 시작 { -->
                        <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/adm-rsv-list" class="btn_item" title="목록">
                                        <span class="">목록</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/adm-rsv-write" class="btn_item" title="글쓰기">
                                        <span class="">글쓰기</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/adm-rsv-write-type/${rsvView.rezAdm_no}" class="btn_item" title="글쓰기">
                                        <span class="">타입추가</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/adm-rsv-update/${rsvView.rezAdm_no}" class="btn_item" title="수정">
                                        <span class="">수정</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- } View 버튼 끝 -->
                    </section>
                    <!-- View 내용 시작 { -->
                    <section class="view_con">
                        <div class="view_block">
	                        <p class="view_tit_block">소제목</p>
	                        <p class="view_con_block">${rsvView.title_s}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">예약가능상품 시작일</p>
	                        <p class="view_con_block">${rsvView.date_start}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">예약가능상품 종료일</p>
	                        <p class="view_con_block">${rsvView.date_end}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">내용</p>
	                        <p class="view_con_block">${rsvView.content}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">혜택</p>
	                        <p class="view_con_block">${rsvView.benefits}</p>
                        </div>
                        <!-- 첨부파일이 있으면 출력 -->
                        <c:if test="${not empty rsvView.rsv_attach}">
                        <div class="view_block">
                        	<p class="view_tit_block">첨부</p>
                            <ul>
                                <c:forEach var="rsv_atc" items="${rsvView.rsv_attach}">
                                    <li>${rsv_atc.name} ${rsv_atc.size}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        </c:if>
                        <!-- 타입이 있으면 출력 -->
                        <c:if test="${not empty rsvViewType}">
                        <div class="view_block">
	                        <p class="view_tit_block">타입 타이틀</p>
	                        <p class="view_con_block">${rsvViewType.title}</p>
                        </div>
						<div class="view_block">
	                        <p class="view_tit_block">타입 혜택</p>
	                        <p class="view_con_block">${rsvViewType.benefit}</p>
	                    </div>
                        </c:if>
                    </section>
                    <!-- } View 내용 끝 -->
                    <!-- View 이전다음글 시작 -->
                    <ul class="view_pn">
                    	<c:if test="${not empty viewPrev}">
	                        <li class="btn_prev">
	                            <a href="/adm/adm-rsv-view/${viewPrev.rezAdm_no}">
		                            <span class="pn_tit">이전글</span>${viewPrev.title}
		                            <span class="pn_date">${viewPrev.rsv_write}</span>
	                            </a>
	                        </li>
                        </c:if>
                        <c:if test="${empty viewPrev}">
                        	<li class="btn_prev"><a href="#none"><span class="pn_tit">이전글</span>이 없습니다.</a></li>
                        </c:if>
                        <c:if test="${not empty viewNext}">
	                        <li class="btn_next">
	                            <a href="/adm/adm-rsv-view/${viewNext.rezAdm_no}">
		                            <span class="pn_tit">다음글</span>${viewNext.title}
		                            <span class="pn_date">${viewNext.rsv_write}</span>
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