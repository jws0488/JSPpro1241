package guestbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	
	
	public List<GuestBookDTO> getList(String searchkey, String search){
		SqlSession session = MybatisManager.getInstance().openSession();
		List<GuestBookDTO> list = null;
		if(searchkey.equals("name_content")){
			list = session.selectList("gbListAll", "%"+search+"%");
		}else{
			Map<String,String> map = new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("gbList", map);
		}
		
		for(GuestBookDTO dto : list){
			String content = dto.getContent();
			content = content.replace("<", "&lt;");
			content = content.replace(">", "&gt;");
			content = content.replace("\n", "<br>");
			content = content.replace("  ", "&nbsp;&nbsp;");
			if(!searchkey.equals("name")) {
				content=content.replace(search, 
				"<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content);
		}
		session.close();
		return list;
	}
	
	public void gbInsert(GuestBookDTO dto){
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("gbInsert", dto);
		session.commit();
		session.close();
	}
	
	public boolean passwdCheck(int idx, String passwd){
		boolean result = false;
		SqlSession session = MybatisManager.getInstance().openSession();
		GuestBookDTO dto = new GuestBookDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		int count = session.selectOne("passwdCheck", dto);
		session.close();
		if(count == 1){
			result = true;
		}
		return result;
	}
	
	public GuestBookDTO gbDetail(int idx){
		GuestBookDTO dto = new GuestBookDTO();
		SqlSession session = MybatisManager.getInstance().openSession();
		dto = session.selectOne("gbDetail", idx);
		session.close();
		return dto;
	}
	
	public void gbUpdate(GuestBookDTO dto){
		SqlSession session = MybatisManager.getInstance().openSession();
		session.update("guestbook.gbUpdate", dto);
		session.commit();
		session.close();
	}
	
	public void gbDelete(int idx){
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("guestbook.gbDelete", idx);
		session.commit();
		session.close();
	}

}
