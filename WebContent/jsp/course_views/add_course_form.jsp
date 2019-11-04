<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Semester Form</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 	com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<a href="view_courses.jsp">View All Courses</a><br/>

	<h1>Add Course</h1>

	<%
		ICrudOperations<Semester> semesterOprt = new SemesterService();

		List<Semester> list = semesterOprt.getAll();
		request.setAttribute("list", list);
	%>


	<form action="add_course.jsp" method="post">
		<table>
			<tr>
				<td>Course Code:</td>
				<td><input type="number" name="courseCode" /></td>
			</tr>
			<tr>
				<td>Course Name:</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Semester No:</td>
				<td><select name="semesterId" required>
						<c:forEach items="${list}" var="semester">
							<option value='<c:out value="${semester.getSemesterId()}"/>'><c:out value="${semester.getSemesterNo()}"/></option>					
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Course" /></td>
			</tr>
		</table>
	</form>


</body>
</html>
