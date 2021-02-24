package com.savanna.model.command.cart;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.MemberVO;

public class CheckDeleteInCartCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("실행?");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		//삭제작업에 쓸 map생성
		Map<String, Object> map = new HashMap<>();

		int result = 0;
		int book_no = 0;
		String[] books = request.getParameterValues("book_no");
		System.out.println(books);
		
		for(String str : books) {
			book_no = Integer.parseInt(str);
			
			//map에 추가하여 작업
			map.put("id", id);
			map.put("book_no", book_no);
			
			// 상품삭제
			result = CartDAO.deleteProduct(map);
		}
		
		/*
		int book_no = Integer.parseInt((String)request.getParameter("book_no"));
		System.out.println("id : "+id);
		System.out.println("book_no : "+book_no);
		
		//map에 추가하여 작업
		map.put("id", id);
		map.put("book_no", book_no);
		
		// 상품삭제
		result = CartDAO.deleteProduct(map);
		System.out.println("result" + result);
		*/
		
		if(result == 0) {
			result = 0;
			request.setAttribute("result", result);
		} else if (result != 0){
			result = 1;
			request.setAttribute("result", result);
		}
		out.print(result);
		
		return "controller?type=cartList";
	}


}
