package com.savanna.model.command.paging;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;

public class AbstractedDomainListPagingCommandExample implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		new ListPaging<SuperVO>().PagingDistributor(new SuperDAO(), request, 5, 5);
		return "domain/domainList.jsp";
	}
}
