package servlet02.future.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// test라는경로로 web.xml에 servletText 서블릿을 호출하도록
// web.xml을 수정하시요
public class ServletTest extends HttpServlet{
	
	public void service(HttpServletRequest req
						,HttpServletResponse res) throws IOException{

		System.out.println("test입니다.");
		res.setContentType("text/html; charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		out.println("asfasfsa가나달마바132125");

		
	}
}