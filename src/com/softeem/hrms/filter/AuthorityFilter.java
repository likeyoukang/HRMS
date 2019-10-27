package com.softeem.hrms.filter;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthorityFilter implements Filter{

	String[] allowPages;
	
	@Override
	public void init(FilterConfig config) throws ServletException {

		allowPages = config.getInitParameter("allowPages").split(",");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;


		String uri = request.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");

		String srcName = uri.substring(lastIndex+1);
		

		boolean isAllow = false;

		for (String page : allowPages) {
			if(Objects.equals(srcName, page)){
				//����
				isAllow = true;
				break;
			}
		}

		if(isAllow){
			chain.doFilter(request, response);
		}else{
			//���session
			Object obj = request.getSession().getAttribute("user");

			if(obj != null){
				chain.doFilter(request, response);				
			}else{
				request.setAttribute("msg", "please login");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}

	@Override
	public void destroy() {
		
	}

}
