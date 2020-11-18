<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>AccessDenied page</title>
</head>
<body>
	${user }님은 인증되지 않은 사용자입니다. <br />
	<a href="<c:url value="/" />">홈으로</a>
</body>
</html>