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
            <div class="col-md-6 col-md-offset-3">
                <form method="POST" action="LoginController" class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Create account</h4>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="name" class="control-label">Name</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                    <input type="text" name="name" id="name" class="form-control" placeholder="What is your name?" required="true"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthdate" class="control-label">Birthdate</label>
                                <div class="input-group">
                                    <div class="bfh-datepicker" data-format="y/m/d" id="birthdate" data-name="birthdate"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthdate" class="control-label">City</label>
                                <div class="bfh-selectbox" data-name="city" id="city" data-filter="true">
                                    <div data-value="porto">Porto</div>
                                    <div data-value="lisboa">Lisboa</div>
                                    <div data-value="braga">Braga</div>
                                    <div data-value="esposende">Esposende</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="control-label">Username</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                    <input type="text" name="username" id="username" class="form-control" placeholder="Choose your username" required="true"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="control-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Insert your email address" required="true"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Type your password" required="true"/>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg btn-block login-button" name="action" value="Signup">Sign up!</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>