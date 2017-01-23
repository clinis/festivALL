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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
        .myTransparentBreadcrumb {
            background-color: rgba(255,255,255, 0.3);
        }
        .myTransparentBreadcrumb > li + li:before {
            color: rgb(2,2,2);
        }
    </style>
    <!-- bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    <!-- Bootstrap Form Helpers -->
    <link href="<c:url value="/libs/css/bootstrap-formhelpers.css" />" rel="stylesheet" media="screen" />
    <script src="<c:url value="/libs/js/bootstrap-formhelpers.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-datepicker.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-datepicker.pt_BR.js" />"></script>
</head>
<body>
    <%@ include file="../../nav.jsp"%>
    <div class="container">
        <h1 id='page-title'>All Events</h1>
        <table class="table table-bordered table-striped myTransparent">
            <thead>
            <tr>
                <th>Event Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>City</th>
                <th>Place</th>
                <th>Bands</th>
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
                    <td>
                        <ul>
                            <c:forEach items="${event.event_bands}" var="band">
                                <li><c:out value="${band.name}" /></li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>