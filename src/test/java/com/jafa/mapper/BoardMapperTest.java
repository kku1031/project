package com.jafa.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;
import com.jafa.model.Board;
import com.jafa.model.Criteria;

public class BoardMapperTest extends AppTest{

	@Autowired
	BoardMapper mapper; 
	
	@Test
	public void getListTest() {
		Criteria criteria = new Criteria();
		criteria.setPage(2);
		mapper.getList(criteria);
	}
	
	@Test
	@Ignore
	public void getTest() {
		mapper.get(1L);
	}
	
	@Test
	@Ignore
	public void insertTest() {
		Board vo = new Board();
		vo.setTitle("제목테스트");
		vo.setContent("내용테스트");
		vo.setWriter("글쓴이");
		mapper.insert(vo);
	}

	@Test
	@Ignore
	public void updateTest() {
		Board vo = new Board();
		vo.setBno(5L);
		vo.setTitle("제목테스트 --수정");
		vo.setContent("내용테스트 --수정");
		mapper.update(vo);
	}
	
	@Test
	@Ignore
	public void deleteTest() {
		mapper.delete(5L);
	}
}
