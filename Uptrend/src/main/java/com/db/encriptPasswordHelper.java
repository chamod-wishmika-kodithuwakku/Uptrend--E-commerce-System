package com.db;

public class encriptPasswordHelper {

	public static String changePassToEncript(String pass) {

		String encriptPassword = "";

		char[] chars = pass.toCharArray();
		for (char c : chars) {
			c += 20;
			String letterHolder = Character.toString(c);
			encriptPassword = encriptPassword + letterHolder;
		}

		return encriptPassword;
	}

}
