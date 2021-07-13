package test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.moyda.www.dao.*;
import com.moyda.www.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class AdminTest {

	@Autowired
	private AdminDao dao;
	
//	@Test
	public void initTest() {
		assertThat(dao, is(notNullValue()));
	}
	
//	@Test
//	@Transactional
	public void updateTest() {
		User u = User.builder().userNo(4).enabled(false).build();
		System.out.println(u);
		assertThat(dao.updateUser(u), is(1));
		System.out.println("b");
	}
	
//	@Test
	public void findTest() {
		assertThat(dao.findUserById(2), is(1));
	}
	
	@Test
	public void findHostDetailTest() {
		System.out.println(dao.findHostDetailById(1));
		assertThat(dao.findHostDetailById(1), is(1));
	}
}
