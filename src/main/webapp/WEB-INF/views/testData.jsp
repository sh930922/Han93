<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/resources/js/comm.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">

</style>
</head>
<body>
<h1>문제 : ${vo.selectQ } </h1>
<h1>보기1 : ${vo.selectE1 } </h1>
<h1>보기2 : ${vo.selectE2 } </h1>
<h1>보기3 : ${vo.selectE3 } </h1>
<h1>보기4 : ${vo.selectE4 } </h1>
<h1>답 : ${vo.selectA } </h1>

</body>
</html>