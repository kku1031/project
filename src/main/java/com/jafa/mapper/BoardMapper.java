package com.jafa.mapper;

import java.util.List;

import com.jafa.model.Board;
import com.jafa.model.Criteria;

public interface BoardMapper {
	
	Board get(Long bno);
	void insert(Board vo);
	void update(Board vo);
	void delete(Long bno);
	List<Board> getList(Criteria criteria);
	Integer totalCount(Criteria criteria);
}
 