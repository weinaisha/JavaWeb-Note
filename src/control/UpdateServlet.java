package control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Note;
import bean.User;
import dao.NoteDao;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int id =Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		Date publishTime = new Date(System.currentTimeMillis());
		
		Note note = new Note();
		note.setId(id);
		note.setTitle(title);
		note.setType(type);
		note.setContent(content);
		note.setPublishTime(publishTime);
		
		NoteDao nd = new NoteDao();
		nd.updateNote(note);
		
		request.setAttribute("flag", true);
		request.getRequestDispatcher("pages/note_update.jsp").forward(request, response);
		
	}

}
