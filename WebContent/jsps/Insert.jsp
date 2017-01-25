

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
        <title>Upload Book</title>

<center>
<img src="/jspwebapp/htmls/bookstore.jpg" Height = 20% Width = 50% size = 10px200px;" />
</center>

         
    </head>
    <body>
    
    

        <%
        String bname = request.getParameter("bname");
        String aname= request.getParameter("aname");
        int price = Integer.parseInt(request.getParameter("price"));
        System.out.println(bname);
        System.out.println(aname);
        System.out.println(price);
        
       try
               {
           Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sysadmin");

        Statement st=con.createStatement();
        System.out.println("connection");
        
         ResultSet rs=st.executeQuery("SELECT MAX(BOOK_ID) AS MAX_ID FROM BOOK");
         
         
         rs.next();
         

         int max= rs.getInt("MAX_ID");
       System.out.println("test");
         System.out.println(max);
               		
  //    ResultSet res=st.executeQuery("INSERT INTO BOOK(BOOK_ID, BOOK_NAME, AUTHOR_NAME, PRICE) VALUES(?, ?, ?, ?)");
        	String query = "INSERT INTO BOOK(BOOK_ID, BOOK_NAME, AUTHOR_NAME, PRICE) VALUES(?, ?, ?, ?)";
         
        	PreparedStatement pst  = con.prepareStatement(query);

    		pst.setInt(1, max+1);
    		pst.setString(2, bname);
    		pst.setString(3, aname);
    		pst.setInt(4, price);
    		pst.executeUpdate();
    		System.out.println("done");
  //  		con.commit();
    		%>
            <jsp:forward page="All.jsp"/>
        <%
       
               }
       
       catch(Exception e)
               {
           
           }

     

       %>

        </body>
</html>
