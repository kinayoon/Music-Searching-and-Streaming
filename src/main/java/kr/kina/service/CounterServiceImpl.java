package kr.kina.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kina.domain.StreamingVO;
import kr.kina.persistence.CounterDAO;

@Service
public class CounterServiceImpl implements CounterService{

	@Inject
	CounterDAO dao;
	
	@Override
	public void streaming(StreamingVO vo) throws Exception {
		dao.countingStreaming(vo);
	}

}
