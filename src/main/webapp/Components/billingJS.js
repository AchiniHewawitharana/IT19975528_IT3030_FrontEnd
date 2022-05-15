

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
		
		if ($("#power_consumption_ID").val().trim() == "")
		{
			return "Select Power Consumption ID";
		}
		
		if ($("#User_Name").val().trim() == "")
		{
			return "Select a User's Name";
		}
		
		if ($("#month").val().trim() == "")
		{
			return "Insert Month here";
		}
		
		if ($("#monthly_units").val().trim() == "")
		{
			return "Insert Monthly Units here";
		}
		
		if ($("#rate").val().trim() == "")
		{
			return "Insert Rate per Month here";
		}
		
		// Numerical value insertions
		var monthly_units = $("#monthly_units").val().trim();
		if (!$.isNumeric(monthly_units))
		{
			return "Invalid Month Reading (Please enter a Number)";
		}
		
		var rate = $("#rate").val().trim();
		if (!$.isNumeric(rate))
		{
			return "Invalid Rate (Please Enter a Number)";
		}
		
		return true;
				
}

