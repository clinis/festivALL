<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Manage Events</title>

    <!-- bootstrap CSS -->
    <link href="<c:url value="/libs/css/bootstrap.css" />" rel="stylesheet" media="screen" />
    <style>
        .myTransparentBreadcrumb {
            background-color: rgba(255,255,255, 0.3);
        }
        .myTransparentBreadcrumb > li + li:before {
            color: rgb(2,2,2);
        }
    </style>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/libs/js/jquery.js" />"></script>
    <!-- bootstrap JavaScript -->
    <script src="<c:url value="/libs/js/bootstrap.js" />"></script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="<c:url value="/libs/fonts/font-awesome-4.6.1/css/font-awesome.min.css" />">
    <!-- Bootstrap Form Helpers -->
    <link href="<c:url value="/libs/css/bootstrap-formhelpers.css" />" rel="stylesheet" media="screen" />
    <script src="<c:url value="/libs/js/bootstrap-formhelpers.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-countries.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-countries.pt_BR.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-datepicker.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-datepicker.pt_BR.js" />"></script>
</head>
<body>
    <%@ include file="../../nav.jsp"%>
    <div class="container">
        <h1 id='page-title'>All Events</h1>
        <a href="EventController?page=addevent"><button class='btn btn-success btn-xs pull-right'>Add Event</button></a>
        <table class="table table-bordered table-striped myTransparent">
            <thead>
            <tr>
                <th>Event Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>City</th>
                <th>Place</th>
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
                    <td><fmt:formatDate pattern="dd MMMMM yyyy" value="${event.date}" /></td>
                    <td><c:out value="${event.city}" /></td>
                    <td><c:out value="${event.place}" /></td>
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${event.registeredon}" /></td>
                    <td>
                        <form method="POST" action="EventController" name="listEdit">
                            <input type="hidden" name="e_id" value="${event.e_id}">
                            <input type="hidden" name="page" value="editEvent" />
                            <button type='submit' name="submit" value='submit' class='btn btn-info btn-xs'>
                                <i class="fa fa-pencil" aria-hidden="true"></i> Edit Event
                            </button>
                        </form>
                        <form method="POST" action="EventController" name="listDelete">
                            <input type="hidden" name="e_id" value="${event.e_id}">
                            <input type="hidden" name="action" value="deleteEvent" />
                            <button type='submit' name="submit" value='submit' class='btn btn-danger btn-xs'>
                                <i class="fa fa-pencil" aria-hidden="true"></i> Delete Event
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>