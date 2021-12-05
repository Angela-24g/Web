<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	 <style>
    	.chk_all_box1{width:10px;}
    	.headline{font-weight:bold;}
    	h2{text-align:center; font-weight:bold;}
	}
   </style>
   <script>
    	var clck = [];
    	function getCheckboxValue(event)
    	{
    		$('#chk').attr("readonly",false);
    		console.log(event);
    		console.log(event.target.value);
    		
    		if(event.target.checked)
    		{clck.push(event.target.value);}
    		else{
    			clck=clck.filter(v=>v!==event.target.value);} 
    	}
    	function submitHandler(event){
    		
    		const fd = new FormData();
    		fd.append("idlist",clck);
    	
    		event.preventDefault(); //event를 눌렀을 때 submit하면서 reload가 되면서! 이벤트를 막는다.(on submit 시에만!!!!) url에 ?를 막아주는 거다!!(강제로)
    		if(clck=="")
    		{
				alert("질문을 선택해주십시오");
    			$('#chk').attr("readonly",false);	    			
			}
		
		else{	
	   		$.ajax({
	    			
	    			url : "/adm/adm-qna-delete"
	    			, type : "post"
	    			// , data : JSON.stringify({idlist:clck}) 
	    			, data : fd
	    			, processData: false
	    			, contentType: false
	    			, success : function(result) {
	    						console.log(result.data);
	    						window.location.reload(true);	
	    						alert("삭제되었습니다.");
	    				}
	    			, error : function(result){
	    				console.log(result);		
	    			}	
	    		});
    	 	 }
    	}
    	function bHandler(event){
    		var rdata=0;			
  		if(clck=="")
	    		{
    				alert("질문을 선택해주십시오");
	    			$('#chk').attr("readonly",false);	    			
    			}
    		
    		else{
	    			
	    		if(clck.length>1)	
	    			{
	    				alert("하나만 선택하십시오");
	    				 $("input[type=checkbox]").prop("checked", false);
	    				 clck.length=0;
	    			}
	    		else{ 
			    		//버튼의 상태를 가져오기(답변관련상태)
			 			$.ajax({
			    			url:"/adm/adm-qna-state",
			    			type:"post",
			    			data: JSON.stringify({'clck':clck}),
			    			contentType:"application/json; charset=utf-8",
			    			dataType:"json"
			    			,success:function(result){
			    				
			    			if(result.rno==-1){
			    					location.href="/adm/adm-rqna-write/"+result.bno; 
			    					
			    				}
			    				else{//답변완료다 
			    					location.href="/adm/adm-rqna-edit/"+result.bno;	 
			    				
			    				}
		       				}
		    			}); 
	    			}
    			}	
    	   }
    	
    	function selectAll(event)  {
    		  const checkboxes 
    		       = document.getElementsByName('chk');
    		  
    		  checkboxes.forEach((checkbox) => {
    		    checkbox.checked = selectAll.checked;
    		  })
    		 
      		clck.push(selectAll.target.value);
      		console.log(clck);
    		}
    </script>
	<div class="adm_content">
	<div class="list_table">
			<div class="list_total">
						<span style="color:white;">Total ${count}건</span> 
					</div>
			<h2>질문 목록</h2>
			<div></div>
			 	
				 <form onsubmit="return submitHandler(event)" method="post" >
			
			<table>
				<thead>
				
				<tr class="headline">
					<td></td>
					<td>번호</td>
					<td>이름</td>
					<td>질문 유형</td>
					<td>제목</td>
					<td>날짜</td>
					<td>답변상태</td>
				</tr>
			</thead><br>
			<tbody>
				
				<c:forEach var="qna" items="${qlist}" varStatus="status">
				<tr>
				
				<th scope="col" class="chk_all_box1">
                		 <input type="checkbox" id="chk" name="chk" value="${qna.no}" onclick="getCheckboxValue(event)" readonly>	  
						 <input type="hidden" name="qno" id="qno" value="${qna.no}">
						 <input type="hidden" name="qsts" id="qsts" value="${qna.qsts}">
               </th>
    			<td>${count-((count-(count-((pageNum-1)*10+status.index)-1)))+1}</td>
						<td>${qna.writer.name}</td>
						<td>${qna.question}</td>
						<td>
						<c:choose>
							<c:when test="${qna.qsts eq '답변대기'}">	
								<a href="/adm/adm-rqna-write/${qna.no}">${qna.title}</a>
								
							</c:when>
							<c:otherwise>
									<a href="/adm/adm-rqna-edit/${qna.no}">${qna.title}</a>
									<input type="hidden" name="no" id="no" value="${qna.no}">
							</c:otherwise>
						</c:choose>
						</td>
						<td>${qna.wdate}</td>
						<td>${qna.qsts}</td>
				</tr>
				</c:forEach>
			</tbody>
		<tr>
				<td class="delbtn"><input type="submit" id="del" value="질문삭제" ></td>
			
				<td class="savebtn"><input type="button" value="답변등록" onclick="bHandler(event)">

				
				
				</td>
	   </tr>
		</table>
		</form>  	
	<table width="80%"> 
	<tr>
		<td align="center">
			<!-- 에러 방지 -->
			<c:if test="${endPage>pageCount}">
				<c:set var = "endPage" value="${pageCount}" />
			</c:if>
			
			<!-- 이전 블럭 가기 -->
			<c:if test="${startPage>10}">
				<a href="/adm/adm-qna-list?pageNum=${startPage-10}">◀</a>
			</c:if>		
			
			<!-- 페이지 처리 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${i eq pageNum}">
						<a href="/adm/adm-qna-list?pageNum=${i}" style="font-weight:bold;">[${i}]</a>
					</c:when>
					<c:otherwise>
					<a href="/adm/adm-qna-list?pageNum=${i}">[${i}]</a> <!-- 페이지 번호를 나열하고 페ㅇ지 블럭을 따로 보냄(가져가신 듯) -->
					</c:otherwise>
				</c:choose>
			</c:forEach>	
		
			<!-- 다음 블럭-->
			<c:if test="${endPage<pageCount}">
				<a href="/adm/adm-qna-list?pageNum=${startPage+10}">▶</a>
		 	</c:if> 
		</td>
	</tr>
</table>
	</div>
</div>
</div>
   

<jsp:include page="../common/footer.jsp"></jsp:include>