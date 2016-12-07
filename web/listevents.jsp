<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Events List</title>

    <!-- bootstrap CSS -->
    <link href="libs/css/bootstrap.css" rel="stylesheet" media="screen" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="libs/js/jquery.js"></script>
    <!-- bootstrap JavaScript -->
    <script src="libs/js/bootstrap.js"></script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="libs/fonts/font-awesome-4.6.1/css/font-awesome.min.css">
    <!-- Bootstrap Form Helpers -->
    <link href="libs/css/bootstrap-formhelpers.css" rel="stylesheet" media="screen" />
    <script src="libs/js/bootstrap-formhelpers.js"></script>
    <script src="libs/js/bootstrap-formhelpers-countries.js"></script>
    <script src="libs/js/bootstrap-formhelpers-countries.pt_BR.js"></script>
</head>
<body>
    <%@ include file="nav.jsp"%>
    <div class="container">
        <h1 id='page-title'>All Events</h1>
        <table class="table table-bordered table-striped myTransparent">
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
                    <td>
                        <c:choose>
                            <c:when test="${event.type == 0}">
                                <c:out value="Festival" />
                            </c:when>
                            <c:when test="${event.type == 1}">
                                <c:out value="Concert" />
                            </c:when>
                            <c:otherwise>
                                <c:out value="unknown" />
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><fmt:formatDate pattern="dd MMM,yyyy" value="${event.date}" /></td>
                    <td><c:out value="${event.city}" /></td>
                    <td><c:out value="${event.local}" /></td>
                    <td><fmt:formatDate pattern="dd MMM,yyyy" value="${event.registeredon}" /></td>
                    <td>
                        <form method="POST" action="EventController" name="listEdit">
                            <input type="hidden" name="e_id" value="${event.e_id}">
                            <input type="submit" name="action" value="Edit" class='btn btn-info btn-xs'></input>
                        </form>

                        <form method="POST" action="EventController" name="listDelete">
                            <input type="hidden" name="e_id" value="${event.e_id}">
                            <input type="submit" name="action" value="Delete" class='btn btn-danger btn-xs'></input>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
<p><a href="EventController?action=insert">Add Event</a></p>
</body>
</html>