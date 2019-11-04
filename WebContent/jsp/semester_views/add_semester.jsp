<%@page
	import="com.ihsinformatics.gpaconvertor.services.SemesterService,
	com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations,
	com.ihsinformatics.gpaconvertor.entities.Semester"
%>
<jsp:useBean id="std"
	class="com.ihsinformatics.gpaconvertor.entities.Semester"></jsp:useBean>
<jsp:setProperty property="*" name="std" />

<%
	ICrudOperations<Semester> semesterService = new SemesterService();
	
	if (semesterService.save(std)) {
		response.sendRedirect("add_semester_success.jsp");
	} else {
		response.sendRedirect("add_semester_error.jsp");
	} 
%>

