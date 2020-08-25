package com.netease;

public class Kitchen {
	public static String make(String vegetable) {
		if(vegetable==null) {
			vegetable="tomato";
		}
		StringBuffer s=new StringBuffer();
		s.append("<html><body>\n")
			.append("<h1>Noodkes with  ")
			.append(vegetable)
			.append("</h1>\n")
			.append("</body></html>");
		return s.toString();
			
	}
}
