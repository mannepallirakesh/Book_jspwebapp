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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        


    </head>
    <body>
<%



         String user = request.getParameter("userName");
        String passwrd= request.getParameter("passWord");
        System.out.println(user);
        System.out.println(passwrd);
       try
               {
           Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sysadmin");
	    Statement st=con.createStatement();
		
    	
    	String query = ("select count(USERNAME)AS CS from admin where USERNAME = ? and PASSWORD = ? ");
     
    	PreparedStatement pst  = con.prepareStatement(query);
		
		pst.setString(1, user);
		pst.setString(2, passwrd);
		ResultSet rs = pst.executeQuery();
		con.commit();
		
		         
         
       while( rs.next()){
    	   
    	   int cs = rs.getInt("CS");
        
        System.out.println(user);
        System.out.println("entered while");
         
        	
         
         if(cs == 1)
             {
                        System.out.println("Success"); 
                        
                        HttpSession httpSession = request.getSession(true);
                        httpSession.setMaxInactiveInterval(30);//seconds

                        httpSession.setAttribute("LoggedInUser", user);

                        %>
            <jsp:forward page="/jsps/All.jsp"/>
        <%
        
        return;
             }
        
        else
        {
       	 System.out.println("fail");
            
       	 %>
            <jsp:forward page="LoginFailed.jsp"/>
        <%
        }
     
         }
         
         
         
           
       


           }




       catch(Exception e)
               {
    	   System.out.println("Problem while executing sql");
           out.println(e);
           e.printStackTrace();
           }
       


       %>


        </body>
</html>
