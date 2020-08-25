package transaction;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.service.AccountService;

public class Test1 {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountService service=context.getBean(AccountService.class);
		new Thread(new Runnable() {
			@Override
			public void run() {
			service.updateRemain(2, 100);	
			}
		}).start();
		service.getRemain(2);
	
	}

}
