<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Event</title>

    <!-- bootstrap CSS -->
    <link href="<c:url value="/libs/css/bootstrap.css" />" rel="stylesheet" media="screen" />
    <style>
        .myTransparentBreadcrumb {
            background-color: rgba(255,255,255, 0.3);
        }
        .myTransparentBreadcrumb > li + li:before {
            color: rgb(2,2,2);
        }
    </style>
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
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-datepicker.js" />"></script>
    <script src="<c:url value="/libs/js/bootstrap-formhelpers-datepicker.pt_BR.js" />"></script>
</head>
<body>
    <%@ include file="../../nav.jsp"%>
    <% String action = request.getParameter("action");
        System.out.println(action);
    %>
    <div class="container">
        <div class="row">
            <ol class="breadcrumb myTransparentBreadcrumb">
                <li><a href="../../index.jsp">Home Page</a></li>
                <li><a href="EventController?action=manageEvents">Manage Events</a></li>
                <% if (action.equalsIgnoreCase("edit")) { %>
                <li class="active">Edit Event "${event.name}"</li>
                <% } else { %>
                <li class="active">Add New Event</li>
                <% } %>
            </ol>
        </div>
        <div class="row">
            <form method="POST" action='EventController' name="frmAddEvent">
                <table class='table table-bordered table-hover myTransparent'>
                    <tr>
                        <td>Event Name</td>
                        <td><input type="text" name="name" value="<c:out value="${event.name}" />" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <label class="radio-inline"><input type="radio" name="type" value="0" ${event.type == 0 ? "checked='checked'" : ""} >Festival</label>
                            <label class="radio-inline"><input type="radio" name="type" value="1" ${event.type == 1 ? "checked='checked'" : ""} >Concert</label>
                        </td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><div class="bfh-datepicker" data-format="y/m/d" data-date<fmt:formatDate pattern="yyyy/MM/dd" value="${event.date}"/> data-name="date"</div></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><input type="text" name="city" value="<c:out value="${event.city}" />" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>Local</td>
                        <td><input type="text" name="place" value="<c:out value="${event.place}" />" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <% if (action.equalsIgnoreCase("edit")) { %>
                            <input type="hidden" name="e_id" value="<c:out value="${event.e_id}" />"/>
                            <input type="hidden" name="action" value="edited" />
                            <button type='submit' name="submit" value='Submit' class='btn btn-primary'>
                                <i class="fa fa-pencil" aria-hidden="true"></i> Save changes
                            </button>
                            <% } else { %>
                            <input type="hidden" name="action" value="added" />
                            <button type='submit' name="submit" value='Submit' class='btn btn-primary'>
                                <i class="fa fa-plus" aria-hidden="true"></i> Add
                            </button>
                            <% } %>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <% if (action.equalsIgnoreCase("edit")) { %>
        <div class="row myTransparent">
            <div class="col-sm-6">
                <form method="POST" action="EventController" name="frmEditEvent" class="form-inline">
                    <select class="form-control" name="eventNotBands">
                        <c:forEach items="${eventNB}" var="enb">
                            <option value="<c:out value="${enb.b_id}" />"><c:out value="${enb.name}" /></option>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="e_id" value="<c:out value="${event.e_id}" />"/>
                    <input type="hidden" name="action" value="addEventBand" />
                    <button type='submit' name="submit" value='Submit' class='btn btn-success'>
                        <i class="fa fa-plus" aria-hidden="true"></i> Add Band to Event
                    </button>
                </form>
            </div>
            <div class="col-sm-6">
                <c:forEach items="${eventB}" var="eb">
                    <form method="POST" action='EventController' name="frmEditEvent">
                        <input type="hidden" name="b_id" value="<c:out value="${eb.b_id}" />"/>
                        <c:out value="${eb.name}" />
                        <input type="hidden" name="e_id" value="<c:out value="${event.e_id}" />"/>
                        <input type="hidden" name="action" value="removeEventBand" />
                        <button type='submit' name="submit" value='Submit' class='btn-link'><span class="text-danger"><i class="fa fa-times" aria-hidden="true"></i></span></button>
                    </form>
                </c:forEach>
            </div>
        </div>
        <% } %>
</body>
</html>