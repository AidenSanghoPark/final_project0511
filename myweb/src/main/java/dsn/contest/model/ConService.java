package dsn.contest.model;

import dsn.trade.model.TrdDTO;

public interface ConService {
	
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesingerDTO dto);
	public int addNaming(ConDTO dto);
	public int addNamingTrade(TrdDTO dto);
	public void updateTrd(ConDTO dto);
}