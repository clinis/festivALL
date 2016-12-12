<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bands List</title>

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
        <h1 id='page-title'>All Bands</h1>
        <table class="table table-bordered table-striped myTransparent">
            <thead>
                <tr>
                    <th>Band Name</th>
                    <th>Artists</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${bands}" var="band">
                <tr>
                    <td><c:out value="${band.name}" /></td>
                    <td><c:out value="${band.artists}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>