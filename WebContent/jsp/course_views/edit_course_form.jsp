<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
	<%@page import="com.ihsinformatics.gpaconvertor.services.CourseService, com.ihsinformatics.gpaconvertor.entities.Course,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>
 <%@page
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 	com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%
		String id = request.getParameter("id");
		ICrudOperations<Course> courseOprt = new CourseService();
		Course course = courseOprt.getSingle(Integer.parseInt(id));
	%>
	
	<%
		ICrudOperations<Semester> semesterOprt = new SemesterService();

		List<Semester> list = semesterOprt.getAll();
		request.setAttribute("list", list);
	%>
	
	<h1>Edit Form</h1>
	<form action="edit_course.jsp" method="post">
		<input type="hidden" name="courseId" value="<%= course.getCourseId() %>" />
		<table>
			<tr>
				<td>Course Code:</td>
				<td><input type="text" name="courseCode" value="<%= course.getCourseCode() %>" /></td>
			</tr>
			<tr>
				<td>Course Name:</td>
				<td><input type="text" name="name" value="<%= course.getName() %>" /></td>
			</tr>
			<tr>
				<td>Semester:</td>
				<td>
					<select name="semesterId">
						<c:forEach items="${list}" var="semester">
							<option value='<c:out value="${semester.getSemesterId()}"/>'><c:out value="${semester.getSemesterNo()}"/></option>					
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit Course" /></td>
			</tr>
		</table>
	</form>

</body>
</html>