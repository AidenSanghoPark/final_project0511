package dsn.memberManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class memberManageServiceImple implements memberManageService {
	
	private memberManageDAO memberManageDao;
	
	public memberManageDAO getMemberManageDao() {
		return memberManageDao;
	}

	public void setMemberManageDao(memberManageDAO memberManageDao) {
		this.memberManageDao = memberManageDao;
	}

	public List memberList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = memberManageDao.memberList(map);
		return lists;
	}

	public memberManageDTO memberContent(String u_id) {
		memberManageDTO dto = memberManageDao.memberContent(u_id);
		return dto;
	}

	public int getTotalCnt() {
		int cnt = memberManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
	return cnt;
	}

}
