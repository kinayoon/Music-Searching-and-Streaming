package kr.kina.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.kina.domain.MemberVO;


@Repository
public class MemberDaoImpl implements MemberDAO{

	static private final Logger log = LoggerFactory.getLogger(MemberDaoImpl.class);
	private final String namespace = "kr.kina.mappers.MemberMapper";
	

	@Inject
	SqlSession session;
	
	@Override
	public void signUp(MemberVO vo) throws Exception {
		session.insert(namespace +".signUp", vo);
	}

	@Override
	public void login(String id, String password) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("password", password);
		
		session.selectOne(namespace + ".loginCheck", paramMap);
	}

}
