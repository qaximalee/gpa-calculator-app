<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>
<%@page import="com.ihsinformatics.gpaconvertor.entities.SemesterResults"%>
<%@page import="com.ihsinformatics.gpaconvertor.services.SemesterResultsService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Semester Results</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>



	<%
		ICrudOperations<SemesterResults> semResOprt = new SemesterResultsService();

		List<SemesterResults> list = semResOprt.getAll();
		request.setAttribute("list", list);
	%>

	<div class="container">
		<h1>Semester Results List</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Semester ID</th>
					<th>Student ID</th>
					<th>Semester GPA</th>
					<th>CGPA</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="semRes">
					<tr>
						<td>${semRes.getSemesterResultId()}</td>
						<td>${semRes.getSemesterId()}</td>
						<td>${semRes.getStudentId()}</td>
						<td>${semRes.getSemesterGPA()}</td>
						<td>${semRes.getcGPA()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <a href="add_semester_results_form.jsp">Add New Semester Results</a>
	</div>

</body>
</html>
