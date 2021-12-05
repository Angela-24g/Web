<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	if(${check} == 1){
		alert("${no}번의 회원정보가 수정되었습니다.");
	}
	else{
		alert("회원정보 수정에 실패했습니다.");
	}
	location.href = "/adm/adm-member-list";
</script>
</head>
<body>
</body>
</html>