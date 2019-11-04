package com.ihsinformatics.gpaconvertor.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ihsinformatics.gpaconvertor.entities.CourseResults;
import com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations;
import com.ihsinformatics.gpaconvertor.singleton.DBConnection;

public class CourseResultsService implements ICrudOperations<CourseResults> {

	private final String TABLE_NAME = "course_results";

	@Override
	public boolean save(CourseResults data) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("INSERT INTO " + TABLE_NAME
						+ " ( student_id, course_id, percentage, gpa, grade, total_points) VALUES(?,?,?,?,?,?)");
				st.setInt(1, data.getStudentId());
				st.setInt(2, data.getCourseId());
				st.setDouble(3, data.getPercentage());
				st.setDouble(4, data.getGpa());
				st.setString(5, data.getGrade());
				st.setDouble(6, data.getTotalPoints());

				st.execute();
				return true;
			} else {
				System.out.println("Problem");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE courseResult_id = ?");
				st.setInt(1, id);
				int rowAffected = st.executeUpdate();
				if (rowAffected > 0)
					return true;
			} else {
				System.out.println("Problem");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(CourseResults data) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("UPDATE " + TABLE_NAME + " SET student_id = ?,"
						+ " course_id = ?, percentage = ?, gpa = ?, grade = ?, total_points = ? WHERE course_result_id = ?");
				st.setInt(1, data.getStudentId());
				st.setInt(2, data.getCourseId());
				st.setDouble(3, data.getPercentage());
				st.setDouble(4, data.getGpa());
				st.setString(5, data.getGrade());
				st.setDouble(6, data.getTotalPoints());
				st.setInt(7, data.getCourseResultId());
				int rowAffected = st.executeUpdate();
				if (rowAffected > 0)
					return true;
			} else {
				System.out.println("Problem");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<CourseResults> getAll() {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("SELECT * FROM " + TABLE_NAME);
				ResultSet results = st.executeQuery();
				List<CourseResults> courseResult = new ArrayList<>();
				while (results.next()) {
					courseResult.add(new CourseResults(results.getInt("course_result_id"), results.getInt("course_id"),
							results.getInt("student_id"), results.getDouble("percentage"), results.getDouble("gpa"),
							results.getString("grade"), results.getDouble("total_points")));
				}
				if (courseResult != null)
					return courseResult;
			} else {
				System.out.println("Problem");
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public CourseResults getSingle(int id) {
		// TODO Auto-generated method stub

		CourseResults courseResult = null;
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("SELECT * FROM " + TABLE_NAME + " WHERE course_result_id = ?");
				st.setInt(1, id);
				ResultSet results = st.executeQuery();
				while (results.next()) {
					courseResult = new CourseResults(results.getInt("course_result_id"), results.getInt("course_id"),
							results.getInt("student_id"), results.getDouble("percentage"), results.getDouble("gpa"),
							results.getString("grade"), results.getDouble("total_points"));
				}
				return courseResult;
			} else {
				System.out.println("Problem");
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public List<CourseResults> getAllCourseResultsBySemester(int semesterId, int studentId) {
		List<CourseResults> listOfCourseResults = new ArrayList<>();

		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("SELECT * FROM " + TABLE_NAME + " WHERE student_id = ? "
						+ "AND course_id IN (SELECT course_id From Course WHERE semester_id = ?)");
				st.setInt(1, studentId);
				st.setInt(2, semesterId);
				ResultSet results = st.executeQuery();
				while (results.next()) {
					listOfCourseResults.add(new CourseResults(results.getInt("course_result_id"),
							results.getInt("course_id"), results.getInt("student_id"), results.getDouble("percentage"),
							results.getDouble("gpa"), results.getString("grade"), results.getDouble("total_points")));
				}
				return listOfCourseResults;
			} else {
				System.out.println("Problem");
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
}
