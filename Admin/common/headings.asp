


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
