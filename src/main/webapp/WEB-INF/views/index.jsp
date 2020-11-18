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
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.css">
<script	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.js"></script>
<script src="https://lorem-1c6b.kxcdn.com/js/moment.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/locales/ko.js"></script>
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
	
	var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
		// 초기뷰
		initialView : 'dayGridMonth',
		// 타임존 지정
		timeZone : 'local',
		// 로게일지정
		locale : 'ko',
		// 툴바 설정
		headerToolbar : {
			left : 'prevYear,prev,next,nextYear today',
			center : 'title',
			right : 'timeGridDay,timeGridWeek,dayGridMonth,listWeek'
		},
		views: {
		    month: {
		      columnFormat: 'dddd'
		    },
		    agendaWeek: {
		      columnFormat: 'M/D ddd',
		      titleFormat: 'YYYY년 M월 D일',
		      eventLimit: false
		    },
		    agendaDay: {
		      columnFormat: 'dddd',
		      eventLimit: false
		    },
		    listWeek: {
		      columnFormat: ''
		    }
		  },
		// 이벤트
		events : [ {
			title : '하루종일',
			start : '2020-08-01'
		}, {
			title : '기간이벤트',
			start : '2020-08-07',
			end : '2020-08-10'
		}, {
			groupId : 999,
			title : 'Repeating Event',
			start : '2020-08-09T16:00:00'
		}, {
			groupId : 999,
			title : 'Repeating Event',
			start : '2020-08-16T16:00:00'
		}, {
			title : 'Conference',
			start : '2020-08-11',
			end : '2020-08-13'
		}, {
			title : 'Meeting',
			start : '2020-08-12T10:30:00',
			end : '2020-08-12T12:30:00'
		}, {
			title : 'Lunch',
			start : '2020-08-12T12:00:00'
		}, {
			title : 'Meeting',
			start : '2020-08-12T14:30:00'
		}, {
			title : 'Happy Hour',
			start : '2020-08-12T17:30:00'
		}, {
			title : 'Dinner',
			start : '2020-08-12T20:00:00'
		}, {
			title : 'Birthday Party',
			start : '2020-08-13T07:00:00'
		}, {
			title : '구글이동',
			url : 'http://google.com/',
			start : '2020-08-28'
		} ]
	});
	// 달력 그리기
	calendar.render();

});
</script>
<style type="text/css">
	 #calendar {
	width: 80%;
	height: 30%;
	padding-left: 300px;
	
	}
	.child{ padding-left: 30px;}
	
</style>
</head>

<body>
	<c:set var="referer" value='${header.referer }'/>
	<!--  이전 페이지 : ${referer } <br /> -->
	<div style="text-align: center; padding-top: 30px;">
		<h1>한자 급수 모이고사</h1>
	</div>
	<c:if test="${not empty user }">
		${user=='anonymousUser' ? "손":user }님 반갑습니다.!!! <br />
	</c:if>
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
	
	<div id='calendar'></div>

</body>
</html>