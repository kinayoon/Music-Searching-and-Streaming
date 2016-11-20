package kr.kina.persistence;

import kr.kina.domain.StreamingVO;

public interface CounterDAO {

	void countingStreaming(StreamingVO vo)throws Exception;
	
	
}
