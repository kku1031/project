package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.mapper.BoardAttachMapper;
import com.jafa.mapper.BoardMapper;
import com.jafa.model.Board;
import com.jafa.model.BoardAttachVO;
import com.jafa.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	
	@Autowired
	private BoardMapper mapper; 
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Autowired
	public void setMapper(BoardMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<Board> readAll(Criteria criteria) {
		return mapper.getList(criteria);
	}

	@Override
	public Board read(Long bno) {
		return mapper.get(bno);
	}

	@Transactional	
	@Override
	public void register(Board board) {
		mapper.insert(board);
		if(board.getAttachList() == null || board.getAttachList().size()==0) return;
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public void modify(Board vo) {
		mapper.update(vo);
	}

	@Override
	public void remove(Long bno) {
		attachMapper.deleteAll(bno);
		
	}

	@Override
	public Integer getTotal(Criteria criteria) {
		return mapper.totalCount(criteria);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}

}
