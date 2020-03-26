package com.web.profile.model.service;

import com.web.member.model.vo.Member;
import com.web.profile.model.dao.ProfileDao;

public class ProfileService {

	private ProfileDao dao=new ProfileDao();
	
	public Member loginMember(String email, String pw) {
		Member m = dao.loginMember(email,pw);
		return m;
	}
	
}
