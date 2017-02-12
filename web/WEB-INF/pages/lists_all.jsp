<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="helloPackage.dataObject.TodoList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Jonathan
  Date: 2/7/2017
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String myname = "Name obtained from Google Account"; %>
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
                    <li class="active">
                        <a onclick="location.href='/lists_all'" href="/lists_all">
                            All <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="location.href='/lists_public'" href="/lists_public">
                            Public
                        </a>
                    </li>
                    <li>
                        <a onclick="location.href='/lists_private'" href="/lists_private">
                            Private
                        </a>
                    </li>
                </ul>
                <div class="navbar-right">
                    <span class="navbar-text"><%=myname%></span>
                    <span class="navbar-text" onclick="location.href='/index'" style="cursor: pointer;">LOGOUT</span>
                </div>
            </div>
        </nav>

        <!-- ALL Lists Page Content Starts HERE -->
        <div class="container-fluid">
            <h2>All ToDo Lists</h2>

            <button type="button" class="btn btn-default" onclick="location.href='/todolist?operation=creation'">
                <span class="glyphicon glyphicon-plus" ></span> Create New List
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
                                if(!myname.equalsIgnoreCase(list.getOwnerName())&& !list.getIsPrivate().equalsIgnoreCase("false")){
                                    continue;
                                }
                                %><tr class="tablerow"><%
                                if(list.getIsPrivate().equalsIgnoreCase("false")){
                                    %> <td style="cursor:pointer;" onclick="location.href='/todolist?operation=edition&listid=<%=list.id%>'"><%=list.getListName()%> </td> <%
                                }else{
                                    %><td style="cursor:pointer; color:red;" onclick="location.href='/todolist?operation=edition&listid=<%=list.id%>'"><%=list.getListName()+" (private)"%> </td> <%
                                }
                      %><td><%=list.getOwnerName()%>
                        <%if(myname.equalsIgnoreCase(list.getOwnerName())){
                            %><span style="float:right; color:white;" class="deleteClass" onclick="location.href='todolistcoe?prevpage=lists_all&operation=deletion&listid=<%=list.id%>'">Delete</span><%
                        }%>
                        </td></tr>
                    <%
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
