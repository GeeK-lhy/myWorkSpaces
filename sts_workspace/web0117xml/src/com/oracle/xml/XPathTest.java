package com.oracle.xml;

import java.io.IOException;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.xpath.XPathFactory;

public class XPathTest {

	public static void main(String[] args) throws JDOMException, IOException {
		SAXBuilder sb=new SAXBuilder();
		Document dc=sb.build("d:/file/book.xml");
		XPathFactory factory=XPathFactory.instance();
		List<Object>list=factory.compile("//name[@id='name1']").evaluate(dc);
		for(Object obj:list) {
			Element e=(Element) obj;
			System.out.println(e.getValue());
		}
	}

}
