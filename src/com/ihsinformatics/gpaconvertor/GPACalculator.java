package com.ihsinformatics.gpaconvertor;

import java.sql.SQLException;
import java.util.List;

import com.ihsinformatics.gpaconvertor.entities.Course;
import com.ihsinformatics.gpaconvertor.entities.CourseResults;
import com.ihsinformatics.gpaconvertor.entities.Lookup;
import com.ihsinformatics.gpaconvertor.entities.Semester;
import com.ihsinformatics.gpaconvertor.entities.SemesterResults;
import com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations;
import com.ihsinformatics.gpaconvertor.services.CourseResultsService;
import com.ihsinformatics.gpaconvertor.services.CourseService;
import com.ihsinformatics.gpaconvertor.services.LookupService;
import com.ihsinformatics.gpaconvertor.services.SemesterResultsService;
import com.ihsinformatics.gpaconvertor.services.SemesterService;
import com.ihsinformatics.gpaconvertor.services.StudentService;

public class GPACalculator {

	public static void main(String[] args) throws SQLException {
		ICrudOperations<Course> courseOprt = new CourseService();
		ICrudOperations<CourseResults> courseResultsOprt = new CourseResultsService();
		ICrudOperations<Semester> semesterOprt = new SemesterService();
		ICrudOperations<SemesterResults> semesterResultsOprt = new SemesterResultsService();
		StudentService studentOprt = new StudentService();
		ICrudOperations<Lookup> lookupOprt = new LookupService();

		// InputForGPAConversion inputs = new InputForGPAConversion();
		// inputs.initializeInputs();

		// Student std = new Student(0, "HEKJ22", "Khalid", "Balti");
		// studentOprt.save(std);

		// System.out.println("Course Code: " + inputs.getCourseCode());
		// System.out.println("Semester No: " + inputs.getSemesterNo());
		// System.out.println("Percentage: " + inputs.getCourseCode() + "%");

		List<Course> courseList = courseOprt.getAll();
		if (courseList != null) {
			System.out.println("-----------------------------");
			for (Course course : courseList) {
				System.out.println("Course Id: " + course.getCourseId());
				System.out.println("Course Code: " + course.getCourseCode());
				System.out.println("Course Name: " + course.getName());
			}
		}
	}
}
