<!DOCTYPE html>

<%@page import="com.ihsinformatics.gpaconvertor.pojo.CourseResultsPOJO"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Courses Results</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- include the script -->
<script src="../../js_lib/alertify.min.js"></script>
<!-- include the style -->
<link rel="stylesheet" href="../../js_lib/css/alertify.min.css" />
<!-- include a theme -->
<link rel="stylesheet" href="../../js_lib/css/themes/default.min.css" />
	
	
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.CourseResultsService, com.ihsinformatics.gpaconvertor.entities.CourseResults,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="container">
		<h1>Courses Results List</h1>

		<%
			CourseResultsService courseOprt = new CourseResultsService();

			List<CourseResultsPOJO> list = courseOprt.getAllReadableResults();
			request.setAttribute("list", list);
		%>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Registration No</th>
					<th>Course Name</th>
					<th>Semester</th>
					<th>Percentage</th>
					<th>GPA</th>
					<th>Grade</th>
					<th>Total Points</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="courseResults">
					<tr>
						<td>${courseResults.getFirstName()}</td>
						<td>${courseResults.getLastName()}</td>
						<td>${courseResults.getRegistrationNo()}</td>
						<td>${courseResults.getCourseName()}</td>
						<td>${courseResults.getSemesterNo()}</td>
						<td>${courseResults.getPercentage()}</td>
						<td>${courseResults.getGpa()}</td>
						<td>${courseResults.getGrade()}</td>
						<td>${courseResults.getTotalPoints()}</td>
						<td><a
							href="edit_course_results_form.jsp?id=${courseResults.getCourseResultId()}">Edit</a></td>
						<td><a
							href="delete_course_results.jsp?id=${courseResults.getCourseResultId()}" id="delete" >Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <a href="add_course_results_form.jsp">Add New Course</a>
	</div>
</body>
<script type="text/javascript">
var elementIsClicked = false; // declare the variable that tracks the state

	function clickHandler() { // declare a function that updates the state
		elementIsClicked = true;
	}

	var element = document.getElementById('delete'); // grab a reference to your element
	element.addEventListener('click', clickHandler);
</script>
</html>