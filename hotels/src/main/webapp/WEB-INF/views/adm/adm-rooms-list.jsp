<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adm-header.jsp"></jsp:include>
	<div class="wrapper">
    <jsp:include page="adm-nav.jsp"></jsp:include>
        <div class="adm_content">
        	<div class="list_wrap">
	            <form onsubmit="" action="" name="admRsvList" id="admRsvList"
	                enctype="multipart/form-data" method="post">
	                <input type="hidden" name="page" value="1">
	                <!-- 예약 리스트 페이지 정보 시작 { -->
	                <div class="list_top">
	                    <div class="list_total">
	                        <span>Total ${lastPageNum}건</span> ${curPageNum} 페이지
	                    </div>
	                    <div class="btn_top">
	                            <ul class="btn_wrap">
	                                <li>
	                                </li>
	                            </ul>
	                        </div>
	                </div>
	                
	                <!-- 예약 리스트 페이지 정보 끝 -->
	                <!-- 예약 목록 시작 {-->
	                <div class="list_table">
	                    <table>
	                        <caption>객실 목록</caption>
	                        <thead>
	                            <tr>
	                                <th scope="col" class="chk_all_box">
	                                	<input type="checkbox" id="chk_all" class="chk_all">
	                                    <label for="chk_all"><b class="">게시물 전체선택</b></label>
	                                </th>
	                                <th scope="col">번호</th>
	                                <th scope="col">객실번호</th>
	                                <th scope="col">
		                                <select onchange="chageLangSelect(this)" name="type">
		                                	<option ${kwd eq "전체" ? "selected": ""} value="전체">룸타입</option>
		                                	<option ${kwd eq "디럭스" ? "selected": ""} value="디럭스" >디럭스</option>
		                                	<option ${kwd eq "프리미엄 디럭스" ? "selected": ""} value="프리미엄 디럭스">프리미엄 디럭스</option>
		                                	<option ${kwd eq "스위트" ? "selected": ""} value="스위트">스위트</option>
		                                </select>
	                                </th>
	                                <th scope="col">
		                                <select onchange="chageLangSelect(this)" name="room_view">
		                                	<option ${kwd eq "전체" ? "selected": ""} value="전체">전망</option>
		                                	<option ${kwd eq "시티" ? "selected": ""} value="시티">시티</option>
		                                	<option ${kwd eq "오션" ? "selected": ""} value="오션">오션</option>
		                                	<option ${kwd eq "오션 테라스" ? "selected": ""} value="오션 테라스">오션 테라스</option>
		                                </select>
	                                </th>
	                                <th scope="col">
		                                <select onchange="chageLangSelect(this)" name="room_location">
		                                	<option ${kwd eq "전체" ? "selected": ""} value="전체">위치</option>
		                                	<option ${kwd eq "본관" ? "selected": ""} value="본관">본관</option>
		                                	<option ${kwd eq "신관" ? "selected": ""} value="신관">신관</option>
		                                </select>
	                                </th>
	                                <th scope="col">
		                                <select onchange="chageLangSelect(this)" name="room_bedtype">
		                                	<option ${kwd eq "전체" ? "selected": ""} value="전체">베드타입</option>
		                                	<option ${kwd eq "더블" ? "selected": ""} value="더블">더블</option>
		                                	<option	${kwd eq "트윈" ? "selected": ""} value="트윈">트윈</option>
		                                	<option ${kwd eq "온돌" ? "selected": ""} value="온돌">온돌</option>
		                                </select>
	                                </th>
	                                <th scope="col">가격</th>
	                                <th scope="col">
		                                <select onchange="chageLangSelect(this)" name="state">
		                                	<option ${kwd eq "전체" ? "selected": ""} value="전체">예약상태</option>
		                                	<option ${kwd eq "예약대기" ? "selected": ""} value="예약대기">예약대기</option>
		                                	<option ${kwd eq "예약중" ? "selected": ""} value="예약중">예약중</option>
		                                	<option ${kwd eq "예약불가" ? "selected": ""} value="예약불가">예약불가</option>
		                                </select>
	                                </th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach var="room" items="${rooms}" varStatus="status">
	                                <tr class="list_block">
	                                    <td class="chk_box">
		                                    <label for="chk_id_${status.count}"> 
		                                    	<input type="checkbox" name="chk_id[]" value="${status.count}" id="chk_id_${status.count}" class="selec_chk">
		                                    </label>
	                                    </td>
	                                    <td class="list_num">${status.count}</td>
	                                    <td class="list_room_num">${room.room_number}</td>
	                                    <td class="list_room_type">${room.roomDetail.roomType.type}</td>
	                                    <td class="list_view">${room.roomDetail.room_view}</td>
	                                    <td class="list_location">${room.roomDetail.room_location}</td>
	                                    <td class="list_bedtype">${room.roomDetail.room_bedtype}</td>
	                                    <td class="list_room_price">${room.roomDetail.room_price}</td>
	                                    <td class="btn_rez_state"><button type="button">${room.state}</button></td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	            </form>
        	</div>
            <!-- 예약 목록 끝 -->
            
		    <!-- 페이징 시작 -->
			<div class="pager">
			    <ul>
   			        <c:choose>
				        <c:when test="${ curPageNum > 5 && !empty kwd && !empty col}">
				            <li><a href="/adm/rooms/list?page=${ blockStartNum - 1 }&col=${ col }&kwd=${ kwd }">◀</a></li>
				        </c:when>
				        
				        <c:when test="${ curPageNum > 5 }">
				            <li><a href="/adm/rooms/list?page=${ blockStartNum - 1 }">◀</a></li>
				        </c:when>
			        </c:choose>
			        <c:forEach var="i" begin="${blockStartNum}" end="${blockLastNum}">
			            <c:choose>
			                <c:when test="${ i > lastPageNum }">
			                    <li style="color:rgba(0,0,0,0.3);">${ i }</li>
			                </c:when>
			                <c:when test="${ i == curPageNum }">
			                    <li class="selected" style="color:red;">${ i }</li>
			                </c:when>
			                <c:when test="${ !empty kwd and !empty col}">
			                    <li><a href="/adm/rooms/list?a=search&page=${ i }&col=${ col }&kwd=${ kwd }">${ i }</a></li>
			                </c:when>
			                <c:otherwise>
			                    <li><a href="/adm/rooms/list?page=${ i }">${ i }</a></li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			        <c:choose>
				        <c:when test="${ lastPageNum > blockLastNum && !empty kwd && !empty col}">
				            <li><a href="/adm/rooms/list?a=search&page=${ blockLastNum + 1 }&col=${ col }&kwd=${ kwd }">▶</a></li>
				        </c:when>
				        
				        <c:when test="${ lastPageNum > blockLastNum }">
				            <li><a href="/adm/rooms/list?page=${ blockLastNum + 1 }">▶</a></li>
				        </c:when>
			        </c:choose>
			    </ul>
			</div>  
            <!-- 페이징 끝 -->
        </div>
  	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>