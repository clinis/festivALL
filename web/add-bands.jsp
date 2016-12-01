<%@ page import="java.sql.*" %>

<%@ include file="db-connection.jsp"%>
<%@ include file="nav.jsp"%>

<jsp:directive.page import="jdbc.datamodel.Band"/>

<jsp:useBean id="b" class="jdbc.datamodel.Band" scope="page">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add Band</title>

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
            <li class="active">Add Band</li>
        </ol>
    </div>
    <form id='create-band-form' method='post' border='0' >
        <table class='table table-hover table-responsive table-bordered myTransparent'>
            <tr>
                <td>Name</td>
                <td><input type='text' name='name' class='form-control' required/></td>
            </tr>
            <tr>
                <td>Artists</td>
                <td><input type='text' name='artists' class='form-control' required/></td>
            </tr>
            <tr>
                <td>Image</td>
                <td><input type="file" name="fileToUpload" id="fileToUpload"/></td>
            </tr>
            <td></td>
            <td>
                <button type='submit' name="submit" value="add" class='btn btn-primary'>
                    <i class='fa fa-plus' aria-hidden='true'></i> Add
                </button>
            </td>
        </table>
    </form>
    <jsp:scriptlet>
        if (request.getParameter("name") != null ) {
            if (request.getParameter("submit").equals("add")) {
                out.println("adding band");
                b.addBand();
            }
        }
    </jsp:scriptlet>
</div>
</body>
</html>