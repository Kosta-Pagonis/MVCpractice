var isAddingItem = true;
	//set current date
	var date = new Date();
	var month = date.getMonth()+1;
	var day = date.getDate();
	var curDate = date.getFullYear() + '-' +
	    (month<10 ? '0' : '') + month + '-' +
	    (day<10 ? '0' : '') + day;
var $curTr = null;
$( document ).ready(function() {
	$("#addItemOverLayCloseBtn, #addItemOverLayCancelBtn").click(function(){
		closeOverlay();
	});
	$("#addItemOkBtn").click(function(){
		clickOkBtn();
	});
	setUpTableClickFuncs();
	$("#Fecha_Inicial, #End_Date").val(curDate);
	$("#addItemBtn").click(function(){
		$("#editItemOverlay").show();
	});
	$("#deleteItemBtn").click(function(){
		clickDeleteItemBtn();
	});
	$("#upItemBtn").click(function(){
		clickUpItemBtn();
	});
	$("#downItemBtn").click(function(){
		clickDownItemBtn();
	});
	$("#createNewBtn").click(function(){
		var reply = confirm("Do you want to save your work?");
		if(reply==true){
			if($.trim( $('#toDoName').val() ) !== ''){	
				saveTodoList();
				createNewTodoList();
			}else{
				alert("Todo List Name Can't Be Empty!");
			}
		}
	});
	$("#SaveBtn").click(function(){
		if($.trim( $('#toDoName').val() ) !== ''){	
			saveTodoList();
		}else{
			alert("Todo List Name Can't Be Empty!");
		}
	});

});


function setUpTableClickFuncs(){
	if($("#itemTable tbody").children().length==0){
		$("#emptyTableText").show();
	}else{
		$("#emptyTableText").hide();
	}
	$("tr").click(function(){
		$curTr = $(this); 
		$("#itemTableDiv tr:nth-child(even)").css("background-color", "f2f2f2");
		$("#itemTableDiv tr:nth-child(odd)").css("background-color", "white");
		$(this).css("background-color", "rgb(0,150,201)");
	});
	$("tr").dblclick(function(){
		isAddingItem = false;
		$("#overlayTitle").html("Edit Item");
		$("#overlaySubTitle").html("Edit Item Details");
		var rawData = [];
		// rawdata = {category:"",description:"",End_Date:"",Fecha_Inicial:"",Compelted:""};
		$(this).find("td").each(function(){
			rawData.push($(this).html());
		});
		$("#Category").val(rawData[0]);
		$("#Description").val(rawData[1]);
		$("#Fecha_Inicial").val(rawData[2]);
		$("#End_Date").val(rawData[3]);
		if(rawData[4]=="true"){
			$("#Completed").prop('checked',true);
		}else{
			$("#Completed").prop('checked',false);
		}
		$("#editItemOverlay").show();
	});
}

function closeOverlay(){
		//change back to defualt
		$("#overlayTitle").html("Add New Item");
		$("#overlaySubTitle").html("New Item Details");
		$("#Category").val("");
		$("#Description").val("");
		$("#Fecha_Inicial, #End_Date").val(curDate);
		$("#Completed").prop('checked',false);
		isAddingItem = true;
		$("#editItemOverlay").hide();
	//alert();
}

function clickDeleteItemBtn(){
		if($curTr==null){
			return;
		}
		if($curTr.prev().length>0){
			$curTr = $curTr.prev();
			$curTr.next().remove();
		}else if($curTr.next().length>0){
			$curTr = $curTr.next();
			$curTr.prev().remove();
		}else{
			$curTr.remove();
			$curT = null;
			if($("#itemTable tbody").children().length==0){
				$("#emptyTableText").show();
			}
			return;
		}
		$("#itemTableDiv tr:nth-child(even)").css("background-color", "f2f2f2");
		$("#itemTableDiv tr:nth-child(odd)").css("background-color", "white");
		$curTr.css("background-color", "rgb(0,150,201)");
}


function clickUpItemBtn(){
	if($curTr.prev().length==0){
		return;
	}else{
		$curTr.insertBefore($curTr.prev());
	}
}
function clickDownItemBtn(){
	if($curTr.next().length==0){
		return;
	}else{
		$curTr.insertAfter($curTr.next());
	}
}


function clickOkBtn(){
	if(isAddingItem){
		$("#emptyTableText").hide();
		var $tr = $("<tr>");
		$tr.append($('<td>').html($("#Category").val()))
			.append($('<td>').html($("#Description").val()))
			.append($('<td>').html($("#Fecha_Inicial").val()))
			.append($('<td>').html($("#End_Date").val()))
			.append($('<td>').html(($("#Completed").is(':checked'))? "true" : "false"))
		    .appendTo("#itemTable tBody");
		setUpTableClickFuncs();
	}else{
		$curTr.find("td")
		.first().html($("#Category").val())
		.next().html($("#Description").val())
		.next().html($("#Fecha_Inicial").val())
		.next().html($("#End_Date").val())
		.next().html(($("#Completed").is(':checked'))? "true" : "false");
	}
	closeOverlay();
}

function createNewTodoList(){
	location.reload();
}

function saveTodoList(){
	alert("Will save by JSP");
}