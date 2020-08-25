package com.oracle.xml;

import java.io.IOException;
import java.util.List;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class ReadXml {

	public static void main(String[] args) throws JDOMException, IOException {
		
		SAXBuilder sb=new SAXBuilder();
		Document dc=sb.build("d:/file/book.xml");
			
		Element root=dc.getRootElement();
		System.out.println(root.getName());
		List<Element> list=root.getChildren();

		for(Element e:list) {
			Attribute a=e.getAttribute("id");
			System.out.println(a.getName()+":"+a.getValue());
			System.out.println(e.getChildTextTrim("name"));
		}
	}

}
