package util;

import java.security.MessageDigest;
import org.apache.commons.codec.binary.Base64; // Sử dụng Apache Commons Codec

public class EncodePassword {
	public static String toSHA1(String str) {
		String rs = null;
		String salt = "23lklj2jn!@%$ASa";
		str += salt;
		try {
			byte[] data = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA1");
			// Sử dụng org.apache.commons.codec.binary.Base64
			rs = Base64.encodeBase64String(md.digest(data));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static void main(String[] args) {
		System.out.println(toSHA1("12345"));
	}
}