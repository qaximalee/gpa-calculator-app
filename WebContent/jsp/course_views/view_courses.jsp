<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Courses</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.CourseService, com.ihsinformatics.gpaconvertor.entities.Course,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Courses List</h1>

	<%
		ICrudOperations<Course> courseOprt = new CourseService();

		List<Course> list = courseOprt.getAll();
		request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>Course No</th>
			<th>Course Name</th>
			<th>Semester</th>
		</tr>
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
	</table>
	<br />
	<a href="add_course_form.jsp">Add New Course</a>

</body>
</html>