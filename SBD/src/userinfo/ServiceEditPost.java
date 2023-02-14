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

@WebServlet("/handleEditPost")
public class ServiceEditPost extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idPost = request.getParameter("getidpost");
		String age = request.getParameter("age");

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		session.setAttribute("resultSubmission",null);
		
		editContent(idPost,age);

		getServletContext().getRequestDispatcher("/handleShowAllContent").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// vai buscar a descrição do conteúdo
	public String editContent(String idPost, String age) {
		if(age.equals("delete")) {
			Connection connect = ConnectionConfigurate.getConnection();
			Statement statement = null;

			try {
				statement = connect.createStatement();
				
				boolean[] index = new boolean[4];
				
				String  query = "SELECT * FROM fotografia WHERE `idConteudo`='" + idPost + "';";
				ResultSet rs = statement.executeQuery(query);

				while (rs.next()) {
					index[0] = true;
				}
				
				query = "SELECT * FROM filmes WHERE `idConteudo`='" + idPost + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					index[1] = true;
				}
				
				query = "SELECT * FROM musica WHERE  `idConteudo`='" + idPost + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					index[2] = true;
				}
				
				query = "SELECT * FROM poema WHERE  idConteudo='" + idPost + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					index[3] = true;
				}
				
				
				for(int i = 0;i<index.length;i++) {
					System.out.println(index[i]);
				}
				
				
				if(index[0]) {
					query = "DELETE FROM fotografia WHERE `idConteudo`='"+idPost+"';";
					statement.executeUpdate(query);
				}
				else if(index[1]) {
					query = "DELETE FROM filmes WHERE `idConteudo`='"+idPost+"';";
					statement.executeUpdate(query);
				}
				else if(index[2]) {
					query = "DELETE FROM musica WHERE `idConteudo`='"+idPost+"';";
					statement.executeUpdate(query);
				}
				else if(index[3]) {
					query = "DELETE FROM poema WHERE `idConteudo`='"+idPost+"';";
					statement.executeUpdate(query);
				}
				
				query = "DELETE FROM conteudo WHERE `idConteudo`='"+idPost+"';";
				statement.executeUpdate(query);
				
				return "<h1 style=\"padding-bottom: 10px; color:#7f7fff;\">Success deleting the content</h1>";
				
				
			} catch (SQLException e) {
				e.printStackTrace();
				return "<h3 style=\"text-align: center;color:#DC143C\">Error deleting the content</h3>";
			} finally {
				try {
					if (connect != null)
						connect.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		else if(age.equals("3") || age.equals("12") || age.equals("16") || age.equals("18")) {
			Connection connect = ConnectionConfigurate.getConnection();
			Statement statement = null;

			try {
				statement = connect.createStatement();

				String query = "UPDATE conteudo SET `escalao` = "+age+ " WHERE `idConteudo` = '"+idPost+"';";
				statement.executeUpdate(query);
				
				return "<h1 style=\"padding-bottom: 10px; color:#7f7fff;\">Success changing the age group</h1>";
			} catch (SQLException e) {
				e.printStackTrace();
				return "<h3 style=\"text-align: center;color:#DC143C\">Error changing the age group</h3>";
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
