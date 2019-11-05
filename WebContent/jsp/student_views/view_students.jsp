<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Students</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.StudentService, com.ihsinformatics.gpaconvertor.entities.Student,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<%
		ICrudOperations<Student> stdOprt = new StudentService();

		List<Student> list = stdOprt.getAll();
		request.setAttribute("list", list);
	%>

	<div class="container">
		<h2>All Students</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Registration No</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="std">
					<tr>
						<td>${std.getStudentId()}</td>
						<td>${std.getFirstName()}</td>
						<td>${std.getLastName()}</td>
						<td>${std.getRegistrationNo()}</td>
						<td><a href="edit_student_form.jsp?id=${std.getStudentId()}">Edit</a></td>
						<td><a href="delete_student.jsp?id=${std.getStudentId()}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br />
		<a href="add_student_form.jsp">Add New Student</a>
	</div>

</body>
</html>