<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Event</title>

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
    <% String action = request.getParameter("action");
        System.out.println(action);
    %>
    <div class="container">
        <div class="page-header">
            <ol class="breadcrumb myTransparentBreadcrumb">
                <li><a href="../../index.jsp">Home Page</a></li>
                <li><a href="UserController?action=userArea">User Home</a></li>
                <li class="active">${sessionScope.currentSessionUser.name}</li>
            </ol>
            <h1 id='page-title'>Edit your profile</h1>
        </div>
        <form method="POST" action="UserController">
            <table class='table table-bordered table-hover myTransparent'>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<c:out value="${sessionScope.currentSessionUser.name}" />" class="form-control"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<c:out value="${sessionScope.currentSessionUser.email}" />" class="form-control"/></td>
                </tr>
                <tr>
                    <td>Birthdate</td>
                    <td><div class="bfh-datepicker" data-format="y/m/d" data-date<fmt:formatDate pattern="yyyy/MM/dd" value="${sessionScope.currentSessionUser.birthdate}"/> data-name="birthdate"></div></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>
                        <div class="bfh-selectbox" data-name="city" id="city" data-value="<c:out value="${sessionScope.currentSessionUser.city}" />" data-filter="true">
                            <div data-value="porto">Porto</div>
                            <div data-value="lisboa">Lisboa</div>
                            <div data-value="braga">Braga</div>
                            <div data-value="esposende">Esposende</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <!-- hidden ID field so that we could identify what record is to be updated -->
                        <input type='hidden' name='u_id' value="<c:out value="${sessionScope.currentSessionUser.u_id}" />" />
                        <input type='hidden' name='action' value="edited" />
                    </td>
                    <td>
                        <button type='submit' name="submit" class='btn btn-primary'><i class="fa fa-pencil" aria-hidden="true"></i> Save changes</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>