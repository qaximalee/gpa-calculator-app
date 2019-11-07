<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Semesters</title>
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
<jsp:include page="../header/nav_bar.jsp"></jsp:include>
	<%@page
		import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations, java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<%
		if(request.getParameter("from") != null){ 
		%>
			<input type="hidden" id="fromRequest" value="<%= request.getParameter("from") %>">
	<%		
		} 
	
		ICrudOperations<Semester> stdOprt = new SemesterService();

		List<Semester> list = stdOprt.getAll();
		request.setAttribute("list", list);
	%>

	<div class="container">
		<h1>Semesters List</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Semester No</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="std">
					<tr>
						<td>${std.getSemesterId()}</td>
						<td>${std.getSemesterNo()}</td>
						<td><a
							href="edit_semester_form.jsp?id=${std.getSemesterId()}">Edit</a></td>
						<td><a href="delete_semester.jsp?id=${std.getSemesterId()}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <a href="add_semester_form.jsp">Add New Semester</a>
	</div>
	<script type="text/javascript">
		var fromRequest = document.getElementById("fromRequest").value;
		if(fromRequest == "from-create"){
			alertify.success('Semester Added');
			document.getElementById("fromRequest").value = null;
		}else if( fromRequest == "from-edit"){
			alertify.success('Semester Updated');
			document.getElementById("fromRequest").value = null;
		}else if( fromRequest == "from-delete"){
			alertify.success('Semester Deleted');
			document.getElementById("fromRequest").value = null;
		}
	</script>

</body>
</html>