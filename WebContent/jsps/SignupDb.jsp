

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
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


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-up Success</title>
         
    </head>
    <body>

        <%
        String user = request.getParameter("Username");
        String passwrd= request.getParameter("Password");
       try
               {
           Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sysadmin");

        Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("SELECT MAX(USER_ID) MAX_ID FROM USERS");
         int max= rs.getInt("MAX_ID");
         out.println("test");
         out.println(max);
        while(rs.next())
         {
        		
        	
        	String query = "INSERT INTO USERS(USER_ID, USER_NAME, PASSWORD) VALUES(?, ?, ?)";
         
        	PreparedStatement pst  = con.prepareStatement(query);

    		pst.setInt(1, max+1);
    		pst.setString(2, user);
    		pst.setString(3, passwrd);
    		pst.executeUpdate();
    		out.println("done");
    		
         }
       
               }
       
       catch(Exception e)
               {
           
           }

     

       %>

        </body>
</html>
