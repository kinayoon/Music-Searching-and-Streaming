package kr.kina.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.kina.domain.StreamingVO;

@Repository
public class CounterDaoImpl implements CounterDAO{
	
	static private Logger log = LoggerFactory.getLogger(CounterDaoImpl.class);
	private String namespace ="kr.kina.mappers.CounterMapper";
	
	@Inject
	SqlSession session;
	
	@Override
	public void countingStreaming(StreamingVO vo) throws Exception {
		log.info("CounterDapImpl.. ");
		session.insert(namespace+".StreamingCounter", vo);
	}

}
