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
import validation.Validator;

@WebServlet("/handleShowAllContent")
public class ServiceAllContent extends HttpServlet {

	protected static final long serialVersionUID = 1L;

	protected final int MAX_CONTENT = 50;
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		
		String user = (String)session.getAttribute("username");
		int age = 3;
		if(user != null) {
			String birthday = getBirthday(user);
			if(birthday != null) 
				age = Validator.calculateAge(birthday);
		}
		
		
		String content = showContent(age);
		
		String words = Titles.convertToString(Titles.getTitles(age))+Titles.convertToString(Titles.getArtists());
		
		words = words.substring(0,words.length()-1);
		
		session.setAttribute("age", age);
		
		session.setAttribute("content", content);
		
		session.setAttribute("words", words);
		
		session.setAttribute("search", null);
		
		session.setAttribute("artists", null);
		
		session.setAttribute("top", null);
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	//mostrar os conteúdos
	public String showContent(int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		String query = "SELECT * FROM conteudo;";

		ArrayList<Integer> id = new ArrayList<>();
		ArrayList<String> title = new ArrayList<>();
		ArrayList<String> date = new ArrayList<>();
		ArrayList<Integer> enable = new ArrayList<>();
		ArrayList<Integer> scale = new ArrayList<>();
		
		String query2 = "SELECT * FROM fotografia;";

		ArrayList<Integer> image = new ArrayList<>();
		
		
		String query3 = "SELECT * FROM filmes;";
		
		ArrayList<Integer> video = new ArrayList<>();

		String query4 = "SELECT * FROM musica;";
		
		ArrayList<Integer> audio = new ArrayList<>();
		
		String query5 = "SELECT * FROM poema;";
		
		ArrayList<Integer> poem = new ArrayList<>();

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				id.add(rs.getInt("idConteudo"));
				title.add(rs.getString("titulo"));
				date.add(rs.getString("lancamento"));
				enable.add(rs.getInt("atividade"));
				scale.add(rs.getInt("escalao"));
			}

			rs = statement.executeQuery(query2);

			while (rs.next()) {
				image.add(rs.getInt("idConteudo"));
			}
			
			rs = statement.executeQuery(query3);

			while (rs.next()) {
				video.add(rs.getInt("idConteudo"));
			}
			
			rs = statement.executeQuery(query4);

			while (rs.next()) {
				audio.add(rs.getInt("idConteudo"));
			}
			
			rs = statement.executeQuery(query5);

			while (rs.next()) {
				poem.add(rs.getInt("idConteudo"));
			}

			String[] result = new String[id.size()];

			int count = 0;

			for (int i = 0; i < id.size(); i++) {
				if (count == MAX_CONTENT)
					break;
				
				// conteudo para imagens
				else if (enable.get(i) == 0 && scale.get(i) <= age && isContent(id.get(i),image)) {
					
					query = "SELECT * FROM fotografia WHERE idConteudo='"+id.get(i)+"';";
					
					rs = statement.executeQuery(query);
					
					String base64Image = null;

					while (rs.next()) {
						Blob imageBlob = rs.getBlob("conteudo");

						byte[] bytes = imageBlob.getBytes(1, (int) imageBlob.length());
						base64Image = Base64.getEncoder().encodeToString(bytes);
					}

					result[i] = HtmlStrings.FIRST_IMAGE + HtmlStrings.FILTER_PHOTO + HtmlStrings.SECOND_IMAGE+HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.THIRTH_IMAGE+"data:image/png;base64,";
					result[i] = result[i]+base64Image+HtmlStrings.FORTH_IMAGE + HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.FIFTH_IMAGE + title.get(i)
							+ HtmlStrings.SIXTH_IMAGE + date.get(i) + HtmlStrings.SEVENTH_IMAGE;
					count++;
				}

				// conteudo para videos
				else if (enable.get(i) == 0 && scale.get(i) <= age && isContent(id.get(i),video)) {
					query = "SELECT * FROM filmes WHERE idConteudo='"+id.get(i)+"';";
					
					rs = statement.executeQuery(query);
					
					String base64Image = null;

					while (rs.next()) {
						Blob imageBlob = rs.getBlob("conteudo");

						byte[] bytes = imageBlob.getBytes(1, (int) imageBlob.length());
						base64Image = Base64.getEncoder().encodeToString(bytes);
					}
					
					result[i] = HtmlStrings.FIRST_VIDEO + HtmlStrings.FILTER_VIDEO +HtmlStrings. SECOND_VIDEO+ HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.THIRD_VIDEO+"data:video/mp4;base64,";
					result[i] = result[i]+base64Image+HtmlStrings.FORTH_VIDEO + HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.FIFTH_VIDEO + title.get(i)
							+ HtmlStrings.SIXTH_VIDEO + date.get(i) + HtmlStrings.SEVENTH_VIDEO;
					count++;
				}
				
				// conteudo para audio
				else if (enable.get(i) == 0 && scale.get(i) <= age && isContent(id.get(i),audio)) {
					query = "SELECT * FROM musica WHERE idConteudo='"+id.get(i)+"';";
					
					rs = statement.executeQuery(query);
					
					String base64Image = null;

					while (rs.next()) {
						Blob imageBlob = rs.getBlob("conteudo");

						byte[] bytes = imageBlob.getBytes(1, (int) imageBlob.length());
						base64Image = Base64.getEncoder().encodeToString(bytes);
					}
					
					result[i] = HtmlStrings.FIRST_AUDIO + HtmlStrings.FILTER_AUDIO + HtmlStrings.SECOND_AUDIO+HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.THIRTH_AUDIO+"data:audio/mpeg;base64,";
					result[i] = result[i]+base64Image+ HtmlStrings.FORTH_AUDIO + HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.FIFTH_AUDIO + title.get(i)
							+ HtmlStrings.SIXTH_AUDIO + date.get(i) + HtmlStrings.SEVENTH_AUDIO;
					count++;
				}
				
				else if (enable.get(i) == 0 && scale.get(i) <= age) {
					query = "SELECT * FROM poema WHERE idConteudo='"+id.get(i)+"';";
					
					rs = statement.executeQuery(query);
					
					String poemDB = null;

					while (rs.next()) {
						poemDB = rs.getString("conteudo");
					}
					
					result[i] = HtmlStrings.FIRST_POEM + HtmlStrings.FILTER_OTHER + HtmlStrings.SECOND_POEM+HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.THIRTH_POEM;
					result[i] = result[i]+poemDB+ HtmlStrings.FORTH_POEM + HtmlStrings.CONTENT_REDIRECT + id.get(i) + HtmlStrings.FIFTH_POEM + title.get(i)
							+ HtmlStrings.SIXTH_POEM + date.get(i) + HtmlStrings.SEVENTH_POEM;
					count++;
				}

			}
			
			String resultString = "";
			for (int i = 0; i < result.length; i++) {
				resultString = resultString+result[i];
			}
			

			return resultString;
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

	
	//verifica se o indice corrente é de um certo conteúdo
	private boolean isContent(int id, ArrayList<Integer> image) {
		for(int i =  0; i < image.size();i++) {
			if(id == image.get(i)) 
				return true;
		}
		return false;
	}
	
	//vai buscar a data de aniversario de um utilizador(para saber a idade)
	public String getBirthday(String username) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		String query = "SELECT dataNascimento FROM utilizador WHERE username = \""+username+"\";";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				return rs.getString("dataNascimento");
				
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