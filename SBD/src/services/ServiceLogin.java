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

@WebServlet("/handleLogin")
public class ServiceLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username != null && password != null) {

			HttpSession session = request.getSession(false);
			if (session == null) {
				session = request.getSession();
			}

			if (validateData(username, password)) {
				boolean valid = validateUser(username, password);

				if (valid) {
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					session.setAttribute("admin", validateAdmin(username));
					getServletContext().getRequestDispatcher("/handleShowAllContent").forward(request, response);
				} else {
					session.setAttribute("errorlog", "" + true);
					getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
				}

			} else {
				session.setAttribute("errorlog", "" + true);
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private boolean validateData(String username, String password) {
		boolean user = Validator.isLettersAndNumbers(username) && username.length() > 3;
		boolean pass = password.length() > 5;
		return user && pass;
	}
	
	
	//retorna true se existir na base dados e false se não exitir
	private boolean validateUser(String username, String password) {

		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		
		String query = "SELECT * FROM utilizador WHERE username = \""+username+"\";";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			
			while (rs.next()) {
				String user = rs.getString("username");
				String pass = rs.getString("password");
				
				return username.equals(user) && password.equals(pass);
			}
			
			return false;
			 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connect != null)
					connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	private int validateAdmin(String username) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		
		String query = "SELECT * FROM utilizador WHERE username = \""+username+"\";";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			
			while (rs.next()) {
				Integer user = rs.getInt("admin");
				
				return user;
			}
			
			return 0;
			 

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
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
