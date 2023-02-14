package content;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.ConnectionConfigurate;
import validation.Validator;

@WebServlet("/handleComment")
public class ServiceComment extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String content = request.getParameter("content");
		String comment = request.getParameter("comment");
		
		

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		
		String username = (String)session.getAttribute("username");
		
		String result = "Error on the submission of comment";

		if(Validator.verifyComment(comment) && username!= null) {
			result = getDescription(comment,content,username);
			
			if(result != null)
				session.setAttribute("resultSubmission", HtmlStrings.SUCCESS_SUBMITTING_COMMENT_CLASSIFICATION+result+HtmlStrings.CLOSE_SUBMITTING_COMMENT_CLASSIFICATION);
			else
				session.setAttribute("resultSubmission", HtmlStrings.ERROR_SUBMITTING_COMMENT_CLASSIFICATION+"Error on the submission of comment"+HtmlStrings.CLOSE_SUBMITTING_COMMENT_CLASSIFICATION);
		}
		else
			session.setAttribute("resultSubmission", HtmlStrings.ERROR_SUBMITTING_COMMENT_CLASSIFICATION+result+HtmlStrings.CLOSE_SUBMITTING_COMMENT_CLASSIFICATION);
		

		getServletContext().getRequestDispatcher("/details.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// vai buscar a descrição do conteúdo
	public String getDescription(String comment, String content, String username) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			statement = connect.createStatement();
			
			String query = "SELECT * FROM utilizador WHERE  username='" + username + "';";
			ResultSet rs = statement.executeQuery(query);

			String iduser = "";

			while (rs.next()) {
				iduser = rs.getString("idUtilizador");
				
			}

			
			query = "INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('"+comment+"', '"+Validator.getCurrentDate()+"', '"+content+"', '"+iduser+"');";
			statement.executeUpdate(query);
			return "Success on the submission the comment";

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (connect != null)
					connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
