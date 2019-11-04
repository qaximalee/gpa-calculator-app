<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Semester Form</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 		com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List, 
 		com.ihsinformatics.gpaconvertor.services.StudentService, com.ihsinformatics.gpaconvertor.entities.Student"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<%@page
		import="com.ihsinformatics.gpaconvertor.services.StudentService, com.ihsinformatics.gpaconvertor.entities.Student
 	"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
	<a href="view_courses.jsp">View All Courses</a><br/>

	<h1>Add Course</h1>

	<%
		ICrudOperations<Semester> semesterOprt = new SemesterService();

		List<Semester> semesterList = semesterOprt.getAll();
		request.setAttribute("semesterList", semesterList);
		
		ICrudOperations<Student> studentOprt = new StudentService();

		List<Student> studentList = studentOprt.getAll();
		request.setAttribute("studentList", studentList);
	%>

	<form action="add_semester_results.jsp" method="post">
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
				<td>Semester:</td>
				<td><select name="semesterId" required>
						<c:forEach items="${semesterList}" var="semester">
							<option value='<c:out value="${semester.getSemesterId()}"/>'><c:out value="${semester.getSemesterNo()}"/></option>					
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Semester Result" /></td>
			</tr>
		</table>
	</form>


</body>
</html>
