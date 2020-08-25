package absfactory.factory;
import abafactory.product.*;
public abstract class Factory {
	public abstract Tv getTv();
	public abstract Washer getWasher();
	public abstract AirConditioner getAirConditioner();
}
