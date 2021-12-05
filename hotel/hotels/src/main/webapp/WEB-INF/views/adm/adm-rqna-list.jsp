<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	 <style>
    	.chk_all_box1{width:10px;}
    	.headline{font-weight:bold;}
    	h2{text-align:center; font-weight:bold;}
    	.delbtn{margin:auto;}
   </style>
    <script>
    	var clck = [];
    	function getCheckboxValue(event)
    	{
    		console.log(event);
    		console.log(event.target.value);
    		if(event.target.checked)
    		{clck.push(event.target.value);}
    		else{
    			clck=clck.filter(v=>v!==event.target.value);} 
    	//	console.log(clck);
    	}
    	function submitHandler(event){
    		const fd = new FormData();
    		fd.append("idlist",clck);
    		event.preventDefault(); //event를 눌렀을 때 submit하면서 reload가 되면서! 이벤트를 막는다.(on submit 시에만!!!!) url에 ?를 막아주는 거다!!(강제로)
    		$.ajax({
    			url : "/adm/adm-rqna-delete"
    	        , type : "post"
    			/* , data : JSON.stringify({idlist:clck}) */
    			, data : fd
    			, processData: false
    			, contentType: false
    			, success : function(result) {
    						console.log(result.data);
    						window.location.reload(true);
    					
    				}
    			, error : function(result){
    				console.log(result);
    				
    			}
    			
    		});
    		
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
			<h2>답변 목록</h2>
			<div></div>
			 	
			 <form onsubmit="return submitHandler(event)" method="post">
			
			<table>
				<thead>
				<tr class="headline">
					<td></td>
					<td>순번</td>
					<td>질문제목</td>
					<td>답변날짜</td>
					<td>답변상태</td>
				</tr>
			</thead><br>
			<tbody>
				
				<c:forEach var="rq" items="${qrlist}" varStatus="status" >
				<tr>
				
				<th scope="col" class="chk_all_box1">
				
                		 <input type="checkbox" id="chk" name="chk" value="${rq.qno}" onclick="getCheckboxValue(event)">	  
						 <input type="hidden" name="qno" value="${rq.qno}">
                     	</th>
					<td>
						
						<c:out value="${count-((count-(count-((pageNum-1)*10+status.index)-1)))+1}"/>
					</td>
					<td><a href="/adm/adm-rqna-rowedit/${rq.qno}"><c:out value="${rq.subject}"/></a></td>
					<td><fmt:formatDate value="${rq.rdate}" pattern="yyyy-MM-dd"/></td>
					<td><c:out value="${rq.qstate}"/></td>
				</tr>
				</c:forEach>
			</tbody>
			<tr>
				<td class="delbtn">
					<input type="submit" value="답변삭제" >
				</td>
				<td>
				<input type="button" onclick="location.href='/adm/adm-qna-list'" value="질문목록" >
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
				<a href="/adm/adm-rqna-list?pageNum=${startPage-10}">◀</a>
			</c:if>		
			
			<!-- 페이지 처리 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${i eq pageNum}">
						<a href="/adm/adm-rqna-list?pageNum=${i}" style="font-weight:bold;">[${i}]</a>
					</c:when>
					<c:otherwise>
					<a href="/adm/adm-rqna-list?pageNum=${i}">[${i}]</a> <!-- 페이지 번호를 나열하고 페ㅇ지 블럭을 따로 보냄(가져가신 듯) -->
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