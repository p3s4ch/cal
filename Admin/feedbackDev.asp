<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="common/GilonHiddenURLSession.asp" -->


<%

AddID = request("AddID")
if AddID="" then
   AddID = request("ID")
end if

uid = request("uid")
justconfirmed = request("conf")


SQL = "exec GetEventById2 "& AddID

Response.Write SQL
Set RS = SQLCN.Execute(SQL)
conf  = RS("BillTotal")
Response.Write conf

fmtDtTim = Day(StartTime)& " "& MonthName(Month(StartTime),true) & " "& Year(StartTime)

%>

<font face="Verdana" size="7" color="black">

<table border="0" cellpadding="0" cellspacing="0" width="100%" height="50%" align="left">

<tr><td height="1" colspan="5" bgcolor="#000000"> </td></tr>

<tr><td bgcolor="black"></td>
    <td colspan="3" bgcolor="#B0C4DE" height="35">
    <font face="Verdana" size="5" color="black"><b><%=fmtDtTim%> </b></font></td>
    <td bgcolor="#000000"></td>
 </tr>


<tr><td height="1" colspan="5" bgcolor="black"> </td></tr>






<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >     </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">




   <A href="main.asp?uid=<%=uid%>&operator=<%=operator%>">      <b> Back </b></a> &nbsp; &nbsp; &nbsp;

   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

   <A href="main.asp?uid=<%=uid%>&operator=<%=operator%>"> <b>  Home</b></a>  </td>

  </td>
  <br>
<td bgcolor="#000000" col_number=5>     </td>
</tr>

<tr><td height="1" colspan="5" bgcolor="#000000"></td></tr>

<tr>
<td bgcolor="#000000"></td>
<td bgcolor="#B0C4DE" colspan="3" align="center"  height="30">
<font face="Verdana" size="1"><br>&copy;2007 Micromen, By G Uzvolk</font></td>
<td bgcolor="#000000"></td>
</tr>
<tr><td height="1" colspan="5" bgcolor="#000000"></td></tr>

</table>
</font>



</body>
</html>
