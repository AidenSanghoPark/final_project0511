package dsn.contest.model;

public interface ConService {
	
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesingerDTO dto);
	public int addNaming(ConDTO dto);
}