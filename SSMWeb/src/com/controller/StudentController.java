package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.bean.Page;
import com.bean.Student;
import com.dao.GradeMapper;
import com.dao.StudentMapper;

@Controller
@RequestMapping("/stu")
public class StudentController {
	@Autowired
    StudentMapper studentMapper;
	@Autowired
	GradeMapper gradeMapper;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request,HttpSession session,Integer pageIndex){
	  if(pageIndex==null){
		  pageIndex=1;
	  }
	int pageSize=3;//ÿҳ�м���
	//��ҳ�Ķ���
	Page<Student> page=new Page<Student>();
	page.setPageIndex(pageIndex);  //�ڼ�ҳ
    page.setPageSize(pageSize);   //ÿҳ�м���
	page.setTotalCount(studentMapper.selectTotalCount());
	page.setTotalPages();//������ҳ��
	page.setList(studentMapper.findAll((pageIndex-1)*pageSize, pageSize));
	//��ȡ������ 
	//int totalCount=(totalCount+pageSize-1)/pageSize;
	//int totalCount=(int)Math.ceil(totalCount*1.0/pageSize);
	//��ҳ��
	//int totalPages=totalCount%pageSize==0?(totalCount/pageSize):(totalCount/pageSize+1);
	request.setAttribute("upage", page);
    session.setAttribute("gradelist", gradeMapper.findAll());
	return "index";
	}
   @RequestMapping("/add")
   public String add(Student s){
	   studentMapper.insert(s);
	   return "index";
	 }
   
   @RequestMapping("/del")
   public String del(Integer id){
	   studentMapper.deleteByPrimaryKey(id);
	   return "index";
	 }
   
   @RequestMapping("/up")
   public String up(HttpServletRequest request,Integer id){
	  request.setAttribute("s", studentMapper.selectByPrimaryKey(id)); 
   return "update";
   }
   
   @RequestMapping("/update")
   public String Update(Student s){
	  studentMapper.updateByPrimaryKey(s);
	   return "index";
   }
   //ajax�ж������ѧ������Ƿ����
   @RequestMapping("/selectById")
   public void selectById(Integer id,HttpServletResponse response){
	Student s=  studentMapper.selectByPrimaryKey(id);
    try {
		response.getWriter().print(s==null);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   
//   @RequestMapping("/selectStus")
//   @ResponseBody
//   //public List<Student> selectStus(){
//   public String selectStus(){
//	 return JSON.toJSONString(studentMapper.findAll()) ;
//   }
   
   @InitBinder
   public void initBinder(ServletRequestDataBinder binder) {
   	// ע�� 2012-12-02 �� 2012-22-12(����� 2013-10-12 ������ת��)
   	binder.registerCustomEditor(Date.class, new CustomDateEditor(
   			new SimpleDateFormat("yyyy-MM-dd"), true));
   }

   
   //�ļ��ϴ�
   @RequestMapping("/fileup")
   public String fileUpload(MultipartFile up,HttpSession session){
	 String name=up.getOriginalFilename();
	   //��ȡimages�ļ��еľ���·��
	   String path=session.getServletContext().getRealPath("images");
	   //�ϴ�����ļ�����
	   File file=new File(path,name);
	   try {
		   //�ļ��ϴ�
		up.transferTo(file);
	} catch (IllegalStateException e) {
	e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	   return "b";
   }
   
 
   
}
