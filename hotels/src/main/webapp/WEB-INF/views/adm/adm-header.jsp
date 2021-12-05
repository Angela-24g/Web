<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  session="false"%>
<%
   HttpSession session= request.getSession(false);
   if(session!=null&& session.getAttribute("name")==null){session=null;}
%>
<jsp:include page="../common/header_inc.jsp"></jsp:include>

<!-- 헤더시작 -->
<header class="header" id="header">
	<h1 class="logo">
		<a href="/adm/index"></a>
	</h1>
<%if(session==null){%>

	<div class="header_member">
		<div class="more">
			<ul class="header_member_up">
				<li><a href="javascript:;" onclick="jsTapChange('adm','member','login')">LOGIN</a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','member','join')">JOIN</a></li>
			</ul>
		</div>
	</div>
<% }else{%>
	<div class="header_member">
		<div class="more">
			<ul class="header_member_up">
				<li><a href="javascript:;" onclick="jsTapChange('adm','member','logout')">LOGOUT</a></li>
				<li><a href="/index">MAIN HOME</a></li>
			</ul>
		</div>
	</div>
<%} %>
</header>
