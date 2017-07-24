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
import dao.NoteDao;


@WebServlet("/ColumnGetInfoServlet")
public class ColumnGetInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		NoteDao nd = new NoteDao();
		ResultSet result = nd.selectNoteByType(type);
		
		request.setAttribute("flag", true);
		request.setAttribute("result", result);
		request.getRequestDispatcher("pages/column.jsp").forward(request, response);
		
	}

		
}