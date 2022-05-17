package dsn.contest.model;

public interface ConDAO {
	
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesingerDTO dto);

	public int addLogo(ConDTO dto);
	public int addNaming(ConDTO dto);
	public int addCharacter(ConDTO dto);
	public int addPrint(ConDTO dto);
	public int addTrade(TradeDTO dto);
}
