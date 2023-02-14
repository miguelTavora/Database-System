package userinfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import content.HtmlStrings;
import sql.ConnectionConfigurate;

@WebServlet("/handleUserInfo")
public class ServiceUserInfo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}

		String username = (String) session.getAttribute("username");
		if (username != null) {
			String[] attr = getAttributes(username);

			session.setAttribute("nationality", attr[0]);
			session.setAttribute("reputation", attr[1]);

			if (attr[2].equals("0"))
				session.setAttribute("typeuser", "Normal user");
			else if (attr[2].equals("1"))
				session.setAttribute("typeuser", "Content creator");
			else if (attr[2].equals("2"))
				session.setAttribute("typeuser", "Administrator");
			
			session.setAttribute("editContent", getEditContent(username,attr[2]));
		}
		
		session.setAttribute("changePass", null);
		
		session.setAttribute("changeContent", null);

		getServletContext().getRequestDispatcher("/userinfo.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// vai buscar a descrição do conteúdo
	public String[] getAttributes(String username) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			statement = connect.createStatement();

			String query = "SELECT * FROM utilizador WHERE  username='" + username + "';";
			ResultSet rs = statement.executeQuery(query);

			String[] attributes = new String[3];

			while (rs.next()) {
				attributes[0] = rs.getString("nacionalidade");
				attributes[1] = rs.getString("reputacao");
				attributes[2] = rs.getString("admin");
			}

			return attributes;

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

	// vai buscar a descrição do conteúdo
	public String getEditContent(String username, String adminType) {
		if(adminType.equals("1") || adminType.equals("2")) {
			Connection connect = ConnectionConfigurate.getConnection();
			Statement statement = null;

			try {
				statement = connect.createStatement();

				String query = "SELECT * FROM utilizador WHERE  username='" + username + "';";
				ResultSet rs = statement.executeQuery(query);

				Integer idUser = -1;

				while (rs.next()) {
					idUser = rs.getInt("idUtilizador");
				}
				
				ArrayList<Integer> idPosts = new ArrayList<>();
				ArrayList<String> titlePosts = new ArrayList<>();
				
				query = "SELECT * FROM conteudo WHERE  idUtilizador='" + idUser + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					idPosts.add(rs.getInt("idConteudo"));
					titlePosts.add(rs.getString("titulo"));
				}
				
				String result = HtmlStrings.FIRST_EDIT_POST;
				String result2 = HtmlStrings.FIFTH_EDIT_POST;
				
				for(int i = 0;i<idPosts.size();i++) {
					result = result+HtmlStrings.SECOND_EDIT_POST+idPosts.get(i)+HtmlStrings.THIRTH_EDIT_POST+titlePosts.get(i)+HtmlStrings.FORTH_EDIT_POST;
					result2 = result2 + HtmlStrings.SIXTH_EDIT_POST+idPosts.get(i)+HtmlStrings.SEVENTH_EDIT_POST+titlePosts.get(i)+HtmlStrings.EIGTH_EDIT_POST;
				}
				result = result+result2+HtmlStrings.NINTH_EDIT_POST;
				
				return result;
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
		return null;
	}
}
