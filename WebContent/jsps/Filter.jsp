 <%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.lang.*" %>
<%@ page import="javax.servlet.Filter"%>
<%@ page import="javax.servlet.FilterChain"%>
<%@ page import="javax.servlet.FilterConfig"%>

<%@ page import="javax.servlet.ServletRequest"%>
<%@ page import="javax.servlet.ServletResponse"%>
<%@ page import="javax.servlet.RequestDispatcher"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
   

<html>
  		
<body>

 
<%


HttpServletRequest httpRequest = (HttpServletRequest)request;

HttpSession sess = httpRequest.getSession(false);
   
if(sess == null || (sess != null && sess.getAttribute("LoggedInUser") == null))
{   System.out.println("User not logged in or session expired.");
	   RequestDispatcher dispacher = httpRequest.getRequestDispatcher("/htmls/index.jsp");
	   dispacher.forward(request, response);
	 
}else{    	
	System.out.println("httpRequest.getRequestURL() "+httpRequest.getRequestURL());
	System.out.println("httpRequest.getServletPath() "+httpRequest.getServletPath());
	System.out.println("httpRequest.getServerName() "+httpRequest.getServerName());
	
	 System.out.println("Once the filters verified it will take you to this forwarding page.");
	   RequestDispatcher dispacher = httpRequest.getRequestDispatcher(httpRequest.getServletPath());
	   dispacher.forward(request, response);
}

       %>
       
     
        </body>
</html>
