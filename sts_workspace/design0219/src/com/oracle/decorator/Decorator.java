package com.oracle.decorator;

public abstract class Decorator extends Component {
	Component component;
	
	public Decorator(Component component) {
		super();
		this.component = component;
	}

	@Override
	public void display() {
		this.component.display();

	}

}
