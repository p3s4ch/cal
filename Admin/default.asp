<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<html>
<head>
<title>Micro Men Calendar</title>

<!--#include file="style.asp"-->


<style type="text/css" >
p {text-align: centre}
</style>

</head>



<body bgcolor="#F0F0F0" vlink="#48576C" link="#48576C" alink="#000000">



<br><br><br>


<font face="Verdana" size="2">OrderOnline
</font>
<br>
<font face="Verdana" size="1">

If you have used our online diaries before you should login with your User ID <br>
(This is usually your email address.) <br>

Alternatively , just click on check availability. <br>
For help or any other issues please call 0788 1966 867 <br>


<%
	If Request("SecondTry") = "True" Then
		If Request("WrongPW") = "True" Then
			Response.Write "<center>Invalid Password.  Please try again.</center>"
		Else
			Response.Write "<center>User ID not found.  Please try again.</center>"
		End If
	End If
%>
</font>
<form action="login.asp" Method="Post">

  <table border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td bgcolor="#000000">

<table border="0" cellpadding="2" cellspacing="1" align="center">
<tr>

        <td bgcolor="#52637B" align="center"> Please Login </td>
</tr>

<tr>
<td bgcolor="#B0C4DE">
<table border="0" cellpadding="2" cellspacing="0" align="center">
<tr>
<td align="right"><font face="Verdana" size="1">User :</font></td>
<td><input type="Text" name="Admin_ID" size="35" class="inputBox"></td>
</tr>
<tr>
<td align="right"><font face="Verdana" size="1">Password:</font></td>
<td><input type="Password" name="Password" size="35" class="inputBox"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" size="60" value="Login" class="inputSubmit"></td>
</tr>
</table>
</tr>
</table>
</td>
</tr>
</table>
</form>

<br>
<br>








<table border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td><font face="Verdana" size="1">Alternatively, just enter below &nbsp; </font>
</td>
</tr>
</table>





<br>
<br>


<form id="form2" action="main.asp?uid=43" Method="Post">

  <table border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td bgcolor="#000000">

<table border="0" cellpadding="2" cellspacing="1" align="center">
<tr>

        <td bgcolor="#52637B" align="center">  </td>
</tr>

<tr>
<td bgcolor="#B0C4DE">
<table border="0" cellpadding="2" cellspacing="0" align="center">
<tr>
<td align="right"><font face="Verdana" size="1"></font></td>
<td><input type="hidden" name="Admin_ID" size="15" class="inputBox"></td>
</tr>
<tr>
<td align="right"><font face="Verdana" size="1"></font></td>
<td></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" size="20" value="Enter to Check Availability" class="inputSubmit"></td>
</tr>
</table>
</tr>
</table>
</td>
</tr>
</table>
</form>


</body>
</html>
<!--#include file="dsn2.asp"-->