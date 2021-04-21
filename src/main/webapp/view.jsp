<%@page import="javax.persistence.TypedQuery"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>View Patient</title>
<%@include file="all_jsp_css.jsp"%>

</head>
<body style="background-image: url('images/455899.jpg');">
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br><br><br><br>
		<h1 class="text-uppercase">View Patient</h1>
		<br>
		<table class="table table-hover table-dark text-center align-middle">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Address</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">Password</th>
					<th scope="col">DELETE</th>
					<th scope="col">Update</th>
				</tr>
			</thead>
			<tbody>
				<%
				Session session1 = FactoryProvider.getFactory().openSession();
				TypedQuery<Patient> q = session1.createQuery("from Patient order by id desc");
				List<Patient> list = q.getResultList();
				int i = 1;

				for (Patient p : list) {
				%>
				<tr>
					<td><%=p.getName()%></td>
					<td><%=p.getAddress()%></td>
					<td><%=p.getEmail()%></td>
					<td><%=p.getPhoneNumber()%></td>
					<td><%=p.getPassword()%></td>
					<td scope="col"><a href="DeleteServlet?id=<%= p.getId() %>" class="btn btn-danger ">Delete</a></td>
					<td scope="col"><a href="update.jsp?id=<%= p.getId() %>" class="btn btn-primary ">Update</a></td>
				</tr>
				<%
				}
				session1.close();
				%>
			</tbody>
		</table>
	</div>
	<div class="container">
		<%@include file="footbar.jsp"%>
	</div>
</body>
</html>