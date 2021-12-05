package com.delluna.hotels.manage_paging;

import com.delluna.hotels.util.Paging;

public interface IPagingService {
	 public Paging makeBlock(int curPage);
	 public void makeLastPageNum(Paging paging,String str);
	 public void makeLastPageNum(Paging paging,String str, String kwd,String col);
}
