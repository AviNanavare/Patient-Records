<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Add Patient</title>
<%@include file="all_jsp_css.jsp"%>

</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
	</div>
	<br><br><br><br><br>
	<div class="container">
		<form action="SaveServlet" method="post">
			<h3>Enter Patients detail</h3>
			<br>
			<div class="mb-3">
				<input type="text" class="form-control" name="name"
					required="required" placeholder="Enter Name of Patient"
					minlength="3">
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" name="address"
					required="required" placeholder="Enter Address" minlength="10">
			</div>

			<div class="input-group mb-3">
				<input type="text" name="country code" value="+91" size="2"
					disabled="disabled" /> <input type="text" class="form-control"
					name="phoneNumber" pattern="^[789]\d{9,9}$" required="required"
					placeholder="Enter Phone Number">
			</div>

			<div class="input-group mb-3">
				<input type="email" class="form-control" placeholder="email"
					name="email" required="required" /> <span></span> <input
					type="text" name="password" class="form-control"
					placeholder="Password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="required" />
			</div>

			<button type="submit" class="btn btn-primary">Add</button>
		</form>
	</div>
	<br>
	<div class="container">
		<%@include file="footbar.jsp"%>
	</div>
</body>
</html>