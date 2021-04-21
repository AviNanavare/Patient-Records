<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.*,com.helper.*,org.hibernate.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Update Patient</title>
<%@include file="all_jsp_css.jsp"%>

</head>
<body style="background-image: url('images/455899.jpg');">
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br><br><br><br><br>
		<h1 class="text-uppercase">Update Patient</h1>
		<br>
		<%
		System.out.print(request.getParameter("id"));
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.print(id);
		
 		Session session3 = FactoryProvider.getFactory().openSession();
 		Patient p = (Patient) session3.get(Patient.class, id);
 		session3.close();

		%>
		
		<div class="container">
		<form action="UpdateServlet" method="post">
			<h3>Update Patients detail</h3>
			<br>
			<input value="<%= p.getId() %>" name="id" type="hidden" >
			<div class="mb-3">
				<input type="text" class="form-control" name="name"
					required="required" placeholder="Enter Name of Patient"
					minlength="3" value="<%= p.getName() %>">
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" name="address"
					required="required" placeholder="Enter Address" minlength="10"
					value="<%= p.getAddress() %>">
			</div>

			<div class="input-group mb-3">
				<input
					type="text" name="country code" value="+91" size="2" />	<input
					type="number" class="form-control" name="phoneNumber"
					pattern="^\d{10}$"
					required="required" placeholder="Enter Phone Number" minlength="10"
					value="<%= p.getPhoneNumber() %>">
			</div>
			
			<div class="input-group mb-3">
				<input type="email" class="form-control" placeholder="email" 
				name="email" required="required" value="<%= p.getEmail() %>"/> 
				<span></span>
					<input type="password" name="password"
					class="form-control" placeholder="Password" 
					value="<%= p.getPassword() %>"/>
			</div>
			
			<button type="submit" class="btn btn-primary">Update</button>
		</form>
	</div>

	</div>
	<br>
	<div class="container">
		<%@include file="footbar.jsp"%>
	</div>
</body>
</html>