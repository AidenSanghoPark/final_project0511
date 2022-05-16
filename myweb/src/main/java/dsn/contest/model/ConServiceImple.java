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
	//logo
	@Override
	public int addLogo(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
	    System.out.println("service="+dto.getUpload().getOriginalFilename());

		//���ε尡 null �ƴҶ��� �������� ���ϳ��� �����ϱ�
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		
		int count = conDao.addLogo(dto);
		return count;
	}
	//naming
	@Override
	public int addNaming(ConDTO dto) {
		
		//���ε尡 null �ƴҶ��� �������� ���ϳ��� �����ϱ�
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addNaming(dto);
		return count;
	}
	//char
	@Override
	public int addCharacter(ConDTO dto) {	
		
		//���ε尡 null �ƴҶ��� �������� ���ϳ��� �����ϱ�
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		
		int count = conDao.addCharacter(dto);
		return count;
	}
	//print
	@Override
	public int addPrint(ConDTO dto) {
		
		//���ε尡 null �ƴҶ��� �������� ���ϳ��� �����ϱ�
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		
		int count = conDao.addPrint(dto);
		return count;
	}
	//@Override
	//public int addTrade(TradeDTO dto) {

		//int count = conDao.addTrade(dto);
		//return count;
	//}
	
}
