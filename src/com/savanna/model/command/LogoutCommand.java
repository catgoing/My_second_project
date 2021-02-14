package com.savanna.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< Updated upstream
<<<<<<<< Updated upstream:src/com/savanna/model/command/LogoutCommand.java
public class LogoutCommand implements Command{
========
import com.savanna.model.dao.DAO;
import com.savanna.model.vo.BookVO;

public class BookListCommand implements Command {
>>>>>>>> Stashed changes:savanna/src/com/savanna/model/command/BookListCommand.java
=======
public class LogoutCommand implements Command{
>>>>>>> Stashed changes

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = request.getSession(true);
		
<<<<<<< Updated upstream
=======
		
		//로그아웃 시 세션 초기화
>>>>>>> Stashed changes
		httpSession.invalidate();
		
		return "main.jsp";
	}

}
