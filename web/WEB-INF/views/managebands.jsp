<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Manage Bands</title>

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
        <h1 id='page-title'>All Bands</h1>
        <a href="BandController?page=addBand"><button class='btn btn-success btn-xs pull-right'>Add Band</button></a>
        <table class="table table-bordered table-striped myTransparent">
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
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${band.registeredon}" /></td>
                    <td>
                        <form method="POST" action="BandController" name="listEdit">
                            <input type="hidden" name="b_id" value="${band.b_id}">
                            <input type="hidden" name="page" value="editBand" />
                            <button type='submit' name="submit" value='submit' class='btn btn-info btn-xs'>
                                <i class="fa fa-pencil" aria-hidden="true"></i> Edit Band
                            </button>
                        </form>

                        <form method="POST" action="BandController" name="listDelete">
                            <input type="hidden" name="b_id" value="${band.b_id}">
                            <input type="hidden" name="action" value="deleteBand" />
                            <button type='submit' name="submit" value='submit' class='btn btn-danger btn-xs'>
                                <i class="fa fa-pencil" aria-hidden="true"></i> Delete Band
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