<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Semesters</title>
</head>
<body>

	<%@page
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Semesters List</h1>
	
	<%
		ICrudOperations<Semester> stdOprt = new SemesterService();

		List<Semester> list = stdOprt.getAll();
		request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>Semester No</th>
		</tr>
		<c:forEach items="${list}" var="std">
			<tr>
				<td>${std.getSemesterId()}</td>
				<td>${std.getSemesterNo()}</td>
				<td><a href="edit_semester_form.jsp?id=${std.getSemesterId()}">Edit</a></td>
				<td><a href="delete_semester.jsp?id=${std.getSemesterId()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="add_semester_form.jsp">Add New Semester</a>

</body>
</html>