package test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.transaction.annotation.*;

import com.moyda.www.dao.*;
import com.moyda.www.dto.*;
import com.moyda.www.entity.*;
import com.moyda.www.hostService.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class HostTest {
	@Autowired
	private HostDao dao;
	
//	@Test
	public void initTest() {
		assertThat(dao, is(notNullValue()));
	}
	
//	@Test
	public void hostMyPage() {
		assertThat(dao.hostMyPage(35), is(1));
	}
	
	@Test
//	@Transactional
	public void update() {
		Host host = new Host(35, null, null, null, null, null, null, "123123", null, null, null, null);
		assertThat(dao.update(host), is(1));
	}
	
//	@Test
//	@Transactional
	public void hostOut() {
		//Host host = new Host(123456, null, null, null, null, null, null, null, null, "1", null);
		//assertThat(dao.out(host), is(1));
	}
	
//	@Test
	public void myProgram() {
		assertThat(dao.myProgram(35), is(notNullValue()));
	}
	
//	@Test
	public void programRegistration() {
//		Program pro = new Program(1, 1231, "프로그램명", "프로그램 소개", 1300, "유의사항", 11, 11, null, null, null, null, null, null, null);
//		assertThat(dao.programRegistration(pro), is(1));
	}
}
