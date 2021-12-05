<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="adm-header.jsp"></jsp:include>
        <div class="wrapper">
            <jsp:include page="adm-nav.jsp"></jsp:include>
            <div class="adm_content">
                <div class="view_wrap">
                    <h2 class="view_title">${rrrView.name}님의 예약상세입니다.</h2>
                    <section class="view_info">
                        <div class="view_info_block">
                            <p>
	                        	<strong>예약현황 : ${rrrView.state}</strong>
	                        	<c:if test="${rrrView.state eq '예약대기'}">
		                        	<a href="/adm/user-rsv-state-update/${rrrView.no}/예약취소" title="예약취소" class="btn_item">예약취소로 변경</a>
		                        	<a href="/adm/user-rsv-state-update/${rrrView.no}/예약완료" title="예약완료" class="btn_item">예약완료로 변경</a>
	                        	</c:if>
	                        	<c:if test="${rrrView.state eq '예약완료'}">
		                        	<a href="/adm/user-rsv-state-update/${rrrView.no}/예약취소" title="예약취소" class="btn_item">예약취소로 변경</a>
		                        	<a href="/adm/user-rsv-state-update/${rrrView.no}/예약대기" title="예약대기" class="btn_item">예약대기로 변경</a>
	                        	</c:if>
	                        </p>
                            <p><span class="">작성일</span> : <strong>${rrrView.date_write}</strong></p>
                        </div>
                        <!-- View 버튼 시작 { -->
                        <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/user-rsv-list" class="btn_item" title="목록">
                                        <span class="">목록</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/adm/user-rsv-update/${rrrView.no}" class="btn_item" title="수정">
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
	                        <p class="view_tit_block">예약상품</p>
	                        <p class="view_con_block">
	                        ${rrrView.rsv_adm_no.title}<br/>
	                        <span>(${rrrView.rsv_adm_no.title_s})</span>
	                        </p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">성명</p>
	                        <p class="view_con_block">${rrrView.name}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">이메일</p>
	                        <p class="view_con_block">${rrrView.email}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">연락처</p>
	                        <p class="view_con_block">${rrrView.tel}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">요청사항</p>
	                        <p class="view_con_block">${rrrView.add_requests}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">예약기간</p>
	                        <p class="view_con_block">${rrrView.check_in}~${rrrView.check_out}</p>
                        </div>
                        <div class="view_block">
                        	<p class="view_tit_block">룸</p>
                        	<p class="view_con_block">${rrrView.rooms_no.room_number}호</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">인원 <span class="info_s">총 ${rrrView.count_all}</span></p>
							<p class="view_con_block">성인 : ${rrrView.count_adult} / 아이 : ${rrrView.count_elementary} / 유아 : ${rrrView.count_child} / 영유아 : ${rrrView.count_baby}</p>
                        </div>
                        <div class="view_block">
	                        <p class="view_tit_block">결제금액 <span class="info_s">${rrrView.price_result}</span></p>
							<p class="view_con_block">
							상품가 : ${rrrView.price_product}<br/>
							서비스 : ${rrrView.price_service}<br/>
							침구 : ${rrrView.price_bed}<br/>
							옵션 : ${rrrView.price_options}<br/>
							회원할인가 : ${rrrView.price_options}<br/>
							포인트사용 : ${rrrView.price_point}<br/>
							총 : ${rrrView.price_total}<br/>
							<strong class="info_b">최종가 : ${rrrView.price_result}</strong> 
							</p>
                        </div>
                    </section>
                    <!-- } View 내용 끝 -->
                    <!-- View 이전다음글 시작 -->
                    <ul class="view_pn">
                    	<c:if test="${not empty viewPrev}">
	                        <li class="btn_prev">
	                            <a href="/adm/user-rsv-view/${viewPrev.no}">
		                            <span class="pn_tit">이전글</span>${rrrView.name}님의 예약상세입니다.
		                            <span class="pn_date">${viewPrev.date_write}</span>
	                            </a>
	                        </li>
                        </c:if>
                        <c:if test="${empty viewPrev}">
                        	<li class="btn_prev"><a href="#none"><span class="pn_tit">이전글</span>이 없습니다.</a></li>
                        </c:if>
                        <c:if test="${not empty viewNext}">
	                        <li class="btn_next">
	                            <a href="/adm/user-rsv-view/${viewNext.no}">
		                            <span class="pn_tit">다음글</span>${rrrView.name}님의 예약상세입니다.
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