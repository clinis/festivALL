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
    <form method="POST" action='BandController' name="frmAddBand">
        <% String action = request.getParameter("action");
            System.out.println(action);
        %>
        <% if (action.equalsIgnoreCase("edit")) {%>
        Band Name : <input type="text" name="name"
                           value="<c:out value="${band.name}" />" readonly="readonly"/> (You Can't Change this)<br />
        <%} else {%>
        Band Name : <input type="text" name="name"
                           value="<c:out value="${band.name}" />" /> <br />
        <%}%>
        Artists : <input
            type="text" name="artists"
            value="<c:out value="${band.artists}" />" /> <br />

        <% if (action.equalsIgnoreCase("edit")) {%>
        Registration : <input
            type="text" name="dob"
            value="<fmt:formatDate pattern="yyyy/MM/dd" value="${band.registeredon}" />" readonly="readonly"/>(You Can't Change this)  <br />
        <%} else {%>
        Registration : <input
            type="text" name="dob"
            value="<fmt:formatDate pattern="yyyy/MM/dd" value="${band.registeredon}" />" />(yyyy/MM/dd)  <br />
        <%}%>
        <input  type="submit" value="Submit" />
    </form>
</body>
</html>