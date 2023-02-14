package content;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.ConnectionConfigurate;

@WebServlet("/handleContent")
public class ServiceDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String content = request.getParameter("content");

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		
		Integer age = (Integer)session.getAttribute("age");
		String username = (String)session.getAttribute("username");
		if(age ==null)
			age = 3;

		
		String[] data = getArtistAndContent(content,age);
		
		Float loop = Float.parseFloat(getClassification(content,age));
		
		Integer stars = Math.round(loop);
		String star = "";
		for(int i = 0;i<10;i++) {
			if(i < stars)
				star = star+ HtmlStrings.STARTS_CLASSIFICATION_CHECKED;
			else
				star = star+ HtmlStrings.STARTS_CLASSIFICATION_UNCHECKED;
		}
		
		String info = getInfo(content,age)+data[0]+loop+star;
		
		session.setAttribute("info", info);
		
		session.setAttribute("image", data[1]);
		
		session.setAttribute("resume", getDescription(content,age));
		
		session.setAttribute("classComment", getContentSubmission(username,content,age));
		
		session.setAttribute("comments",getComments(content,age));
		
		session.setAttribute("resultSubmission",null);

		getServletContext().getRequestDispatcher("/details.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	// vai buscar a descrição do conteúdo
	public String getDescription(String content, int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			statement = connect.createStatement();

			String query = "SELECT * FROM conteudo WHERE  idConteudo='" + content + "';";
			ResultSet rs = statement.executeQuery(query);

			String resume = "XXXXXXXX";

			while (rs.next()) {
				if (!rs.getBoolean("atividade") && rs.getInt("escalao") <= age) {
					resume = rs.getString("resumo");
				}
			}
			if(resume == null)
				resume = HtmlStrings.FIRST_DESC_DETAILS+"This content don't have a description";
			else
				resume = HtmlStrings.FIRST_DESC_DETAILS+resume;
			
			query = "SELECT * FROM musica WHERE  idConteudo='" + content + "';";
			rs = statement.executeQuery(query);
			
			while (rs.next()) {
				resume = HtmlStrings.FIRST_LYRICS_DETAILS+rs.getString("letra");
			}
			
			return resume;
		} catch (SQLException e) {
			e.printStackTrace();
			return "XXXXXXXX";
		} finally {
			try {
				if (connect != null)
					connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// vai buscar as imagens á base dados
	public String getInfo(String content,int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			statement = connect.createStatement();
			
			String query = "SELECT * FROM conteudo WHERE  idConteudo='"+content+ "';";
			ResultSet rs = statement.executeQuery(query);
			
			String result= "";
			String title = "XXXXXXXX";
			String date = "XXXXXXXX";
			String ageContent = "XXXXXXXX";
			Integer idUser = -1;

			while (rs.next()) {
				if(!rs.getBoolean("atividade") && rs.getInt("escalao") <= age) {
					title = rs.getString("titulo");
					date = rs.getString("lancamento");
					ageContent = rs.getString("escalao");
					idUser = rs.getInt("idUtilizador");
				}
			}
			
			
			String userPost= "XXXXXXXXX";
			
			if(idUser != -1) {
				query = "SELECT * FROM utilizador WHERE  idUtilizador='"+idUser+ "';";
				rs = statement.executeQuery(query);
				
				while (rs.next()) {
					userPost = rs.getString("username");
				}
			}
			
			result = result+HtmlStrings.FIRST_DETAILS+title+HtmlStrings.SECOND_DETAILS+date+HtmlStrings.THIRTH_DETAILS+ageContent+HtmlStrings.FORTH_DETAILS+userPost+HtmlStrings.FIFTH_DETAILS;

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
	
	// vai buscar as imagens á base dados
	public String[] getArtistAndContent(String content, int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;
		Statement statement2 = null;

		try {
			statement = connect.createStatement();
			statement2= connect.createStatement();

			String query = "SELECT * FROM conteudo WHERE  idConteudo='" + content + "';";
			ResultSet rs = statement.executeQuery(query);
			

			boolean flag = false;
			String[] result = new String[2];
			result[0] = "XXXXXXXX";

			while (rs.next()) {
				if (!rs.getBoolean("atividade") && rs.getInt("escalao") <= age) {
					flag = true;
				}
			}

			if (flag) {
				query = "SELECT * FROM fotografia WHERE  idConteudo='" + content + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					Blob image = rs.getBlob("conteudo");

					byte[] bytes = image.getBytes(1, (int) image.length());
					String base64Image = Base64.getEncoder().encodeToString(bytes);

					result[1] = HtmlStrings.FIRST_IMAGE_DETAILS+"data:image/png;base64," + base64Image+HtmlStrings.SECOND_IMAGE_DETAILS;

					Integer idArtist = rs.getInt("idArtista");
					
					
					String query2 = "SELECT * FROM artista WHERE  idArtista='" + idArtist + "';";
					
					ResultSet rs2 = statement2.executeQuery(query2);
					while (rs2.next()) {
						result[0] = rs2.getString("nomeArtistico")+HtmlStrings.SIXTH_DETAILS;
					}
				}
				
				query = "SELECT * FROM filmes WHERE  idConteudo='" + content + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					Blob image = rs.getBlob("conteudo");

					byte[] bytes = image.getBytes(1, (int) image.length());
					String base64Image = Base64.getEncoder().encodeToString(bytes);

					result[1] = HtmlStrings.FIRST_VIDEO_DETAILS+"data:video/mp4;base64," + base64Image+HtmlStrings.SECOND_VIDEO_DETAILS;

					Integer idArtist = rs.getInt("idArtista");
					
					
					String query2 = "SELECT * FROM artista WHERE  idArtista='" + idArtist + "';";
					
					ResultSet rs2 = statement2.executeQuery(query2);
					while (rs2.next()) {
						result[0] = rs2.getString("nomeArtistico")+HtmlStrings.SIXTH_DETAILS;
					}
				}
				
				query = "SELECT * FROM poema WHERE  idConteudo='" + content + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					String poem = rs.getString("conteudo");

					result[1] = HtmlStrings.FIRST_POEM_DETAILS+poem+HtmlStrings.SECOND_POEM_DETAILS;

					Integer idArtist = rs.getInt("idArtista");
					
					
					String query2 = "SELECT * FROM artista WHERE  idArtista='" + idArtist + "';";
					
					ResultSet rs2 = statement2.executeQuery(query2);
					while (rs2.next()) {
						result[0] = rs2.getString("nomeArtistico")+HtmlStrings.SIXTH_DETAILS;
					}
				}
				
				query = "SELECT * FROM musica WHERE  idConteudo='" + content + "';";
				rs = statement.executeQuery(query);

				while (rs.next()) {
					Blob image = rs.getBlob("conteudo");

					byte[] bytes = image.getBytes(1, (int) image.length());
					String base64Audio = Base64.getEncoder().encodeToString(bytes);

					result[1] = HtmlStrings.FIRST_AUDIO_DETAILS+"data:audio/mpeg;base64,"+base64Audio+HtmlStrings.SECOND_AUDIO_DETAILS;

					Integer idArtist = rs.getInt("idConteudo");
					
					
					String query2 = "SELECT * FROM artista_participante WHERE  idConteudo='" + idArtist + "';";
					
					ArrayList<Integer> names = new ArrayList<>();
					
					ResultSet rs2 = statement2.executeQuery(query2);
					while (rs2.next()) {
						names.add(rs2.getInt("idArtista"));
					}
					
					String artists = "";
					
					for(int i = 0;i<names.size();i++) {
						query2 = "SELECT * FROM artista WHERE  idArtista='" + names.get(i) + "';";

						rs2 = statement2.executeQuery(query2);
						while (rs2.next()) {
							artists = artists+rs2.getString("nomeArtistico")+",";
						}
						artists = artists.substring(0,artists.length()-1);
					}
					result[0] = artists+HtmlStrings.SIXTH_DETAILS;
				}
			}

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
	
	public String getClassification(String content, int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;
		int[] x = new int[1];
		x[0] = Integer.parseInt(content);
		
		try {
			statement = connect.createStatement();

			String query = "SELECT * FROM conteudo WHERE  idConteudo='" + content + "';";
			ResultSet rs = statement.executeQuery(query);

			boolean flag = false;

			while (rs.next()) {
				if (!rs.getBoolean("atividade") && rs.getInt("escalao") <= age) {
					flag = true;
				}
			}
			
			float[] mean = ServiceTopClassification.getClassification(x);
			if(flag)
				return ""+mean[0];
			else
				return "-1";
		} catch (SQLException e) {
			e.printStackTrace();
			return "-1";
		} finally {
			try {
				if (connect != null)
					connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private String getContentSubmission(String username,String content,int age) {
		if(username != null) {
			Connection connect = ConnectionConfigurate.getConnection();
			Statement statement = null;
			
			try {
				statement = connect.createStatement();

				String query = "SELECT * FROM conteudo WHERE  idConteudo='" + content + "';";
				ResultSet rs = statement.executeQuery(query);

				int scale = 3;

				while (rs.next()) {
					scale = rs.getInt("escalao");
				}
				
				if(scale <= age) 
					return HtmlStrings.FIRST_FORM_CLASSIFICATION+content+HtmlStrings.SECOND_FORM_CLASSIFICATION+HtmlStrings.FIRST_FORM_COMMENT+content+HtmlStrings.SECOND_FORM_COMMENT;
				
				else 
					return null;
				
				
				
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
	
	private String getComments(String content, int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			statement = connect.createStatement();

			String query = "SELECT * FROM conteudo WHERE  idConteudo='" + content + "';";
			ResultSet rs = statement.executeQuery(query);

			int scale = 3;
			boolean active = true;

			while (rs.next()) {
				scale = rs.getInt("escalao");
				active = rs.getBoolean("atividade");
			}

			if (scale <= age && !active) {
				query = "SELECT * FROM comentario WHERE  idConteudo='" + content + "';";
				rs = statement.executeQuery(query);
				
				ArrayList<String> texts = new ArrayList<>();
				ArrayList<String> dates = new ArrayList<>();
				ArrayList<Integer> idUser = new ArrayList<>();
				
				while (rs.next()) {
					texts.add(rs.getString("texto"));
					dates.add(rs.getString("data"));
					idUser.add(rs.getInt("idUtilizador"));
				}
				ArrayList<String> usernames = new ArrayList<>();
				
				for(int i = 0;i<idUser.size();i++) {
					query = "SELECT * FROM utilizador WHERE  idUtilizador='" + idUser.get(i) + "';";
					rs = statement.executeQuery(query);
					
					while (rs.next()) {
						usernames.add(rs.getString("username"));
					}
				}
				String result = HtmlStrings.FIRST_COMMENT;
				
				for(int i = 0;i<idUser.size();i++) {
					result = result+HtmlStrings.SECOND_COMMENT+usernames.get(i)+HtmlStrings.THIRTH_COMMENT+texts.get(i)+HtmlStrings.FORTH_COMMENT+dates.get(i)+HtmlStrings.FIFTH_COMMENT;
				}
				result = result+HtmlStrings.SIXTH_COMMENT;
				return result;
			}

			return null;

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