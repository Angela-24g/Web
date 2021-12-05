<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css?ver=1" />
<c:choose>
<c:when test="${empty index_css}">
<link rel="stylesheet" href="/css/common.css?ver=1" />
</c:when>
<c:otherwise>
<link rel="stylesheet" href="/css/index/${index_css}?ver=2" />
</c:otherwise>
</c:choose>
<c:if test="${not empty css}">
<link rel="stylesheet" href="/css/${css}?ver=1" />
</c:if>
<script src="/js/jquery-3.1.0.min.js"></script>
<script src="https://kit.fontawesome.com/edd220a6d2.js" crossorigin="anonymous"></script>
</head>
<body>