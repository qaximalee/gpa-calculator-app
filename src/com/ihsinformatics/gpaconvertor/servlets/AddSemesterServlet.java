package com.ihsinformatics.gpaconvertor.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ihsinformatics.gpaconvertor.entities.CourseResults;
import com.ihsinformatics.gpaconvertor.entities.SemesterResults;
import com.ihsinformatics.gpaconvertor.services.CourseResultsService;
import com.ihsinformatics.gpaconvertor.services.SemesterResultsService;

public class AddSemesterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int semesterId = Integer.parseInt(req.getParameter("semesterId"));
		int studentId = Integer.parseInt(req.getParameter("studentId"));

		CourseResultsService courseResultsService = new CourseResultsService();
		List<CourseResults> listOfCourseResults = courseResultsService.getAllCourseResultsBySemester(semesterId,
				studentId);

		// Semester GPA can be get by below formula
		// gpa = totalPoints / gradableCredit
		// where,
		// totalPoints = gpa * credit hours
		// gradableCredit = total credit hours
		double totalPoints = 0.0;

		for (CourseResults courseResults : listOfCourseResults) {
			totalPoints += courseResults.getTotalPoints();
		}

		double gradableCredit = 3 * listOfCourseResults.size();

		double semesterGPA = totalPoints / gradableCredit;

		SemesterResultsService semesterResultsService = new SemesterResultsService();
		SemesterResults semesterResultsUpdated = new SemesterResults(0, semesterId, studentId, semesterGPA,
				semesterGPA);

		if (semesterResultsService.save(semesterResultsUpdated)) {
			resp.sendRedirect("add_semester_results_success.jsp");
		} else {
			resp.sendRedirect("add_semester_results_error.jsp");
		}

	}
}
