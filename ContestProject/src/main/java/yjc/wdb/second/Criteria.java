package yjc.wdb.second;

public class Criteria {

   private int page = 1;
   private int recordsPerPage = 10;
   private String searchType;
   private String keyword;
	
   public final static int DISPLAY_PAGE_NUM = 10;
   private int startPage;
   private int endPage;
   private boolean prev;
   private boolean next;
   private int totalCount;

	private int menuType;
	public int getMenuType() {
		return menuType;
	}
	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

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
   
   
   public int getTotalCount() {
	return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calculate();
	}
	
	private void calculate() {
		/*
		 * startPage, endPage, prev, next �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕.
		 */
		endPage = (int)Math.ceil(page/(double)DISPLAY_PAGE_NUM)*DISPLAY_PAGE_NUM;
		/*
		 * endPage�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕���뜝�룞�삕 �뜝�룞�삕 �뜝�뙇�뙋�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
		 * �뜝�룞�삕�뜝�떛釉앹삕 �뜝�룞�삕�뜝占� �뜝�뙇�뙋�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떬�뙋�삕.(totalCount)
		 * endPage�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕���뜝�룞�삕 �뜝�룞�삕 �뜝�뙇�뙋�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 : endPage * recordsPerPage
		 * (endPage * recordsPerPage) > totalCount
		 * �뜝�룞�삕�뜝�뛿�뿉 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떛�씛�삕�뜝占�
		 * endPage = (totalCount/recordsPerPage)+1;
		 */
		startPage = endPage-DISPLAY_PAGE_NUM + 1;

		if((endPage*recordsPerPage)>totalCount)
			endPage = (int)(Math.ceil(totalCount/(double) recordsPerPage));
		
		prev = startPage > 1 ? true : false;
		next = endPage*recordsPerPage<totalCount ? true : false;
	}
	
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getPage() {
      return page;
   }
	
   public void setPage(int page) {
      if( page <= 0){
         this.page = 1;
      }else{
         this.page = page;
      }
      
   }
   public int getRecordsPerPage() {
      return recordsPerPage;
   }
   public void setRecordsPerPage(int recordsPerPage) {
      if(recordsPerPage < 0 || recordsPerPage >100){
         this.recordsPerPage = 10;
      }else{
         this.recordsPerPage = recordsPerPage;
      }
      
   }
   public int getStartRecord(){
      //page�뜝�룞�삕 1�뜝�떛紐뚯삕 0*10�뜝�룞�삕�뜝�룞�삕
            //page�뜝�룞�삕 2�뜝�떛紐뚯삕 1*10�뜝�룞�삕�뜝�룞�삕
            //page�뜝�룞�삕 3�뜝�떛紐뚯삕 2*10�뜝�룞�삕�뜝�룞�삕
            return (page-1)*recordsPerPage;
   }
   public String toString(){
      return "Criteria [page=" +page +"," +"recordsPerPage=" + recordsPerPage + "]";
   }
   
}