package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.book.AdminLoginCommand;
import com.savanna.model.command.book.CardListCommand;
import com.savanna.model.command.book.CreateBookCommand;
import com.savanna.model.command.book.DeleteBookCommand;
import com.savanna.model.command.book.ListPagingCommand;
import com.savanna.model.command.book.UpdateBookCommand;
import com.savanna.model.command.book.viewDispatchCommand.EnterBookDetailCommand;
import com.savanna.model.command.book.viewDispatchCommand.EnterCreateBookViewCommand;
import com.savanna.model.command.book.viewDispatchCommand.EnterUpdateBookViewCommand;
import com.savanna.model.command.member.AdminUpdateCommand;
import com.savanna.model.command.member.AdminWithdrawalCommand;
import com.savanna.model.command.member.DoSignInCommand;
import com.savanna.model.command.member.DoSignUpCommand;
import com.savanna.model.command.member.InquiryIdCommand;
import com.savanna.model.command.member.InquiryPwdCommand;
import com.savanna.model.command.member.LogoutCommand;
import com.savanna.model.command.member.MemDetailCommand;
import com.savanna.model.command.member.MemListCommand;
import com.savanna.model.command.member.MyInfoCommand;
import com.savanna.model.command.member.PwdCheckCommand;
import com.savanna.model.command.member.SignInCommand;
import com.savanna.model.command.member.SignUpCommand;
import com.savanna.model.command.member.UpdateCommand;
import com.savanna.model.command.member.WithdrawalCommand;


@WebServlet("/controller")
public class FrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		String type = request.getParameter("type");
		System.out.println("> type : "+ type);

		Command command = null;
		if (1 == 2) {
			System.out.print("error test");
		} else if ("signUp".equals(type)) {
			command = new SignUpCommand();
		} else if ("doSignUp".equals(type)) {
			command = new DoSignUpCommand();
		} else if ("signIn".equals(type)) {
			command = new SignInCommand();
		} else if ("doSignIn".equals(type)) {
			command = new DoSignInCommand();
		} else if ("myInfo".equals(type)) {
			command = new MyInfoCommand();
		} else if ("pwdCheck".equals(type)) {
			command = new PwdCheckCommand();
		} else if ("logout".equals(type)) {
			command = new LogoutCommand();
		} else if ("update".equals(type)) {
			command = new UpdateCommand();
		} else if ("withdrawal".equals(type)) {
			command = new WithdrawalCommand();
		} else if ("memList".equals(type.substring(0, 7))) {
			if(type.length()==7) {
				command = new MemListCommand("1");
			} else
			command = new MemListCommand(type.substring(14));
		} else if ("inquiryId".equals(type)) {
			command = new InquiryIdCommand();
		} else if ("inquiryPwd".equals(type)) {
			command = new InquiryPwdCommand();
		} else if ("memDetail".equals(type.substring(0, 9))) {
			command = new MemDetailCommand(type.substring(13));
		} else if ("adminUpdate".equals(type)) {
			command = new AdminUpdateCommand();
		} else if ("adminWithdrawal".equals(type)) {
			command = new AdminWithdrawalCommand();
		} else if("cardlist".equals(type)) {
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
		} else {
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
