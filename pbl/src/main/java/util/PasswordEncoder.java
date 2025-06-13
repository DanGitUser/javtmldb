package util;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class PasswordEncoder {

    public static String encode(String rawPassword) {
        return BCrypt.withDefaults().hashToString(10, rawPassword.toCharArray());
    }

    public static boolean matches(String rawPassword, String encodedPassword) {
        BCrypt.Result result = BCrypt.verifyer().verify(rawPassword.toCharArray(), encodedPassword);
        return result.verified;
    }
    
//    public static void main(String[] args) {
//		String origin = "평문";
//		String encoded1 = encode(origin);
//		String encoded2 = encode(origin);
//		String encoded3 = encode(origin);
//		
//		System.out.println(encoded1);
//		System.out.println(encoded2);
//		System.out.println(encoded3);
//		
//		String[] encodeds = {
//				"$2a$10$iH4H0oR0HAMLuSw2XHQw/umyg5J82FykwzBfO0FfP84LzXOG9WbZu"
//				, "$2a$10$pSAOfuJiOhqSc926j3/mwevhexYt0uoymOSC0mU7W7DZUI6XOhana"
//				, "$2a$10$1x.aBOMfWJOjjg5xTFMK5uV4UR0WzP91IyJnIO1aN0saLotT2.9M2"
//		};
//		
//		System.out.println(matches("평문", encodeds[0]));
//		System.out.println(matches("평문2", encodeds[0]));
//	}
}