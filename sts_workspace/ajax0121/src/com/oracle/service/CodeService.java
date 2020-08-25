package com.oracle.service;
import java.util.*;
public class CodeService {
	static Map<String,String>codes=new HashMap<String,String>();
	static {
		codes.put("150036", "������,������");
		codes.put("100000", "����,������");
		codes.put("630000", "̨��,����");
		codes.put("210000", "�㶫,����");
		codes.put("130000", "����,����");
	}
	public static String getCode(String code) {
		if(codes.containsKey(code)) {
			return  codes.get(code);
		}else {
			return "�ޣ���";
		}
	}
}
