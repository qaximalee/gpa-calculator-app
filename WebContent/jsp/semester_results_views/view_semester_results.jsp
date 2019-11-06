<!DOCTYPE html>
<%@page import="com.ihsinformatics.gpaconvertor.pojo.SemesterResultsPOJO"%>
<%@page import="java.util.List"%>
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
		SemesterResultsService semResOprt = new SemesterResultsService();

		List<SemesterResultsPOJO> list = semResOprt.getAllReadableResults();
		request.setAttribute("list", list);
	%>

	<div class="container">
		<h1>Semester Results List</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Registration No</th>
					<th>Semester</th>
					<th>Semester GPA</th>
					<th>CGPA</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="semRes">
					<tr>
						<td>${semRes.getFirstName()}</td>
						<td>${semRes.getLastName()}</td>
						<td>${semRes.getRegistrationNo()}</td>
						<td>${semRes.getSemesterNo()}</td>
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
