package com.oracle.service;
import java.util.*;
public class CodeService {
	static Map<String,String>codes=new HashMap<String,String>();
	static {
		codes.put("150036", "黑龙江,哈尔滨");
		codes.put("100000", "北京,朝阳区");
		codes.put("630000", "台湾,高雄");
		codes.put("210000", "广东,广州");
		codes.put("130000", "辽宁,沈阳");
	}
	public static String getCode(String code) {
		if(codes.containsKey(code)) {
			return  codes.get(code);
		}else {
			return "无，无";
		}
	}
}
