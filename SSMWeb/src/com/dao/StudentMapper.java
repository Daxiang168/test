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
    //计算总条数
     int selectTotalCount();
    //from 开始的下标
    //pageSize每页显示几条
    List<Student> findAll(@Param("from")Integer from,@Param("pageSize")Integer pageSize);
}