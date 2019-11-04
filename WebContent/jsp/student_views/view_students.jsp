<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Students</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.StudentService, com.ihsinformatics.gpaconvertor.entities.Student,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Students List</h1>

	<%
		ICrudOperations<Student> stdOprt = new StudentService();

		List<Student> list = stdOprt.getAll();
		request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Registration No</th>
		</tr>
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
	</table>
	<br />
	<a href="add_student_form.jsp">Add New Student</a>

</body>
</html>