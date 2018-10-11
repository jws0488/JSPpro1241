package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {
	
	public List<BoardDTO> list(int start, int end) {
		List<BoardDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = session.selectList("board.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
		
	}

	public void insert(BoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public String getFileName(int num) {
		String result = "";
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("board.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public void plusDown(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.plusDown",num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public BoardDTO view(int num) {
		BoardDTO dto = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("board.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	
	public BoardDTO viewReplace(int num){
		BoardDTO dto = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("board.view", num);
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session != null) session.close();
		}
		return dto;
	}
	
	public void plusReadCount(int num, HttpSession count_session){
		SqlSession session = null;
		try {
			long read_time = 0;
			if(
			count_session.getAttribute("read_time_"+num) != null){
			read_time = (long)count_session.getAttribute("read_time_"+num);	
			}
			long current_time = System.currentTimeMillis();
			session = MybatisManager.getInstance().openSession();
			if(current_time-read_time > 5*1000){
				session.update("board.plusReadCount", num);
				session.commit();
				count_session.setAttribute("read_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}		
	}

	public List<BoardCommentDTO> commentList(int num) {
		List<BoardCommentDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list=session.selectList("board.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

		return list;
	}

	public void commentAdd(BoardCommentDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}
	
	public void updateStep(int ref, int re_step){
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			BoardDTO dto = new BoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("board.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}
	}
	
	public void reply(BoardDTO dto){
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}
	}
	
	public String passwdCheck(int num, String passwd){
		String result = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String,Object> map = new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result = session.selectOne("board.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session != null) session.close();
		}
		return result;
	}
	
	public void update(BoardDTO dto) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	public void delete(int num) {
		SqlSession session = null;
		try { 
			session = MybatisManager.getInstance().openSession();
			session.update("board.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	public List<BoardDTO> searchList(String search_option, String keyword) {
		List<BoardDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			Map<String,String> map=new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("board.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int count(){
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("board.count");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}
