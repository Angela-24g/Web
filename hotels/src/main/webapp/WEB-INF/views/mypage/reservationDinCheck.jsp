<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->

<section id="container">

<!-- 서브헤더 : 필요시 사용! -->
	<jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="mypage" name="submenu" />

		<jsp:param value="reservation" name="ssubmenu1" />
		<jsp:param value="point" name="ssubmenu2" />
        <jsp:param value="service" name="ssubmenu3" />
        <jsp:param value="edit" name="ssubmenu4" />
        <jsp:param value="delete" name="ssubmenu5" />

	</jsp:include>
<!-- 서브헤더 끝  -->
	
	<div class="hotelParadiseWrap">
		<div class="innerBox">
	
		<div class="contTitle">
			<span>예약내역</span>
			<h1>
			델루나 호텔 부산에서 예약한 내역을<br>
			확인하실 수 있습니다.
			</h1>
		</div>
		
		<div class="reservation">
			<h2>예약 상세정보</h2>
			<table>
				<tbody>
					<tr class="bg_grey">
						<th colspan="1"><span class="strong">${rt.restaurant_name}</span></th>
						<td colspan="3" class="txt_right">${rt.state }</td>
					</tr>
					<tr>
						<th colspan="1"><span class="bold">방문 희망 일자</span></th>
						<td colspan="3">${rt.date_reserve }</td>
					</tr>
					<tr>
						<th colspan="1"><span class="bold">중식/석식</span></th>
						<td colspan="3">${rt.time_meal }</td>
					</tr>
					<tr>
						<th colspan="1"><span class="bold">예약시간</span></th>
						<td colspan="3">${rt.date_write }</td>
					</tr>
					<tr>
						<th colspan="1"><span class="bold">인원</span></th>
						<td colspan="3">성인 ${rt.count_adult }명/ 어린이 ${rt.count_child }명/ 유아 ${rt.count_baby }명</td>
					</tr>
					<tr>
						<th colspan="1"><span class="bold">추가요청</span></th>
						<td colspan="3">${rt.add_request }</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="memberDetail">
			<h2>예약자 정보</h2> 
			<table>
				<tbody>
					<tr>
						<th colspan="1"><span class="strong">이름</span></th>
						<td colspan="3">${rt.name }</td> 
					</tr>
					<tr>
						<th colspan="1"><span class="strong">휴대폰번호</span></th>
						<td colspan="3">${rt.tel }</td>
					</tr>
					<tr>
						<th colspan="1"><span class="strong">Email</span></th>
						<td colspan="3">${rt.email }</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="ClickBox">
		<c:if test="${rt.state eq '예약대기'}">
			<a href="/mypage/reservationDinCheck/delete/${rt.no}"><div class="box">예약취소</div></a>
		</c:if>
			<a href="/mypage/reservationDin"><div class="box on">목록</div></a>
		</div>
				
		</div>
	</div>
</section>

<style>
.reservation, .memberDetail{width:100%; margin-bottom:50px;} 
.txt_right{text-align: right;}
h2{font-size:20px; font-weight:bold; color:black; padding:20px 10px;}
table{border-top:2px solid #9c836a; border-bottom:2px solid #9c836a; text-align:left;}
.bg_grey{background-color: #9c836a; color:white; font-size:16px;}
th, td{padding:30px 30px; word-break: break-word;}
tr{border-bottom:1px solid #e6e3df;} 
.ClickBox{text-align: center; display: flex; justify-content: center;}
.box{border:2px solid #9c836a; padding: 25px 50px; margin: 10px 15px; width:200px;}
.on{background-color:#9c836a; color:white;}
a.box.on{color:white; font-size:20px;font-weight: bold;}
.on:hover{background-color:#53352c; transition: all .3s ease;}

</style>
<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->