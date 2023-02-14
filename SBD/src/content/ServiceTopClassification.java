package content;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.ConnectionConfigurate;
import validation.Validator;

@WebServlet("/handleTop10")
public class ServiceTopClassification extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final int MAX = 10;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}

		int age = (Integer) session.getAttribute("age");

		int[] indexes = getDates(age);

		float[] means = getClassification(indexes);
		
		String content = getContent(means,indexes);

		session.setAttribute("search", null);

		session.setAttribute("artists", null);
		
		session.setAttribute("content", content);
		
		session.setAttribute("search", null);
		
		session.setAttribute("top", true);

		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public int[] getDates(int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		ArrayList<String> date = new ArrayList<>();
		ArrayList<Integer> ids = new ArrayList<>();

		String query = "SELECT * FROM conteudo;";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			int count = 0;
			while (rs.next()) {
				if (count == MAX)
					break;

				else if (rs.getBoolean("atividade") == false && rs.getInt("escalao") <= age) {
					date.add(rs.getString("lancamento"));
					ids.add(rs.getInt("idConteudo"));
					count++;
				}
			}

			String[] dates = new String[date.size()];
			int[] idx = new int[date.size()];

			for (int i = 0; i < date.size(); i++) {
				dates[i] = date.get(i);
				idx[i] = ids.get(i);
			}

			for (int i = 0; i < dates.length; i++) {
				for (int j = 0; j < dates.length; j++) {
					if (i != j && Validator.compareDates(dates[i], dates[j])) {
						String x = dates[i];
						dates[i] = dates[j];
						dates[j] = x;

						int index = idx[i];
						idx[i] = idx[j];
						idx[j] = index;
					}
				}
			}

			return idx;
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

	public static float[] getClassification(int[] indexes) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		try {
			String query = "SELECT * FROM classificacao;";

			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			HashMap<Integer, ArrayList<Integer>> classification = new HashMap<>();

			while (rs.next()) {
				int index = rs.getInt("idConteudo");

				if (isIndex(indexes, index)) {

					ArrayList<Integer> classif = classification.get(index);

					if (classif == null)
						classif = new ArrayList<>();

					classif.add(rs.getInt("valor"));

					classification.put(index, classif);
				}

			}
			float[] index = new float[indexes.length];

			for (int i = 0; i < indexes.length; i++) {
				ArrayList<Integer> clas = classification.get(indexes[i]);
				float mean = 0;
				if(clas != null) {
					for (int j = 0; j < clas.size(); j++) {
						mean = mean + clas.get(j);
					}
					mean = mean / clas.size();
					index[i] = mean;
				}
			}

			return index;
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

	public String getContent(float[] means, int[] indexes) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;
		
		ArrayList<String> title = new ArrayList<>();
		

		try {
			statement = connect.createStatement();
			
			float[] indexSorted = new float[means.length];
			
			for(int i = 0;i<means.length;i++) {
				indexSorted[i] = means[i];
			}
			
			for(int i = 0;i<indexSorted.length;i++) {
				for(int j = 0;j<indexSorted.length;j++) {
					if(i!=j && indexSorted[i]> indexSorted[j]) {
						float x = indexSorted[i];
						indexSorted[i] = indexSorted[j];
						indexSorted[j] = x;
					}
				}
			}
			
			
			HashMap<Float,Integer> repetead = new HashMap<>();
			ArrayList<Float> rep = new ArrayList<>();
			
			for(int i = 0;i<indexSorted.length;i++) {
				for(int j = i+1;j<indexSorted.length;j++) {
					if(indexSorted[i] == indexSorted[j] && !isIndexFloat(rep,indexSorted[i])) {
						Integer count = repetead.get(indexSorted[i]);
						
						if(count != null)
							repetead.put(indexSorted[i], count+1);
						else
							repetead.put(indexSorted[i], 2);
					}
				}
				rep.add(indexSorted[i]);
			}
			
			int[] indexMeans = new int[indexes.length];
			
			HashMap<Float,Integer> repIndexex = new HashMap<>();
			
			for(int i = 0;i<indexSorted.length;i++) {
				Integer count = repetead.get(indexSorted[i]);
				
				Integer countCut = repIndexex.get(indexSorted[i]);
				if(countCut == null)
					countCut = 0;
				if(count != null)
					count = count-(count-countCut);

				
				for(int j = 0;j<indexSorted.length;j++) {
					if(indexSorted[i] == means[j] && count == null) {
						indexMeans[i] = indexes[j];
						break;
					}
					else if(indexSorted[i] == means[j] && count == 0) {
						indexMeans[i] = indexes[j];
						break;
					}
					else if(indexSorted[i] == means[j] && count > 0) {
						count--;
					}
				}
				
				Integer countIndex = repIndexex.get(indexSorted[i]);
				if(countIndex == null)
					countIndex = 0;
				repIndexex.put(indexSorted[i],countIndex+1);
				
			}
			
			String query = "";
			for (int i = 0; i < indexMeans.length; i++) {
				query = "SELECT * FROM conteudo WHERE idConteudo='" + indexMeans[i] + "';";
				ResultSet rs = statement.executeQuery(query);

				while (rs.next()) {
					int index = rs.getInt("idConteudo");
					
					if(isIndex(indexes,index)) 
						title.add(rs.getString("titulo"));
					
				}
			}
			
			
			String result = "";

			for (int i = 0; i < indexMeans.length; i++) {
				query = "SELECT * FROM fotografia WHERE idConteudo='" + indexMeans[i] + "';";
				ResultSet rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob image = rs.getBlob("conteudo");

					byte[] bytes = image.getBytes(1, (int) image.length());
					String base64Image = Base64.getEncoder().encodeToString(bytes);

					result = result + HtmlStrings.FIRST_IMAGE + HtmlStrings.FILTER_PHOTO + HtmlStrings.SECOND_IMAGE
							+ HtmlStrings.CONTENT_REDIRECT + indexMeans[i] + HtmlStrings.THIRTH_IMAGE
							+ "data:image/png;base64," + base64Image;

					result = result + HtmlStrings.FORTH_IMAGE + HtmlStrings.CONTENT_REDIRECT + indexMeans[i]
							+ HtmlStrings.FIFTH_IMAGE + title.get(i) + HtmlStrings.SIXTH_IMAGE + "Classification: "+indexSorted[i]
							+ HtmlStrings.SEVENTH_IMAGE;
				}

				query = "SELECT * FROM filmes WHERE idConteudo='" + indexMeans[i] + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob video = rs.getBlob("conteudo");

					byte[] bytes = video.getBytes(1, (int) video.length());

					String base64Video = Base64.getEncoder().encodeToString(bytes);

					result = result + HtmlStrings.FIRST_VIDEO + HtmlStrings.FILTER_VIDEO + HtmlStrings.SECOND_VIDEO
							+ HtmlStrings.CONTENT_REDIRECT + indexMeans[i] + HtmlStrings.THIRD_VIDEO
							+ "data:video/mp4;base64," + base64Video;

					result = result + HtmlStrings.FORTH_VIDEO + HtmlStrings.CONTENT_REDIRECT + indexMeans[i]
							+ HtmlStrings.FIFTH_VIDEO + title.get(i) + HtmlStrings.SIXTH_VIDEO + "Classification: "+indexSorted[i]
							+ HtmlStrings.SEVENTH_VIDEO;
				}

				query = "SELECT * FROM musica WHERE idConteudo='" + indexMeans[i] + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					Blob audio = rs.getBlob("conteudo");

					byte[] bytes = audio.getBytes(1, (int) audio.length());

					String base64Audio = Base64.getEncoder().encodeToString(bytes);

					result = result + HtmlStrings.FIRST_AUDIO + HtmlStrings.FILTER_AUDIO + HtmlStrings.SECOND_AUDIO
							+ HtmlStrings.CONTENT_REDIRECT + indexMeans[i] + HtmlStrings.THIRTH_AUDIO
							+ "data:audio/mpeg;base64," + base64Audio;

					result = result + HtmlStrings.FORTH_AUDIO + HtmlStrings.CONTENT_REDIRECT + indexMeans[i]
							+ HtmlStrings.FIFTH_AUDIO + title.get(i) + HtmlStrings.SIXTH_AUDIO + "Classification: "+indexSorted[i]
							+ HtmlStrings.SEVENTH_AUDIO;
				}

				query = "SELECT * FROM poema WHERE idConteudo='" + indexMeans[i] + "';";
				rs = statement.executeQuery(query);
				while (rs.next()) {
					result = result + HtmlStrings.FIRST_POEM + HtmlStrings.FILTER_OTHER + HtmlStrings.SECOND_POEM
							+ HtmlStrings.CONTENT_REDIRECT + indexMeans[i] + HtmlStrings.THIRTH_POEM
							+ rs.getString("conteudo");
					result = result + HtmlStrings.FORTH_POEM + HtmlStrings.CONTENT_REDIRECT + indexMeans[i]
							+ HtmlStrings.FIFTH_POEM + title.get(i) + HtmlStrings.SIXTH_POEM + "Classification: "+indexSorted[i]
							+ HtmlStrings.SEVENTH_POEM;
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
	
	public boolean isIndexFloat(ArrayList<Float> x, float y) {
		for (int i = 0; i < x.size(); i++) {
			if (x.get(i) == y)
				return true;
		}
		return false;
	}

	private static boolean isIndex(int[] x, int y) {
		for (int i = 0; i < x.length; i++) {
			if (x[i] == y)
				return true;
		}
		return false;
	}
}