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
		test(); 
		 
	});
	
	function test() {
		var a = $("#items1 option:selected").text();
		var b = $("#items2 option:selected").text();
		// alert(a+'와 '+b+'번 선택');
		$("#changeBox").html("<h1>"+a+'와 '+b+'번 선택</h1>')
		$.ajax("selectJson",{
			data : {"d":a,"s":b,},
			success: function(data){
				//alert(JSON.stringify(data));
				msg = '<h3>※&nbsp;&nbsp;&nbsp;단답형은 뜻만 작성&nbsp;&nbsp;&nbsp;※</h3><br><br>'
				
				for(idx in data){
					if(data[idx].e1 != null){	
						msg += data[idx].idx + "번문제 : " + data[idx].q + "<br><br>";
						msg += "<label><input type='radio' checked='checked' name='a" + idx + "' value='1' />&nbsp;&nbsp;① : " + data[idx].e1 + "</label><br>"
						msg += "<label><input type='radio' name='a" + idx + "' value='2' />&nbsp;&nbsp;② : " + data[idx].e2 + "</label><br>"
						msg += "<label><input type='radio' name='a" + idx + "' value='3' />&nbsp;&nbsp;③ : " + data[idx].e3 + "</label><br>"
						msg += "<label><input type='radio' name='a" + idx + "' value='4' />&nbsp;&nbsp;④ : " + data[idx].e4 + "</label><br><br>"
						// msg += "<label>&nbsp;&nbsp; 답 : " + data[idx].a + "</label><br>"
						msg += "<br><br>"
					}
					else{
						msg += data[idx].idx + "번문제 : " + data[idx].q + "<br><br>";
						msg += "<label style='border: 1px solid black;'>작성 : <input type='text' name='a" + idx + "' /></label><br>"
						msg += "<br><br>"
					}
				}
				$("#changeBox").html(msg)
			}
		});
	}
	
</script>
<style type="text/css">
	.child{ padding-left: 30px;}	
</style>
</head>
<body>
	<!--
	<c:set var="referer" value='${header.referer }'/>
	 이전 페이지 : ${referer } <br /> <hr /> -->
	
	<c:if test="${not empty user }">
		${user=='anonymousUser' ? "손":user }님 반갑습니다.!!! <br />
	</c:if>
	<div style="text-align: center; padding-top: 30px;">
		<h1>한자 급수 모이고사</h1>
	</div>
	<br /><hr />
	
	<div class="child">
		<c:if test="${empty sessionScope.hanjaVO }">
			<button id="loginBtn" class="txt2" >로그인하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		</c:if>
		<a href="index" class="txt2">홈페이지</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index2" class="txt2">모의고사</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	<c:if test="${not empty sessionScope.hanjaVO }">
		${sessionScope.hanjaVO.name }(${sessionScope.hanjaVO.nickname})님 반갑습니다.!!! <br />
		<a href="hanjaUpdate">정보 수정</a> <br />
		<a href="changePassword">비번 변경</a> <br />
		<button id="logoutBtn">로그아웃하기</button>
	</c:if>
	<hr />
		<form action="result" method="post">
		<h1 style="text-align: center;">한자 급수 시험</h1> <br />
		<select name="items1" id="items1">
			<option value="1">8급</option>
			<option value="2">7급</option>
			<option value="3">6급</option>
			<option value="4">5급</option>
			<option value="5">준5급</option>
			<option value="6">4급</option>
			<option value="7">준4급</option>
			<option value="8">준3급</option>
		</select> 
		<select name="items2" id="items2">
			<option value="1">74회</option>
			<option value="2">75회</option>
			<option value="3">76회</option>
			<option value="4">85회</option>
		</select>
		
		<input type="button" value="검색" onclick="test()"/>
		<hr />
		
			<div id="changeBox" style="text-align: center;">
				
			</div>
			<input type="submit" value="채점하기">
		</form>
		<!-- 
		
		<c:forEach items="${list }" var="list">
 			<div> <hr />
				<h3>idx : ${list.idx }</h3>
				<h3>몇회 : ${list.s }</h3>
				<h2>문제 : ${list.q }</h2>
				<br />
				<div>
					<section>
						<div id="checkboxlist" style="margin-top: 20px;">
							<div id="enum2">
								<input type="checkbox" id="box1" name="anwser" value="1" class="answer1" />
								<label class="label1" for="box1" style="cursor: pointer;"> &nbsp;
								① : ${list.e1 }
								</label>
							</div>
							<div id="enum2">
								<input type="checkbox" id="box2" name="anwser" value="2" class="answer2" />
								<label class="label2" for="box2" style="cursor: pointer;"> &nbsp;
								② : ${list.e2 }
								</label>
							</div>
							<div id="enum2">
								<input type="checkbox" id="box3" name="anwser" value="3" class="answer3" />
								<label class="label3" for="box3" style="cursor: pointer;"> &nbsp;
								③ : ${list.e3 }
								</label>
							</div>
							<div id="enum2">
								<input type="checkbox" id="box4" name="anwser" value="4" class="answer4" />
								<label class="label4" for="box4" style="cursor: pointer;"> &nbsp;
								④ : ${list.e4 } <br />
								</label>
							</div>
							<div id="enum2">
								<input type="checkbox" id="box4" name="anwser" value="4" class="answer4" />
								<label class="label4" for="box4" style="cursor: pointer;">
								답 : ${list.a } <br />
								</label>
							</div>
						</div>
					</section>
				</div>
			</div>
	</c:forEach>
		 --> 

</body>
</html>