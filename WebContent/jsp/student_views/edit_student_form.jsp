<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
	<%@page import="com.ihsinformatics.gpaconvertor.services.StudentService, com.ihsinformatics.gpaconvertor.entities.Student,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>

	<%
		String id = request.getParameter("id");
		ICrudOperations<Student> stdOprt = new StudentService();
		Student std = stdOprt.getSingle(Integer.parseInt(id));
	%>
	
	<h1>Edit Form</h1>
	<form action="edit_student.jsp" method="post">
		<input type="hidden" name="studentId" value="<%= std.getStudentId() %>" />
		<table>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName" value="<%= std.getFirstName() %>" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName"
					value="<%= std.getLastName() %>" /></td>
			</tr>
			<tr>
				<td>Registration No:</td>
				<td><input type="text" name="registrationNo" value="<%= std.getRegistrationNo() %>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit User" /></td>
			</tr>
		</table>
	</form>

</body>
</html>