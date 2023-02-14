package userinfo;

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

@WebServlet("/handleChangePassword")
public class ServiceChangePassword extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String oldPass =  request.getParameter("pass1");
		String newPass =  request.getParameter("pass2");
		String repeatPass =  request.getParameter("pass3");

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		
		String username = (String)session.getAttribute("username");
		
		
		if(Validator.validPassword(oldPass) && newPass.equals(repeatPass) && Validator.validPassword(newPass) && username != null) {
			if(updatePassword(username,oldPass,newPass))
				session.setAttribute("changePass","<h1 style=\"padding-bottom: 10px; color:#7f7fff;\">Password changed with success</h1>");
			else
				session.setAttribute("changePass","<h3 style=\"text-align: center;color:#DC143C\">The password is not correct</h3>");
		}
		else
			session.setAttribute("changePass","<h3 style=\"text-align: center;color:#DC143C\">Error changing the password</h3>");
		
		
		session.setAttribute("changeContent", null);

		getServletContext().getRequestDispatcher("/userinfo.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// vai buscar a descrição do conteúdo
	public boolean updatePassword(String username,String oldPass, String newpass) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			String query = "SELECT * FROM utilizador WHERE username='"+username+"';";
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			String oldpassDB = "";

			while (rs.next()) {
				oldpassDB = rs.getString("password");
				
			}

			
			if(oldpassDB.equals(oldPass)) {
				query = "UPDATE utilizador SET `password` = "+newpass+ " WHERE `username` = '"+username+"';"; 
				statement.executeUpdate(query);
				return true;
			}
			return false;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
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
