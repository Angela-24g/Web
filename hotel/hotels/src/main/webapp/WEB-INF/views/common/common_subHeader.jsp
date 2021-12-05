<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!-- 서브탭 시작 -->

		<section class="subGnb">
			<div class="innerSubGnb">
			
				<h1>
					<a href="/${param.submenu}">${param.submenu}</a>
				</h1>
				<ul>
					<c:if test="${not empty param.ssubmenu1}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu1}">${param.ssubmenu1}</a></li>
					</c:if>
					<c:if test="${not empty param.ssubmenu2}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu2}">${param.ssubmenu2}</a></li>
					</c:if>
					<c:if test="${not empty param.ssubmenu3}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu3}">${param.ssubmenu3}</a></li>
					</c:if>
					<c:if test="${not empty param.ssubmenu4}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu4}">${param.ssubmenu4}</a></li>
					</c:if>
					<c:if test="${not empty param.ssubmenu5}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu5}">${param.ssubmenu5}</a></li>
					</c:if>
					<c:if test="${not empty param.ssubmenu6}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu6}">${param.ssubmenu6}</a></li>
					</c:if>
					<c:if test="${not empty param.ssubmenu7}">
					<li class="tabcontent"><a href="/${param.submenu}/${param.ssubmenu7}">${param.ssubmenu7}</a></li>
					</c:if>
				</ul>
			</div>
		</section>
		<!-- 서브탭 끝 -->