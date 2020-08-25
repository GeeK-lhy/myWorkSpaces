package transaction;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.service.BookService;

public class TrancationTest {
	ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
	@Test
	public void test() {
		BookService service=(BookService) context.getBean(BookService.class);
		service.buy(2, 14, 2);
		
	}

}
