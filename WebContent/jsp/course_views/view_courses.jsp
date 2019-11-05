<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Courses</title>
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
		import="com.ihsinformatics.gpaconvertor.services.CourseService, com.ihsinformatics.gpaconvertor.entities.Course,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



	<%
		ICrudOperations<Course> courseOprt = new CourseService();

		List<Course> list = courseOprt.getAll();
		request.setAttribute("list", list);
	%>
	<div class="container">
		<h1>Courses List</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Course No</th>
					<th>Course Name</th>
					<th>Semester</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="std">
					<tr>
						<td>${std.getCourseId()}</td>
						<td>${std.getCourseCode()}</td>
						<td>${std.getName()}</td>
						<td>${std.getSemesterId()}</td>
						<td><a href="edit_course_form.jsp?id=${std.getCourseId()}">Edit</a></td>
						<td><a href="delete_course.jsp?id=${std.getCourseId()}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <a href="add_course_form.jsp">Add New Course</a>
	</div>
</body>
</html>