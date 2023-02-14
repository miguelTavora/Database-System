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

@WebServlet("/handleAutoComplete")
public class ServiceAutoComplete extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String word = request.getParameter("myCountry");

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		
		if(word != null) {
			int age = (Integer)session.getAttribute("age");
			
			String contents = getContent(word,age);
			if(contents != "")
				session.setAttribute("content", contents);
			else
				session.setAttribute("content", null);
			
			
			String artists = getContentArtist(word,age);
			if(artists != "") 
				session.setAttribute("artists", artists);
			
			else
				session.setAttribute("artists", null);
		}
		
		
		session.setAttribute("search", word);
		
		session.setAttribute("top", null);
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	public String getContent(String word, int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		ArrayList<Integer> ids = new ArrayList<>();
		ArrayList<String> date = new ArrayList<>();
		ArrayList<String> titles = new ArrayList<>();
		

		String query = "SELECT * FROM conteudo;";
		
		word = word.toLowerCase();

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				if(rs.getBoolean("atividade") == false && rs.getInt("escalao") <= age) {
					String title = rs.getString("titulo").toLowerCase(); 
					if(title.startsWith(word)) {
						ids.add(rs.getInt("idConteudo"));
						date.add(rs.getString("lancamento"));
						titles.add(rs.getString("titulo"));
					}
				}
					
			}
			String result = "";
			
			for(int i = 0;i<ids.size();i++) {
				query = "SELECT * FROM fotografia WHERE idConteudo='"+ids.get(i)+"';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob image = rs.getBlob("conteudo");

					byte[] bytes = image.getBytes(1, (int) image.length());
					String base64Image = Base64.getEncoder().encodeToString(bytes);
					
					result = result + HtmlStrings.FIRST_IMAGE + HtmlStrings.FILTER_PHOTO + HtmlStrings.SECOND_IMAGE+HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.THIRTH_IMAGE
							+"data:image/png;base64,"+base64Image;
					
					result = result+HtmlStrings.FORTH_IMAGE + HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.FIFTH_IMAGE + titles.get(i)
					+ HtmlStrings.SIXTH_IMAGE + date.get(i) + HtmlStrings.SEVENTH_IMAGE;
				}
				
				
				
				query = "SELECT * FROM filmes WHERE idConteudo='"+ids.get(i)+"';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob video = rs.getBlob("conteudo");

					byte[] bytes = video.getBytes(1, (int) video.length());

					String base64Video = Base64.getEncoder().encodeToString(bytes);
					
					
					result = result + HtmlStrings.FIRST_VIDEO + HtmlStrings.FILTER_VIDEO +HtmlStrings. SECOND_VIDEO+ HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.THIRD_VIDEO
							+"data:video/mp4;base64," +base64Video;
					
					result = result +HtmlStrings.FORTH_VIDEO + HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.FIFTH_VIDEO + titles.get(i)
							+ HtmlStrings.SIXTH_VIDEO + date.get(i) + HtmlStrings.SEVENTH_VIDEO;
				}
				
				
				
				query = "SELECT * FROM musica WHERE idConteudo='"+ids.get(i)+"';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob audio = rs.getBlob("conteudo");

					byte[] bytes = audio.getBytes(1, (int) audio.length());

					String base64Audio = Base64.getEncoder().encodeToString(bytes);
					
					
					result = result +HtmlStrings.FIRST_AUDIO + HtmlStrings.FILTER_AUDIO + HtmlStrings.SECOND_AUDIO+HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.THIRTH_AUDIO
							+"data:audio/mpeg;base64,"+base64Audio;
					
					result = result + HtmlStrings.FORTH_AUDIO + HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.FIFTH_AUDIO + titles.get(i)
							+ HtmlStrings.SIXTH_AUDIO + date.get(i) + HtmlStrings.SEVENTH_AUDIO;
				}
				
				
				
				query = "SELECT * FROM poema WHERE idConteudo='"+ids.get(i)+"';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					result = result + HtmlStrings.FIRST_POEM + HtmlStrings.FILTER_OTHER + HtmlStrings.SECOND_POEM+HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.THIRTH_POEM+rs.getString("conteudo");
					result = result + HtmlStrings.FORTH_POEM + HtmlStrings.CONTENT_REDIRECT + ids.get(i) + HtmlStrings.FIFTH_POEM + titles.get(i)
							+ HtmlStrings.SIXTH_POEM + date.get(i) + HtmlStrings.SEVENTH_POEM;
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
	
	public String getContentArtist(String word, int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;
		Statement statement2 = null;

		ArrayList<Integer> ids = new ArrayList<>();
		ArrayList<String> names = new ArrayList<>();
		
		String query = "SELECT * FROM artista;";
		
		word = word.toLowerCase();

		try {
			statement = connect.createStatement();
			statement2 = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				String title = rs.getString("nomeArtistico").toLowerCase(); 
				if(title.startsWith(word)) {
					ids.add(rs.getInt("idArtista"));
					names.add(rs.getString("nomeArtistico"));
				}
			}
			boolean firstArtist = true;
			
			String[] results = new String[ids.size()];
			
			for (int i = 0; i < ids.size(); i++) {
				query = "SELECT * FROM tipo_artista WHERE idArtista='" + ids.get(i) + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {

					int poeth = rs.getInt("poeta");
					int movie_realizer = rs.getInt("realizador");
					int photographer = rs.getInt("fotografo");
					int actor = rs.getInt("ator");
					int musician = rs.getInt("musico");
					int music_writter = rs.getInt("escritor_musica");

					if (firstArtist) {
						results[i] = results[i] + HtmlStrings.FIRST_ARTIST + names.get(i) + HtmlStrings.SECOND_ARTIST;
						firstArtist = false;
					} else 
						results[i] = results[i] + HtmlStrings.FIRST_ARTIST_2 + names.get(i) + HtmlStrings.SECOND_ARTIST;
					
					String x = "";
					if (poeth == 1)
						x = x + "Poeth, ";
					if (movie_realizer == 1)
						x = x + "Film maker, ";
					if (photographer == 1)
						x = x + "Photographer, ";
					if (actor == 1)
						x = x + "Actor, ";
					if (musician == 1)
						x = x + "Musician, ";
					if (music_writter == 1)
						x = x + "Music writter, ";

					x = x.substring(0, x.length() - 2);

					results[i] = results[i] + HtmlStrings.THIRTH_ARTIST + x + HtmlStrings.FORTH_ARTIST;

				}
				
			}
			
			for (int i = 0; i < ids.size(); i++) {
				String resultContent = "";
				
				
				/*-------- Fotografia --------------*/
				query = "SELECT * FROM fotografia WHERE idArtista='" + ids.get(i) + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob image = rs.getBlob("conteudo");

					byte[] bytes = image.getBytes(1, (int) image.length());
					String base64Image = Base64.getEncoder().encodeToString(bytes);
					
					String idConteudo = rs.getString("idConteudo");
					String query2 = "SELECT * FROM conteudo WHERE idConteudo ='"+idConteudo+"';";
					
					ResultSet rs2 = statement2.executeQuery(query2);

					while (rs2.next()) {
						if (rs2.getBoolean("atividade") == false && rs2.getInt("escalao") <= age) {
							resultContent = resultContent + HtmlStrings.FIRST_IMAGE + HtmlStrings.FILTER_PHOTO
									+ HtmlStrings.SECOND_IMAGE + HtmlStrings.CONTENT_REDIRECT + idConteudo
									+ HtmlStrings.THIRTH_IMAGE + "data:image/png;base64," + base64Image;

							resultContent = resultContent + HtmlStrings.FORTH_IMAGE + HtmlStrings.CONTENT_REDIRECT
									+ idConteudo + HtmlStrings.FIFTH_IMAGE + rs2.getString("titulo")
									+ HtmlStrings.SIXTH_IMAGE + rs2.getString("lancamento") + HtmlStrings.SEVENTH_IMAGE;
						}
					}
					
				}
				
	
				
				
				ArrayList<Integer> idsUsed = new ArrayList<>();
				/*-------- Videos --------------*/
				query = "SELECT * FROM filmes WHERE idArtista='" + ids.get(i) + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob video = rs.getBlob("conteudo");

					byte[] bytes = video.getBytes(1, (int) video.length());

					String base64Video = Base64.getEncoder().encodeToString(bytes);
					
					
					int idConteudo = rs.getInt("idConteudo");
					String query2 = "SELECT * FROM conteudo WHERE idConteudo ='"+idConteudo+"';";
					
					idsUsed.add(idConteudo);
					ResultSet rs2 = statement2.executeQuery(query2);
					
					while (rs2.next()) {
						if (rs2.getBoolean("atividade") == false && rs2.getInt("escalao") <= age) {
							resultContent = resultContent + HtmlStrings.FIRST_VIDEO + HtmlStrings.FILTER_VIDEO
									+ HtmlStrings.SECOND_VIDEO + HtmlStrings.CONTENT_REDIRECT + idConteudo
									+ HtmlStrings.THIRD_VIDEO + "data:video/mp4;base64," + base64Video;

							resultContent = resultContent + HtmlStrings.FORTH_VIDEO + HtmlStrings.CONTENT_REDIRECT
									+ idConteudo + HtmlStrings.FIFTH_VIDEO + rs2.getString("titulo")
									+ HtmlStrings.SIXTH_VIDEO + rs2.getString("lancamento") + HtmlStrings.SEVENTH_VIDEO;
						}
					}
				}
				
				
				
				
				/*-------- Musicas e filmes --------------*/
				query = "SELECT * FROM artista_participante WHERE idArtista='" + ids.get(i) + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					int idConteudo = rs.getInt("idConteudo");
					
					String query2 = "SELECT * FROM conteudo WHERE idConteudo ='"+idConteudo+"';";
					
					ResultSet rs2 = statement2.executeQuery(query2);
					
					String title = "";
					String date = "";
					boolean flag = false;
					
					while (rs2.next()) {
						if (rs2.getBoolean("atividade") == false && rs2.getInt("escalao") <= age) {
							title = rs2.getString("titulo");
							date = rs2.getString("lancamento");
							flag = true;
						}
					}
					if (flag) {
						if (!isUsed(idsUsed, idConteudo)) {
							query2 = "SELECT * FROM filmes WHERE idConteudo='" + idConteudo + "';";

							rs2 = statement2.executeQuery(query2);

							while (rs2.next()) {
								Blob video = rs2.getBlob("conteudo");

								byte[] bytes = video.getBytes(1, (int) video.length());

								String base64Video = Base64.getEncoder().encodeToString(bytes);

								resultContent = resultContent + HtmlStrings.FIRST_VIDEO + HtmlStrings.FILTER_VIDEO
										+ HtmlStrings.SECOND_VIDEO + HtmlStrings.CONTENT_REDIRECT + idConteudo
										+ HtmlStrings.THIRD_VIDEO + "data:video/mp4;base64," + base64Video;

								resultContent = resultContent + HtmlStrings.FORTH_VIDEO + HtmlStrings.CONTENT_REDIRECT
										+ idConteudo + HtmlStrings.FIFTH_VIDEO + title + HtmlStrings.SIXTH_VIDEO + date
										+ HtmlStrings.SEVENTH_VIDEO;
							}
						}

						query2 = "SELECT * FROM musica WHERE idConteudo='" + idConteudo + "';";

						rs2 = statement2.executeQuery(query2);

						while (rs2.next()) {
							Blob video = rs2.getBlob("conteudo");

							byte[] bytes = video.getBytes(1, (int) video.length());

							String base64Audio = Base64.getEncoder().encodeToString(bytes);

							resultContent = resultContent + HtmlStrings.FIRST_AUDIO + HtmlStrings.FILTER_AUDIO
									+ HtmlStrings.SECOND_AUDIO + HtmlStrings.CONTENT_REDIRECT + idConteudo
									+ HtmlStrings.THIRTH_AUDIO + "data:audio/mpeg;base64," + base64Audio;

							resultContent = resultContent + HtmlStrings.FORTH_AUDIO + HtmlStrings.CONTENT_REDIRECT
									+ idConteudo + HtmlStrings.FIFTH_AUDIO + title + HtmlStrings.SIXTH_AUDIO + date
									+ HtmlStrings.SEVENTH_AUDIO;
						}
					}
					
				}
				
				/*-------- Fotografia --------------*/
				query = "SELECT * FROM poema WHERE idArtista='" + ids.get(i) + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					String content = rs.getString("conteudo");
					
					String idConteudo = rs.getString("idConteudo");
					String query2 = "SELECT * FROM conteudo WHERE idConteudo ='"+idConteudo+"';";
					
					ResultSet rs2 = statement2.executeQuery(query2);

					while (rs2.next()) {
						if (rs2.getBoolean("atividade") == false && rs2.getInt("escalao") <= age) {
							resultContent = resultContent + HtmlStrings.FIRST_POEM + HtmlStrings.FILTER_OTHER
									+ HtmlStrings.SECOND_POEM + HtmlStrings.CONTENT_REDIRECT + idConteudo
									+ HtmlStrings.THIRTH_POEM + content;
							resultContent = resultContent + HtmlStrings.FORTH_POEM + HtmlStrings.CONTENT_REDIRECT
									+ idConteudo + HtmlStrings.FIFTH_POEM + rs2.getString("titulo")
									+ HtmlStrings.SIXTH_POEM + rs2.getString("lancamento") + HtmlStrings.SEVENTH_POEM;
						}
					}
					
				}
			
				results[i] = results[i]+resultContent+HtmlStrings.FIFTH_ARTIST;
				
			}
			String result = "";
			
			for(int i = 0; i<results.length;i++) {
				result = result+results[i];
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
	
	private boolean isUsed(ArrayList<Integer> used, int id) {
		for(int i = 0; i<used.size();i++) {
			if(used.get(i) == id)
				return true;
		}
		return false;
	}
	
}