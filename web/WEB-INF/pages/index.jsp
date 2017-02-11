<%--
  Created by IntelliJ IDEA.
  User: AjaxSurangama
  Date: 2/6/2017
  Time: 6:16 PM
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
    <body>
        <nav class="navbar todolist-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <em class="navbar-brand todolist-navbar-logo">ToDoList</em>
                </div>
                <div class="navbar-right">
                    <span class="navbar-text" onclick="location.href='/lists_all'">LOGIN</span>
                </div>
            </div>
        </nav>

        <div class="welcome-content">
            <h1>Welcome to the ToDoList WebApp!!!</h1>

            To begin, please login.
        </div>
    </body>
</html>
