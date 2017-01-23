<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login</title>

    <!-- bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    <!-- Bootstrap Form Helpers -->
    <link href="<c:url value="/libs/css/bootstrap-formhelpers.css" />" rel="stylesheet" media="screen" />
    <script src="<c:url value="/libs/js/bootstrap-formhelpers.js" />"></script>
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
