<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="style.asp"-->

<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">

<tr><td height="1" colspan="5" bgcolor="#000000"> </td></tr>

<tr><td bgcolor="black"></td>
    <td colspan="3" bgcolor="#B0C4DE" height="35">
    <font face="Verdana" size="5" color="#FFCC00"><b>&nbsp;Methusela</b></font></td>
    <td bgcolor="#000000"></td>
 </tr>
<tr><td height="1" colspan="5" bgcolor="black"> </td></tr>

<tr>
<td bgcolor="black"></td>
<td bgcolor="#B0C4DE" width="11%" valign="top" ><!--#include file="common\Menu_Table.asp"--></td>
<td bgcolor="black"></td>
<td bgcolor="#FFFFFF" width="89%" valign="top">


main area
(using Conn =mdb)
<%
Set RS = Server.CreateObject("ADODB.Recordset")

Dim colorchanger
Dim color1
Dim color2
colorchanger = 0
color1 = "#C5D3E7"
color2 = "#B0C4DE"

dim intPage
dim intPageCount
dim intRecordCount

If Request.QueryString("page") = "" Then
	intPage = 1	
Else
	intPage = Request.QueryString("page")
End If
	
RS.CursorLocation = 3
RS.CursorType = 3
RS.ActiveConnection = Conn

SQL = "SELECT * FROM Categories"
RS.Open SQL, Conn, 1, 3
	
RS.PageSize = 20
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount

If NOT (RS.BOF AND RS.EOF) Then
%>

<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>&nbsp;Category&nbsp;Name&nbsp;</b></font></td>
</tr>

<%	
If CInt(intPage) > CInt(intPageCount) Then intPage = intPageCount
	If CInt(intPage) <= 0 Then intPage = 1
		If intRecordCount > 0 Then
			RS.AbsolutePage = intPage
			intStart = RS.AbsolutePosition
			If CInt(intPage) = CInt(intPageCount) Then
				intFinish = intRecordCount
			Else
				intFinish = intStart + (RS.PageSize - 1)
			End if
		End If
	If intRecordCount > 0 Then
		For intRecord = 1 to RS.PageSize
%>
<tr>
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1"><a href="categories_delete.asp?ID=<%=RS("ID")%>">Remove</a></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Category")%></font></td>
</tr>
			
<%
RS.MoveNext
If colorchanger = 1 Then
	colorchanger = 0
	color1 = "#C5D3E7"
	color2 = "#B0C4DE"
Else
	colorchanger = 1
	color1 = "#DAE3F0"
	color2 = "#C5D3E7"
End If

If RS.EOF Then Exit for
	Next
%>
<tr>
<td colspan="5"><table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td width="50%" align="left"><font face="Verdana, arial" size="1">
<%If cInt(intPage) > 1 Then%>
	<a href="?orderby=<%=orderBy%>&page=<%=intPage - 1%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>"><< <b>Prev</b></a>
<%End If%>
</font></td>
<td width="50%" align="right"><font face="Verdana, arial" size="1" >
<%If cInt(intPage) < cInt(intPageCount) Then%>
	<a href="?orderby=<%=orderBy%>&page=<%=intPage + 1%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>"><b>Next</b> >></a>
<%End If%>
</font></td></tr></table></td></tr></table><br>
<%End If
Else%>
<center><font face="Verdana, arial" size="1">There are currently no categories.</font></center>
<%
End If
RS.close
Set RS = Nothing
%>







  </td>
<td bgcolor="#000000" col_number=5></td>
</tr>

<tr><td height="1" colspan="5" bgcolor="#000000"></td></tr>

<tr>
<td bgcolor="#000000"></td>
<td bgcolor="#B0C4DE" colspan="3" align="center"  height="30">
<font face="Verdana" size="1"><br>&copy;2007 Micro Software Ltd, By Gilon Uzvolk</font></td>
<td bgcolor="#000000"></td>
</tr>

<tr><td height="1" colspan="5" bgcolor="#000000"></td></tr>

</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
