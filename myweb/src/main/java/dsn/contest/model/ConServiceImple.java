package dsn.contest.model;

import java.util.List;
import java.util.Map;

public class ConServiceImple implements ConService {

	private ConDAO conDao;

	
	public ConDAO getConDao() {
		return conDao;
	}

	public void setConDao(ConDAO conDao) {
		this.conDao = conDao;
	}

	@Override
	public int addNaming(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
		System.out.println("service="+dto.getUpload().getOriginalFilename());
		//���ε尡 null �ƴҶ��� �������� ���ϳ��� �����ϱ�
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addNaming(dto);
		return count;
	}	
}
