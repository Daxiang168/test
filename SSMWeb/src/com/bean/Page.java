package com.bean;
//���ڷ�ҳ����

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
	private Integer pageIndex;//�ڼ�ҳ
	private Integer pageSize;//ÿҳ��ʾ������
	private Integer totalCount;//������
	private Integer totalPages;//��ҳ��
	//ÿҳҪ��ʾ�����ݣ���һ������
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
//������ҳ��
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
