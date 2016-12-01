<%@ page import="jdbc.datamodel.Band" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="nav.jsp"%>

<jsp:useBean id="bb" class="jdbc.datamodel.Band" scope="session">
</jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Edit Band</title>

    <!-- bootstrap CSS -->
    <link href="libs/css/bootstrap.css" rel="stylesheet" media="screen" />
    <style>
        .myTransparentBreadcrumb {
            background-color: rgba(255,255,255, 0.3);
        }
        .myTransparentBreadcrumb > li + li:before {
            color: rgb(2,2,2);
        }
    </style>
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
    <script src="libs/js/bootstrap-formhelpers-datepicker.js"></script>
    <script src="libs/js/bootstrap-formhelpers-datepicker.pt_BR.js"></script>
</head>
<body>
<div class="container">
    <div>
        <ol class="breadcrumb myTransparentBreadcrumb">
            <li><a href="index.jsp">Home Page</a></li>
            <li><a href="gest.jsp">Manage Bands</a></li>
            <li class="active">Edit Band ${param.b_id} - ${bb.b_id} </li>
        </ol>
    </div>
    <form id='update-product-form' action='' method='post' border='0' > <!--- enctype="multipart/form-data" > --->
        <table class='table table-bordered table-hover myTransparent'>
            <tr>
                <td>Band Name</td>
                <td><input type='text' name='name' class='form-control' value="<%= bb.getName() %>" required /></td>
            </tr>
            <tr>
                <td>Artists of the Band</td>
                <td><input type='text' name='artists' class='form-control' value="<%= bb.getArtists() %>" required /></td>
            </tr>
            <tr>
                <td>Band Image</td>
                <td><input type="file" name="fileToUpload" id="fileToUpload"/></td>
            </tr>
            <tr>
                <td> <%= bb.getID() %> </td>
                <td>
                    <!-- hidden ID field so that we could identify what record is to be updated -->
                    <input type='hidden' name='b-id' value="<%= bb.getID() %>" />
                    <button type='submit' name="submit" value='save' class='btn btn-primary'>
                        <i class="fa fa-pencil" aria-hidden="true"></i> Save changes
                    </button>
                </td>
            </tr>
        </table>
    </form>
    <%
        if (request.getParameter("submit") != null ) {
            if (request.getParameter("submit").equals("save")) {
                out.println("saving changes");
                bb.updateBand(request);
            }
        }
    %>
</div>
</body>
</html>