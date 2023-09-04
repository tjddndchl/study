package servlet02.future.com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Servletjson2")
public class Servletjson2 extends HttpServlet {
	@SuppressWarnings("unchecked")


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("Access-Control-Allow-Origin", "*");
//		JSONObject json = new JSONObject();
//		json.put("name", "nick");
//		json.put("age", 20);
		String qString = req.getParameter("q");
		ApiExamdictionary api = new ApiExamdictionary();
		String result = api.naverencyc(qString);
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);
		
//		resp.getWriter().write(json.toJSONString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
