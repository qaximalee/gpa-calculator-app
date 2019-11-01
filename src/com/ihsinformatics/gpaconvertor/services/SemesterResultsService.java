package com.ihsinformatics.gpaconvertor.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ihsinformatics.gpaconvertor.entities.SemesterResults;
import com.ihsinformatics.gpaconvertor.interfaces.ICrudOperations;
import com.ihsinformatics.gpaconvertor.singleton.DBConnection;

public class SemesterResultsService implements ICrudOperations<SemesterResults> {

	private final String TABLE_NAME = "semester_results";

	@Override
	public boolean save(SemesterResults data) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("INSERT INTO " + TABLE_NAME
						+ " ( semester_id, student_id, semester_gpa, cgpa) VALUES(?,?,?,?)");
				st.setInt(1, data.getSemesterId());
				st.setInt(2, data.getStudentId());
				st.setDouble(3, data.getSemesterGPA());
				st.setDouble(4, data.getcGPA());

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
				st = con.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE semester_results_id = ?");
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
	public boolean update(SemesterResults data) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("UPDATE " + TABLE_NAME
						+ " SET semester_id = ?, student_id = ?, semester_gpa = ?, cgpa = ? WHERE semester_results_id = ?");
				st.setInt(1, data.getSemesterId());
				st.setInt(2, data.getStudentId());
				st.setDouble(3, data.getSemesterGPA());
				st.setDouble(4, data.getcGPA());
				st.setInt(5, data.getSemesterResultId());
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
	public List<SemesterResults> getAll() {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("SELECT * FROM " + TABLE_NAME);
				ResultSet results = st.executeQuery();
				List<SemesterResults> semesterResults = new ArrayList<>();
				while (results.next()) {
					semesterResults.add(new SemesterResults(results.getInt("semester_results_id"),
							results.getInt("semester_id"), results.getInt("student_id"),
							results.getDouble("semester_gpa"), results.getDouble("cgpa")));
				}
				if (semesterResults != null)
					return semesterResults;
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
	public SemesterResults getSingle(int id) {
		// TODO Auto-generated method stub

		SemesterResults semesterResult = null;
		Connection con = null;
		PreparedStatement st = null;
		try {
			boolean connected = DBConnection.getInstance().getDBUtility().tryConnection();
			con = DBConnection.getInstance().getConnection();
			if (connected) {
				st = con.prepareStatement("SELECT * FROM " + TABLE_NAME + " WHERE course_id = ?");
				st.setInt(1, id);
				ResultSet results = st.executeQuery();
				while (results.next()) {
					semesterResult = new SemesterResults(results.getInt("semester_results_id"),
							results.getInt("semester_id"), results.getInt("student_id"),
							results.getDouble("semester_gpa"), results.getDouble("cgpa"));
				}
				return semesterResult;
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
