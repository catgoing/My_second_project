package com.savanna.model.command.cart;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;

public class CheckDeleteInCartCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String str = "";
		StringBuilder sb = new StringBuilder();
		BufferedReader br = null;
		InputStream is = request.getInputStream();
		if(is != null) {
			br = new BufferedReader(new InputStreamReader(is));
		}
		
		
		return "controller?type=cartList";
	}


}
