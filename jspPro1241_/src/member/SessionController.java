package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/session_servlet/*")
public class SessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		String url=request.getRequestURI();
		System.out.println(url);
		MemDAO dao=new MemDAO();
		if(url.indexOf("login.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MemDTO dto=new MemDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			String page="/login/session_login.jsp";
			if(!result.equals("로그인 실패")){
				
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/login/main.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else{
				response.sendRedirect(
						request.getContextPath()+page+"?message=error");
	
			}
			
		}else if(url.indexOf("logout.do") != -1){
			
			HttpSession session = request.getSession();
			
			session.invalidate();
			
			String page=request.getContextPath()
					+"/login/session_login.jsp?message=logout";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
