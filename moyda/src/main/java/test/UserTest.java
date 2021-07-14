package test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import javax.servlet.http.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.transaction.annotation.*;

import com.moyda.www.dao.*;
import com.moyda.www.entity.*;
import com.sun.org.apache.xalan.internal.xsltc.compiler.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class UserTest {
	@Autowired
	private UserDao dao;
	
//	@Test
//	public void initTest() {
//		assertThat(dao, is(notNullValue()));
//	}
	
//	@Test
//	public void userJoinTest() {
//		User user = new User(5,"www@naver.com","www","www","00011112222",18,"f","계양구","default.jpg","aaaa1111",0,0,null,null,null);
//		assertThat(dao.userJoin(user), is(1));
//	}
	
//	@Test
//	public void userfindById() {
//		User user = User.builder().irum("최형택").phone("01011111111").build();
//		assertThat(dao.userfindById(user).getUserNo(), is(1));
//	}
	
//	@Test
//	public void hostfindById() {
//		Host host = Host.builder().nickname("minho").phone("01012341234").build();
//		assertThat(dao.hostfindById(host).getHostNo(), is(1));
//	}
	
//	@Test
//	public void userfindByPass() {
//		User user = User.builder().irum("최형택").email("@naver.com").build();
//		assertThat(dao.userfindByPass(user).getUserNo(), is(1));
//	}
	
//	@Test
//	public void hostfindByPass() {
//		Host host = Host.builder().nickname("minho").email("minho@naver.com").build();
//		assertThat(dao.hostfindByPass(host).getHostNo(), is(1));
//	}
	
//	@Test
//	public void userfindByPhone() {
//		String user = "01011111111";
//		assertThat(dao.userfindByPhone(user).getUserNo(), is(1));
//	}
	
//	@Test
//	public void hostfindByPhone() {
//		String host = "01012341234";
//		assertThat(dao.hostfindByPhone(host).getHostNo(),is(1));
//	}
//	@Test
//	public void userexistsById() {
//		assertThat(dao.existsById("nice130@naver.com"),is(1));
//	}
	
//	@Test
//	public void userlogin() {
//		String email = "@naver.com";
//		String password = "asd123123";
//		assertThat(dao.loginCheck(email, password,null),is(1));
//	}
	
}
