<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<c:if test="${not empty member}">
			<table border="1">
			<caption>회원정보 수정</caption>
				<tbody>
					<tr>
						<td  colspan="3"><h1>회원정보</h1></td>
					</tr>
					<tr>
						<th colspan="1">회원번호</th>
						<td colspan="2">${member.no}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2">${member.name}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="2">${member.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2">${member.pw}</td>
					</tr>
					<tr>
						<th>생일날짜</th>
						<td colspan="2">${member.birth}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2">${member.tel}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="2">${member.email}</td>
					</tr>
					<tr>
						<th>이름(영문)</th>
						<td colspan="2">${member.first_name}</td>
					</tr>
					<tr>
						<th>성(영문)</th>
						<td colspan="2">${member.last_name}</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td colspan="2">${member.post}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2">${member.address}</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td colspan="2">${member.detail_address}</td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td colspan="2">${member.jdate}</td>
					</tr>
					<tr>
						<th>회원상태</th>
						<td colspan="2">${member.state}</td>
					</tr>
					<tr>
						<th>회원등급</th>
						<td colspan="2">${member.grade}</td>
					</tr>
					<tr>
						<td colspan="3"><a id="bt" href="/adm/adm-member-update/${member.no}">회원정보 변경하기</a></td>
					</tr> 
				</tbody>
			</table>
		</c:if> 
		<c:if test="${empty member}">
			<div class="listNone">
				<img src="/images/mypage/noneList.png" alt="noList">
				<p>존재하지 않은 회원입니다.<br> 다시 확인해주세요</p>
			</div>
		</c:if>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>