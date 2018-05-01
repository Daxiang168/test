package com.bean;
//用于分页的类

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
	private Integer pageIndex;//第几页
	private Integer pageSize;//每页显示的数量
	private Integer totalCount;//总条数
	private Integer totalPages;//总页数
	//每页要显示的数据，是一个集合
   private List<T> list=new ArrayList<T>();
public Integer getPageIndex() {
	return pageIndex;
}
public void setPageIndex(Integer pageIndex) {
	this.pageIndex = pageIndex;
}
public Integer getPageSize() {
	return pageSize;
}
public void setPageSize(Integer pageSize) {
	this.pageSize = pageSize;
}
public Integer getTotalCount() {
	return totalCount;
}
public void setTotalCount(Integer totalCount) {
	this.totalCount = totalCount;
}
public Integer getTotalPages() {
	
	return totalPages;
}
//计算总页数
public void setTotalPages() {
	this.totalPages = (totalCount+pageSize-1)/pageSize;;
}
public List<T> getList() {
	return list;
}
public void setList(List<T> list) {
	this.list = list;
}
public Page(Integer pageIndex, Integer pageSize, Integer totalCount, Integer totalPages, List<T> list) {
	super();
	this.pageIndex = pageIndex;
	this.pageSize = pageSize;
	this.totalCount = totalCount;
	this.totalPages = totalPages;
	this.list = list;
}
public Page() {
	super();
}
   
}
