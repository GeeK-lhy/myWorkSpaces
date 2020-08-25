package HttpDemo;
import java.io.*;
import java.net.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
public class Server {
	public static void main(String[] args) throws Exception {
		ServerSocket server=new ServerSocket(8080);
		Map<String,String> map=new HashMap<String,String>();
		System.out.println("监听端口号80：");
		while(true) {
			Socket socket=server.accept();
			BufferedReader br=new BufferedReader(new InputStreamReader(socket.getInputStream()));	
			String str=null;
				System.out.println(br.readLine());		
			while(!((str=br.readLine()).equals(""))){
				System.out.println(str);
				map.put(str.split(":")[0], str.split(":")[1].trim());
			}
			
			if(map.containsKey("Content-Length")) {
				char []c=new char[Integer.valueOf(map.get("Content-Length"))];
					br.read(c);
					System.out.println(new String(c));
			}else {
				System.out.println("没有内容体");
			}
			Random r=new Random();
			String names="abcdefghigklmnopqrstuvwxyz1234567890";
			char []cs=names.toCharArray();
			StringBuffer code=new StringBuffer();
			for(int i=0;i<4;i++)
			code.append(cs[r.nextInt(36)]);			
				BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
				StringBuffer sb=new StringBuffer();
				sb.append("<html><head><title>我的网页</title></head><body><input type='text'>asd</br>验证码:"+code.toString()+"</body></html>");
				bw.write("HTTP/1.1 200 OK\r\n");
				bw.write("Content-Type:text/html\r\n");
				bw.write("\r\n");
				bw.write(sb.toString());
				
				bw.close();
				br.close();
				socket.close();
				
		}
		
		//	server.close();
	}
	
}
