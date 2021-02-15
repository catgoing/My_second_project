package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.AdminLoginCommand;
import com.savanna.model.command.CardListCommand;
import com.savanna.model.command.Command;
import com.savanna.model.command.DeleteBookCommand;
import com.savanna.model.command.GoEntryBookViewCommand;
import com.savanna.model.command.InsertBookCommand;
import com.savanna.model.command.ShowBookDetailCommand;

@WebServlet("/controller")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		String type = request.getParameter("type");
		System.out.println("> type : "+ type);
		
		//작업 요청에 대한 처리
		Command command = null;
		if("cardlist".equals(type)) {
			System.out.println("showing cardlist");
			command = new CardListCommand();
		} else if("adminlogin".equals(type)) {
			command = new AdminLoginCommand();
		} else if("insertbook".equals(type)) {
			command = new InsertBookCommand();
		} else if("goentrybook".equals(type)) {
			System.out.println("going entrybook");
			command = new GoEntryBookViewCommand();
		} else if("showdetail".equals(type)) {
			System.out.print("showing detail of");
			System.out.println(request.getParameter("book_no"));
			command = new ShowBookDetailCommand();
		} else if("deletebook".equals(type)) {
			System.out.print("deleting book which is");
			System.out.println(request.getParameter("book_no"));
			command = new DeleteBookCommand();
		}
		else {
			System.out.print("error test");
		}
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doPost() 실행~~");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
