<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
	<%@page import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>

	<%
		String id = request.getParameter("id");
		ICrudOperations<Semester> semesterOprt = new SemesterService();
		Semester std = semesterOprt.getSingle(Integer.parseInt(id));
	%>
	
	<h1>Edit Form</h1>
	<form action="edit_semester.jsp" method="post">
		<input type="hidden" name="semesterId" value="<%= std.getSemesterId() %>" />
		<table>
			<tr>
				<td>Semester No:</td>
				<td><input type="text" name="semesterNo" value="<%= std.getSemesterNo() %>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit Semester" /></td>
			</tr>
		</table>
	</form>

</body>
</html>