<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CRUD Example</title>
</head>
<body>
    <%--<jsp:forward page="/BandController?action=listBands" />--%>
    <a href="BandController?action=listBands">View Bands</a> <br>
    <a href="EventController?action=listEvents">View Events</a>
</body>
</html>