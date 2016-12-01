<%@ page import="jdbc.datamodel.Band" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="nav.jsp"%>

<jsp:useBean id="b" class="jdbc.datamodel.Band" scope="session">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>

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
    <div class='page-header'>
        <h1 id='page-title'>List of all bands</h1>
        <form method="post" action="add-bands.jsp" enctype="multipart/form-data">
            <input type="submit" name="create" value="Add Band" class='btn btn-success btn-xs'></input>
        </form>
    </div>
    <table class="table table-bordered table-striped myTransparent">
        <thead>
        <tr>
            <th>Index</th>
            <th>Nome</th>
            <th>Img</th>
            <th>Artistas</th>
            <th style='text-align:center'>Ação</th>
        </tr>
        </thead>
        <tbody>
            <% List<Band> bandsList = b.getBandsList(); for(Band band : bandsList) { %>
                <tr>
                    <td> <%= band.getID() %> </td>
                    <td> <%= band.getName() %> </td>
                    <td> <%= band.getImage() %> </td>
                    <td> <%= band.getArtists() %> </td>
                    <td style="text-align:center">
                        <div class="row">
                            <div class="col-xs-4">
                                <form method="post" action="edit-bands.jsp">
                                    <input type="hidden" name="b_id" value="<%= band.getID() %>">
                                    <input type="submit" name="edit" value="Edit" class='btn btn-info btn-xs'>  <%=b.getID()%> </input>
                                </form>
                            </div>
                            <div class="col-xs-4">
                                <form method="post" action="">
                                    <input type="hidden" name="b_id" value="<%= band.getID() %>">
                                    <input type="submit" name="delete" value="Delete" class='btn btn-danger btn-xs'></input>
                                </form>
                            </div>
                            <div class="col-xs-4"><?php if($row['foto']!=''){echo"<a href='uploads/jogadores/".$row['foto']."' target='_blank' class='btn btn-info btn-xs'>Ver Foto</a>";} ?></div>
                        </div>
                    </td>
                </tr>
            <% } %>
            <%
                if (request.getParameter("delete") != null ) {
                    if (request.getParameter("delete").equals("Delete")) {
                        out.println("deleting");
                        b.deleteBand(request);
                        response.sendRedirect("gest.jsp");
                    }
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
