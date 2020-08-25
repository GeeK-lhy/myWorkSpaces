package com.oracle.vo;
import java.util.*;

import org.springframework.stereotype.Component;
@Component
public class Person {
	String name;
	int    age;
	Dept dept;
	String hobby[];
	List<String>skills;
	Set<String> edu;
	Map<String,Integer> subject;
	List<Weapon> weapon;
	Properties props;
	
	public Properties getProps() {
		return props;
	}
	public void setProps(Properties props) {
		this.props = props;
	}
	public List<Weapon> getWeapon() {
		return weapon;
	}
	public void setWeapon(List<Weapon> weapon) {
		this.weapon = weapon;
	}
	public Map<String, Integer> getSubject() {
		return subject;
	}
	public void setSubject(Map<String, Integer> subject) {
		this.subject = subject;
	}
	public Set<String> getEdu() {
		return edu;
	}
	public void setEdu(Set<String> edu) {
		this.edu = edu;
	}
	public List<String> getSkills() {
		return skills;
	}
	public void setSkills(List<String> skills) {
		this.skills = skills;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + "]";
	}
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public Person(int age, String name) {
		super();
		this.name = name;
		this.age = age;
	}
	public Person() {
		super();
	}

}	
