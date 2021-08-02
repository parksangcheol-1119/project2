<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/Project02_1/WebContent/fullcalendar-5.7.2/lib/main.css' rel='stylesheet' />
<script src='/Project02_1/WebContent/fullcalendar-5.7.2/lib/main.js'></script>
	
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

</script>
</head>
<body>

<div id='calendar'></div>
	
</body>
</html>