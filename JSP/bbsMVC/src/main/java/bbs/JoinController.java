package bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserVO;
import service.UserService;


@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	RequestDispatcher dispathcer = 
								request.getRequestDispatcher("/views/join.jsp");
								dispathcer.forward(request, response);
			

	
	
		
	
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userNm = request.getParameter("userNm");
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		vo.setUserNm(userNm);
		System.out.println(userNm);
		UserService userService = UserService.getInstance();
		int cnt = userService.insertUser(vo);
		System.out.println(cnt);
		if (cnt == 0) {
			System.out.println("중복된아이디입니다.");
			request.setAttribute("cnt", cnt);
			request.getRequestDispatcher("/views/join.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userId", vo.getUserId());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
