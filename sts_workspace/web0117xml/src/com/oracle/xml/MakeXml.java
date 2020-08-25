package com.oracle.xml;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class MakeXml {

	public static void main(String[] args) throws IOException {
		
		Document doc=new Document();
		Element root=new Element("books");
		Element  book=new Element("book");
		book.addContent(new Element("isbn").setText("123"));
		book.addContent(new Element("name").setText("詹姆斯"));
		book.addContent(new Element("price").setText("99"));
		root.addContent(book);
		doc.setRootElement(root);
		XMLOutputter outputter=new XMLOutputter();
		outputter.setFormat(Format.getPrettyFormat().setEncoding("UTF-8"));
		outputter.output(doc,new FileWriter("d:/book.xml"));
		
	}
	public static void WriteXML(Writer w) {
		Document doc=new Document();
		Element root=new Element("books");
		Element  book=new Element("book");
		book.addContent(new Element("isbn").setText("123"));
		book.addContent(new Element("name").setText("詹姆斯"));
		book.addContent(new Element("price").setText("99"));
		root.addContent(book);
		doc.setRootElement(root);
		XMLOutputter outputter=new XMLOutputter();
		outputter.setFormat(Format.getPrettyFormat().setEncoding("UTF-8"));
		try {
			outputter.output(doc,w);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
