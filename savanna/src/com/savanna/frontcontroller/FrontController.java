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
import com.savanna.model.command.CreateBookCommand;
import com.savanna.model.command.DeleteBookCommand;
import com.savanna.model.command.ListPagingCommand;
import com.savanna.model.command.UpdateBookCommand;
import com.savanna.model.command.viewDispatchCommand.EnterBookDetailCommand;
import com.savanna.model.command.viewDispatchCommand.EnterCreateBookViewCommand;
import com.savanna.model.command.viewDispatchCommand.EnterUpdateBookViewCommand;

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
		} else if("AdminLogin".equals(type)) {
			command = new AdminLoginCommand();
		} else if("PagedAdminLogin".equals(type)) {
			System.out.print("Expect:PagedAdminLogin");

			command = new ListPagingCommand();
		} else if("createbook".equals(type)) {
			command = new CreateBookCommand();
		} else if("EnterCreateBook".equals(type)) {
			command = new EnterCreateBookViewCommand();
		} else if("EnterDetail".equals(type)) {
			System.out.print("showing detail of");
			System.out.println(request.getParameter("book_no"));
			
			command = new EnterBookDetailCommand();
		} else if("DeleteBook".equals(type)) {
			System.out.print("deleting book which is");
			System.out.println(request.getParameter("book_no"));
			
			command = new DeleteBookCommand();
		} else if("EnterUpdateBook".equals(type)) {
			System.out.print("expect:EnterUpdateMode");
			
			command = new EnterUpdateBookViewCommand();
		} else if("UpdateBook".equals(type)) {
			System.out.print("expect:UpdateBook");
			
			command = new UpdateBookCommand();
		}
		else {
			System.out.print("Command Error");
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
