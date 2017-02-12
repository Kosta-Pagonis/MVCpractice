<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="helloPackage.dataObject.TodoList" %>
<%@ page import="helloPackage.dataObject.TodoItem" %><%--
  Created by IntelliJ IDEA.
  User: AjaxSurangama
  Date: 2/6/2017
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ObjectifyService.register(TodoList.class);
   ObjectifyService.register(TodoItem.class);
%>
<html>
    <head>
        <meta name="google-signin-client_id" content="1027240453637-n7gq0t7hs7sq0nu30p4keu797ui3rhcm.apps.googleusercontent.com">
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
                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                    <%--<span class="navbar-text" onclick="location.href='/lists_all'" style="cursor:pointer;">LOGIN</span>--%>
                </div>
            </div>
        </nav>

        <div class="welcome-content">
            <h1>Welcome to the ToDoList WebApp!!!</h1>

            To begin, please login.
        </div>
        <form action="/SetLoginEmailServlet" method="POST" id="usernamehiddenform">
            <input type="hidden" name="loginemail" value="notloggedin" id="loginemail"/>
        </form>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="../resources/js/googleSignIn.js" async defer></script>

    </body>
</html>
