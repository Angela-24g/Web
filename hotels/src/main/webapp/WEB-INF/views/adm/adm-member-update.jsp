<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<c:if test="${not empty member}">	
			<form name="form1" action="/adm/adm-member-update/complete" method="post"> 
			<table border="1">
			<caption>회원정보 수정</caption>
				<tbody>
					<tr>
						<td  colspan="3"><h1>회원정보 수정</h1></td> 
					</tr>
					<tr>
						<th colspan="1">회원번호</th>
						<td colspan="2"><input type="text" name="no" value="${member.no}" readonly></td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2"><input type="text" id="name" name="name" value="${member.name}" placeholder="이름">
						<div class="errorText" id="errorName">
									<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="2"><input type="text" id="id" name="id" value="${member.id}" readonly>
						<div class="errorText" id="errorId">
									<!-- 에러 메시지 -->
						</div>
						</td> 
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><input type="password" id="pw" name="pw" value="${member.pw}" placeholder="비밀번호">
						<div class="errorText">
									<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>생일날짜</th>
						<td colspan="2">${member.birth}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2"><input type="text" id="tel" name="tel" value="${member.tel}" placeholder="전화번호">
						<div class="errorText" id="errorTel">
										<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="2"><input type="text" id="email" name="email" value="${member.email}" placeholder="이메일">
						<div class="errorText">
										<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>이름(영문)</th>
						<td colspan="2"><input type="text" id="first_name" name="first_name" value="${member.first_name}" placeholder="이름">
						<div class="errorText" id="errorEng">
										<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>성(영문)</th>
						<td colspan="2"><input type="text" id="last_name" name="last_name" value="${member.last_name}" placeholder="성">
						<div class="errorText" id="errorEng2">
										<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td colspan="2"><input type="text" id="sample4_postcode" name="post" value="${member.post}" placeholder="우편번호" readonly><input id="bt" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width:20%;"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2"><input type="text" id="sample4_roadAddress" name="address" value="${member.address}" placeholder="주소" readonly></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td colspan="2"><input type="text" id="detail_address" name="detail_address" value="${member.detail_address}" placeholder="상세주소">
						<div class="errorText" id="errorAddress">
										<!-- 에러 메시지 -->
						</div>
						</td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td colspan="2">${member.jdate}</td>
					</tr>
					<tr>
						<th>회원상태</th>
						<td colspan="2">
						<select name="state">
						<option value="대기">대기</option>
						<option value="가입">가입</option>
						<option value="탈퇴">탈퇴</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>회원등급</th>
						<td colspan="2"><input type="number" min="1" max="10" name="grade" value="${member.grade}" placeholder="회원등급"></td>
					</tr>
					<tr>
						<td colspan="3"><input id="bt" type="button" onclick="submitInfo()" value="변경하기"></td>
					</tr>
				</tbody>
			</table>
			</form>
		</c:if>
		<c:if test="${empty member}">
			<div class="listNone">
				<img src="/images/mypage/noneList.png" alt="noList">
				<p>존재하지 않은 회원입니다.<br> 다시 확인해주세요</p>
			</div>
		</c:if>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="../common/footer.jsp"></jsp:include>