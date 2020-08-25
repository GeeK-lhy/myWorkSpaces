package maven0222;

import static org.junit.Assert.*;

import org.junit.Test;

import com.oracle.aop.Proxy;

public class Test1 {

	@Test
	public void test() {
		Proxy p=new Proxy();
		p.rent(5000);
	}

}
