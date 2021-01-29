<!-- This is a GenericMini to be called with table name-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->

<!--#include file="common/GilonHiddenURLSession_NoHello.asp"-->



<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
betweenFrom= request("betweenFrom")
betweenTo= request("betweenTo")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")

tableName = request("tableName")
if tableName = "" then
    Response.Write "requires pm tableName "
    Response.End
end if

%>

<!--#include file="common/update_Generic.asp"-->

<%

            SQL = "select * from " & tableName

   If (tableName = "Enrolment" ) Then
       SQL = "select * from vEnrolment "
   End IF


%>




<form action="guest_add.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value="<%=uid%>" >
<input type="hidden" name="tableName" value="<%=tableName%>" >
 &nbsp; <input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>



<table border="2" cellpadding="2" cellspacing="0">
<tr>
<td width="100%"><font face="Verdana" size="1">

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

RS.Open SQL, SQLCN, 1, 3

RS.PageSize = 280
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount



If NOT (RS.BOF AND RS.EOF) Then
%>
<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<%

isAnID=false
for each x in RS.Fields
if InStr(x.Name,"ID") > 0 then isAnID =true else isAnID=false end if

if isAnID then
 %>
   <td bgcolor="#C5D3E7">

   </td>
 <%
 end if
if Not isAnID then
 %>

    <td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
    <%=x.name%> &nbsp; </b></font> </td>

 <%
 end if
   next
%>

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
<%

isAnID=false
for each x in RS.Fields
if InStr(x.Name,"ID") > 0 then isAnID =true else isAnID=false end if

if isAnID then
 %>
   <td bgcolor="<%=color1%>">
   </td>
 <%
 end if
 if Not isAnID then
 %>
   <td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%= x.value %></font></td>
 <%
 end if
   next
%>

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
<td colspan="5">


<table border="0" cellpadding="0" cellspacing="0" width="100%">
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
</font></td></tr>

</table></td></tr>

</table>


<%End If
Else
If (SearchFor = "") Then%>
<center><font face="Verdana, arial" size="1">There are currently no items in this category</font></center>
<%Else%>
<center><font face="Verdana, arial" size="1">There are no items that match your search</font></center>
<%End If
End If
RS.close
Set RS = Nothing
%>

</font></td>
</tr>
</table>


