<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Semesters</title>
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
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<%
		ICrudOperations<Semester> stdOprt = new SemesterService();

		List<Semester> list = stdOprt.getAll();
		request.setAttribute("list", list);
	%>

	<div class="container">
		<h1>Semesters List</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Semester No</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="std">
					<tr>
						<td>${std.getSemesterId()}</td>
						<td>${std.getSemesterNo()}</td>
						<td><a
							href="edit_semester_form.jsp?id=${std.getSemesterId()}">Edit</a></td>
						<td><a href="delete_semester.jsp?id=${std.getSemesterId()}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <a href="add_semester_form.jsp">Add New Semester</a>
	</div>
</body>
</html>