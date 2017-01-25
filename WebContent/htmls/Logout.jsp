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

<%@ page import="javax.servlet.Filter"%>
<%@ page import="javax.servlet.FilterChain"%>
<%@ page import="javax.servlet.FilterConfig"%>
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

        session.removeAttribute("LoggedInUser");
        response.sendRedirect("/jspwebapp/htmls/index.jsp");
        %>

       
     
        </body>
</html>
