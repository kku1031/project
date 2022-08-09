package com.jafa.service;

import java.util.List;

import com.jafa.model.Board;
import com.jafa.model.BoardAttachVO;
import com.jafa.model.Criteria;

public interface BoardService {
	
	List<Board> readAll(Criteria criteria); 
	Board read(Long bno); 
	void register(Board vo);
	void modify(Board vo);
	void remove(Long bno);
	Integer getTotal(Criteria criteria);
	List<BoardAttachVO> getAttachList(Long bno);
	
}
