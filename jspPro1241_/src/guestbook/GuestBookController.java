package guestbook;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.dao.GuestBookDAO;
import guestbook.dto.GuestBookDTO;

@WebServlet("/guestbook_servlet/*")
public class GuestBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		GuestBookDAO dao = new GuestBookDAO();
		if(uri.indexOf("list.do") != -1){
			String searchkey = request.getParameter("searchkey");
			String search = request.getParameter("search");
			
			if(searchkey == null) searchkey = "name";
			if(search == null) search = "";
			
			System.out.println("searchkey:"+searchkey);
			System.out.println("search:"+search);
			
			List<GuestBookDTO> items = dao.getList(searchkey, search);
			request.setAttribute("list", items);
			request.setAttribute("count", items.size());
			
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			
			String page = "/guestbook/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("insert.do") != -1){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			GuestBookDTO dto = new GuestBookDTO();
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			dao.gbInsert(dto);
			String url = "/guestbook_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}else if(uri.indexOf("passwd_check.do") != -1){
			int idx = Integer.parseInt(request.getParameter("idx"));
			String passwd = request.getParameter("passwd");
			System.out.println("게시물 번호:"+idx);
			System.out.println("사용자가 입력한 비번:"+passwd);
			
			boolean result = dao.passwdCheck(idx, passwd);
			System.out.println("결과:"+result);
			String url = "";
			if(result){
				url = "/guestbook/edit.jsp";
				GuestBookDTO dto = dao.gbDetail(idx);
				request.setAttribute("dto", dto);
			}else{
				url = "/guestbook/list.do";
			}
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1){
			int idx = Integer.parseInt(request.getParameter("idx"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			GuestBookDTO dto = new GuestBookDTO();
			dto.setIdx(idx);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			dao.gbUpdate(dto);
			String url = "/guestbook_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}else if(uri.indexOf("delete.do") != -1){
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.gbDelete(idx);
			String url = "/guestbook_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
