package servlet02.future.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletMain extends HttpServlet{
	
	public void service(HttpServletRequest req
						,HttpServletResponse res) throws IOException{
		System.out.println("main");
		
//		req.setCharacterEncoding("UTF-8");
		String nm = req.getParameter("nm");
		
		//reponse 응답
		res.setContentType("text/html; charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('"+nm+" 님 반가워요^^ ');");
		out.println("</script>");
	}
}
