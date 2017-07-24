package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.Note;
import util.DBUtil;

public class NoteDao {
	
	//属性：数据库连接对象
	private Connection connection = DBUtil.getConnection();
	
	//方法：插入笔记
	public void insertNote(Note note) {
		
		String sql = "INSERT note VALUES(DEFAULT,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, note.getTitle());
			pstmt.setString(2, note.getType());
			pstmt.setDate(3, note.getPublishTime());
			pstmt.setString(4, note.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//方法：通过id删除笔记
	public void deleteNoteById(int id) {
		
		String sql = "DELETE FROM note WHERE id = " + id;
		
		try {
			Statement statement = connection.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//方法：修改笔记
	public void updateNote(Note note) {
		
		String sql = "UPDATE note SET title = ?,type = ?,publishTime = ?,content = ? WHERE id = ?";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, note.getTitle());
			pstmt.setString(2, note.getType());
			pstmt.setDate(3, note.getPublishTime());
			pstmt.setString(4, note.getContent());
			pstmt.setInt(5, note.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//方法：查询所有笔记
	public ResultSet selectAllNotes() {
		
		String sql = "SELECT * FROM note";
		
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
	
	//方法：通过id查询笔记
	public ResultSet selectNoteById(int id) {
		
		String sql = "SELECT * FROM note WHERE id = " + id;
		
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
	
	//方法：通过类型查询笔记
	public ResultSet selectNoteByType(String type) {
		
		String sql = "SELECT * FROM note WHERE type = '" + type +"'";
		
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