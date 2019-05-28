package com.coffee.auth;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


//앞으로 데이터베이스에 비밀번호를 넣을때는 일반 텍스트로 넣지말고, 보안 목적상 암호화된 데이터로 넣어보자...!!!
public class SecurityBean {
	//일반 텍스트를 해시값으로 변환하여 반환하는 메서드...
	public String textToHash(String password) {
		StringBuilder sb = new StringBuilder();
		try {
			//내가 사용할 알고리즘 선택하기  
			//종류 : 224, 256, 384, 512
			MessageDigest md = MessageDigest.getInstance("SHA-224");
			md.update(password.getBytes());
			
			//암호화 된 바이트 반환받기...
			byte[] data =md.digest();
			for(int i = 0; i < data.length; i++) {
				sb.append(Integer.toString((data[i]&0xff)+0x100,16).substring(1));
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();
	}
}
