<%@page import="com.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lodge Complaint</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Complaint.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />

</head>
<body>
	<br>
	<center>
		<img src="Images/ceb.png" alt="ceb" hieght="200" width="200"><br> <br>
		<marquee style="font-family:Book Antiqua;color:white;background-color:rgba(255,0,0,0.3)"  direction="right"><b>Welcome to Ceylon Electricity Board!!!</b></marquee>
	</center>
	<h1 class="text-white text-center mt-5">Lodge Complaint</h1>
	<br>
	<div class="container ">
		<div class="row">

			<div class="mx-auto float-left col-10" style="width: 30%;">
				<img src="Images/elec2.png" alt="ceb" hieght="380" width="380"
					style="float: left; left: 0;"> <br> <br> <br>
				<br>
				
				<form id="formItem" name="formItem"
					class='card p-3 bg-transparent bg-white was-validated'>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-user" aria-hidden="true"></i>
							</span>
						</div>
						<input id="cID" name="cID" type="number" class="form-control"
							placeholder="Enter your account number Here" required>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"><i
								class="fa fa-list-alt" aria-hidden="true"></i></span>
						</div>
						<input id="type" name="type" type="text" class="form-control"
							placeholder="Enter your complaint type Here" required>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-edit" aria-hidden="true"></i>
							</span>
						</div>
						<textarea id="cdesc" name="cdesc" class="form-control"
							placeholder="Enter Your Complaint Here" required></textarea>
					</div>


					<div class="text-center mt-2">
						<input id="btnSave" name="btnSave" type="button" value="Save"
							class="btn btn-outline-success" style="width: 30%; height: 50px;">
						<input type="hidden" id="hidItemIDSave" name="hidItemIDSave"
							value="">
					</div>
				</form>
				<div id="alertSuccess" class="alert alert-success mt-5"></div>
				<div id="alertError" class="alert alert-danger mt-5"></div>
			</div>
			<div id="divItemsGrid"
				class="float-right col-12  mt-5 text-white text-center">
				<%
				Complaint ComplaintAPIObj = new Complaint();
				out.print(ComplaintAPIObj.readComplaints());
				%>
			</div>
		</div>
	</div>
	</div>



</body>

<style>
body {
	/* background-image: radial-gradient( circle 610px at 5.2% 51.6%,  rgba(5,8,114,1) 0%, rgba(7,3,53,1) 97.5% ); */
	/* background-image: linear-gradient( 90.9deg,  rgba(3,195,195,1) 0.3%, rgba(37,84,112,1) 87.8% ); */
	/* 
background: #0f0c29;  
background: -webkit-linear-gradient(to right, #24243e, #302b63, #0f0c29);  
background: linear-gradient(to right, #24243e, #302b63, #0f0c29);  */
	background: #000428; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right #b10c0c, #460202, #120101);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b10c0c, #460202, #120101);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

th {
	color: white;
}

td {
	color: white;
}
</style>
</html>