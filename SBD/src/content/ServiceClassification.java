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

@WebServlet("/handleClassification")
public class ServiceClassification extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String classification = request.getParameter("classification");
		String content = request.getParameter("content");
		
		

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		
		String username = (String)session.getAttribute("username");
		
		String result = "Error on the submission of classification";

		if(Validator.isValidClassification(classification) && username!= null) {
			result = getDescription(content,username,classification);
			
			if(result != null)
				session.setAttribute("resultSubmission", HtmlStrings.SUCCESS_SUBMITTING_COMMENT_CLASSIFICATION+result+HtmlStrings.CLOSE_SUBMITTING_COMMENT_CLASSIFICATION);
			else
				session.setAttribute("resultSubmission", HtmlStrings.ERROR_SUBMITTING_COMMENT_CLASSIFICATION+result+HtmlStrings.CLOSE_SUBMITTING_COMMENT_CLASSIFICATION);
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
	public String getDescription(String content, String username, String classification) {
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
			
			
			query = "SELECT * FROM classificacao WHERE  idUtilizador='" + iduser + "';";
			rs = statement.executeQuery(query);
			
			boolean flag = false;
			int contentInt = Integer.parseInt(content);
			
			while (rs.next()) {
				if(rs.getInt("idConteudo") == contentInt) {
					flag = true;
					break;
				}
			
			}
			if(!flag) {
				query = "INSERT INTO classificacao (`idUtilizador`,`idConteudo`,`valor`,`data`) VALUES ('"+iduser+"', '"+content+"', '"+classification+"', '"+Validator.getCurrentDate()+"');";
				statement.executeUpdate(query);
				return "Success on the submission of classification";
			}

			return "You already submitted a classification on this content";
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