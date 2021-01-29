<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="common/GilonHiddenURLSession.asp" -->


<%

AddID = request("AddID")
if AddID="" then
   AddID = request("ID")
end if

uid = request("uid")
justconfirmed = request("conf")



if justconfirmed  = "confirmed" then
       sql_u = "update cEvents set Confirmed= 'Confirmed' where ID = "& AddID
       SQLCN.Execute(sql_u)
end if

if justconfirmed  = "Not Paid" then
       sql_u = "update cEvents set Confirmed= 'Not Paid' where ID = "& AddID
       SQLCN.Execute(sql_u)
end if


if justconfirmed  = "Paid" then
       sql_u = "update cEvents set Confirmed= 'Paid' where ID = "& AddID
       SQLCN.Execute(sql_u)
end if

if justconfirmed  = "Cancelled" then
       sql_u = "update cEvents set Confirmed= 'Cancelled' where ID = "& AddID
       SQLCN.Execute(sql_u)
end if

SQL_PRE = "exec [dbo].[SetByCursorAllFeedbacks]  "& AddID
Set RS_PRE = SQLCN.Execute(SQL_PRE)



SQL = "exec GetEventById2 "& AddID
Set RS = SQLCN.Execute(SQL)
conf  = RS("Confirmed")
StartTime =RS("StartTime")
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
<td bgcolor="#B0C4DE" width="11%" valign="top" >   &nbsp;     </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">  &nbsp;   <%=RS("Title")%> &nbsp;  <%=RS("Firstname")%>  &nbsp; <%=RS("Surname")%> </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >   &nbsp;     </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">  &nbsp; </td>
<td bgcolor="#000000" col_number=5></td>
</tr>
<tr height="7" >
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" > Time:                   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">&nbsp;<b> <%=RS("tm")%> &nbsp; - &nbsp; <%=RS("tm2")%>  </b>  </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr  height="7">
<td  bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" > Operator                   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top"> &nbsp; <%=RS("Operator")%>     </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td height="7"  bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Address   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">&nbsp; <%=RS("SiteAddress")%>   &nbsp; &nbsp; <%=RS("SitePostCode")%> </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td height="7"  bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Phone   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">&nbsp; <%=RS("Phone")%>   </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td height="7"  bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Mobile   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">&nbsp; <%=RS("Mobile")%>   </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td height="7"  bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Email   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">&nbsp; <%=RS("Email")%>  </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Category               </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">  &nbsp; <%=RS("Category")%>    </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Price &pound; <br>(excl vat)               </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">  &nbsp; &pound; <%=RS("BillTotal")%>    </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" > Details    </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top"> &nbsp; <%=RS("Details")%>    </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" > &nbsp;    </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top"> &nbsp; &nbsp;    </td>
<td bgcolor="#000000" col_number=5></td>
</tr>


<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" > &nbsp;&nbsp;    </td>
<td bgcolor="black"></td>

<td bgcolor="#FFFFFF" width="89%" valign="top">

</br>




</td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  Status    </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">


<%
  if (conf = "Unpaid" or conf = "Not Paid" or conf = "Requires Feedback" ) then
%>
     <br/>
    <form href="EventView.asp" name="frmUser2" Method="Post" >
    <input type="hidden"  name="uid" value=<%=uid%>  >
    <input type="hidden"  color ="red" name="conf" value="Cancelled" >
    <input type="submit"  color ="red" name="Submit" value="Click here if job is cancelled !" class="inputSubmit"></form>
<%
   end if
%>

<%
  if conf = "Confirmed" then
      Response.Write "&nbsp; <font color=green><b> Appointment  has been confirmed </b></font>"
  end if
  if conf = "Paid" then
      Response.Write "&nbsp; <font color=blue><b> Paid </b></font>"
  end if

 if (conf = "Unpaid" or conf = "Not Paid") and isCustomer=1 then
      Response.Write "&nbsp; <font color=red><b> Unpaid </b></font>"
  end if

 if conf = "Cancelled" then
      Response.Write "&nbsp; <font color=black><b> Cancelled </b></font>"
  end if
%>


<br>
 Previous comments and feedback:  <%=RS("feedbacks")%>


<%
  if conf = "Unconfirmed" and not isCustomer=1 then
%>
    <form href="EventView.asp" name="frmUser2" Method="Post" >
    <input type="hidden"  name="uid" value=<%=uid%>  >
    <input type="hidden"  color ="red" name="conf" value="confirmed" >
    <input type="submit"  color ="red" name="Submit" value="Please click here to confirm!" class="inputSubmit"></form>
<%
   end if
%>



   <form action="Feedback_done.asp" name="frmUser2" Method="GET">
     <input type="hidden" name="uid" value=<%=uid%> />
     <input type="hidden" name="feedbackID" value="-1" />
     <input type="hidden" name="EventID" value=<%=AddID%> />

<%
  if not isCustomer=1  then
%>


   Materials & Labour :
   <textarea name="mat_lab" class="inputbox" cols="60" rows="2">  </textarea> <br>
   Customer already paid &pound;
   <input type="text" name="CustomerAlreadyPaid" value=<%=RS("customerPaidAlready")%>  class="inputbox" size="10" maxlength="255" >

   <br>
   AND / OR
   Send Invoice Price excluding  VAT &pound;
   <input type="text" name="GenerateInvoicePrice" class="inputbox" size="10" maxlength="255"> &nbsp;
   <input type="submit" name="Submit" value="Submit" class="inputSubmit">
   </form>

<%
  else
%>


&nbsp;&nbsp; please fill in any feedback or comments about the job: <br>
&nbsp;&nbsp;
&nbsp; &nbsp; &nbsp;
<textarea name="mat_lab" class="inputbox" cols="60" rows="2">  </textarea>
<input type="submit" name="Submit" value="Save" class="inputSubmit">
</form>

<%
   end if
%>









</td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" >  &nbsp;   </td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">   </td>
<td bgcolor="#000000" col_number=5></td>
</tr>


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
