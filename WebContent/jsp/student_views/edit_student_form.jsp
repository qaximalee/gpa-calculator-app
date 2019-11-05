<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
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
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>

	<%
		String id = request.getParameter("id");
		ICrudOperations<Student> stdOprt = new StudentService();
		Student std = stdOprt.getSingle(Integer.parseInt(id));
	%>
	<div class="container">
		<h1>Edit Form</h1>
		<form action="edit_student.jsp" method="post">
			<input type="hidden" name="studentId" value="<%=std.getStudentId()%>" />
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" id="firstName" value="<%=std.getFirstName()%>"
					name="firstName">
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" id="lastName" value="<%=std.getLastName()%>"
					name="lastName">
			</div>
			<div class="form-group">
				<label for="registrationNo">First Name:</label> <input type="text"
					class="form-control" id="registrationNo"
					value="<%=std.getRegistrationNo()%>" name="registrationNo">
			</div>
			<button type="submit" class="btn btn-default">Edit Student</button>
		</form>
	</div>
</body>
</html>