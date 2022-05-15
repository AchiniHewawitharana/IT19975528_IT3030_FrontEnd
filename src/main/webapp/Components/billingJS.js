

/*$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == ""){
		$("#alertSuccess").hide();
	}
	
	$("#alertError").hide();
});*/
	
$(document).ready(function() 
{ 
	 $("#alertSuccess").hide(); 
	 $("#alertError").hide(); 
}); 

	
//SAVE ============================================
// add a click event handler for the Save button 


$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
		
	// Form validation-------------------
	var status = validateBillForm();
	if (status != true){
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
		
	// If valid------------------------
	var type = ($("#hidBillIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
		
	{
		url : "billingAPI",
		type : type,
		data : $("#formCon").serialize(),
		dataType : "text",
		complete : function(response, status){
			onBillSaveComplete(response.responseText, status);
		}
		});
});



function onBillSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			
			$("#divItemsGrid").html(resultSet.data);	
		} 
		
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
		
	else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} 
	
	else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidBillIDSave").val("");
	$("#formCon")[0].reset();
}



//UPDATE==========================================

$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidBillIDSave").val($(this).data("billid"));
	
	$("#power_consumption_ID").val($(this).closest("tr").find('td:eq(1)').text());
	$("#User_Name").val($(this).closest("tr").find('td:eq(2)').text());
	$("#NIC").val($(this).closest("tr").find('td:eq(3)').text());
	$("#address").val($(this).closest("tr").find('td:eq(4)').text());
	$("#month").val($(this).closest("tr").find('td:eq(5)').text());
	$("#monthly_units").val($(this).closest("tr").find('td:eq(6)').text());
	$("#rate").val($(this).closest("tr").find('td:eq(7)').text());
	
});


//DELETE=================================================
$(document).on("click", ".btnRemove", function(event)
		{
			$.ajax(
			{
				url : "billingAPI",
				type : "DELETE",
				data : "bill_ID=" + $(this).data("billid"),
				dataType : "text",
				complete : function(response, status)
				{
					onBillDeleteComplete(response.responseText, status);
				}
			});
});


function onBillDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	
	else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} 
	
	else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


//========== VALIDATION ================================================


function validateBillForm()
{
		/*// Month
		if ($("#month").val().trim() == "")
		{
			return "Insert Month!!";
		}
		
		// Previous Month Reading
		if ($("#premonreading").val().trim() == "")
		{
			return "Insert Previous Month Reading!!";
		}
		
		// Current Month Reading
		if ($("#curmonreading").val().trim() == "")
		{
			return "Insert Current Month Reading!!";
		}
		
		// is numerical value
		var premonreading = $("#premonreading").val().trim();
		if (!$.isNumeric(premonreading))
		{
			return "Invalid Previous Month Reading (Please enter a number)";
		}
		
		var curmonreading = $("#curmonreading").val().trim();
		if (!$.isNumeric(curmonreading))
		{
			return "Invalid Current Month Reading (Please enter a number)";
		}*/
		
		return true;
				
}

