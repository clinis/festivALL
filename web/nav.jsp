<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand visible-xs" href="index.jsp">festivALL</a>
            <a class="navbar-brand visible-sm" href="index.jsp">festivALL</a>
            <a class="navbar-brand hidden-xs hidden-sm" href="index.jsp">festivALL - all the festivals!</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="${pageContext.request.servletPath eq '/index.jsp' ? ' active' : ''}"><a href="index.jsp">Home Page</a></li>
                <li class="${pageContext.request.servletPath eq '/listbands.jsp' ? ' active' : ''}"><a href="BandController?action=listBands">Manage Bands</a></li>
                <li class="${pageContext.request.servletPath eq '/band.jsp' ? ' active' : ''}"><a href="BandController?action=insert">Add Band</a></li>
                <li class="${pageContext.request.servletPath eq '/listevents.jsp' ? ' active' : ''}"><a href="EventController?action=listEvents">Manage Events</a></li>
                <li class="${pageContext.request.servletPath eq '/event.jsp' ? ' active' : ''}"><a href="EventController?action=insert">Add Event</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${empty sessionScope.currentSessionUser}">
                        <li>
                            <a href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</a>
                        </li>
                        <li>
                            <a href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <c:out value="${sessionScope.currentSessionUser}"/> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li >
                                <a href="admin-home.php"><i class="fa fa-user" aria-hidden="true"></i> Perfil</a>
                                </li>
                                <c:choose>
                                    <c:when test="${sessionScope.currentSessionLevel == 1}">
                                        <li >
                                            <a href="BandController?action=manageBands"><i class="fa fa-database" aria-hidden="true"></i> Manage Bands</a>
                                        </li>
                                        <li >
                                            <a href="EventController?action=manageEvents"><i class="fa fa-database" aria-hidden="true"></i> Manage Events</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                                <li role="separator" class="divider"></li>
                                <li><a href="LoginController?action=logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container -->
</nav>
<style>
    body {
        padding-top: 70px;
        background: url(libs/img/Phones.png);
        background-position: center center;
        background-attachment: fixed;
        background-size: cover;
        background-repeat: no-repeat;
    }
    .myTransparent {
        background-color: rgba(255,255,255, 0.5);
        color: inherit;
    }
</style>