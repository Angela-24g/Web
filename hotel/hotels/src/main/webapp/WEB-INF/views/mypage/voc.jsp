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
			<span>이용문의</span>
			<h1>
			회원님께서 문의 하신 내역을<br>
			확인하실 수 있습니다.
			</h1>
			<p class="btnInquiry">
				<a href="#layer2" class="btn-example" >1:1문의 하기</a>
			</p>
		</div>
		
		<div class="list">
			<c:forEach var="qna" items="${qnaList}">
			<div class="listHead">
				<p><span class="strong">접수일: ${qna.wdate} </span></p>
				<a href="/mypage/service/${qna.no}"><span class="strong click">문의내용 상세보기</span></a>
			</div>
			<div class="listBody">
				<div class="listBodyLeft">
					<p><span class="strong">${qna.title}</span></p>
				</div>
				<div class="listBodyRight">
					<p></p>
					<p><span id="check">${qna.question}</span></p>
				</div>
			</div>
			</c:forEach>
		</div>
		
		<c:if test="${empty qnaList}">
		<div class="listNone">
			<img src="/images/mypage/noneList.png" alt="noList">
			<p>내역이 없습니다.</p>
 		</div>
 		</c:if>

				
		</div>
	</div>
</section>

<!-- 팝업창 -->
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <h2>1:1문의</h2>
                <form name="form1" action="/mypage/service" method="post">
                <div class="vocContent">
                	<div class="line1">
                		<div class="formImportant">
                		<p>질문유형*</p>
                		<p>필수입력항목*</p>
                		</div>
                		<div class="line1Input">
                			<select id="type2" name="question">
                				<option value="">유형</option>
                				<option value="객실">객실</option>
                				<option value="서비스">서비스</option>
                				<option value="기타">기타</option>
                			</select>
                		</div>
                	</div>
                	<input type="hidden" value="${member.no}"> 
                	<div class="line2">
                		<div class="formImportant2">
                		<p>이름*</p>
                		<p>이메일*</p>
                		</div>
                		<div class="line2Input">
                			<input type="text" value="${member.name}" readonly>
                			<input type="text" value="${member.email}" readonly>
                		</div>
                	</div>
                	
                	<div class="line3">
                		<div class="formImportant3">
                		<p>휴대폰 번호*</p>
                		</div>
                		<div class="line3Input">
                			<input type="text" value="${member.tel}" readonly>
                		</div>
                	</div>
                	
                	<div class="line4">
                		<div class="formImportant3">
                		<p>제목*</p>
                		</div>
                		<div class="line3Input">
                			<input id="title" type="text" name="title" required="required">
                		</div>
                	</div>
                	
                	<div class="line4">
                		<div class="formImportant3">
                		<p>내용*</p>
                		</div>
                		<div class="line3Input">
                			<textarea id="contents" rows="" cols="" name="contents" required="required"></textarea>
                		</div>
                	</div>
                	
                	<div class="line5">
                		<input type="button" onclick="submitInfo()" value="등록">
                	</div>
                </div>
                
                
                </form>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">×</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>

<style>
p,a{margin:auto 0; word-break: break-all; }
.strong{font-weight: bold; color:#9c836a;}
.click{text-decoration:underline;}
.list{width:100%; margin:50px 0;}
.listHead{border-top:2px solid #9c836a;}
.listBody{border-bottom:1px solid #9c836a;}
.listHead, .listBody{height:60px;}
.listHead, .listBody , .listBodyLeft, .listBodyRight{display:flex; justify-content:space-between;}
.listBody{background-color:white; border-top:1px solid #e6e3df;}
.listBodyLeft, .listBodyRight, .listHead{padding:10px;}
.listBodyLeft, .listBodyRight{width:50%;}
</style>


<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->