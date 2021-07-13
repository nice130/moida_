package test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.moyda.www.dao.BoardDao;
import com.moyda.www.entity.Board;
import com.moyda.www.entity.FaqBoard;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class BoardTest {
	@Autowired
	private BoardDao dao;
	
	
	//@Test
	public void findByall() {
		Board count = dao.findByall(null);
		assertThat(count, is(1));
	}
	
	//@Test
	//@Transactional
	public void insertAllTest() {
		List<String> writers = Arrays.asList("관리자");
		for(int i=0; i<123; i++) {
			int index = i%1;
			String writer = writers.get(index);
			Board board = Board.builder().noticeNo(0).title("공지").readcnt(1).content("공지사항제목").writer(writer).build();
			dao.insert(board);
		}
	}
	@Test
	@Transactional
	public void faqinsert() {
		List<String> writers = Arrays.asList("관리자");
		for(int i=0; i<50; i++) {
			int index = i%1;
			String writer = writers.get(index);
			FaqBoard faqboard = FaqBoard.builder().faqno(0).faqtn(0).content("제목").writer(writer).build();
			dao.faqinsert(faqboard);
			}
	}
	//@Test
	//@Transactional
	public void delete() {
		assertThat(dao.delete(1), is(1));
		assertThat(dao.findByall(1), is(nullValue()));
	}
}
