package com.web.common;

import java.security.MessageDigest;

public class SHA256 {
	public static String getSHA256(String input) {//특정값을 넣었을때 그 값을 SHA256으로 해시값을 구함
		StringBuffer result=new StringBuffer();
		try {
			MessageDigest digest=MessageDigest.getInstance("SHA-256");//실제로 사용자가 입력한 값을 SHA256 알고리즘을 적용
			byte[] salt="Hello! This is Salt.".getBytes();//sha256을 적용하고 salt값을? 해커?/뭐래?
			digest.reset();
			digest.update(salt);//salt값 적용
			byte[] chars = digest.digest(input.getBytes("UTF-8"));//실제로 해시를 적용한 값을 저장
			for(int i=0; i<chars.length;i++) {
				String hex=Integer.toHexString(0xff & chars[i]);
				if(hex.length()==1) {
					result.append("0");
				}
				result.append(hex);
			}
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("나는 SHA-256 result입니다. : "+result);
		System.out.println("나는 SHA-256 toString입니다. : "+result.toString());
		return result.toString();
	}
}
