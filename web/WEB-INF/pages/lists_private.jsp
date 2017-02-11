<%--
  Created by IntelliJ IDEA.
  User: Jonathan
  Date: 2/11/2017
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>ToDoList WebApp</title>

        <spring:url value="/resources/css/bootstrap.css" var="BootstrapCSS" />
        <spring:url value="/resources/css/main-styles.css" var="MainStyles" />
        <spring:url value="/resources/js/bootstrap.js" var="BootstrapJS" />
        <spring:url value="/resources/js/jquery-3.1.1.js" var="JQuery" />

        <link rel="stylesheet" href="${BootstrapCSS}" />
        <link rel="stylesheet" href="${MainStyles}" />
        <script src="${JQuery}"></script>
        <script src="${BootstrapJS}"></script>
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
                        <a onclick="location.href='/lists_all'" href="/lists_all">
                            All
                        </a>
                    </li>
                    <li>
                        <a onclick="location.href='/lists_public'" href="/lists_public">
                            Public
                        </a>
                    </li>
                    <li class="active">
                        <a onclick="location.href='/lists_private'" href="/lists_private">
                            Private  <span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>
                <div class="navbar-right">
                    <span class="navbar-text" onclick="location.href='/index'">LOGOUT</span>
                </div>
            </div>
        </nav>

        <!-- ALL Lists Page Content Starts HERE -->
        <div class="container-fluid">
            <h2>Private ToDo Lists</h2>

            <button type="button" class="btn btn-default">
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
                    <tr>
                        <td>Sample List 2</td>
                        <td>Sample Owner 1</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </body>
</html>

