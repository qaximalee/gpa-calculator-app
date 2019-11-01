<%@page
	import="com.ihsinformatics.gpaconvertor.services.StudentService,
	com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations,
	com.ihsinformatics.gpaconvertor.entities.Student"
%>
<jsp:useBean id="std"
	class="com.ihsinformatics.gpaconvertor.entities.Student"></jsp:useBean>
<jsp:setProperty property="*" name="std" />

<%
	ICrudOperations<Student> stdService = new StudentService();
	//Student student = new Student(0, "Ep-144556", "Basit", "Ali");
	
	if (stdService.save(std)) {
		response.sendRedirect("add_student_success.jsp");
	} else {
		response.sendRedirect("add_semester.jsp");
	} 
%>

