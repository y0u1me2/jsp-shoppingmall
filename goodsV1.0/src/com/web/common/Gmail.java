package com.web.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("errornotzoo@gmail.com", "zootopia123!");//관리자의 gmail 계정과 비밀번호 입력
	}
	
}
