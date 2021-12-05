<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="adm-header.jsp"></jsp:include>
        <div class="wrapper">
            <jsp:include page="adm-nav.jsp"></jsp:include>
            <div class="adm_content">
                <div class="view_wrap">
                    <h2 class="view_title">${rtUpdate.name}님의 ${rtUpdate.restaurant_name}예약 상세입니다.</h2>
                    <section class="view_info">
                        <div class="view_info_block">
                            <p><span class="">작성일</span> : <strong>${rtUpdate.date_write}</strong></p>
                        </div>
                        <!-- Update 버튼 시작 { -->
                        <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/user-rt-list" class="btn_item" title="목록">
                                        <span class="">목록</span>
                                    </a>
                                </li>
                                <li>
                                    <a onclick="submitRtUpdate()" class="btn_item" title="적용하기">
                                        <span class="">적용하기</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- } Update 버튼 끝 -->
                    </section>
                    <!-- Update 내용 시작 { -->
                    <section class="view_con">
                    	<form name="rtUpdate" action="/adm/user-rt-update" method="post">
                    	<input type="hidden" name="no" value="${rtUpdate.no}"/>
	                        <div class="view_block">
	                        	<p class="view_tit_block">예약상태</p>
	                        	<p class="view_con_block">${rtUpdate.state}</p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">예약일</p>
	                        	<p class="view_con_block">${rtUpdate.date_reserve}</p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">예약시</p>
	                        	<p class="view_con_block">${rtUpdate.time_meal}</p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">총 인원 : ${rtUpdate.count_all}</p>
	                        	<p class="view_con_block">성인 : ${rtUpdate.count_adult}, 초등학생 : ${rtUpdate.count_elementary}, 어린이 : ${rtUpdate.count_child}</p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">연락처</p>
	                        	<p class="view_con_block"><input type="text" value="${rtUpdate.tel}" name="tel"/></p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">이메일</p>
	                        	<p class="view_con_block"><input type="text" value="${rtUpdate.email}" name="email"/></p>
	                        </div>
	                        <div class="view_block">
	                        	<p class="view_tit_block">상세내용</p>
	                        	<p class="view_con_block">
	                        	<textarea type="text" name="add_request" value="${rtUpdate.add_request}" placeholder="${rtUpdate.add_request}"></textarea>
	                        	</p>
	                        </div>
                        </form>
                    </section>
                    <!-- } Update 내용 끝 -->
                </div>
            </div>
        </div>
<script>
function submitRtUpdate(){
	document.rtUpdate.submit();
}
</script>
        <jsp:include page="../common/footer.jsp"></jsp:include>