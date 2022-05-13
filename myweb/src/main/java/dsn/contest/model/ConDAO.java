package dsn.contest.model;

public interface ConDAO {
	
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesingerDTO dto);
}
