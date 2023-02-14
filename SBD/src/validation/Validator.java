package validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;

public class Validator {

	public static boolean isLettersAndNumbers(String s) {
		String regex = "^[a-zA-Z0-9]+$";
		return s.matches(regex);
	}

	public static boolean isValidCountry(String country) {
		String[] countrys = { "Afghanistan", "South Africa", "Albania", "Germany", "Andorra", "Angola", "Saudi Arabia",
				"Algeria", "Argentina", "Australia", "Austria", "Belgium", "Brazil", "Cameroon", "Canada", "Chile",
				"China", "Cyprus", "North Korea", "South Korea", "Denmark", "Spain", "Philippines", "Finland", "France",
				"Greece", "Guinea", "Guinea-Bissau", "India", "Iran", "Iraq", "Ireland", "Iceland", "Israel", "Italy",
				"Japan", "Jamaica", "Lithuania", "Luxembourg", "Mexico", "Mozambique", "Norway", "New Zealand",
				"Netherlands", "Paraguay", "Puerto Rico", "Portugal", "United Kingdom", "Russia", "Switzerland",
				"Sweden", "Zimbabwe" };

		return Arrays.stream(countrys).anyMatch(country::equals);
	}

	public static boolean isValidFormat(String value) {
		Date date = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			date = sdf.parse(value);
			if (!value.equals(sdf.format(date))) {
				date = null;
			}
		} catch (ParseException ex) {
			ex.printStackTrace();
		}
		return date != null;
	}

	public static int calculateAge(String birthDate) {

		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthDate);
			LocalDate bday = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			
			
			Date dateCurrent = new Date(System.currentTimeMillis());
			
			LocalDate current = dateCurrent.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			
			
			if ((bday != null) && (current != null)) {
				return Period.between(bday, current).getYears();
			} else {
				return 3;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 3;
		
	}
	
	
	public static boolean compareDates(String d1, String d2) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = sdf.parse(d1);
			Date date2 = sdf.parse(d2);

			if (date1.after(date2)) {
				return true;
			}
			return false;

		} catch (ParseException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public static boolean isValidClassification(String classification) {
		int classify = Integer.parseInt(classification);
		
		return classify > 0 && classify< 11;
			
	}
	
	public static String getCurrentDate() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	
	public static boolean verifyComment(String comment) {
		return comment != null && comment.trim().length() > 0;
	}
	
	public static boolean validPassword(String password) {
		return password.length()  > 5;
	}
	
}
