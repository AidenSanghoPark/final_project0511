package dsn.contest.model;

import dsn.trade.model.TrdDTO;

public interface ConService {
	public int contestJoin(DesingerDTO dto);
	public ConDTO conInfo(int c_idx);
	public void updateTrd(ConDTO dto);
	
	//logo
	public int addLogo(ConDTO dto);	
	public int addLogoTrade(TrdDTO dto);
	
	//naming	
	public int addNaming(ConDTO dto);
	public int addNamingTrade(TrdDTO dto);
	
	//character
	public int addChar(ConDTO dto);
	public int addCharTrade(TrdDTO dto);
	
	//print
	public int addPrint(ConDTO dto);
	public int addPrintTrade(TrdDTO dto);
}