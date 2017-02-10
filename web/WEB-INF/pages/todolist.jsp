<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
		<spring:url value="/resources/css/toDoTable.css" var="toDoTableCSS" />
		<spring:url value="/resources/js/jquery-311min.jsp" var="jqueryJs" />
		<spring:url value="/resources/js/toDoTable.js" var="toDoTableJs" />
		<spring:url value="/resources/img/addItemIcon.png" var="addItemIcon" />
		<link href="${toDoTableCSS}" rel="stylesheet" />
		<script src="${jqueryJs}"></script>
		<script src="${toDoTableJs}"></script>

        <title>To Do List Maker</title>
    </head>
    <body>
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
    			<input id="Category" type="text" name="Category" style="display: block; float: right; margin-top: 10px; margin-right: 30px;width: 140px;" 		 />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Description:</b>
    			<input id="Description" type="text" name="Description" style="display: block; float: right; margin-top: 10px; margin-right: 30px;width: 140px;"  />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Fecha Inicial:</b>
    			<input id="Fecha_Inicial" type="date" name="Fecha_Inicial" style="display: block; float: right; margin-top: 10px; margin-right: 30px;width: 140px;" />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">End Date:</b>
    			<input id="End_Date" type="date" name="End_Date" style="display: block; float: right; margin-top: 10px; margin-right: 30px;"  />
    			<br style="clear: both;" />
    		</div>
    		<div class="AddNewItemText">
    			<b style="display: block; float: left;">Completed:</b>
    			<input id="Completed" type="checkbox" name="Completed" style="display: block; float: right; margin-top: 10px; margin-right: 85px; width: 140px;" />
    			<br style="clear: both;" />
    		</div>
    		<button id="addItemOkBtn" style="margin-left: 15px; margin-top: 15px;">OK</button> 
    		<button id="addItemOverLayCancelBtn" style=" margin-top: 15px;">Cancel</button> 
    	</div>

    	<div id="toDoListTopDiv">
    		<div id="createNewBtn" class="toDoListTopBtns" title="Create a new list"></div>
    		<div id="SaveBtn" class="toDoListTopBtns" title="Save this todo list"></div>
    		<br style="clear: both;" />
    	</div>
        <div id="ToDoListContainer">
            <h2 style="margin-left: 20px">To Do List</h2>
            <div id="toDoDetailsDiv">
            	<div style="margin-left: 15px; font-size:18px; margin-top: 15px;"><b>Details</b></div>
            	<div style="margin-left: 15px; font-size: 12px; margin-top: 10px">
            		<b>Name of Todo List:</b> <input id="toDoName" type="text" name="toDoName" />
            		<b>Owner:</b> <input id="toDoOwner" type="text" name="toDoOwner" disabled placeholder="Get from Google Account" />
            	</div>
            </div>

            <div id="itemsDiv">
            	<div style="margin-left: 15px; font-size:18px; margin-top: 15px;"><b>Items</b></div>
            	<div style="margin-left:15px; margin-top:8px; width:400px; height:40px;">
            		<div id="addItemBtn" class="itemBtns" title="Add an Item"></div>
            		<div id="deleteItemBtn" class="itemBtns" title="Delete an Item"></div>
            		<div id="upItemBtn" class="itemBtns" title="Order Up"></div>
            		<div id="downItemBtn" class="itemBtns" title="Order Down"></div>
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
	            		</tbody>
	            		</table>
	            	</div>
            		</div>
            	</div>
            </div>
        </div>
    </body>
</html>
