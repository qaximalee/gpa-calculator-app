<%@page import="com.ihsinformatics.gpaconvertor.services.CourseService, com.ihsinformatics.gpaconvertor.entities.Course,
 com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations"%>  

<%  
String strId = request.getParameter("id");
ICrudOperations<Course> courseOprt = new CourseService();

if(courseOprt.delete(Integer.parseInt(strId)))
	response.sendRedirect("view_courses.jsp");
else
	response.sendRedirect("delete_error.jsp");
%>  