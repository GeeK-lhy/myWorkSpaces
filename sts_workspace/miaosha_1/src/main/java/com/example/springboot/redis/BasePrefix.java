package com.example.springboot.redis;

public abstract class BasePrefix implements KeyPrefix {
	private int expireSeconds;//过期时间
	private String prefix;
	
	public BasePrefix(int expireSeconds,String prefix) {
		this.expireSeconds=expireSeconds;
		this.prefix=prefix;
	}
	public BasePrefix(String prefix) {
		this(0, prefix);
	}
	public int expireSeconds() {//默认0代表永不过期
		return  expireSeconds;
	}

	@Override
	public String getPrefix() {
		String className=getClass().getSimpleName();
		return className+":"+prefix;
	}
}
