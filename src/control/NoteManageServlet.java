package control;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoteDao;

@WebServlet("/NoteManageServlet")
public class NoteManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoteDao nd = new NoteDao();
		ResultSet result = nd.selectAllNotes();
		
		request.setAttribute("flag", true);
		request.setAttribute("result", result);
		request.getRequestDispatcher("pages/note_manage.jsp").forward(request, response);
		
	}

}
