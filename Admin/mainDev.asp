<!--#include file="dsn.asp"-->
<!--not include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="Common/GilonHiddenURLSession.asp"-->
<!--#include file="common/cancel_event.asp"-->

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<%
orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")

'team = request("team")


Response.Write "team =" & team
Response.Write "<br>uid =" & uid & "<br>"

SQLCN.execute("SetFirstAvail " & uid )


SQL = "GetDiaries '" & team &"'"


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

RS.Open SQL, SQLCN, 1, 3


RS.PageSize = 20
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount

If NOT (RS.BOF AND RS.EOF) Then
%>


<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#FFFFFF"></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>Name&nbsp;</b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>&nbsp; does ... &nbsp;</b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>&nbsp;&nbsp;</font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="red" ><b>&nbsp; Earliest available slot... &nbsp;</b></font></td>




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
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">



<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Name")   %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Services")   %></font></td>
<td bgcolor="<%=color2%>">


		 <a href="MonthView.asp?uid=<%=uid%>&Operator=<%=RS("Name")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">
		 <font face="Verdana, arial" size="1" color=black>

		 Month&nbsp;&nbsp;

          </font>
          </a>

          <font face="Verdana, arial" size="1">
                      <a href="WeekView.asp?uid=<%=uid%>&Operator=<%=RS("Name")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">
                      View Diary
                      </a>&nbsp;&nbsp;

          </font></td>


<td bgcolor="<%=color2%>">

                      <a href="WeekView.asp?uid=<%=uid%>&Operator=<%=RS("Name")%>&iDay=<%=RS("day")%>&iMonth=<%=RS("iMonth")%>&iYear=<%=RS("yr")%> ">
                      <font face="Verdana, arial" size="1" color="red">
                      <%=RS("dw")%> &nbsp; <%=RS("day")%>&nbsp; <%=RS("mnth")%> &nbsp;<%=RS("yr")%>&nbsp;&nbsp; <%=RS("tm")%> </font>
                      </a>&nbsp;&nbsp;
          </td>



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
Else
If (SearchFor = "") Then%>
<center><font face="Verdana, arial" size="1">There are currently no items </font></center>
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
<LINK href="MainStyle.css" rel="stylesheet" type="text/css">
<script src="../../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>

<body>
<!-- do not include file="MultiMap.asp"-->

<%

if uid="5" then
 %>
<a href=pickle.asp?uid=<%=uid%> >
<FONT COLOR=Green><i><B>New </B></i></FONT> <FONT COLOR=Blue><B>To send an SMS Text </B></FONT></a><br>

<br>

<%
End if
%>

<!--#include file="pickleSentClear.asp"-->

<hr>


<%
if isAdmin then
%>


Telephones:<br>
<form action="TelephoneBook.asp" Method="GET"><!--#include file="common\searchForm.asp"--></form>


<form action="events.asp" Method="GET">
<b>To View, <i> Cancel </i> or Amend an existing appointment please enter the booking number below<br>
(Alternatively try searching on customer name or post code) </b>
<!--#include file="common\searchForm.asp"-->
</form>
<%
end if
%>


<hr>

<%
if isGuest=0 then
%>
<!--#include file="MostRecentEvents.asp"-->
<!--#include file="common/loyalty.asp"-->
<%
end if
%>

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>
</body>
</html>
<!--#include file="dsn2.asp"-->
