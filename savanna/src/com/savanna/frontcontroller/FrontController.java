package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.BookListCommand;
import com.savanna.model.command.Command;
import com.savanna.model.command.DoSignInCommand;
import com.savanna.model.command.DoSignUpCommand;
<<<<<<< HEAD
=======
import com.savanna.model.command.IdCheckCommand;
>>>>>>> dev2
import com.savanna.model.command.LogoutCommand;
import com.savanna.model.command.MyInfoCommand;
import com.savanna.model.command.PwdCheckCommand;
import com.savanna.model.command.SignInCommand;
import com.savanna.model.command.SignUpCommand;


@WebServlet("/controller")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		String type = request.getParameter("type");
		System.out.println("> type : "+ type);
		
		//작업 요청에 대한 처리
		Command command = null;
		if ("booklist".equals(type)) {
			command = new BookListCommand();
			//아래의 else if 조건식란에 해당되는 명령어를 type과 equals 처리해 주세요
<<<<<<< HEAD
		} else if (1 == 2) {
			System.out.print("error test");
		}
		
=======
		} 
>>>>>>> dev2
		else if ("signUp".equals(type)) {
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
		else if ("myInfo".equals(type)) {
			command = new MyInfoCommand();
		}
		else if ("pwdCheck".equals(type)) {
			command = new PwdCheckCommand();
		}
		else if ("logout".equals(type)) {
			command = new LogoutCommand();
		}
		
<<<<<<< HEAD
=======
		
		
>>>>>>> dev2
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
