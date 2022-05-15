<%@page import="com.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Employer</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Employee.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />

</head>
<body>
	<br>
	
	<center>
		<img src="Images/ceb.png" alt="ceb" hieght="200" width="200"><br> <br>
		<marquee style="font-family:Book Antiqua;color:white;background-color:rgba(255,0,0,0.3)"  direction="right"><b>Welcome to Ceylon Electricity Board!!!</b></marquee>
	</center>
	<br>
	<h1 class="text-white text-center mt-5">Employee Registration Form</h1>
	<br>
	
	<div class="container ">
		<div class="row">
			<div class="mx-auto float-left col-10" style="width: 30%;">
				<img src="Images/elec3.png" alt="ceb" hieght="350" width="350"
					style="float: left; left: 0;">
				<form id="formItem" name="formItem"
					class='card p-3 bg-transparent bg-white was-validated'>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-user-plus" aria-hidden="true"></i>
							</span>
						</div>
						<input id="empID" name="empID" type="number" class="form-control"
							placeholder="Enter Employee ID Here" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-user" aria-hidden="true"></i>
							</span>
						</div>
						<input id="fname" name="fname" type="text" class="form-control"
							placeholder="Enter Full Name Here" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-venus-mars" aria-hidden="true"></i>
							</span>
						</div>
						<input id="gender" name="gender" type="text" class="form-control"
							placeholder="Enter Gender Here" required>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="	fa fa-credit-card" aria-hidden="true"></i>
							</span>
						</div>
						<input id="nic" name="nic" type="number" class="form-control"
							placeholder="Enter NIC Here" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-phone" aria-hidden="true"></i>
							</span>
						</div>
						<input id="number" name="number" type="number"
							class="form-control" placeholder="Enter Phone Number Here"
							required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-envelope-o" aria-hidden="true"></i>
							</span>
						</div>
						<input id="email" name="email" type="email" class="form-control"
							placeholder="Enter Email Here" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-key" aria-hidden="true"></i>
							</span>
						</div>
						<input id="password" name="password" type="password"
							class="form-control" placeholder="Enter Password Here" required>
					</div>


					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"> <i
								class="fa fa-map-marker" aria-hidden="true"></i>
							</span>
						</div>
						<textarea id="address" name="address" class="form-control"
							placeholder="Insert Address Here" required></textarea>
						>
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
				Employee EmployeeAPIObj = new Employee();
				out.print(EmployeeAPIObj.readEmployee());
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

