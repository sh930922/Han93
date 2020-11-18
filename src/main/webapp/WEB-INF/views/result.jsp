<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="referer" value='${header.referer }'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/animsition/js/animsition.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/countdowntime/countdowntime.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loginBtn").click(function(){
			location.href='login';
		});
		$("#logoutBtn").click(function(){
			// location.href='logout.jsp';
			// Ajax로 로그아웃 구현하기
			$.ajax("logout",{
				success: function(data){
					window.location.reload();
				}
			});
		});
	 
		 
	});
	
	
	
	
</script>
<style type="text/css">
		div { text-align: center;}
</style>
</head>
<body>

	<c:set var="referer" value='${header.referer }'/>
	이전 페이지 : ${referer } <br /> <hr />
	<c:if test="${not empty user }">
		${user=='anonymousUser' ? "손":user }님 반갑습니다.!!! <br />
	</c:if>
	<c:if test="${empty sessionScope.hanjaVO }">
		<button id="loginBtn" class="txt2">로그인하기</button> <br /><hr />
	</c:if>
	<a href="index" class="txt2">첫번째 화면</a> &nbsp;&nbsp;&nbsp;
	<a href="index2" class="txt2">기출 문제 풀기</a> &nbsp;&nbsp;&nbsp;
	<br /> <br />
	<c:if test="${not empty sessionScope.hanjaVO }">
		${sessionScope.hanjaVO.name }(${sessionScope.hanjaVO.nickname})님 반갑습니다.!!! <br />
		<a href="hanjaUpdate">정보 수정</a> <br />
		<a href="changePassword">비번 변경</a> <br />
		<button id="logoutBtn">로그아웃하기</button>
	</c:if>
	<hr />
	
		<h1 style="text-align: center;">한자 급수 결과</h1> <br />
		
		<hr />
		<div>
			<h1>${D} ${S}  <br /></h1>
			<!-- 
			<c:if test = "${score > 2}">
				<h1 class="score" style="color: red;"> ${listsize} / ${score} <br /></h1>
			</c:if>
			<c:if test = "${score > 2}">
				<h1 class="score" style="color: red;"> ${listsize} / ${score} <br /></h1>
			</c:if>
			 -->
				
			<c:choose>
			    <c:when test="${score >= listsize*0.6}">
			    	<h1 class="score" style="color: green;"> ${listsize} / ${score} <br /></h1>
			    	<h2>합격</h2>
			    	<a href="index2" class="txt3">문제풀기</a>
			    </c:when>
			
			    <c:otherwise>
			    	<h1 class="score" style="color: red;"> ${listsize} / ${score} <br /></h1>
			    	<h2>불합격</h2>
			    	<a href="index2" class="txt3">문제풀기</a>
			    </c:otherwise>
			</c:choose>
		</div>
		
		<!-- 
		<div>
			<a href="index2" class="txt3">다시풀기</a>
		</div>
		 -->
</body>
</html>