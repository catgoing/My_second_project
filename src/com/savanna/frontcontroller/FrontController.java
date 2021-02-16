package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.DoSignInCommand;
import com.savanna.model.command.DoSignUpCommand;
import com.savanna.model.command.IdCheckCommand;
import com.savanna.model.command.LogoutCommand;
import com.savanna.model.command.MyInfoCommand;
import com.savanna.model.command.PwdCheckCommand;
import com.savanna.model.command.SignInCommand;
import com.savanna.model.command.SignUpCommand;

import del.IdCheckCommand2;



@WebServlet("/controller")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파라미터 값 확인
		String type = request.getParameter("type");
		
		//작업 요청에 대한 처리
		Command command = null;
		if ("signUp".equals(type)) {
			command = new SignUpCommand();
		} 
		else if ("doSignUp".equals(type)) {
			command = new DoSignUpCommand();
		} 
		else if ("signIn".equals(type)) {
			command = new SignInCommand();
		}
		else if ("doSignIn".equals(type)) {
			command = new DoSignInCommand();
		} 
		else if ("idCheck".equals(type)) {
			command = new IdCheckCommand2();
		} 
		else if ("myInfo".equals(type)) {
			command = new MyInfoCommand();
		}
		else if ("pwdCheck".equals(type)) {
			command = new PwdCheckCommand();
		}
		else if ("logout".equals(type)) {
			command = new LogoutCommand();
		}
		
		
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
