<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		// 우편번호 검색 띄우기
		$("#zipcode").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                $("#zipcode").val(data.zonecode);
	                $("#addr1").val(data.roadAddress);
	                $("#addr2").focus();
	            }
	        }).open();
		});
		
		$("#password").focus();
		
	});
	
	function formCheck(){
		var value = $("#password").val();
		if(value==null || value.trim().length==0){
			alert('사용자 비밀번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var value = $("#password2").val();
		if(value==null || value.trim().length==0){
			alert('사용자 비밀번호 확인은 반드시 입력해야 합니다.');
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
		var value = $("#name").val();
		if(value==null || value.trim().length==0){
			alert('사용자 이름은 반드시 입력해야 합니다.');
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		var value = $("#nickname").val();
		if(value==null || value.trim().length==0){
			alert('사용자 별명은 반드시 입력해야 합니다.');
			$("#nickname").val("");
			$("#nickname").focus();
			return false;
		}
		var value = $("#hp").val();
		if(value==null || value.trim().length==0){
			alert('사용자 핸드폰 번호는 반드시 입력해야 합니다.');
			$("#hp").val("");
			$("#hp").focus();
			return false;
		}
		// 전화번호 형식 검증
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		// 검증에 사용할 정규식 변수 regExp에 저장
	    if(value.match(regExp) == null) {
	    	alert('핸드폰 번호 형식이 틀립니다. 000-0000-0000으로 입력하세요!!');
	    	$("#hp").val("");
			$("#hp").focus();
			return false;
		}
		var value = $("#addr2").val();
		if(value==null || value.trim().length==0){
			alert('상세주소는 반드시 입력해야 합니다.');
			$("#addr2").val("");
			$("#addr2").focus();
			return false;
		}
		
		return true;
	}
</script>
<style type="text/css">
</style>

</head>
<body>
	<form action="hanjaUpdateOk" method="post" style="margin-top: 50px;" onsubmit="return formCheck();">
		<div style="width: 80%; padding: 20px; margin: auto;border: 2px solid gray;">
			<div style="text-align: center;font-size: 22pt;margin-bottom: 10px;">
				회원 정보 수정 하기
				<%-- 이부분을 반드시 숨겨서 가져가야 한다. --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="idx" value="${hanjaVO.idx }">
			</div>
			<div class="form-group row">
				<label for="userid" class="col-sm-2 col-form-label"  style="text-align: right;">아이디(Email 형식)</label> 
				<input type="text" value="${hanjaVO.userid }" readonly="readonly"
					name="userid" id="userid" class="form-control col-sm-3" aria-describedby="emailHelp">
				<span id="userid_msg" style="margin-left: 20px;padding-top: 4px;"></span>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label"  style="text-align: right;">비밀번호</label> <input type="password"
					name="password" id="password" class="form-control col-sm-3">
				<label for="password2" class="col-sm-2 col-form-label"  style="text-align: right;">비밀번호확인</label> <input type="password"
					name="password2" id="password2" class="form-control col-sm-3">
			</div>
			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label"  style="text-align: right;">이름</label> 
				<input type="text" name="name" id="name" class="form-control col-sm-3" value="${hanjaVO.name }">
				<label for="nickname" class="col-sm-2 col-form-label"  style="text-align: right;">별명</label> 
				<input type="text" name="nickname" id="nickname" class="form-control col-sm-3"  value="${hanjaVO.nickname }">
			</div>
			<div class="form-group row">
				<label for="hp" class="col-sm-2 col-form-label"  style="text-align: right;">핸드폰번호</label> 
				<input type="text" name="hp" id="hp" class="form-control col-sm-3"  value="${hanjaVO.hp }">
				<label for="birth" class="col-sm-2 col-form-label"  style="text-align: right;">생연월일</label> 
				<input type="text" name="birth" id="birth" class="form-control col-sm-3"  value="${hanjaVO.birth }" readonly="readonly">
			</div>
			<div class="form-group" >
				<label class="col-sm-2 col-form-label"  style="text-align: right;">성별</label>
				<div class="form-check form-check-inline">
					${hanjaVO.gender=='M' ? "남자" : "여자" }					
				</div>
			</div>
			<div class="form-group row">
				<label for="zipcode" class="col-sm-2 col-form-label"  style="text-align: right;">우편번호</label> 
				<input type="text" name="zipcode" id="zipcode" class="form-control col-sm-3" readonly="readonly"  value="${hanjaVO.zipcode }">
			</div>
			<div class="form-group row">
				<label for="addr1"  class="col-sm-2 col-form-label"  style="text-align: right;">주소</label> 
				<input type="text" name="addr1" id="addr1" class="form-control col-sm-8" readonly="readonly"  value="${hanjaVO.addr1 }">
			</div>
			<div class="form-group row">
				<label for="addr2"  class="col-sm-2 col-form-label" style="text-align: right;">상세주소</label> 
				<input type="text" name="addr2" id="addr2" class="form-control col-sm-8"  value="${hanjaVO.addr2 }">
			</div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-primary">회원정보 수정</button>
				<button type="button" class="btn btn-primary" id="cancelBtn">취소하기</button>
			</div>
		</div>
	</form>
</body>
</html>