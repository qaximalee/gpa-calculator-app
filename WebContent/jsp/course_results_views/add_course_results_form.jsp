<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Semester Form</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.CourseService, com.ihsinformatics.gpaconvertor.entities.Course,
 	com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<%@page
		import="com.ihsinformatics.gpaconvertor.services.StudentService, com.ihsinformatics.gpaconvertor.entities.Student
 	"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
	<a href="view_courses_results.jsp">View All Courses</a><br/>

	<h1>Add Course</h1>

	<%
		ICrudOperations<Course> courseOprt = new CourseService();

		List<Course> courseList = courseOprt.getAll();
		request.setAttribute("courseList", courseList);
		
		ICrudOperations<Student> studentOprt = new StudentService();

		List<Student> studentList = studentOprt.getAll();
		request.setAttribute("studentList", studentList);
	%>

	<form action="add_course_results.jsp" method="post">
		<table>
			<tr>
				<td>Student:</td>
				<td><select name="studentId" required>
						<c:forEach items="${studentList}" var="student">
							<option value='<c:out value="${student.getStudentId()}"/>'><c:out value="${student.getRegistrationNo()}"/></option>					
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Course:</td>
				<td><select name="courseId" required>
						<c:forEach items="${courseList}" var="course">
							<option value='<c:out value="${course.getCourseId()}"/>'><c:out value="${course.getCourseCode()}"/></option>					
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Percentage:</td>
				<td><input type="number" name="percentage" required/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Course Result" /></td>
			</tr>
		</table>
	</form>


</body>
</html>
