package mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserVO;
import service.UserService;


@WebServlet("/mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserService service = UserService.getInstance();
		UserVO vo = service.userInfo(userId);
		request.setAttribute("vo", vo);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = UserService.getInstance();
		UserVO userVO = userService.loginUser(request.getParameter("userId"),
											request.getParameter("userPw"));
		
		if (userVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userVO.getUserId());
			response.sendRedirect("mypage");
		}else {
			response.sendRedirect("login");
		}
	}
	

}
