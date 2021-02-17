package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.AdminLoginCommand;
import com.savanna.model.command.AdminUpdateCommand;
import com.savanna.model.command.AdminWithdrawalCommand;
import com.savanna.model.command.CardListCommand;
import com.savanna.model.command.CartInsertCommand;
import com.savanna.model.command.CartListCommand;
import com.savanna.model.command.ClearCartCommand;
import com.savanna.model.command.Command;
import com.savanna.model.command.CreateBookCommand;
import com.savanna.model.command.DeleteBookCommand;
import com.savanna.model.command.DeleteInCartCommand;
import com.savanna.model.command.DoSignInCommand;
import com.savanna.model.command.DoSignUpCommand;
import com.savanna.model.command.EditQuantCommand;
import com.savanna.model.command.InquiryIdCommand;
import com.savanna.model.command.InquiryPwdCommand;
import com.savanna.model.command.ListPagingCommand;
import com.savanna.model.command.LogoutCommand;
import com.savanna.model.command.MemDetailCommand;
import com.savanna.model.command.MemListCommand;
import com.savanna.model.command.MyInfoCommand;
import com.savanna.model.command.OrderGoCommand;
import com.savanna.model.command.PwdCheckCommand;
import com.savanna.model.command.SignInCommand;
import com.savanna.model.command.SignUpCommand;
import com.savanna.model.command.TempBookInsertCommand;
import com.savanna.model.command.UpdateBookCommand;
import com.savanna.model.command.UpdateCommand;
import com.savanna.model.command.WithdrawalCommand;
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
			if (1 == 2) {
				System.out.print("error test");
			} else if ("signUp".equals(type)) {
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
			else if ("update".equals(type)) {
				command = new UpdateCommand();
			}
			else if ("withdrawal".equals(type)) {
					command = new WithdrawalCommand();
			}
			else if (type.indexOf("memList") == 0) {
				 if(type.length()==7) {
				    command = new MemListCommand("1");
				 } else
				 command = new MemListCommand(type.substring(14));
			}
			else if ("inquiryId".equals(type)) {
			command = new InquiryIdCommand();
			}
			else if ("inquiryPwd".equals(type)) {
			command = new InquiryPwdCommand();
			}
			else if (type.indexOf("memDetail") == 0) {
			command = new MemDetailCommand(type.substring(13));			   
			}
			else if ("adminUpdate".equals(type)) {
				command = new AdminUpdateCommand();
			}
			else if ("adminWithdrawal".equals(type)) {
				command = new AdminWithdrawalCommand();
			}else if("cardlist".equals(type)) {
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
			
			else if ("cartList".equals(type)) { //장바구니 보기
				command = new CartListCommand();
			} 
			else if("cartInsert".equals(type)){ //장바구니 넣기
				command = new CartInsertCommand();
			}
			else if("deleteInCart".equals(type)){ //장바구니에서 삭제
				command = new DeleteInCartCommand();
			}
			else if("clearCart".equals(type)){ //장바구니 비우기
				command = new ClearCartCommand();
			} 
			else if("orderGo".equals(type)){ //구매하기
				command = new OrderGoCommand();
			} 
			else if("editQuan".equals(type)){ //장바구니에서 수량변경
				command = new EditQuantCommand();
			}
			else if("tempBookInsert".equals(type)){ //Cart에 담기위한 임시상품리스트
				command = new TempBookInsertCommand();
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
