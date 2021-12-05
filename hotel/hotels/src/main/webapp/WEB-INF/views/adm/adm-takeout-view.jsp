<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<c:if test="${empty takeoutAdm}">
			<table border="1">
			<caption>회원정보 수정</caption>
				<tbody>
					<tr> 
						<td  colspan="3"><h1>테이크 아웃 정보</h1></td>
					</tr>
					<tr>
						<th colspan="1">제목</th>
						<td colspan="2"><!--${takeoutAdm.title}--></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2"><!--${takeoutAdm.title}--></td>
					</tr>
					<tr>
						<th>픽업장소</th>
						<td colspan="2"><!--${takeoutAdm.title}--></td>
					</tr>
					<tr>
						<th>제품명 몇 가격</th>
						<td colspan="2">
						<!--${takeoutAdm.title}-->
						<!--${takeoutAdm.price}-->
						</td>
					</tr>
					<tr>
						<th>판매단위</th>
						<td colspan="2"><!--${takeoutAdm.sales_unit}--></td>
					</tr>
					<tr>
						<th>중량/용량</th>
						<td colspan="2"><!--${takeoutAdm.sales_unit}--></td>
					</tr>
					<tr>
						<th>상품설명 이미지</th>
						<td colspan="2">
						첫번째 사진은 썸네일
						c:포이치문 쓰기
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<a href="/adm-takeout-delete" id="bt">삭제하기</a>					
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>
		<c:if test="${not empty takeoutAdm}">
			<div class="listNone">
				<img src="/images/mypage/noneList.png" alt="noList">
				<p>존재하지 않은 정보입니다.<br> 다시 확인해주세요</p>
			</div>
		</c:if>
		
	</div>
</div>

<style>
input{width:30%;}
textarea{width:80%;}
</style>

<jsp:include page="../common/footer.jsp"></jsp:include>