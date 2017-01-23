<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Band Form</title>

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
    <% String pag = request.getParameter("page");
        System.out.println(pag);
    %>
    <div class="container">
        <div>
            <ol class="breadcrumb myTransparentBreadcrumb">
                <li><a href="../../index.jsp">Home Page</a></li>
                <li><a href="BandController?page=manageBands">Manage Bands</a></li>
                <% if (pag.equalsIgnoreCase("editband")) { %>
                <li class="active">Edit Band "${band.name}"</li>
                <% } else { %>
                <li class="active">Add New Band</li>
                <% } %>
            </ol>
        </div>
        <form method="POST" action='BandController'>
            <table class='table table-bordered table-hover myTransparent'>
                <tr>
                    <td>Band Name</td>
                    <td><input type="text" name="name" value="<c:out value="${band.name}" />" class="form-control"/></td>
                </tr>

                <tr>
                    <td>Artists</td>
                    <td><input type="textarea" name="artists" value="<c:out value="${band.artists}" />" class="form-control"/></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <% if (pag.equalsIgnoreCase("editband")) { %>
                        <input type="hidden" name="b_id" value="<c:out value="${band.b_id}" />"/>
                        <input type="hidden" name="action" value="edited" />
                        <button type='submit' name="submit" value='submit' class='btn btn-primary'>
                            <i class="fa fa-pencil" aria-hidden="true"></i> Save changes
                        </button>
                        <% } else { %>
                        <input type="hidden" name="action" value="added" />
                        <button type='submit' name="submit" value='submit' class='btn btn-primary'>
                            <i class="fa fa-plus" aria-hidden="true"></i> Add
                        </button>
                        <% } %>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>