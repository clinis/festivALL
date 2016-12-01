<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>festivALL</title>


    <%@ page import="java.sql.*" %>

    <%@ include file="db-connection.jsp"%>

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
    <h1><center>Listagem de Bandas</center></h1>
    <%
        Statement s = connection.createStatement ();
        s.executeQuery ("SELECT * FROM bands");
        ResultSet rs = s.getResultSet ();
        while (rs.next ()){
            out.println (rs.getString (1) + ", " + rs.getString (3) + " " + rs.getString (4) + ", " +rs.getString (5) + "<br />");
        }
        rs.close ();
        s.close ();
        connection.close ();

        //out.println( request.getServletPath() );
    %>

</body>
</html>
