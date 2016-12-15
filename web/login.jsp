<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login Page</title>

    <!-- bootstrap CSS -->
    <link href="<c:url value="/libs/css/bootstrap.css" />" rel="stylesheet" media="screen" />
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
</head>
<body>
    <%@ include file="nav.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4">
                <form method="POST" action="LoginController" class="form-signin">
                    <h2 class="form-signin-heading">Who's there?</h2>

                    <div class="form-group">
                        <label for="un">Username</label>
                        <input type="text" id="un" name="un" class="form-control" required autofocus/>
                    </div>

                    <div class="form-group">
                        <label for="pw">Password</label>
                        <input type="password" id="pw" name="pw" class="form-control" required/>
                    </div>

                    <button class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="Login">Sign in</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4 text-center">
                <a href="signup.jsp">Create account</a>
            </div>
        </div>
    </div>
</body>
</html>
</html>