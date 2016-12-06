<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show All Events</title>
</head>
<body>
<table border=1>
    <thead>
    <tr>
        <th>Event Name</th>
        <th>Type</th>
        <th>Date</th>
        <th>City</th>
        <th>Local</th>
        <th>Registered on</th>
        <th colspan=2>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${events}" var="event">
        <tr>
            <td><c:out value="${event.name}" /></td>
            <td><c:out value="${event.type}" /></td>
            <td><fmt:formatDate pattern="dd MMM,yyyy" value="${event.date}" /></td>
            <td><c:out value="${event.city}" /></td>
            <td><c:out value="${event.local}" /></td>
            <td><fmt:formatDate pattern="dd MMM,yyyy" value="${event.registeredon}" /></td>
            <td>
                <form method="POST" action="EventController" name="listEdit">
                    <input type="hidden" name="e_id" value="${event.e_id}">
                    <input type="submit" name="action" value="Edit" class='btn btn-info btn-xs'></input>
                </form>
            </td>
            <td>
                <form method="POST" action="EventController" name="listDelete">
                    <input type="hidden" name="e_id" value="${event.e_id}">
                    <input type="submit" name="action" value="Delete" class='btn btn-danger btn-xs'></input>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="EventController?action=insert">Add Event</a></p>
</body>
</html>