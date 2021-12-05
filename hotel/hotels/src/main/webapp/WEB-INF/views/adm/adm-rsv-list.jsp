<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="adm-header.jsp"></jsp:include>
    <div class="wrapper">
        <jsp:include page="adm-nav.jsp"></jsp:include>
        <div class="adm_content">
        	<div class="list_wrap">
            <form onsubmit="return admSubmitRsvList()" action="/adm/adm-rsv-list" name="admRsvList" id="admRsvList"
                enctype="multipart/form-data" method="post">
                <input type="hidden" name="page" value="1">
                <!-- 예약 리스트 페이지 정보 시작 { -->
                <div class="list_top">
                    <div class="list_total">
                        <span>Total 00건</span> 0 페이지
                    </div>
                    <div class="btn_top">
                            <ul class="btn_wrap">
                                <li>
                                    <a href="/adm/adm-rsv-write" class="btn_item" title="글쓰기">
                                        <span class="">글쓰기</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                </div>
                
                <!-- } 예약 리스트 페이지 정보 끝 -->
                <!-- 예약 목록 시작 {-->
                <div class="list_table">
                    <table>
                        <caption>예약 목록</caption>
                        <thead>
                            <tr>
                                <th scope="col" class="chk_all_box"><input type="checkbox" id="chk_all" class="chk_all">
                                    <label for="chk_all"><b class="">현재 페이지 게시물 전체선택</b></label>
                                </th>
                                <th scope="col">번호</th>
                                <th scope="col">대표썸네일</th>
                                <th scope="col">제목</th>
                                <th scope="col">시작일</th>
                                <th scope="col">종료일</th>
                                <!-- <th scope="col">조회수</th> -->
                                <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rsv_list" items="${rsvList}" varStatus="status">
                                <tr class="list_block">
                                    <td class="chk_box"><label for="chk_id_${rsv_list.rezAdm_no}"> <input type="checkbox"
                                                name="chk_id[]" value="${rsv_list.rezAdm_no}" id="chk_id_${rsv_list.rezAdm_no}"
                                                class="selec_chk">
                                        </label></td>
                                    <td class="list_num">${rsv_list.rezAdm_no}</td>
                                    <td class="list_thum">대표썸네일</td>
                                    <td class="list_tit"><a href="/adm/adm-rsv-view/${rsv_list.rezAdm_no}">${rsv_list.title}</a></td>
                                    <td class="list_date_start"><a href="/adm/adm-rsv-view/${rsv_list.rezAdm_no}">${rsv_list.date_start}</a></td>
                                    <td class="list_date_end"><a href="/adm/adm-rsv-view/${rsv_list.rezAdm_no}">${rsv_list.date_end}</a></td>
                                    <%-- <td class="list_hit">${rsv_list.views}</td> --%>
                                    <td class="list_date_write">${rsv_list.rsv_write}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- } 예약 목록 끝 -->
                <!-- 페이징 시작 {-->
                <div class="pager">
				    <ul>
				        <c:if test="${ curPageNum > 5 && !empty kwd && !empty col}">
				            <li><a href="/adm/adm-rsv-list?page=${ blockStartNum - 1 }&col=${ col }&kwd=${ kwd }">◀</a></li>
				        </c:if>
				        
				        <c:if test="${ curPageNum > 5 }">
				            <li><a href="/adm/adm-rsv-list?page=${ blockStartNum - 1 }">◀</a></li>
				        </c:if>
				        
				        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
				            <c:choose>
				                <c:when test="${ i > lastPageNum }">
				                    <li style="color:rgba(0,0,0,0.3);">${ i }</li>
				                </c:when>
				                <c:when test="${ i == curPageNum }">
				                    <li class="selected" style="color:red;">${ i }</li>
				                </c:when>
				                <c:when test="${ !empty kwd and !empty col}">
				                    <li><a href="/adm/adm-rsv-list?a=search&page=${ i }&col=${ col }&kwd=${ kwd }">${ i }</a></li>
				                </c:when>
				                <c:otherwise>
				                    <li><a href="/adm/adm-rsv-list?page=${ i }">${ i }</a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				        
				        <c:if test="${ lastPageNum > blockLastNum && !empty kwd && !empty col}">
				            <li><a href="/adm/adm-rsv-list?a=search&page=${ blockLastNum + 1 }&col=${ col }&kwd=${ kwd }">▶</a></li>
				        </c:if>
				        
				        <c:if test="${ lastPageNum > blockLastNum }">
				            <li><a href="/adm/adm-rsv-list?page=${ blockLastNum + 1 }">▶</a></li>
				        </c:if>
				    </ul>
				</div>
                <!-- } 페이징 끝 -->
            </form>
        </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>