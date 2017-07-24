package control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Note;
import bean.User;
import dao.NoteDao;
import dao.UserDao;

@WebServlet("/ShowNoteServlet")
public class ShowNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
int id = Integer.parseInt(request.getParameter("id"));
		
		NoteDao nd = new NoteDao();
		ResultSet rs = nd.selectNoteById(id);
		Note news = new Note();
		try {
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setType(rs.getString("type"));
				news.setPublishTime(rs.getDate("publishTime"));
				news.setContent(rs.getString("content"));
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", news);
		request.getRequestDispatcher("pages/show_note.jsp").forward(request, response);
		
	}

}
