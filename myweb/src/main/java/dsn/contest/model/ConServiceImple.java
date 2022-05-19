package dsn.contest.model;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dsn.trade.model.TrdDTO;

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

	@Override
	public int addLogoTrade(TrdDTO dto) {
		int count = conDao.addLogoTrade(dto);
		return count;
	}
	//naming
	@Override
	public int addNaming(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
		System.out.println("service="+dto.getUpload().getOriginalFilename());
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addNaming(dto);
		return count;
	}
	@Override
	public int addNamingTrade(TrdDTO dto) {
		int count = conDao.addNamingTrade(dto);
		return count;
	}
	//char
	@Override
	public int addChar(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
		System.out.println("service="+dto.getUpload().getOriginalFilename());
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addChar(dto);
		return count;
	}
	@Override
	public int addCharTrade(TrdDTO dto) {
		int count = conDao.addCharTrade(dto);
		return count;
	}
	//print
	@Override
	public int addPrint(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
		System.out.println("service="+dto.getUpload().getOriginalFilename());
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addPrint(dto);
		return count;
	}
	@Override
	public int addPrintTrade(TrdDTO dto) {
		int count = conDao.addPrintTrade(dto);
		return count;
	}
	@Override
	public void updateTrd(ConDTO dto) {
		conDao.updateTrd(dto);
	}
}
