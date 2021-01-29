
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<%
Response.Write "v2"

rangeFrom = request("StartDate")
rangeTo = request("EndDate")

startHr = request("StartHour")
endHr = request("EndHour")

duration = request("duration")
AllDay= request("AllDayEvent")

recurrence = request("recurrence")
hourlyEveryXhours = request("hourlyEveryXhours")
dailyEveryXdays = request("dailyEveryXdays")
mon = request("mon")
tue = request("tue")
wed = request("wed")
thu = request("thu")
fri = request("fri")
sat = request("sat")
sun = request("sun")
monthlyOnDayXoftheMonth = request("monthlyOnDayXoftheMonth")
monthlyEveryXmonths= request("monthlyEveryXmonths")
yearlyOntheXofthemonth= request("yearlyOntheXofthemonth")
yearlyOntheMonthOfX= request("yearlyOntheMonthOfX")

Operator = request("Operator")
Category = request("Category")
CatA = request("CatA")
CatB = request("CatB")
CustomerID = request("CustomerID")
Office = request("Office")
Email    = request("Email")
SiteAddress   = request("Address")
SitePostCode  = request("PostCode")
SameAsBill  = request("SameAsBill")
Title = request("Title")
Details = request("Details")
Assigned = request("Assigned")
BillTotal = request("BillTotal")



if AllDay= "" then AllDay=0 end if
if SameAsBill= ""  then SameAsBill=0 end if
if BillTotal =""   then BillTotal=0 end if
if SiteId = ""     then SiteId=0 end if
if GroupID = ""    then GroupID=-1 end if
if color = ""      then color="balck" end if
if catB = ""      then catB=99 end if
if recurrence = ""      then recurrence ="annually" end if
if Mon = ""      then Mon=0 end if
if Tue = ""      then Tue=0 end if
if Wed = ""      then Wed=0 end if
if Thu = ""      then Thu=0 end if
if Fri = ""      then Fri=0 end if
if Sat = ""      then Sat=0 end if
if Sun = ""      then Sun=0 end if
if hourlyEveryXhours = ""      then hourlyEveryXhours=0 end if
if dailyEveryXdays = ""      then dailyEveryXdays=0 end if
if monthlyOnDayXoftheMonth = ""      then monthlyOnDayXoftheMonth=0 end if
if monthlyEveryXmonths = ""      then monthlyEveryXmonths=0 end if
if yearlyOntheXofthemonth = ""      then yearlyOntheXofthemonth=0 end if
if yearlyOntheMonthOfX = ""      then yearlyOntheMonthOfX= 1 end if


Response.Write "<br>rangeFrom :" & rangeFrom
Response.Write "<br>rangeTo :" & rangeTo
Response.Write "<br>startHr:" & startHr

Response.Write "<br>AllDayEvent:" & AllDayEvent
Response.Write "<br>AllDay:" & AllDay

'Response.End

x= "1 Jan 2008 " & startHr
z= "1 Jan 2008 " & endHr

cDtStart =  CDate(x)
cDtEnd   =  CDate(z)

startHr = hour(cDtStart)
startMin= Minute(cDtStart)

endHr = hour(cDtEnd)
endMin =Minute(cDtEnd)
'sql ="truncate table cEvents"

'color = "black"

recurrence = "'"& recurrence & "'"
color      = "'"& color  	 & "'"
yearlyOntheMonthOfX = 1

d = CDate(rangeFrom)
d1 = "'" & Day(d) & " " &  MonthName( Month(d)) & " "  & year(d) & "'"
d = CDate(rangeTo)
d2 = "'" & Day(d) & " " &  MonthName( Month(d)) & " "  & year(d) & "'"

'Response.Write "d1=" & d1
'Response.Write "<br>"
'Response.Write "d2=" & d2

sql1 ="exec blockBook '1 December 2007', '1 march 2008' ,7,22,'Yanik' ,'Decorating',-1,180"
'blockBook '1 dec 2007', '1 dec 2007' ,9,00,10,00,'Gilon' ,'handyman',30

sql2 ="exec AvailSlots " & d1 & "," & d2 & "," & startHr &","& startMin & "," & endHr & ","& endMin & ",'"& operator &"','" &_
			category      		& "'," &_
			duration			& ","  &_
			AllDay        		& ",'"   &_
			Details   			& "',"  &_
			GroupID 			& ","  &_
			color				& ","  &_
			Mon 				& ","  &_
			Tue 				& ","  &_
			Wed 				& ","  &_
			Thu 				& ","  &_
			Fri 				& ","  &_
			Sat 				& ","  &_
			Sun					& ","  &_
			recurrence 		 	& ","  &_
			hourlyEveryXhours 	& ","  &_
			dailyEveryXdays  	& ","  &_
			monthlyOnDayXoftheMonth & ","  &_
			monthlyEveryXmonths 	& ","  &_
			yearlyOntheXofthemonth 	& ","  &_
			yearlyOntheMonthOfX

Response.Write "<br>"
Response.Write sql2
Response.Write "<br>"

'sql3 = "exec [AvailSlots] '25 December 2007','31 Dec 2007',10,0,18,59,'Yanik','unavailable',60,0, 'details',-1,'black',1,0,1,0,0,0,0,'weekly',2,0,5,1,10,1"
'Response.Write sql3
'Response.Write "<br>"

Set RSADD = SQLCN.Execute(sql2)

Set RSREPORT = SQLCN.Execute("exec AvailSlotsConflicts")


WHILE     Not RSREPORT.EOF
             op  = RSREPORT("Operator")
             Response.Write "<br>done "&op
	         RSREPORT.MoveNext
		WEND



%>

<%


orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")

If (DeleteID <> "") Then
  SQL = "DELETE FROM cEvents WHERE ID = " & DeleteID
  Set RS = SQLCN.Execute(SQL)
  Response.Write "Deleted ID = " & DeleteID
End If

SQL_SearchFor0 = " where category <> 'available'"
If NOT (SearchFor = "") Then
	SQL_SearchFor = " AND ( " &_
	" ID LIKE ('%" & SearchFor & "%') or " &_
    " Operator LIKE ('%" & SearchFor & "%') or " &_
    " Details LIKE ('%" & SearchFor & "%') or " &_
    " Category LIKE ('%" & SearchFor & "%') or " &_
    " SiteAddress LIKE ('%" & SearchFor & "%') or " &_
    " SitePostcode LIKE ('%" & SearchFor & "%')  )"

Else
	SQL_SearchFor = "  "
End If
SQL_SearchFor = SQL_SearchFor0 & SQL_SearchFor




SQL = "SELECT * FROM cEvents "
Response.Write SQL


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

<tr>
<td bgcolor="#FFFFFF"></td>
<td bgcolor="#DAE3F0" align="center"></td>
<td bgcolor="#DAE3F0" align="center"></td>


<td bgcolor="#DAE3F0" align="center"></td>
<td bgcolor="#DAE3F0" align="center"></td>
<td bgcolor="#DAE3F0" align="center"></td>

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
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">

<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">

</tr>


<%
RS.MoveNext
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

<td width="50%" align="right"><font face="Verdana, arial" size="1" ></font></td></tr></table></td></tr></table><br>

<%End If
Else


If (SearchFor = "") Then%>
y
<%Else%>
<center><font face="Verdana, arial" size="1">h</font></center>



<%End If
End If
RS.close
Set RS = Nothing
%>

</font></td>
</tr>
</table>

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>
</body>
</html>
<!--#include file="dsn2.asp"-->
