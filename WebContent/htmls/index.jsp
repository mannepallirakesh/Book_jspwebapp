<html>
<style>

input[type=text] {
     background-color: #3CBC8D;
    color: white;
    }
    
    input[type=password] {
     background-color: #3CBC8D;
    color: white;
    }
    

body {

background-image: url("/jspwebapp/htmls/login.jpg");
background-size: 1400px 700px;
background-repeat: no-repeat;
}

</style>
<body>

<form method="POST" action="/jspwebapp/htmls/Signup.jsp">
  <div align="Center"  ><br><br><br><br><br><br><br><br><br>
  
  <p><font size="8">Don't have an Account!</font></p>
  
  <p><font size="6">To registered Please Click on 'SignUp'</font></p>
   </div>
   <div align = "center">
  <input type="submit" value="SignUp" />
  </div>
</form>
 


<form method="POST" action="/jspwebapp/htmls/LoginTest.jsp">
  <div align="left"  >
  
  <p><font color="red" size="6">Registered Users</font></p>
  Username: <input type="text"  name="userName" size="25" /><br />
  Password: <input type="password" name="passWord" size="25" /><br />
  <input type="submit" value="Login" />

  </div>
</form>
</body>
</html>