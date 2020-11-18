<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
</style>

</head>
<body>
	<c:if test="${not empty hanjaVO }">
		<script>
			alert('회원 정보를 성공적으로 수정했습니다.\\n메인화면으로 이동합니다.');
			location.href='index';
		</script>
	</c:if>

	<c:if test="${empty hanjaVO }">
		<script>
			alert('회원 정보 수정에 실패했습니다.\\n비밀번호를 확인해 주세요');
			history.back();
		</script>
	</c:if>
</body>
</html>