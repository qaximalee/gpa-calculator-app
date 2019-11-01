package com.ihsinformatics.gpaconvertor.entities;

public class CourseResults {
	private int courseResultId;
	private int courseId;
	private int studentId;
	private double percentage;
	private double gpa;
	private String grade;
	private double totalPoints;

	public CourseResults() {
	}

	public CourseResults(int courseResultId, int courseId, int studentId, double percentage, double gpa, String grade,
			double totalPoints) {
		super();
		this.courseResultId = courseResultId;
		this.courseId = courseId;
		this.studentId = studentId;
		this.percentage = percentage;
		this.gpa = gpa;
		this.grade = grade;
		this.totalPoints = totalPoints;
	}

	public int getCourseResultId() {
		return courseResultId;
	}

	public void setCourseResultId(int courseResultId) {
		this.courseResultId = courseResultId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public double getTotalPoints() {
		return totalPoints;
	}

	public void setTotalPoints(double totalPoints) {
		this.totalPoints = totalPoints;
	}
}
