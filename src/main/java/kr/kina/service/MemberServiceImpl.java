package kr.kina.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.kina.domain.MemberVO;
import kr.kina.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	private final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	MemberDAO dao;
	

	@Override
	public void signUp(MemberVO vo) throws Exception {
		dao.signUp(vo);
	}

	@Override
	public void login(String id, String password) throws Exception {
		dao.login(id, password);
		
	}

}
