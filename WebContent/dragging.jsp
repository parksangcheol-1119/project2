<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='/Project02_1/WebContent/fullcalendar-5.7.2/lib/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='/Project02_1/WebContent/calendar/calendar.css' rel='stylesheet' />
<script src='/Project02_1/WebContent/calendar/calendar.js'></script>
</head>
<body>
<div id="external-events">
    <p>
      <strong>Draggable Events</strong>
    </p>
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div>
<div id='calendar'></div>
</body>
</html>