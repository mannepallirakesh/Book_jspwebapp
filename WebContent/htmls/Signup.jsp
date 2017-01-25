
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

	<form NAME="MyForm" method="POST" action="/jspwebapp/jsps/SignupTest.jsp">

		<center>
			<table cellpadding=2 cellspacing=1 border="1" bgcolor="blue">

				<th bgcolor="blue" colspan=2><font size=5>SignUp
						Page</font> <br></th>
				<center>
					<tr bgcolor="white">
						<td valign=top>FirstName:<input type="text" ><br>
						<br> LastName <input type="text" ><br>
						<br> Email:<input type="text" ><br>
						<br> Phone: <input type="text" ><br>
						<br> Username:<input type="text" name="Username"><br>
						<br> Password: <input type="password" name="Password"><br>
						<br>
					<tr bgcolor="white">
						<td align=center colspan=1><input type="submit" value="SignUp">
						
            <INPUT TYPE="RESET" value="Reset">
						</td>
					</tr>
				</center>
			</table>
		</center>


	</form>


<font color = "red" size="4">Returned User Click on 'Login'</font>	<a  href="/jspwebapp"><input type = "submit"  value = "Login"></a>
</body>
</html>
