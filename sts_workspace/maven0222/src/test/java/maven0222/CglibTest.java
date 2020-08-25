package maven0222;

import static org.junit.Assert.*;

import org.junit.Test;

import com.oracle.aop3.BookService;
import com.oracle.aop3.CglibMethodInterceptor;

public class CglibTest {

	@Test
	public void test() {
		CglibMethodInterceptor cglib=new CglibMethodInterceptor();
		BookService bs=(BookService) cglib.getInstance(new BookService());
		bs.delete();
	}

}
