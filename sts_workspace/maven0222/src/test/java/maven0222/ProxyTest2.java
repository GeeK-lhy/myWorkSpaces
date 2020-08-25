package maven0222;

import static org.junit.Assert.*;

import org.junit.Test;

import com.oracle.aop3.BookDao;
import com.oracle.aop3.JdbcFactory;

public class ProxyTest2 {

	@Test
	public void test() {
		BookDao dao=JdbcFactory.getMapper(BookDao.class);
	//dao.save();
		dao.delete(1005);
	}

}
