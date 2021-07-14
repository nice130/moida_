package test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
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

import com.moyda.www.dao.ClubDao;
import com.moyda.www.dao.UserDao;
import com.moyda.www.entity.Board;
import com.moyda.www.entity.Club;
import com.moyda.www.entity.ClubBoard;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class ClubTest {
	@Autowired
	private ClubDao dao;
	@Autowired
	private UserDao userDao;
	
//	@Test
	public void initTest() {
		assertThat(dao, is(notNullValue()));
	}
	
//	@Test
	@Transactional
	public void insertClubCreate() {
		Club club = new Club(1,"0","default.jpg","test클럽","안녕하세요 테스트 클럽입니다.",30,"0","0",0,0);
		assertThat(dao.insert(club), is(1));
	}
	//@Test
	@Transactional
	public void test() {
		String dd = "CLUB_ROLL_ADMIN";
		assertThat(dao.createUserInsert(1, 1,dd), is(1));
	}
//	
//	public void clubUserJoin() {
//		
//	}
	
	//@Test
	public void findByMax() {
		assertThat(dao.findByMaxClubNo(), is(2));
	}
	
	//@Test
	public void findById() {
		String userName = "@naver.com";
		assertThat(userDao.tfindById(userName), notNullValue());
	}
	
	//@Test
	public void findByAll() {
		Integer clubNo = 1;
		assertThat(dao.findByAll(clubNo), nullValue());
	}
	
	//@Test
	public void insertAllTest() {
		List<String> writers = Arrays.asList("@naver.com", "mini@naver.com");
		for(int i=0; i<50; i++) {
			int index = i%2;
			String writer = writers.get(index);
			ClubBoard clubBoard = ClubBoard.builder().title("TEST용 게시글").content("여기가 내용").writer(writer).clubNo(11).build();
			dao.boardInsert(clubBoard);
		}
	}
	
//	@Test
	public void userSelect() {
		assertThat(userDao.tfindById("@naver.com"), notNullValue());
	}
}
