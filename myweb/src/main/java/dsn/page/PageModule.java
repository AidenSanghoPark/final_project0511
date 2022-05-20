package dsn.page;

public class PageModule {

	private String searchType = ""; // 寃��깋 ���엯(移댄뀒怨좊━)
	  private String keyword = ""; // 寃��깋 �궎�썙�뱶
	   
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
	  

	public static String pageMake(String pageName, int totalCnt, int listSize,int pageSize, int cp) {
		
		int totalPage = (totalCnt / listSize)+1;
		if(totalCnt%listSize==0)totalPage--;

		int userGroup = cp/pageSize;  
		if(cp%pageSize==0)userGroup--; 

		StringBuffer sb=new StringBuffer();
		
		sb.append("<nav aria-label='...'><ul class='pagination justify-content-center'>");
		
		//�쇊履쎌쑝濡� 媛��뒗 �솕�궡�몴 肄붾뱶
		if(userGroup!=0){
			sb.append("<li class='page-item'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>"); //�쇊履� �솕�궡�몴 臾몄옄�몴�떆
			sb.append("'</li>");
			//<a href="pageTest.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
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
			sb.append("'>&gt;&gt;</a>"); //�삤瑜몄そ �솕�궡�몴 臾몄옄�몴
			sb.append("'</li>");
		
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
				sb.append("'>&lt;&lt;</a>"); //�쇊履� �솕�궡�몴 臾몄옄�몴�떆
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
				sb.append("'>&gt;&gt;</a>"); //�삤瑜몄そ �솕�궡�몴 臾몄옄�몴�떆
			}
			return sb.toString();
		}

}
