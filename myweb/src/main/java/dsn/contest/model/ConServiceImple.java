package dsn.contest.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConServiceImple implements ConService{
	
	@Autowired
	private ConDAO conDao;
	
	public ConDAO getConDao() {
		return conDao;
	}

	public void setConDao(ConDAO bbsDao) {
		this.conDao = bbsDao;
	}
	@Override
	public ConDTO conInfo(int c_idx) {
		return conDao.conInfo(c_idx);
	}
	@Override
	public int contestJoin(DesingerDTO dto) {
		if(dto.getUploadfile1() != null|| dto.getUploadfile2() != null) {
			dto.setD_img_1(dto.getUploadfile1().getOriginalFilename());
			dto.setD_img_2(dto.getUploadfile2().getOriginalFilename());
		}
		return conDao.contestJoin(dto);
	}

}
