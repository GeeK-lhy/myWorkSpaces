package com.oracle.vo;

public class Weapon {
		String name;
		int power;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPower() {
			return power;
		}
		public void setPower(int power) {
			this.power = power;
		}
		@Override
		public String toString() {
			return "Weapon [ÎäÆ÷Ãû=" + name + ", ¹¥»÷Á¦=" + power + "]";
		}
		
}
