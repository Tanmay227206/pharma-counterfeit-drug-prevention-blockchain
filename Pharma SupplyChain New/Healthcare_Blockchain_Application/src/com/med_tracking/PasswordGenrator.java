package com.med_tracking;

import java.util.Random;

public class PasswordGenrator {
	public static String skKeyGenerate() 
	{
		char[] chars = "1234567890abcdefghijklmnopqrstuvwxyz".toCharArray();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 8; i++) {
		    char c = chars[random.nextInt(chars.length)];
		    sb.append(c);
		}
		String output = sb.toString();
		return output;
	}
}
