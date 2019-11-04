<%@page import="com.ihsinformatics.gpaconvertor.services.SemesterService, com.ihsinformatics.gpaconvertor.entities.Semester,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>  
<jsp:useBean id="std" class="com.ihsinformatics.gpaconvertor.entities.Semester"></jsp:useBean>  
<jsp:setProperty property="*" name="std"/>  
<%  
ICrudOperations<Semester> semesterOprt = new SemesterService();

if(semesterOprt.update(new Semester(std.getSemesterId(), std.getSemesterNo())))
	response.sendRedirect("view_semesters.jsp");
else
	response.sendRedirect("update_error.jsp");
%>  