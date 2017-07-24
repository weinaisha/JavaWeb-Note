package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.User;
import util.DBUtil;

public class UserDao {
	
	private Connection connection = DBUtil.getConnection();
	
	public void insertUser(User user) {
		
		String sql = "INSERT user VALUES(DEFAULT,'" + user.getUsername() + "','" + user.getPassword() + "')";
		
		try {
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteUserById(int id) {
		
		String sql = "DELETE FROM user WHERE id = " + id;
		
		try {
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void updateUser(User user) {
		
		String sql = "UPDATE user SET username = '" + user.getUsername() + "',password = '" + user.getPassword() + "',role = '" + "' WHERE id = " + user.getId();
		
		try {
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public ResultSet selectUserByUsername(String username) {
		
		String sql = "SELECT * FROM user WHERE username = '" + username + "'";
		
		ResultSet rs = null;
		Statement statement;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
		
	}

	public ResultSet selectUserById(int id) {
		
		String sql = "SELECT * FROM user WHERE id = " + id;
		
		ResultSet rs = null;
		Statement statement;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
		
	}
	
}