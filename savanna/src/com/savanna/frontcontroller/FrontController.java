package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.MainPageCommand;
import com.savanna.model.command.board.CommDeleteCommand;
import com.savanna.model.command.board.CommInsertCommand;
import com.savanna.model.command.board.ReviewDeleteCommand;
import com.savanna.model.command.board.ReviewInsertCommand;
import com.savanna.model.command.board.ReviewListPagingCommand;
import com.savanna.model.command.board.ReviewUpdateCommand;
import com.savanna.model.command.book.BookListPagingCommand;
import com.savanna.model.command.book.CreateBookCommand;
import com.savanna.model.command.book.DeleteBookCommand;
import com.savanna.model.command.book.EnterCardListCommand;
import com.savanna.model.command.book.UpdateBookCommand;
import com.savanna.model.command.book.viewDispatchCommand.EnterBookDetailCommand;
import com.savanna.model.command.book.viewDispatchCommand.EnterCreateBookViewCommand;
import com.savanna.model.command.book.viewDispatchCommand.EnterUpdateBookViewCommand;
import com.savanna.model.command.member.AdminUpdateCommand;
import com.savanna.model.command.member.AdminWithdrawalCommand;
import com.savanna.model.command.member.DoPwdCheckCommand;
import com.savanna.model.command.member.DoSignInCommand;
import com.savanna.model.command.member.DoSignUpCommand;
import com.savanna.model.command.member.IdCheckCommand;
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
import com.savanna.model.command.cart.*;

@WebServlet("/controller")
public class FrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
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
		} else if (type.indexOf("memList") == 0) {
			command = type.length()==7
					? new MemListCommand("1")
					: new MemListCommand(type.substring(14));
		} else if ("inquiryId".equals(type)) {
			command = new InquiryIdCommand();
		} else if ("inquiryPwd".equals(type)) {
			command = new InquiryPwdCommand();
		} else if ("memDetail".equals(type)) {
			command = new MemDetailCommand(id);
		} else if ("idCheck".equals(type)) {
			command = new IdCheckCommand(id);
		} else if ("doPwdCheck".equals(type)) {
			command = new DoPwdCheckCommand(id, pwd);
		} else if ("doPwdCheckwithdrawal".equals(type)) {
			command = new DoPwdCheckCommand(id, pwd, type.substring(10));;
		} else if ("adminUpdate".equals(type)) {
			command = new AdminUpdateCommand();
		} else if ("adminWithdrawal".equals(type)) {
			command = new AdminWithdrawalCommand();
		} else if("StockList".equals(type)) {
			command = new EnterCardListCommand();
		} else if("StockManagerPage".equals(type)) {
			System.out.print("Expect:StockManagerPage");
			command = new BookListPagingCommand();
		} else if("CreateBook".equals(type)) {
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
		} else if("reviewPage".equals(type) || "reviewList".equals(type)) {
			command = new ReviewListPagingCommand();
		} else if("reviewInsert".equals(type)) {
			command = new ReviewInsertCommand();
		} else if("reviewUpdate".equals(type)) {
			command = new ReviewUpdateCommand();
		} else if("reviewDelete".equals(type)) {
			command = new ReviewDeleteCommand();
		} else if("commInsert".equals(type)) {
			command = new CommInsertCommand();
		} else if("commDelete".equals(type)) {
			command = new CommDeleteCommand();
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
		else if("orderPayment".equals(type)){ //구매step1
			command = new OrderPaymentCommand();
		}
		else if("GoOrder".equals(type)){ //구매step2
			command = new OrderGoCommand();
		}
		else if("editQuan".equals(type)){ //장바구니에서 수량변경
			command = new EditQuantCommand();
		}
		else if("tempBookInsert".equals(type)){ //Cart에 담기위한 임시상품리스트
			command = new TempBookInsertCommand();
		}
		else if("paymentComplete".equals(type)){ //구매완료
			command = new PaymentCompleteCommand();
		}
		else if("creditCardProc".equals(type)){ //카드결제진행창
			command = new CreditCardProcCommand();
		}
		else if("payCreditCard".equals(type)){ //카드결제완료
			command = new PayCreditCardCommand();
		} else if("MainPage".equals(type)) {
			System.out.print("expect:MainPage");
			command = new MainPageCommand();
		}else {
			System.out.print("Command Error");
		}
		String path = command.execute(request, response);


		if(type.indexOf("List") != 0) {
			request.setAttribute("curList", type);
		}
		if(type.indexOf("idCheck") != 0 && type.indexOf("doPwdCheck") != 0) {
			request.getRequestDispatcher(path).forward(request, response); // 데이터 포워딩하는 부분
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doPost() 실행~~");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
