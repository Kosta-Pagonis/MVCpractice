<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="helloPackage.dataObject.TodoItem" %>
<%@ page import="helloPackage.dataObject.TodoList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%	String myname ="Name obtained from Google Account";
	String todoListName = "";
	String todoListOwner =myname;
	String isPrivate ="false";
	List<TodoItem> todoItems = null;
	boolean isEditting = request.getParameter("operation").equalsIgnoreCase("edition");
	if(isEditting == true){
	String todoListId = request.getParameter("listid");
	TodoList todoList = ObjectifyService.ofy().load().type(TodoList.class).id(Long.parseLong(todoListId)).now();
	todoListName = todoList.getListName();
	todoListOwner = todoList.getOwnerName();
	isPrivate = todoList.getIsPrivate();
	todoItems = ObjectifyService.ofy().load().type(TodoItem.class).ancestor(todoList).list();
	}
	boolean amItheOwner = myname.equalsIgnoreCase(todoListOwner);
%>
<html>
    <head>
		<spring:url value="/resources/css/toDoTable.css" var="toDoTableCSS" />
		<spring:url value="/resources/js/jquery-311min.jsp" var="jqueryJs" />
		<spring:url value="/resources/js/toDoTable.js" var="toDoTableJs" />
		<spring:url value="/resources/img/addItemIcon.png" var="addItemIcon" />
		<spring:url value="/resources/css/bootstrap.css" var="BootstrapCSS" />
		<spring:url value="/resources/css/main-styles.css" var="MainStyles" />
		<spring:url value="/resources/js/bootstrap.js" var="BootstrapJS" />
		<link rel="stylesheet" href="${BootstrapCSS}" />
		<link rel="stylesheet" href="${MainStyles}" />

		<link rel="stylesheet" href="${toDoTableCSS}" />
		<script src="${jqueryJs}"></script>
		<script src="${toDoTableJs}"></script>
		<script src="${BootstrapJS}"></script>

        <title>To Do List Maker</title>
    </head>
    <body>
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

	<div id="editItemOverlay">
    		<div style="width: 100%; height: 30px; background-color: white;">
	    		<span style="margin-left:10px; vertical-align: middle;line-height: 30px;font-size: 14px;">
	    		<img src="${addItemIcon}" alt="icon" style="margin-right: 7px;" />
	    		<span id="overlayTitle">Add New Item</span>
	    		</span>
	    		<div id="addItemOverLayCloseBtn">×</div>
    		</div>
    		<div style="width: 200px; height: 40px; background-color: rgb(255,228,196); line-height: 40px; text-align: center; font-size: 26px; margin-top: 10px; margin-left: 15px;" 		id="overlaySubTitle">New Item Details</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Category:</b>
    			<input id="Category" type="text" name="Category" style="display: block; float: right; margin-top: 10px; margin-right: 30px;width: 140px; font-size:14px;" 		 />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Description:</b>
    			<input id="Description" type="text" name="Description" style="font-size:14px;display: block; float: right; margin-top: 10px; margin-right: 30px;width: 140px;"  />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Fecha Inicial:</b>
    			<input id="Fecha_Inicial" type="date" name="Fecha_Inicial" style="font-size:14px;display: block; float: right; margin-top: 10px; margin-right: 30px;width: 140px;" />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">End Date:</b>
    			<input id="End_Date" type="date" name="End_Date" style="font-size:14px;display: block; float: right; margin-top: 10px; margin-right: 30px;"  />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Completed:</b>
    			<input id="Completed" type="checkbox" name="Completed" style="font-size:14px;display: block; float: right; margin-top: 10px; margin-right: 85px; width: 140px;" />
    			<br style="clear: both;" />
    		</div>
    		<button id="addItemOkBtn" style="margin-left: 15px; margin-top: 15px;<%if(amItheOwner==false){%>display:none; <%}%>" >OK</button>
    		<button id="addItemOverLayCancelBtn" style=" margin-top: 15px;">Cancel</button> 
    	</div>

    	<div id="toDoListTopDiv">
    		<div id="createNewBtn" class="toDoListTopBtns" title="Create a new list" <%if(amItheOwner==false){%>style="display: none;" <%}%>></div>
    		<div id="SaveBtn" class="toDoListTopBtns" title="Save this todo list" <%if(amItheOwner==false){%>style="display: none;" <%}%> ></div>
    		<br style="clear: both;" />
    	</div>
        <div id="ToDoListContainer">
            <h2 style="margin-left: 20px">To Do List <%if(amItheOwner==false){%>(Read Only)<%}%></h2>
            <div id="toDoDetailsDiv">
            	<div style="margin-left: 15px; font-size:18px; margin-top: 15px;"><b>Details</b></div>
            	<div style="height:30px;margin-left: 15px; font-size: 12px; margin-top: 10px;">
            		<b>Name of Todo List:</b> <input form="hiddenForm"  id="toDoName" type="text" name="toDoName" value="<%=todoListName%>" <%if(amItheOwner==false){%>disabled<%}%> />
            		<b>Owner:</b> <input form="hiddenForm"  id="toDoOwner" type="text" name="toDoOwner" readonly value="<%if(isEditting){%><%=todoListOwner%><%}else{%><%=myname%><%}%>" />
					<b>Is Private:</b><input form="hiddenForm" style="width:17px; height: 17px; " id="isPrivate" type="checkbox", name="isPrivate"<%if(!isPrivate.equalsIgnoreCase("false")){%>checked<%}%> <%if(amItheOwner==false){%>disabled<%}%> />
				</div>
            </div>

            <div id="itemsDiv">
            	<div style="margin-left: 15px; font-size:18px; margin-top: 15px;"><b>Items</b></div>
            	<div style="margin-left:15px; margin-top:8px; width:400px; height:40px;">
            		<div id="addItemBtn" class="itemBtns" title="Add an Item" <%if(amItheOwner==false){%>style="display: none;" <%}%>></div>
            		<div id="deleteItemBtn" class="itemBtns" title="Delete an Item" <%if(amItheOwner==false){%>style="display: none;" <%}%>></div>
            		<div id="upItemBtn" class="itemBtns" title="Order Up" <%if(amItheOwner==false){%>style="display: none;" <%}%>></div>
            		<div id="downItemBtn" class="itemBtns" title="Order Down" <%if(amItheOwner==false){%>style="display: none;" <%}%>></div>
            		<br style="clear:both;" />
            	</div>
            	<div id="itemTableDiv">
            		<div id="table-wrapper">
            		<div id="emptyTableText">No content in table</div>
            		<div id="table-scroll">
	            		<table id="itemTable">
	            		<thead>
	            			<tr>
	            				<th><span class="theadtext">Category</span></th>
	            				<th><span class="theadtext">Description</span></th>
	            				<th><span class="theadtext">Start Date</span></th>
	            				<th><span class="theadtext">End Date</span></th>
	            				<th><span class="theadtext">Complete</span></th>
	            			</tr>
	            		</thead>
	            		<tbody>
						<%if(isEditting==true && todoItems.isEmpty()==false){
							for (TodoItem item:todoItems) {
								%><tr><%
								%><td><%=item.getCategory()%></td><%
								%><td><%=item.getDescription()%></td><%
								%><td><%=item.getStartDate()%></td><%
								%><td><%=item.getEndDate()%></td><%
								%><td><%=item.getCompleted()%></td><%
								%></tr><%
							}
						}%>
						</tbody>
	            		</table>
	            	</div>
            		</div>
            	</div>
            </div>
        </div>

	<!--hidden form, action = servlet -->
	<form id="hiddenForm" action="/todolistcoe" method="GET">
		<% if(request.getParameter("operation").equalsIgnoreCase("creation")){
		    %><input name="operation" type="hidden" value="creation"><%
		}else{
			%><input name="operation" type="hidden" value="edition"><%
			%><input name="listid" type="hidden" value="<%=request.getParameter("listid")%>"><%
		}%>
	</form>

    </body>
</html>
