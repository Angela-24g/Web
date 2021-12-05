<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<c:if test="${not empty takeoutAdmList}">
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>제목</th>
					<th>장소</th>
					<th>작성일자</th>
					<th>제품명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="takeoutAdm" items="${takeoutAdmList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count}"/></td>
					<td><a href="/adm-member/${takeoutAdm.no}" style="color:green;"><c:out value="${takeoutAdm.title}"/></a></td>
					<td><c:out value="${takeoutAdm.location}"/></td>
					<td><c:out value="${takeoutAdm.date_write}"/></td>
					<td>
					<c:forEach var="product" items="${takeoutAdm.product_names}">
						<c:out value="${product}"/>/
					</c:forEach>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="pager">
		    <ul>
		        <c:if test="${ curPageNum > 5 && !empty kwd && !empty col}">
		            <li><a href="/adm-member-list?page=${ blockStartNum - 1 }&col=${ col }&kwd=${ kwd }">◀</a></li>
		        </c:if>
		        
		        <c:if test="${ curPageNum > 5 }">
		            <li><a href="/adm-member-list?page=${ blockStartNum - 1 }">◀</a></li>
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
		                    <li><a href="/adm-member-list?a=search&page=${ i }&col=${ col }&kwd=${ kwd }">${ i }</a></li>
		                </c:when>
		                <c:otherwise>
		                    <li><a href="/adm-member-list?page=${ i }">${ i }</a></li>
		                </c:otherwise>
		            </c:choose>
		        </c:forEach>
		        
		        <c:if test="${ lastPageNum > blockLastNum && !empty kwd && !empty col}">
		            <li><a href="/adm-member-list?a=search&page=${ blockLastNum + 1 }&col=${ col }&kwd=${ kwd }">▶</a></li>
		        </c:if>
		        
		        <c:if test="${ lastPageNum > blockLastNum }">
		            <li><a href="/adm-member-list?page=${ blockLastNum + 1 }">▶</a></li>
		        </c:if>
		    </ul>
		</div>  

		<div class="searchBox">
			<form action="/adm-member-list">
				<select name="col">
					<option value="title" selected>제목</option>
					<option value="place">장소</option>
					<option value="products">제품명</option>
				</select>
				<input type="text" name="kwd" placeholder="검색하기">
				<input type="submit" id="bt" value="검색">
			</form>
		</div>
		
		</c:if>
		<c:if test="${empty takeoutAdmList}">
			<div class="listNone">
				<img src="/images/mypage/noneList.png" alt="noList">
				<p>등록하신 상품이 없습니다.</p>
				<a href="/adm-takeout-write">작성하기</a>
			</div>
		</c:if>
	</div>
</div>