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
    <head><font color = "green" size="6">List of All Books</font></head>
        
       
        <style>table {	    font-family: arial, sans-serif;	    border-collapse: collapse;	    width: 100%;	}
			td, th {    border: 1px solid #dddddd;    text-align: left;    padding: 8px;}
			tr:nth-child(even) {    background-color: #dddddd;}
			</style>
			<table>
			<tr><th>BOOK NAME</th> <th>BOOK AUTHOR</th> <th>BOOK PRICE</th><th>ACTION</th> </tr>
		
		
<body>

 
<%

%>
<%@ page buffer="5kb" autoFlush="false" %>

<%
        try
               {
           Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sysadmin");
	    Statement st=con.createStatement();
		
	    String query = ("select * FROM BOOK");
	     
    	PreparedStatement pst  = con.prepareStatement(query);
		
	
		ResultSet rs = pst.executeQuery();
		
		
         
        while(rs.next())
         {
        	int bookid = rs.getInt("BOOK_ID");
         String BookName=rs.getString("BOOK_NAME");
         String AuthorName=rs.getString("AUTHOR_NAME");
         int Price = rs.getInt("PRICE");
        
  
         out.println("<form method=\"POST\" action=\"/jspwebapp/jsps/Update.jsp\">");
         out.println("<input type=\"hidden\" name=\"bookid\" value="+bookid+">");
			out.println(" <tr>"

					+ " <td>" + BookName
					+ "</td><td>" + AuthorName + "</td><td>" + Price
					+ "</td>  <td>");
			
			out.println("<input type=\"submit\"  value=\"Update\">");
			out.println("</form>");
			out.println("<form method=\"POST\" action=\"/jspwebapp/jsps/Delete.jsp\">");
			out.println("<input type=\"hidden\" name=\"bookid\" value="+bookid+">");
					
			out.println("<input type=\"submit\"  value=\"Delete\">");
			out.println("</form>");
			out.println("</td></tr>");
         }
        
        
           

               }



       catch(Exception e)
               {
    	   System.out.println("Problem while executing sql");
           out.println(e);
           e.printStackTrace();
           }


       %>
       
      
	</table>
	
	<form method="POST" action="/jspwebapp/jsps/insert.html">
  <div align="left"  ><br><br><br><br><br><br><br><br><br>
  
  
  
  <p><font color = "red" size="4">To Upload a New Book - Click on 'Upload'</font></p>
   
  <input type="submit" value="Upload" />
  </div>
</form>
	
	
	
	
<br></br>
<font color = "black" size="4">Logout</font>	<a  href="/jspwebapp/htmls/Logout.jsp"><input type = "submit"  value = "Logout"></a>
	
	
	
	
        </body>
</html>
