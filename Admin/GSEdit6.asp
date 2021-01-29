<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<%
    procName ="procGS5"
    procNameEdit="procGSc6d2"
    procName=procNameEdit

    isId2new = request("isId2new")
    mysql = request("mysql")
    myheader = request("myheader")
    actionPage = request("actionPage")

        editSQL = request("editSQL")


    sql = mysql
   	AddID = request("ID")

sql =editSQL & AddID
Response.Write sql & "<br>"
if (isId2new = "true") Then
   Response.Write  "This will be saved As NEW"
   AddId = "-1"
end if

If (actionPage = "") Then
             actionPage ="GSAdd6.update.asp"
end if


	If (AddID <> "") Then
             myID =AddID
        else
             myID = 1
             AddID = -1
        end if

tableName = request("tableName")
'if tableName = "" then
'    Response.Write "requires pm tableName "
'    Response.End
'end if

if tableName = "vGuestDepartures" then
    tableName = "Guest"
end if

Response.Write "<br>" & myheader


%>

<b> <%=myheader%>  </b>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<form action="<%=actionPage%>" name="frmUser" Method="POST">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>

<%
set RS = SQLCN.Execute(sql )
%>




<%
clr="#DAE3F0"

for each x in RS.Fields
%>


<!--#include file="common\columnFormFormatter.asp"-->

<%
   next
%>






<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">



</tr>


<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">

<input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
<input type="hidden" name="tableName"  value="<%=tableName%>" >
<input type="hidden" name="procName"  value="<%=procName%>" >
<input type="hidden" name="uid"        value="<%=uid%>" />
<input type="hidden" name="AddId"      value=<%=AddId%> >
<input type="submit" name="Submit" value="Delete" class="inputSubmit">
</td>
</tr>



</table>
</form>


</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
