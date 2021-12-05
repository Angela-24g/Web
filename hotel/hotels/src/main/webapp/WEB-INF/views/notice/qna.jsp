<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String nm = request.getParameter("name");
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include> 
	<section id="container">
		<!-- 서브헤더 : 필요시 사용! -->
		<section class="subGnb">
			<div class="innerSubGnb">
				<h1>
					<a href="/notice/faq">Customer Serivce</a>
				</h1>
				<ul>
					<li class="tabcontent"><a href="/notice/faq">FAQ</a></li>
					<li class="tabcontent"><a href="/notice/qna">Q&amp;A</a></li>
					<li class="tabcontent"><a href="/notice/location">MAP</a></li>
					
				</ul>
			</div>
		</section>
<!-- 서브헤더 끝  -->
<!-- 헤더끝  -->
	<div class="inquiryPopCont">
	    <div class="forminnerWrap">

            <form id="form_inquiry" name="form_inquiry" action="/notice/qna" >            
                
                
                <div class="formInquiryWrap">
                
                	<h1 class="contTitle"><span>Q &amp; A</span>1:1문의 창입니다.</h1>
                 	<p>*필수입력항목</p><br><br>
					<dl class="category">
						<dt><label for="Type">질문유형<span class="color">*</span></label></dt>
						<dd class="clearFixed">
							<div class="selectType1">
								 <div class="ui-select-wrapper"><select class="selectBox" id="question" name="question" >
                            <option value="">선택</option>
                            <option value="서비스">서비스</option>
                            <option value="객실">객실</option>
                            <option value="기타">기타</option>
                            
                        </select>
                        </div>
                        </div>
						</dd>
					</dl>
                   
                   
                    <div class="clearFixed">
                        <dl class="name">
                            <dt><label for="PI_CUST_NM">이름</label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="text" id="name" name="name" value="<%= session.getAttribute("name") %>" title="이름" readonly="">
                                </div>
                                
                                <div class="errorText">
                                    <!-- 에러 메시지 -->
                                </div>
                            </dd>
                        </dl>
                        <dl class="pwd">
                            <dt><label for="EMAIL">이메일</label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="email" class="inqEmailValidation" id="email" name="email"  value="${email}" title="이메일" readonly="readonly">
                                </div>
                                <div class="errorText">
                                    <!-- 에러 메시지 -->
                                </div>  
                            </dd>
                        </dl>
                    </div>
                    
                    <dl class="phone full">
                        
                        <dt><label for="TEL1">휴대폰 번호</label></dt>
                        <dd>
                            <div class="inp">
                             <input type="tel" id="TEL1" name="TEL1" value="${tel1}"  title="핸드폰 첫째자리 입력" maxlength="3" readonly="">
                           </div>
                          
                            <div class="inp">
                                <input type="tel" id="TEL2" name="TEL2" value="${tel2}" title="핸드폰 가운데자리 입력" maxlength="4" readonly="">
                            </div>
                            <span>-</span>
                            <div class="inp">
                                <input type="tel" id="TEL3" name="TEL3" value="${tel3}" title="핸드폰 끝자리 입력" maxlength="4" readonly="">
                            </div>
                       
                            <div class="errorText">
                                <!-- 에러 메시지 -->
                            </div>
                        </dd>
                    </dl>
                     <dl class="title">
                        <dt>
                            <label for="TITLE">제목 <span class="color">*</span></label>
                        </dt>
                        <dd>
                            <div class="inp">
                                <input type="text" id="title" name="title" required="" title="제목" maxlength="40">
                                <button type="button" class="btnDelete" style="display: none;">삭제</button>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="CTNT">내용<span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="contents" name="contents" required="" title="내용"></textarea>
                        </dd>
                    </dl>
                </div>
         
            <div class="btnGroup">
                <input type="submit" class="btn btnFull small" onclick="return saveqna()" value="등록">
            </div> </form>
           	<div class="lastdiv"></div>
		</div>
	</div>
      
      
</section>
        
	<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->