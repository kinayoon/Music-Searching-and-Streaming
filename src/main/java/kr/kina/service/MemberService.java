package kr.kina.service;

import kr.kina.domain.MemberVO;

public interface MemberService {

	void signUp(MemberVO vo) throws Exception; //signUp
	void login(String id, String password) throws Exception; //login Check	
}
