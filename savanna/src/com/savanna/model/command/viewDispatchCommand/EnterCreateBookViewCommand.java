package com.savanna.model.command.viewDispatchCommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.BookDAO;
import com.savanna.model.command.Command;
import com.savanna.model.vo.BookVO;

public class EnterCreateBookViewCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("EnterCreateBook");
		return "createbook.jsp";
	}
	
}
