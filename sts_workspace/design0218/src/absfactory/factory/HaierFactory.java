package absfactory.factory;

import abafactory.product.AirConditioner;
import abafactory.product.HaierAirConditioner;
import abafactory.product.HaierTv;
import abafactory.product.HaierWasher;
import abafactory.product.Tv;
import abafactory.product.Washer;

public class HaierFactory extends Factory {

	@Override
	public Tv getTv() {
		// TODO Auto-generated method stub
		return new HaierTv();
	}

	@Override
	public Washer getWasher() {
		// TODO Auto-generated method stub
		return new HaierWasher();
	}

	@Override
	public AirConditioner getAirConditioner() {
		// TODO Auto-generated method stub
		return new HaierAirConditioner();
	}

}
