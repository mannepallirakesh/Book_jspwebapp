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

    
    
    
    try
    {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sysadmin");

Statement st=con.createStatement();
System.out.println("connection");

PreparedStatement pst = con.prepareStatement("SELECT BOOK_NAME, AUTHOR_NAME, PRICE FROM BOOK WHERE BOOK_ID = ?");
pst.setInt(1, bkid);
ResultSet rs = pst.executeQuery();



rs.next();
String bkn= rs.getString("BOOK_NAME");
System.out.println(bkn);
String an= rs.getString("AUTHOR_NAME");
System.out.println(an);
int newprice= rs.getInt("PRICE");
System.out.println(newprice);
out.println("<form method=\"POST\" action=\"UpdateDisplay.jsp\">");
out.println("<div align=\"center\"><br><br><br><br><br><br><br><br><br><br><br>");
out.println("<table cellpadding=2 cellspacing=1 border=\"1\" bgcolor=\"blue\">");

out.println("<th bgcolor=\"blue\" colspan=2><font size=5>Udate");

out.println("Page</font> <br></th>");
out.println("<center><tr bgcolor=\"white\"><td valign=top>");
out.println("<input type=\"hidden\" name=\"bookid\" value="+bkid+">");
out.println("</br>");
out.println("Book Name:<input type=\"text\" name=\"bookname\" value="+bkn+">");
out.println("</br>");
out.println("</br>");
out.println("Author Name:<input type=\"text\" name=\"authorname\" value="+an+">");
out.println("</br>");
out.println("</br>");
out.println("Book Price:<input type=\"text\" name=\"bkprice\" value="+newprice+">");

out.println();
out.println("<BR>");
out.println("</BR>");
out.println("<input type=\"submit\"  value=\"Update\">");
out.println();
out.println("<BR>");
out.println("</BR>");
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
