<%--
  Created by IntelliJ IDEA.
  User: Jonathan
  Date: 2/7/2017
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
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
        <script src="${BootstrapJS}"></script>
        <script src="${JQuery}"></script>
    </head>
    <body class="pagebody-content">
        <!-- Webapp Navbar with ALL lists selected -->
        <nav class="navbar todolist-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <em class="navbar-brand todolist-navbar-logo">ToDoList</em>
                </div>
                <p class="navbar-text">Lists To View:</p>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">All <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">Public</a></li>
                    <li><a href="#">Private</a></li>
                </ul>
                <div class="navbar-right">
                    <span class="navbar-text" onclick="location.href='/index'">LOGOUT</span>
                </div>
            </div>
        </nav>

        <!-- ALL Lists Page Content Starts HERE -->
        <div class="container-fluid">
            <h2>All ToDo Lists</h2>
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
                    <td>Sample List 1</td>
                    <td>Sample Owner 1</td>
                </tr>
                <tr>
                    <td>Sample List 2</td>
                    <td>Sample Owner 1</td>
                </tr>
                <tr>
                    <td>Sample List 3</td>
                    <td>Sample Owner 2</td>
                </tr>
                </tbody>
            </table>
        </div>

    </body>
</html>
