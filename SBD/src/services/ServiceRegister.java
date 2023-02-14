package services;

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

@WebServlet("/handleRegister")
public class ServiceRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");// vai buscar o name que está no input da JSP
		String nacionality = request.getParameter("nacionality");
		String birthday = request.getParameter("birthday");
		String password = request.getParameter("password");

		int x = -1;
		if (validateData(username, nacionality, birthday, password)) {
			x = insertNewUser(username, nacionality, birthday, password);
				
		}
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		session.setAttribute("register", ""+x);
		getServletContext().getRequestDispatcher("/register.jsp").forward(request,response);

		/*HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}

		if ((String) session.getAttribute("studentKey") == null || (String) session.getAttribute("studentKey") == "") {
																														
			session.setAttribute("errorSession", "");
			getServletContext().getRequestDispatcher("/TemplatesAluno/TemplateLoginAluno.jsp").forward(request,
					response);

		}*/

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private boolean validateData(String username, String nationality, String birthday, String password) {
		boolean user = Validator.isLettersAndNumbers(username) && username.length() > 3;
		boolean nat = Validator.isValidCountry(nationality);
		boolean birth = Validator.isValidFormat(birthday);
		boolean pass = password.length() > 5;
		return user && nat && birth && pass;
	}
	
	
	//retorna 1 se conseguir, 0 se já existir o utilizador e -1 se a validação falhar
	private int insertNewUser(String username, String nationality, String birthday, String password) {

		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		
		String query = "SELECT `idUtilizador` FROM utilizador WHERE username = \""+username+"\";";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			boolean flag = false;
			while (rs.next()) {
				flag = true;
			}
			if(!flag) {
				query = "INSERT INTO utilizador (`username`,`password`,`nacionalidade`,`dataNascimento`) VALUES ('"+username+"', '"+password+"', '"+nationality+"', '"+birthday+"');";
				statement.executeUpdate(query);
				return 1;
			}
			return 0;
			 

		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
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
