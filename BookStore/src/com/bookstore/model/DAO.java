package com.bookstore.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bookstore.model.vo.Employee;
import com.bookstore.mybatis.DBService;

public class DAO {
	public static List<Employee> getList(){
		SqlSession sqlSession = DBService.getFactory().openSession();
		List<Employee> list = sqlSession.selectList("HR.list");
		sqlSession.close();
		return list;
	}
}
