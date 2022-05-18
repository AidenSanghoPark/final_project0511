package dsn.page;

public class PageModule {
	
	public static String pageMake(String pageName, int totalCnt, int listSize,int pageSize, int cp) {
		
		int totalPage = (totalCnt / listSize)+1;
		if(totalCnt%listSize==0)totalPage--;

		int userGroup = cp/pageSize;  
		if(cp%pageSize==0)userGroup--; 

		StringBuffer sb=new StringBuffer();
		
		sb.append("<nav aria-label='...'><ul class='pagination justify-content-center'>");
		
		//왼쪽으로 가는 화살표 코드
		if(userGroup!=0){
			sb.append("<li class='page-item'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("' class='page-link'>Previous</a></li>");
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
			sb.append("</a></li>");
	
			if(i==totalPage)break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<li class='page-item'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=(userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("' class=\"page-link\">Next</a></li>");
		
		}
		
		sb.append("</ul></nav>");
		return sb.toString();
	}
	
}
