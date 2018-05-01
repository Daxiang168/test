package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Student;

public interface StudentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    //����������
     int selectTotalCount();
    //from ��ʼ���±�
    //pageSizeÿҳ��ʾ����
    List<Student> findAll(@Param("from")Integer from,@Param("pageSize")Integer pageSize);
}