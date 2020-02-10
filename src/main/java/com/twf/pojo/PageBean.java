package com.twf.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 分页数据Bean
 * @param <T>
 */
public class PageBean<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	private int pageno; // 当前页码
	private int pagesize; // 页面要显示数据条数
	private String queryText;//查询条件
	
	private int pageCount; // 总页码数
	private int start;// limit(start,pagesize)
	
	private int size; // 总记录数
	private List<?> datas; // 每页记录的数据
	
	
	
	
	@Override
	public String toString() {
		return "PageBean [pageno=" + pageno + ", pagesize=" + pagesize + ", queryText=" + queryText + ", pageCount="
				+ pageCount + ", start=" + start + ", size=" + size + "]";
	}

	public PageBean() {
		super();
	}

	//计算查询起始位置
	public int getStart() {
		return (pageno-1)*pagesize;
	}

	//计算总页码
	public int getPageCount() {
		if(pagesize==0){
			return 0;
		}
		return size % pagesize == 0 ? (size / pagesize) : (size / pagesize + 1);
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List<?> getDatas() {
		return datas;
	}

	public void setDatas(List<?> datas) {
		this.datas = datas;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public void setStart(int start) {
		this.start = start;
	}


}
