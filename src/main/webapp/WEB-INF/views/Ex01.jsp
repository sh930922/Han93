<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.css">
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/locales/ko.js"></script>
<script type="text/javascript">
	$(function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			// 처음 보일 모양
			initialView : 'dayGridMonth', 
			// 상단 메뉴바 지정
			headerToolbar: {
		        left: 'prevYear,prev,next,nextYear today',
		        center: 'title',
		        right: 'timeGridDay,timeGridWeek,dayGridMonth listWeek'
		    }
		});
		// 그려라!!!!
		calendar.render();
	});
</script>
<style type="text/css">
#calendar {
	width: 1000px;
	margin: auto;
	padding: 10px;
}
</style>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>