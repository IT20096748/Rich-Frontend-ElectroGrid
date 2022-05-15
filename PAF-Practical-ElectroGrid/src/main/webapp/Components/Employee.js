$(document).ready(function() {

	$("#alertSuccess").hide();

	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
		{
			url: "EmployeeAPI",
			type: type,
			data: $("#formItem").serialize(),
			dataType: "text",
			complete: function(response, status) {
				onItemSaveComplete(response.responseText, status);
			}
		});
});



function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#formItem")[0].reset();
}


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) {
	$("#hidItemIDSave").val($(this).data("itemid"));
	$("#empID").val($(this).closest("tr").find('td:eq(0)').text());
	$("#fname").val($(this).closest("tr").find('td:eq(1)').text());
	$("#gender").val($(this).closest("tr").find('td:eq(2)').text());
	$("#nic").val($(this).closest("tr").find('td:eq(3)').text());
	$("#number").val($(this).closest("tr").find('td:eq(4)').text());
	$("#email").val($(this).closest("tr").find('td:eq(5)').text());
	$("#password").val($(this).closest("tr").find('td:eq(6)').text());
	$("#address").val($(this).closest("tr").find('td:eq(7)').text());
});





//Delete=============================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax(
		{
			url: "EmployeeAPI",
			type: "DELETE",
			data: "empNo=" + $(this).data("itemid"),
			dataType: "text",
			complete: function(response, status) {
				onItemDeleteComplete(response.responseText, status);
			}
		});
});



function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}





// CLIENT-MODEL================================================================
function validateItemForm() {
	// Employee ID
	if ($("#empID").val().trim() == "") {
		return "Insert Employee ID.";
	}
	// Full Name
	if ($("#fname").val().trim() == "") {
		return "Insert First Name.";
	}
	// Gender
	if ($("#gender").val().trim() == "") {
		return "Insert Gender.";
	}

	// NIC
	if ($("#nic").val().trim() == "") {
		return "Insert NIC.";
	}
	// Phone Number
	if ($("#number").val().trim() == "") {
		return "Insert Phone Number.";
	}
	// Email
	if ($("#email").val().trim() == "") {
		return "Insert email.";
	}
	// Password
	if ($("#password").val().trim() == "") {
		return "Insert Password.";
	}
	// Address
	if ($("#address").val().trim() == "") {
		return "Insert Address.";
	}
	return true;
}