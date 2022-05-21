package dsn.page;

public class PageModule {

	private String searchType = "";
	  private String keyword = "";
	   
	  public String getSearchType() {
	      return searchType;
	  }
	  public void setSearchType(String searchType) {
	      this.searchType = searchType;
	  }
	  public String getKeyword() {
	      return keyword;
	  }
	  public void setKeyword(String keyword) {
	      this.keyword = keyword;
	  }
	  

	  public static String pageMake(
				String pageName,int totalCnt,int listSize,int pageSize,int cp) {
				
				int totalPage=(totalCnt/listSize)+1;
				if(totalCnt%listSize==0)totalPage--;
				int userGroup=cp/pageSize;
				if(cp%pageSize==0)userGroup--;
				
				StringBuffer sb=new StringBuffer();
						
				if(userGroup!=0){
					sb.append("<a href='");
					sb.append(pageName);
					sb.append("?cp=");
					int temp=(userGroup-1)*pageSize+pageSize;
					sb.append(temp);
					sb.append("'>&lt;&lt;</a>"); //왼쪽 화살표 문자표시
				}
				
				for(int i=(userGroup*pageSize+1);
						i<=(userGroup*pageSize+pageSize);i++){
					
					sb.append("&nbsp;&nbsp;<a href='");
					sb.append(pageName);
					sb.append("?cp=");
					sb.append(i);
					sb.append("'>");
					sb.append(i);
					sb.append("</a>&nbsp;&nbsp;");
					
					if(i==totalPage)break;
				}

				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
					sb.append("<a href='");
					sb.append(pageName);
					sb.append("?cp=");
					int temp=(userGroup+1)*pageSize+1;
					sb.append(temp);
					sb.append("'>&gt;&gt;</a>"); //오른쪽 화살표 문자표
				}
				return sb.toString();
			}
			
	  public static String paramPageMake(String pageName, int totalCnt, int listSize,int pageSize, int cp, int u_idx) {
			
			int totalPage = (totalCnt / listSize)+1;
			if(totalCnt%listSize==0)totalPage--;

			int userGroup = cp/pageSize;  
			if(cp%pageSize==0)userGroup--; 

			StringBuffer sb=new StringBuffer();
			
			sb.append("<nav aria-label='...'><ul class='pagination justify-content-center'>");
			
			int idx=u_idx;
			
			if(userGroup!=0){
				sb.append("<li class='page-item'><a href='");
				sb.append(pageName);
				sb.append("?u_idx=");
				sb.append(idx);
				sb.append("&cp=");
				int temp = (userGroup-1)*pageSize+pageSize;
				sb.append(temp);
				sb.append("'>&lt;&lt;</a>");
				sb.append("</li>");
			}
			
			
			for(int i=(userGroup*pageSize+1);
					i<=(userGroup*pageSize+pageSize);i++){
				sb.append("<li class='page-item'><a href='");
				sb.append(pageName);
				sb.append("?u_idx=");
				sb.append(idx);
				sb.append("&cp=");
				sb.append(i);
				sb.append("' class='page-link'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
				
				sb.append("</a></li>");
		
				if(i==totalPage)break;
			}
			
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				sb.append("<li class='page-item'><a href='");
				sb.append(pageName);
				sb.append("?u_idx=");
				sb.append(idx);
				sb.append("&cp=");
				int temp=(userGroup+1)*pageSize+1;
				sb.append(temp);
				sb.append("'>&gt;&gt;</a>");
			
			}
			
			sb.append("</ul></nav>");
			return sb.toString();
		}
	  
	public static String pageMake(String pageName, int totalCnt, int listSize,int pageSize, int cp) {
		
		int totalPage = (totalCnt / listSize)+1;
		if(totalCnt%listSize==0)totalPage--;

		int userGroup = cp/pageSize;  
		if(cp%pageSize==0)userGroup--; 

		StringBuffer sb=new StringBuffer();
		
		sb.append("<nav aria-label='...'><ul class='pagination justify-content-center'>");
		
		
		if(userGroup!=0){
			sb.append("<li class='page-item'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
			sb.append("</li>");
		}
		
		
		for(int i=(userGroup*pageSize+1);
				i<=(userGroup*pageSize+pageSize);i++){
			sb.append("<li class='page-item'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("' class='page-link'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			
			sb.append("</a></li>");
	
			if(i==totalPage)break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<li class='page-item'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=(userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		
		}
		
		sb.append("</ul></nav>");
		return sb.toString();
	}

	public static String searchPageMake(
			String pageName,int totalCnt,int listSize,int pageSize,int cp,
			String searchType, String keyword) {
			
			int totalPage=(totalCnt/listSize)+1;
			if(totalCnt%listSize==0)totalPage--;
			int userGroup=cp/pageSize;
			if(cp%pageSize==0)userGroup--;
			
			StringBuffer sb=new StringBuffer();
					
			if(userGroup!=0){
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?cp=");
				int temp=(userGroup-1)*pageSize+pageSize;
				sb.append(temp);
				sb.append("&searchType=");
				sb.append(searchType);
				sb.append("&keyword=");
				sb.append(keyword);	
				sb.append("'&lt;&lt;</a>"); 
			}
			
			for(int i=(userGroup*pageSize+1);
					i<=(userGroup*pageSize+pageSize);i++){
				
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pageName);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&searchType=");
				sb.append(searchType);
				sb.append("&keyword=");
				sb.append(keyword);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
				if(i==totalPage)break;
			}
	
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?cp=");
				int temp=(userGroup+1)*pageSize+1;
				sb.append(temp);
				sb.append("'&gt;&gt;</a>");
			}
			return sb.toString();
		}

}
