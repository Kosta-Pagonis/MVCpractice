<%@ page import="helloPackage.dataObject.TodoList" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Jonathan
  Date: 2/11/2017
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String myname = "Name obtained from Google Account";
    myname = (String)session.getAttribute("loginemail");
%>
<html>
    <head>
        <meta name="google-signin-client_id" content="115960067068-mbk1drrrcnlctedq26qjnbcug9gt5qdf.apps.googleusercontent.com">
        <title>ToDoList WebApp</title>

        <spring:url value="/resources/css/bootstrap.css" var="BootstrapCSS" />
        <spring:url value="/resources/css/main-styles.css" var="MainStyles" />
        <spring:url value="/resources/js/bootstrap.js" var="BootstrapJS" />
        <spring:url value="/resources/js/jquery-3.1.1.js" var="JQuery" />

        <link rel="stylesheet" href="${BootstrapCSS}" />
        <link rel="stylesheet" href="${MainStyles}" />
        <script src="${JQuery}"></script>
        <script src="${BootstrapJS}"></script>
        <script src="../resources/js/googleSignIn.js"></script>
        <script src="https://apis.google.com/js/platform.js?onload=onLoad"></script>
    </head>
    <body class="pagebody-content">
        <!-- Webapp Navbar with ALL lists selected -->
        <nav class="navbar todolist-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <em class="navbar-brand todolist-navbar-logo">ToDoList</em>
                </div>
                <ul class="nav navbar-nav">
                    <li>
                        <a onclick="location.href='lists_all.jsp'" href="lists_all.jsp">
                            All
                        </a>
                    </li>
                    <li class="active">
                        <a onclick="location.href='lists_public.jsp'" href="lists_public.jsp">
                            Public <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="location.href='lists_private.jsp'" href="lists_private.jsp">
                            Private
                        </a>
                    </li>
                </ul>
                <div class="navbar-right">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user"></span>
                                <strong id="FirstName">firstname</strong>
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="navbar-login">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <p class="text-center">
                                                    <img src="../resources/img/user1.png" height="100px" width="100px">
                                                    <%--<span class="glyphicon glyphicon-user icon-size"></span>--%>
                                                </p>
                                            </div>
                                            <div class="col-lg-8">
                                                <p class="text-left" id="FullName"><strong>Full Name</strong></p>
                                                <p class="text-left small" id="Email">email@email.com</p>
                                                <p class="text-left">
                                                    <a id="ProfileLink" href="#" class="btn btn-primary btn-block btn-sm">Profile</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider navbar-login-session-bg"></li>
                                <li><a href="#" onclick="signOut();">Sign Out <span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ALL Lists Page Content Starts HERE -->
        <div class="container-fluid">
            <h2>Public ToDo Lists</h2>

            <button type="button" class="btn btn-default" onclick="location.href='todolist.jsp?operation=creation'">
                <span class="glyphicon glyphicon-plus"></span> Create New List
            </button>

            <h3>Edit List</h3>
            <p>Click on a ToDo List in the table below to view it.</p>
            <table class="table table-hover table-bordered todolist-table">
                <thead>
                <tr>
                    <th>List Name</th>
                    <th>Owner</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<TodoList> todoLists = ObjectifyService.ofy().load().type(TodoList.class).order("-date").list();
                    if(!todoLists.isEmpty()){
                        for (TodoList list: todoLists) {
                            //if(!myname.equalsIgnoreCase(list.getOwnerName())){
                            //    continue;
                           // }
                         %><tr class="tablerow"><%
                            if(list.getIsPrivate().equalsIgnoreCase("false")){
                         %> <td style="cursor:pointer;" onclick="location.href='todolist.jsp?operation=edition&listid=<%=list.id%>'"><%=list.getListName()%> </td>
                            <td><%=list.getOwnerName()%><%if(myname.equalsIgnoreCase(list.getOwnerName())){%>(You)<%}%>
                                <%if(myname.equalsIgnoreCase(list.getOwnerName())){
                                %><span style="float:right; color:white;" class="deleteClass" onclick="location.href='todolistcoe?prevpage=lists_public&operation=deletion&listid=<%=list.id%>'">Delete</span><%
                                    }%>
                            </td>
                        </tr><%
                            }
                        }
                    }
                %>
                <script type="text/javascript">
                    $(".tablerow").mouseover(function() {
                        $(this).find(".deleteClass").css("color","red").css("cursor","pointer");

                    }).mouseout(function () {
                        $(this).find(".deleteClass").css("color","white");
                    });
                </script>
                </tbody>
            </table>
        </div>

    </body>
</html>
