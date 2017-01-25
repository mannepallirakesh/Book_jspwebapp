package com.training.jspwebapp;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.security.*;

public class FilterTest implements Filter 
{
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException 
  {
	       
    System.out.println("In filter test 1.");
    chain.doFilter(request, response);
    System.out.println("Leaving filter test 1.");
    
    HttpServletRequest httpRequest = (HttpServletRequest)request;
	  
    HttpSession session = httpRequest.getSession(false);
	   
    if(session == null || (session != null && session.getAttribute("LoggedInUser") == null))
    {   System.out.println("User not logged in or session expired.");
 	   RequestDispatcher dispacher = httpRequest.getRequestDispatcher("/");
 	   dispacher.forward(request, response);
    	 return;
    }else{    	
    	System.out.println("httpRequest.getRequestURL() "+httpRequest.getRequestURL());
    	System.out.println("httpRequest.getServletPath() "+httpRequest.getServletPath());
    	System.out.println("httpRequest.getServerName() "+httpRequest.getServerName());
    	
    	 System.out.println("Once the filters verified it will take you to this forwarding page.");
 	   RequestDispatcher dispacher = httpRequest.getRequestDispatcher(httpRequest.getServletPath());
 	   dispacher.forward(request, response);
 	   return;
    }
    
  }

  public void destroy() 
  { 
  }

  public void init(FilterConfig filterConfig) 
  {
	  System.out.println( filterConfig.getInitParameter("emailId"));
  }
  
}
