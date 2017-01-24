<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="rinte.model.User" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Home</title>

    <!-- bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
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
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"> <c:out value="${user.name}"/> </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6  col-md-3 col-lg-3 " align="center">
                                    <img class='img-responsive img-thumbnail' src='libs/img/user.png'/>
                                    <p>
                                    <form method="POST" action="UserController?page=editUser">
                                        <input type='hidden' name='u_id' value="<c:out value="${user.u_id}"/>" />
                                        <input type="submit" name="edit" value="Edit profile" class='btn btn-info btn-sm'/>
                                    </form>
                                </div>
                                <div class="col-xs-10 col-md-9 col-lg-9">
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>Name</td>
                                                <td> <c:out value="${user.name}"/> </td>
                                            </tr>
                                            <tr>
                                                <td>Username</td>
                                                <td> <c:out value="${user.username}"/> </td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td> <c:out value="${user.email}"/> </td>
                                            </tr>
                                            <tr>
                                                <td>Birthdate</td>
                                                <td> <fmt:formatDate pattern="dd MMMMM yyyy" value="${user.birthdate}" /> </td>
                                            </tr>
                                            <tr>
                                                <td>City</td>
                                                <td> <c:out value="${user.city}"/> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <h1>Your Events</h1>
                <div class="card-columns">
                <c:forEach items="${userE}" var="ue">
                    <div class='col-xs-4'>
                        <div class='panel panel-default'>
                            <div class='panel-heading'><c:out value="${ue.name}" /> (<c:out value="${ue.date}" />)</div>
                            <div class='panel-body'>
                                <c:out value="${ue.place}" />
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
            <div class="row">
                <h1>Your Bands</h1>
                <div class="card-columns">
                    <c:forEach items="${userB}" var="ub">
                        <div class='col-xs-4'>
                            <div class='panel panel-default'>
                                <div class='panel-heading'><c:out value="${ub.name}" /> (<c:out value="${ub.timesSeen}" />)</div>
                                <div class='panel-body'>
                                    <c:out value="${ub.artists}" />
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>