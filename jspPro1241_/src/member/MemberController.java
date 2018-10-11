package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();

		MemDAO dao=new MemDAO();

		if(uri.indexOf("list.do") != -1) {
			System.out.println("list.do호출...");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));

			Map<String,Object> map=new HashMap<>();
			List<MemDTO> list=dao.memberList();
			map.put("list", list);
			
			map.put("count", list.size());
			request.setAttribute("map", map);
			String page="/admin/member_list2.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("join.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			MemDTO dto=new MemDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dao.insert(dto);
		}else if(uri.indexOf("view.do") != -1){
			String userid=request.getParameter("userid");
			MemDTO dto=dao.memberDetail(userid);
			request.setAttribute("dto", dto);
			String page="/admin/member_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			MemDTO dto=new MemDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dao.update(dto);
			response.sendRedirect(context+"/admin/member.jsp");
		} else if(uri.indexOf("delete.do") != -1) {
			String userid=request.getParameter("userid");
			dao.delete(userid);
			response.sendRedirect(context+"/admin/member.jsp");
		} else if(uri.indexOf("sessionLogin.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MemDTO dto=new MemDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			String page="/member/login.jsp";
			if(!result.equals("로그인 실패")){
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/home/home.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else{
				response.sendRedirect(
						request.getContextPath()+page+"?message=error");
			}
		}else if(uri.indexOf("sessionLogout.do") != -1){
			HttpSession session = request.getSession();
			session.invalidate();
			String page=request.getContextPath()
					+"/member/login.jsp?message=logout";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

