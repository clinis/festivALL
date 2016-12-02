<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show All Bands</title>
</head>
<body>
<table border=1>
    <thead>
    <tr>
        <th>Band Name</th>
        <th>Artists</th>
        <th>Registration Date</th>
        <th colspan=2>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${bands}" var="band">
        <tr>
            <td><c:out value="${band.name}" /></td>
            <td><c:out value="${band.artists}" /></td>
            <td><fmt:formatDate pattern="dd MMM,yyyy" value="${band.registeredon}" /></td>
            <%--<td><a href="BandController?action=edit&bandID=<c:out value="${band.bid}"/>">Update</a></td>
            <td><a href="BandController?action=delete&bandID=<c:out value="${band.bid}"/>">Delete</a></td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="BandController?action=insert">Add Band</a></p>
</body>
</html>