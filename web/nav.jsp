<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
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
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="${pageContext.request.servletPath eq '/index.jsp' ? ' active' : ''}"><a href="index.jsp">Home Page</a></li>
                <li class="${pageContext.request.servletPath eq '/WEB-INF/views/listbands.jsp' ? ' active' : ''}"><a href="BandController?page=listBands">List Bands</a></li>
                <li class="${pageContext.request.servletPath eq '/WEB-INF/views/listevents.jsp' ? ' active' : ''}"><a href="EventController?page=listEvents">List Events</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${empty sessionScope.currentSessionUser}">
                        <li class="${pageContext.request.servletPath eq '/signup.jsp' ? ' active' : ''}"><a href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</a></li>
                        <li class="${pageContext.request.servletPath eq '/login.jsp' ? ' active' : ''}"><a href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-bars" aria-hidden="true"></i> Menu <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="${pageContext.request.servletPath eq '/WEB-INF/views/userHome.jsp' ? ' active' : ''}"><a href="UserController?page=userArea"><i class="fa fa-user" aria-hidden="true"></i> My Profile</a></li>
                                <c:choose>
                                    <c:when test="${sessionScope.currentSessionLevel == 1}">
                                        <li class="${pageContext.request.servletPath eq '/WEB-INF/views/managebands.jsp' ? ' active' : ''}"><a href="BandController?page=manageBands"><i class="fa fa-database" aria-hidden="true"></i> Manage Bands</a></li>
                                        <li class="${pageContext.request.servletPath eq '/WEB-INF/views/manageevents.jsp' ? ' active' : ''}"><a href="EventController?page=manageEvents"><i class="fa fa-database" aria-hidden="true"></i> Manage Events</a></li>
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
        </div>
    </div>
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