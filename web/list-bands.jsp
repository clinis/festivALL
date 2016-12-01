<%@ page import="java.sql.*" %>

<%@ include file="db-connection.jsp"%>
<%@ include file="nav.jsp"%>
<%
    Statement s = connection.createStatement ();
    s.executeQuery ("SELECT * FROM bands");
    ResultSet rs = s.getResultSet ();
%>

<!DOCTYPE html>
<html lang="en">
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
    <div class="container">
      <h1 id='page-title'>All Bands</h1>
      <table class="table table-bordered table-striped myTransparent">
        <thead>
          <tr>
            <th>Index</th>
            <th>Nome</th>
            <th>Img</th>
            <th>Artistas</th>
            <th>isDeleted</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <% while (rs.next ()){ %>
            <td> <% out.println(rs.getString(1));%> </td>
            <td> <% out.println(rs.getString(2));%> </td>
            <td> <% out.println(rs.getString(3));%> </td>
            <td> <% out.println(rs.getString(4));%> </td>
            <td> <% out.println(rs.getString(5));%> </td>
          </tr>
        <% } rs.close (); s.close (); connection.close (); %>
        </tbody>
      </table>
    </div>
</body>
</html>
