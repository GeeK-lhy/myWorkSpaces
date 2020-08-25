package text;

import abafactory.product.AirConditioner;
import abafactory.product.Tv;
import abafactory.product.Washer;
import absfactory.factory.Factory;
import absfactory.factory.HaierFactory;

public class Text1 {

	public static void main(String[] args) {
	
		Factory f=new HaierFactory();
		Tv tv=f.getTv();
		tv.display();
		
		Washer w=f.getWasher();
		w.wash();
		
		AirConditioner a=f.getAirConditioner();
		a.open();
	
	}

}
