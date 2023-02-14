package content;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sql.ConnectionConfigurate;

public class Titles {

	
	public static ArrayList<String> getTitles(int age) {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		ArrayList<String> titles = new ArrayList<>();

		String query = "SELECT * FROM conteudo;";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				if(rs.getBoolean("atividade") == false && rs.getInt("escalao") <= age)
					titles.add(rs.getString("titulo"));
			}

			return titles;
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
	
	public static String convertToString(ArrayList<String> titles) {
		String result = "";
		
		for(int i = 0; i<titles.size();i++) {
			result = result+"\""+titles.get(i)+"\",";
		}
		return result;
	}
	
	public static ArrayList<String> getArtists() {
		Connection connect = ConnectionConfigurate.getConnection();
		Statement statement = null;

		ArrayList<String> artista = new ArrayList<>();

		String query = "SELECT * FROM artista;";

		try {
			statement = connect.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				artista.add(rs.getString("nomeArtistico"));
			}

			return artista;
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
	
	public static boolean isIndex(int[] x, int y) {
		for(int i = 0;i<x.length;i++) {
			if(x[i] == y)
				return true;
		}
		return false;
	}
	
	
	/*public static void main(String[] args) {
		int[] index = getX(3);
		float[] a = getClassification(index);
		for(int i = 0;i<a.length;i++) {
		System.out.println(a[i]);
		}
		
		
		int[] index2 = {5,4,15,13,6,10,8,7,11,17};
		float[] ax = {9.75f,7.5f,6.0f,7.5f,7.0f,7.0f,3.0f,7.5f,2.0f,6.0f};
		getContent(a,index);
		
		
	}*/
}
