<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="adm-header.jsp"></jsp:include>
        <div class="wrapper">
            <jsp:include page="adm-nav.jsp"></jsp:include>
            <div class="adm_content">
                <div class="view_wrap">
                    <h2 class="view_title">${rsvView.name}님의 예약상세입니다.</h2>
                    <section class="view_info">
                        <div class="view_info_block">
                            <p><span class="">작성일</span> : <strong>${rsvUpdate.date_write}</strong></p>
                        </div>
                        <!-- Update 버튼 시작 { -->
                        <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/user-rsv-list" class="btn_item" title="목록">
                                        <span class="">목록</span>
                                    </a>
                                </li>
                                <li>
                                    <a onclick="submitRsvUpdate()" class="btn_item" title="적용하기">
                                        <span class="">적용하기</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- } Update 버튼 끝 -->
                    </section>
                    <!-- Update 내용 시작 { -->
                    <section class="view_con">
                    	<form name="rsvUpdate" action="/adm/user-rsv-update" method="post"> 
                    	<input type="hidden" name="no" value="${rsvUpdate.no}"/>
	                        <div class="view_block">
		                        <p>예약상품</p>
		                        <p class="view_con_block">${rsvUpdate.no}</p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">성명</p>
		                        <p class="view_con_block"><input type="text" value="${rsvUpdate.name}" name="name"/></p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">이메일</p>
		                        <p class="view_con_block"><input type="text" value="${rsvUpdate.email}" name="email"/></p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">연락처</p>
		                        <p class="view_con_block"><input type="text" value="${rsvUpdate.tel}" name="tel"/></p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">요청사항</p>
		                        <p class="view_con_block"><textarea type="text" name="add_requests" value="${rsvUpdate.add_requests}" placeholder="${rsvUpdate.add_requests}"></textarea></p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">예약기간</p>
		                        <p class="view_con_block">${rsvUpdate.check_in}~${rsvUpdate.check_out}</p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">룸</p>
	                        	<p class="view_con_block">호</p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">인원 <span class="info_s">총 ${rsvUpdate.count_all}</span></p>
								<p class="view_con_block">성인 : ${rsvUpdate.count_adult} / 아이 : ${rsvUpdate.count_elementary} / 유아 : ${rsvView.count_child} / 영유아 : ${rsvView.count_baby}</p>
	                        </div>
	                        <div class="view_block">
		                        <p class="view_tit_block">결제금액 <span class="info_s">${rsvView.price_result}</span></p>
								<p class="view_con_block">
								상품가 : ${rsvUpdate.price_product}<br/>
								서비스 : ${rsvUpdate.price_service}<br/>
								침구 : ${rsvUpdate.price_bed}<br/>
								옵션 : ${rsvUpdate.price_options}<br/>
								회원할인가 : ${rsvUpdate.price_options}<br/>
								포인트사용 : ${rsvUpdate.price_point}<br/>
								총 : ${rsvUpdate.price_total}<br/>
								<strong class="info_b">최종가 : ${rsvUpdate.price_result}</strong> 
								</p>
	                        </div>
	                    </form>
                    </section>
                    <!-- } Update 내용 끝 -->
                </div>
            </div>
        </div>
<script>
function submitRsvUpdate(){
	document.rsvUpdate.submit();
}
</script>
        <jsp:include page="../common/footer.jsp"></jsp:include>