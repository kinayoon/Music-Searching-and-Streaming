package kr.kina.persistence;

import kr.kina.domain.MemberVO;

public interface MemberDAO {

	void signUp(MemberVO vo) throws Exception;//회원가입 (insert)
	void login(String id, String password) throws Exception; //로그인 체크 

}
