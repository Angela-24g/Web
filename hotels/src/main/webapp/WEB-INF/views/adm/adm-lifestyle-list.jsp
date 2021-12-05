<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adm-header.jsp"></jsp:include>
	<div class="wrapper">
    <jsp:include page="adm-nav.jsp"></jsp:include>
        <div class="adm_content">
        	<div class="list_wrap">
	                <!-- 예약 리스트 페이지 정보 시작 { -->
	                <div class="list_top">
	                    <div class="list_total">
	                        <span>Total 00건</span> 0 페이지
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
	                                <th scope="col">
	                                 <select onchange="chageLangSelect(this)" name="type">
		                                	<option ${kwd eq "전체" ? "selected": ""} value="전체">타입</option>
		                                	<option ${kwd eq "spa" ? "selected": ""} value="spa" >SPA</option>
		                                	<option ${kwd eq "kidsvillage" ? "selected": ""} value="kidsvillage">KIDS VILLAGE</option>
		                                </select>
									</th>
	                                <th scope="col">서브타입</th>
	                                <th scope="col">이름</th>
	                                <th scope="col">요금(성인기준)</th>
	                                <th scope="col">위치</th>
	                                <th scope="col">연락처</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach var="lifestyle" items="${lifestyles}" varStatus="status">
	                                <tr class="list_block">
	                                    <td class="chk_box">
		                                    <label for="chk_id_"> 
		                                    	<input type="checkbox" name="chk_id[]" value="" id="chk_id_" class="selec_chk">
		                                    </label>
	                                    </td>
	                                    <td class="list_num">${lifestyle.no}</td>
	                                    <td class="list_type">${lifestyle.type}</td>
	                                    <td class="list_subtype">${lifestyle.subtype}</td>
	                                    <td class="list_name"><a href="/adm/lifestyle/view/${lifestyle.no}">${lifestyle.name}</a></td>
	                                    <c:choose>
		                                    <c:when test="${lifestyle.lifestylePrices[0].price_type eq '성인'}">
	                                   			<td class="list_price">${lifestyle.lifestylePrices[0].price}</td>
	                                   		</c:when>
		                                    <c:otherwise>
	                                   			<td class="list_price">가격정책에 따라</td>
	                                   		</c:otherwise>
                                   		</c:choose>
	                                    <td class="list_place">${lifestyle.location}</td>
	                                    <td class="list_contact">${lifestyle.contact}</td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- 예약 목록 끝 -->
	                           
				    <!-- 페이징 시작 -->
					<div class="pager">
					    <ul>
		   			        <c:choose>
						        <c:when test="${ curPageNum > 5 && !empty kwd && !empty col}">
						            <li><a href="/adm/lifestyle/list?page=${ blockStartNum - 1 }&col=${ col }&kwd=${ kwd }">◀</a></li>
						        </c:when>
						        
						        <c:when test="${ curPageNum > 5 }">
						            <li><a href="/adm/lifestyle/list?page=${ blockStartNum - 1 }">◀</a></li>
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
					                    <li><a href="/adm/lifestyle/list?a=search&page=${ i }&col=${ col }&kwd=${ kwd }">${ i }</a></li>
					                </c:when>
					                <c:otherwise>
					                    <li><a href="/adm/lifestyle/list?page=${ i }">${ i }</a></li>
					                </c:otherwise>
					            </c:choose>
					        </c:forEach>
					        <c:choose>
						        <c:when test="${ lastPageNum > blockLastNum && !empty kwd && !empty col}">
						            <li><a href="/adm/lifestyle/list?a=search&page=${ blockLastNum + 1 }&col=${ col }&kwd=${ kwd }">▶</a></li>
						        </c:when>
						        
						        <c:when test="${ lastPageNum > blockLastNum }">
						            <li><a href="/adm/lifestyle/list?page=${ blockLastNum + 1 }">▶</a></li>
						        </c:when>
					        </c:choose>
					    </ul>
					</div>  
		            <!-- 페이징 끝 -->
        	</div>
        </div>
  	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>