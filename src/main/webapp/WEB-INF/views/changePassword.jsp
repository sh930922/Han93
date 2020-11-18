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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:if test="${empty hanjaVO }">
	<c:redirect url="/index"/>
</c:if>
<script type="text/javascript">
	$(function(){
		$("#cancelBtn").click(function(){
			location.href='index';
		});
	});
	
	function formCheck(){
		var value = $("#cpassword").val();
		if(value==null || value.trim().length==0){
			alert('현재 비밀번호는 반드시 입력해야 합니다.');
			$("#cpassword").val("");
			$("#cpassword").focus();
			return false;
		}
		var value = $("#password").val();
		if(value==null || value.trim().length==0){
			alert('새로운 비밀번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var value = $("#password2").val();
		if(value==null || value.trim().length==0){
			alert('새로운 비밀번호 확인은 반드시 입력해야 합니다.');
			$("#password2").val("");
			$("#password2").focus();
			return false;
		}
		// 비번과 비번확인이 일치하는지 검사
		if($("#password").val()!=$("#password2").val()){
			alert('비밀번호가 일치하지 않습니다.');
			$("#password").val("");
			$("#password2").val("");
			$("#password").focus();	
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
</style>

</head>
<body>
	<form action="changePasswordOk" method="post" style="margin-top: 50px;" onsubmit="return formCheck();">
		<div style="width: 80%; padding: 20px; margin: auto;border: 2px solid gray;">
			<div style="text-align: center;font-size: 22pt;margin-bottom: 10px;">
				비밀번호 변경하기
				<%-- 이부분을 반드시 숨겨서 가져가야 한다. --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
			<div class="form-group row">
				<label for="userid" class="col-sm-2 col-form-label"  style="text-align: right;">현재 비밀번호</label> 
				<input type="password"
					name="cpassword" id="cpassword" class="form-control col-sm-3">
				<span id="userid_msg" style="margin-left: 20px;padding-top: 4px;"></span>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label"  style="text-align: right;">새 비밀번호</label> <input type="password"
					name="password" id="password" class="form-control col-sm-3">
				<label for="password2" class="col-sm-2 col-form-label"  style="text-align: right;">새 비밀번호확인</label> <input type="password"
					name="password2" id="password2" class="form-control col-sm-3">
			</div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-primary">비밀번호 변경하기</button>
				<button type="button" class="btn btn-primary" id="cancelBtn">취소하기</button>
			</div>
		</div>
	</form>
</body>
</html>