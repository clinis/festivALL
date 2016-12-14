<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>festivALL</title>

    <!-- bootstrap CSS -->
    <link href="<c:url value="/libs/css/bootstrap.css" />" rel="stylesheet" media="screen" />
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
</head>
<body>
    <%@ include file="nav.jsp"%>

    <div class="container">
        <div class="jumbotron myTransparent">
            <h1>Hello!</h1>
            <p>Welcome to festivALL. Where you can find all your Bands' Concerts.</p>
            <p><a class="btn btn-primary btn-lg" href="login.jsp" role="button">Login</a></p>
        </div>

        <%--<jsp:forward page="/BandController?action=listBands" />--%>
        <a href="BandController?action=listBands">View Bands</a> <br>
        <a href="BandController?action=insert">Add Band</a> <br>
        <a href="BandController?action=manageBands">Manage Bands</a> <br>
        <br>
        <a href="EventController?action=listEvents">View Events</a> <br>
        <a href="EventController?action=insert">Add Event</a> <br>
        <a href="EventController?action=manageEvents">Manage Events</a> <br>
    </div>
</body>
</html>