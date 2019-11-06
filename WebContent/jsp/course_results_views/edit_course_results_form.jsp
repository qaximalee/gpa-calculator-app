<!DOCTYPE html>
<%@page import="com.ihsinformatics.gpaconvertor.services.CourseService"%>
<%@page import="com.ihsinformatics.gpaconvertor.entities.Course"%>
<%@page import="com.ihsinformatics.gpaconvertor.services.StudentService"%>
<%@page import="com.ihsinformatics.gpaconvertor.entities.Student"%>
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
		import="com.ihsinformatics.gpaconvertor.services.CourseResultsService, com.ihsinformatics.gpaconvertor.entities.CourseResults,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>
	<%@page
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 	com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%
		String id = request.getParameter("id");
		ICrudOperations<CourseResults> courseOprt = new CourseResultsService();
		CourseResults course = courseOprt.getSingle(Integer.parseInt(id));
	%>

	<%
		ICrudOperations<Course> coursesOprt = new CourseService();

		List<Course> courseList = coursesOprt.getAll();
		request.setAttribute("courseList", courseList);
		
		ICrudOperations<Student> studentOprt = new StudentService();

		List<Student> studentList = studentOprt.getAll();
		request.setAttribute("studentList", studentList);
	%>

	<div class="container">
		<h1>Edit Course</h1>

		<form action="add_course.jsp" method="post">
			<input type="hidden" name="courseResultId"
				value="<%=course.getCourseResultId()%>" />
				
			<div class="form-group">
				<label for="studentId">Student Id:</label> <select name="studentId"
					required>
					<c:forEach items="${studentList}" var="student">
						<option value='<c:out value="${student.getStudentId()}"/>'><c:out
								value="${student.getRegistrationNo()}" /></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="courseId">Course Code:</label> <select name="courseId"
					required>
					<c:forEach items="${courseList}" var="course">
								<option value='<c:out value="${course.getCourseId()}"/>'><c:out
										value="${course.getCourseCode()}" /></option>
							</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="percentage">Percentage:</label> <input type="text"
					class="form-control" id="percentage" value="<%=course.getPercentage()%>"
					name="percentage">
			</div>
			<button type="submit" class="btn btn-default">Edit Course Result</button>
		</form>
	</div>

</body>
</html>