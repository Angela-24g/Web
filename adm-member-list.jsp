<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<c:if test="${not empty memberList}">
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>회원번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count}"/></td>
					<td><c:out value="${member.no}"/></td>
					<td><a href="/adm-member/${member.no}" style="color:green;"><c:out value="${member.name}"/></a></td>
					<td><c:out value="${member.id}"/></td>
					<td><c:out value="${member.email}"/></td>
					<td><c:out value="${member.tel}"/></td>
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
					<option value="id" selected>아이디</option>
					<option value="name">이름</option>
					<option value="tel">전화번호</option>
					<option value="email">이메일</option>
					<option value="birth">생일</option>
					<option value="state">회원상태</option>
				</select>
				<input type="text" name="kwd" placeholder="검색하기">
				<input type="submit" id="bt" value="검색">
			</form>
		</div>
		
		</c:if>
		<c:if test="${empty memberList}">
			<div class="listNone">
				<img src="/images/mypage/noneList.png" alt="noList">
				<p>회원이 존재하지 않습니다.</p>
			</div>
		</c:if>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>