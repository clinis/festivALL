<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add new band</title>
</head>
<body>
    <form method="POST" action='EventController' name="frmAddEvent">
        <% String action = request.getParameter("action");
            System.out.println(action);
        %>

        Event Name : <input type="text" name="name" value="<c:out value="${event.name}" />" /> <br />
        Type : <input type="text" name="type" value="<c:out value="${event.type}" />" /> <br />
        Date : <input type="text" name="date" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${event.date}" />" /> <br />
        City : <input type="text" name="city" value="<c:out value="${event.city}" />" /> <br />
        Local : <input type="text" name="local" value="<c:out value="${event.local}" />" /> <br />

        <% if (action.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="e_id" value="<c:out value="${event.e_id}" />"/>
        <input type="hidden" name="ac" value="edit" />
        <% } else { %>
        <input type="hidden" name="ac" value="add" />
        <% } %>

        <input type="submit" value="Submit" />
    </form>
</body>
</html>