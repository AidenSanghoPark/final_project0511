package dsn.contest.model;

public interface ConDAO {
	public int addNaming(ConDTO dto);
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesingerDTO dto);
}
