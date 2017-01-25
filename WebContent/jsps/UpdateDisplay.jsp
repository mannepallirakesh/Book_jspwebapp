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
<title>SignUp</title>
<center>
<img src="/jspwebapp/htmls/bookstore.jpg" Height = 20% Width = 50% size = 10px200px;" />
</center>
</head>

<body>

<%



 int bkid = Integer.parseInt(request.getParameter("bookid"));
System.out.println(bkid);
String bookname = request.getParameter("bookname");
System.out.println(bookname);
String authorname = request.getParameter("authorname");
System.out.println(authorname);
int bkprice = Integer.parseInt(request.getParameter("bkprice"));
System.out.println(bkprice);

    
    
    
    try
    {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sysadmin");

Statement st=con.createStatement();
System.out.println("connection");

PreparedStatement pst = con.prepareStatement("UPDATE BOOK SET  BOOK_NAME = ?, AUTHOR_NAME = ?, PRICE = ? WHERE BOOK_ID = ?");
pst.setString(1, bookname);
pst.setString(2, authorname);
pst.setInt(3, bkprice);
pst.setInt(4, bkid);
ResultSet rs = pst.executeQuery();



rs.next();
;{
	%>
	<%@ page buffer="5kb" autoFlush="false" %>
	<jsp:forward page="All.jsp"/>
	<%
	 response.sendRedirect("All.jsp");
}
	

	






out.println();
out.println("<BR>");
out.println("</BR>");
out.println();
out.println();
out.println("<BR>");

out.println("</BR>");


    }

catch(Exception e)
    {

}

    %>
    
    
	



</body>
</html>
