<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Form</title>

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
        <div class="page-header">
            <ol class="breadcrumb myTransparentBreadcrumb">
                <li><a href="../../index.jsp">Home Page</a></li>
                <li><a href="UserController?page=userArea">User Home</a></li>
                <li class="active">${user.name}</li>
            </ol>
            <h1 id='page-title'>Edit your profile</h1>
        </div>
        <form method="POST" action="UserController">
            <table class='table table-bordered table-hover myTransparent'>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<c:out value="${user.name}" />" class="form-control"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<c:out value="${user.email}" />" class="form-control"/></td>
                </tr>
                <tr>
                    <td>Birthdate</td>
                    <td><div class="bfh-datepicker" data-format="y/m/d" data-date<fmt:formatDate pattern="yyyy/MM/dd" value="${user.birthdate}"/> data-name="birthdate"></div></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>
                        <div class="bfh-selectbox" data-name="city" id="city" data-value="<c:out value="${user.city}" />" data-filter="true">
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
                        <input type='hidden' name='u_id' value="<c:out value="${user.u_id}" />" />
                        <input type='hidden' name='action' value="edited" />
                    </td>
                    <td>
                        <button type='submit' name="submit" class='btn btn-primary'><i class="fa fa-pencil" aria-hidden="true"></i> Save changes</button>
                    </td>
                </tr>
            </table>
        </form>
        <h3>Edit your Bands</h3>
        <div class="row myTransparent">
            <div class="col-sm-6">
                <form method="POST" action="UserController" name="frmEditUser" class="form-inline">
                    <select class="form-control" name="userNotBands">
                        <c:forEach items="${userNB}" var="unb">
                            <option value="<c:out value="${unb.b_id}" />"><c:out value="${unb.name}" /></option>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="u_id" value="<c:out value="${user.u_id}" />"/>
                    <input type="hidden" name="action" value="addUserBand" />
                    <button type='submit' name="submit" value='Submit' class='btn btn-success'>
                        <i class="fa fa-plus" aria-hidden="true"></i> Add band to my profile
                    </button>
                </form>
            </div>
            <div class="col-sm-6">
                <c:forEach items="${userB}" var="ub">
                    <form method="POST" action='UserController' name="frmEditUser">
                        <input type="hidden" name="b_id" value="<c:out value="${ub.b_id}" />"/>
                        <c:out value="${ub.name}" />
                        <input type="hidden" name="u_id" value="<c:out value="${user.u_id}" />"/>
                        <input type="hidden" name="action" value="removeUserBand" />
                        <button type='submit' name="submit" value='Submit' class='btn-link'><span class="text-danger"><i class="fa fa-times" aria-hidden="true"></i></span></button>
                    </form>
                </c:forEach>
            </div>
        </div>
        <h3>Edit your Events</h3>
        <div class="row myTransparent">
            <div class="col-sm-6">
                <form method="POST" action="UserController" name="frmEditUser" class="form-inline">
                    <select class="form-control" name="userNotEvents">
                        <c:forEach items="${userNE}" var="une">
                            <option value="<c:out value="${une.e_id}" />"><c:out value="${une.name}" /></option>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="u_id" value="<c:out value="${user.u_id}" />"/>
                    <input type="hidden" name="action" value="addUserEvent" />
                    <button type='submit' name="submit" value='Submit' class='btn btn-success'>
                        <i class="fa fa-plus" aria-hidden="true"></i> Add event to my profile
                    </button>
                </form>
            </div>
            <div class="col-sm-6">
                <c:forEach items="${userE}" var="ue">
                    <form method="POST" action='UserController' name="frmEditUser">
                        <input type="hidden" name="e_id" value="<c:out value="${ue.e_id}" />"/>
                        <c:out value="${ue.name}" />
                        <input type="hidden" name="u_id" value="<c:out value="${user.u_id}" />"/>
                        <input type="hidden" name="action" value="removeUserEvent" />
                        <button type='submit' name="submit" value='Submit' class='btn-link'><span class="text-danger"><i class="fa fa-times" aria-hidden="true"></i></span></button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>