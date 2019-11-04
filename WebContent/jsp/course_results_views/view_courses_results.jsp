<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Courses Results</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.CourseResultsService, com.ihsinformatics.gpaconvertor.entities.CourseResults,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Courses Results List</h1>

	<%
		ICrudOperations<CourseResults> courseOprt = new CourseResultsService();

		List<CourseResults> list = courseOprt.getAll();
		request.setAttribute("list", list);
	%>
	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>Course Id</th>
			<th>Student Id</th>
			<th>Percentage</th>
			<th>GPA</th>
			<th>Grade</th>
			<th>Total Points</th>
		</tr>
		<c:forEach items="${list}" var="courseResults">
			<tr>
				<td>${courseResults.getCourseResultId()}</td>
				<td>${courseResults.getCourseId()}</td>
				<td>${courseResults.getStudentId()}</td>
				<td>${courseResults.getPercentage()}</td>
				<td>${courseResults.getGpa()}</td>
				<td>${courseResults.getGrade()}</td>
				<td>${courseResults.getTotalPoints()}</td>
				<td><a href="edit_course_results_form.jsp?id=${std.getCourseResultId()}">Edit</a></td>
				<td><a href="delete_course_results.jsp?id=${std.getCourseResultId()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="add_course_results_form.jsp">Add New Course</a>

</body>
</html>