<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<%


rangeFrom ="1 december 2007"
rangeTo ="1 december 2008"
startHr =7
endHr =22
operator ="Gilon"
category ="avail"
Assigned   =-1
CatA  =1
CatB  =0
CustomerID  =-1
Office  =""
Details =""
BillTotal =0
SiteAddress =""
SitePostCode =""
SameAsBill =0
siteId = -1
duration =30

rangeFrom = request("StartDate")
rangeTo = request("EndDate")
startHr = request("StartHour")
endHr = request("EndHour")
duration = request("duration")
AllDayEvent= request("AllDayEvent")
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


Response.Write "<br>rangeFrom :" & rangeFrom
Response.Write "<br>rangeTo :" & rangeTo
Response.Write "<br>startHr:" & startHr
Response.Write "<br>endHr:" & endHr

x= "1 Jan 2008 " & startHr
z= "1 Jan 2008 " & endHr

cDtStart =  CDate(x)
cDtEnd   =  CDate(z)

Response.Write "<br>cDtStart :" & cDtStart
Response.Write "<br>cDtEnd :" & cDtEnd
temp1 = hour(cDtStart)
temp2 = hour(cDtEnd)
Response.Write "<br>temp1 :" & temp1
Response.Write "<br>temp2 :" & temp2

Response.Write "<br>duration:" & duration
Response.Write "<br>operator:" & operator
Response.Write "<br>category:" & category

Response.Write "<br>AllDayEvent:" & AllDayEvent
Response.Write "<br>recurrence:" & recurrence

Response.Write "<br>hourlyEveryXhours:" & hourlyEveryXhours
Response.Write "<br>dailyEveryXdays:"    & dailyEveryXdays


'Response.Write "<br>recurrence:" & recurrence
Response.Write "<br>mon:" & mon
Response.Write "<br>tue:" & tue
Response.Write "<br>wed:" & wed
Response.Write "<br>thu:" & thu
Response.Write "<br>fri:" & fri
Response.Write "<br>sat:" & sat
Response.Write "<br>sun:" & sun


Response.Write "<br>monthlyOnDayXoftheMonth:" & monthlyOnDayXoftheMonth
Response.Write "<br>monthlyEveryXmonths:" & monthlyEveryXmonths
Response.Write "<br>yearlyOntheXofthemonth:" & yearlyOntheXofthemonth
Response.Write "<br>yearlyOntheMonthOfX:" & yearlyOntheMonthOfX




Response.Write "<br>Assigned:" & Assigned
Response.Write "<br>CatB:" 	   & CatB
Response.Write "<br>CustomerID:" & CustomerID
Response.Write "<br>Office :" & Office
Response.Write "<br>Details :" & Details
Response.Write "<br>BillTotal:" & BillTotal
Response.Write "<br>SiteAddress:" & SiteAddress
Response.Write "<br>SitePostCode:" & SitePostCode
Response.Write "<br>SameAsBill:" & SameAsBill
Response.Write "<br>siteId:" & siteId
Response.Write "<br>duration:" & duration
Response.Write "<br>"

'sql ="truncate table cEvents"

allDay =0
if AllDayEvent = yes then allDay=1 end if

d = CDate(rangeFrom)
d1 = "'" & Day(d) & " " &  MonthName( Month(d)) & " "  & year(d) & "'"
d = CDate(rangeTo)
d2 = "'" & Day(d) & " " &  MonthName( Month(d)) & " "  & year(d) & "'"

Response.Write "d1=" & d1
Response.Write "<br>"
Response.Write "d2=" & d2

'sql1 ="exec blockBook '1 December 2007', '1 march 2008' ,7,22,'Yanik' ,'Decorating',-1,180"
sql2 ="exec blockBook " & d1 & "," & d2 & "," & temp1 &","& temp2 &",'"& operator &"', '" &_
          category      & "', " &_
          AllDay 	 	& ","   &_
		  CatB   	 	& ","   &_
		  CustomerID 	& ",'"  &_
		  Office     	& "','" &_
		  Details   	& "',"  &_
		  BillTotal  	& ",'"  &_
		  SiteAddress 	& "','"  &_
		  SitePostCode  & "',"  &_
		  SameAsBill 	& ","  &_
	      siteId 		& ","  &_
	      GroupID 		& ",'"  &_
		  color    		& "',"  &_
          duration





/*
create procedure [dbo].[blockBook](@rangeFrom datetime,@rangeTo datetime,
                           @startHr int ,
                           @endHr int,
                           @operator varchar(50)='Gilon',
                           @category varchar(50)='available',
						   @AllDay int = 0 , --no = false few hours
                           @CatB int =0,
                           @CustomerID int =-1,
						   @Office  varchar(250) = '',
                           @Details varchar(250) = '' ,
						   @BillTotal FLOAT = 0.0,
                           @SiteAddress varchar(50)='',
                           @SitePostCode varchar(50)='',
                           @SameAsBill int=0 ,
						   @siteId int= -1 ,
						   @GroupID int = -1,
                           @color varchar(50)='black',
                           @duration int=30)


*/
'Response.Write "<br>"
'Response.Write "required sql="& sql1
Response.Write "<br>"
Response.Write sql2


Response.Write "<br>"
Set RSADD = SQLCN.Execute(sql2)

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


If orderBy      = "" Then
	SQL_OrderBy = " ORDER BY StartTime"

ElseIf orderBy      = "Operator_Up" Then
	SQL_OrderBy = " ORDER BY Operator DESC"

ElseIf orderBy      = "Operator_Down" Then
	SQL_OrderBy = " ORDER BY Operator"

ElseIf orderBy      = "Category_Up" Then
	SQL_OrderBy = " ORDER BY Category"

ElseIf orderBy      = "Category_Down" Then
	SQL_OrderBy = " ORDER BY Category DESC"


ElseIf orderBy      = "ID_Up" Then
	SQL_OrderBy = " ORDER BY ID"

ElseIf orderBy      = "ID_Down" Then
	SQL_OrderBy = " ORDER BY ID DESC"

ElseIf orderBy      = "Name_Up" Then
	SQL_OrderBy = " ORDER BY FirstName DESC"
ElseIf orderBy = "Name_Down" Then
	SQL_OrderBy = " ORDER BY FirstName"
ElseIf orderBy = "Address_Up" Then

	SQL_OrderBy = " ORDER BY SiteAddress DESC"
ElseIf orderBy = "Address_Down" Then
	SQL_OrderBy = " ORDER BY SiteAddress"

ElseIf orderBy = "PostCode_Up" Then
	SQL_OrderBy = " ORDER BY SitePostCode DESC"

ElseIf orderBy = "PostCode_Down" Then
	SQL_OrderBy = " ORDER BY SitePostCode "


ElseIf orderBy = "Updated_Up" Then
	SQL_OrderBy = " ORDER BY Updated "

ElseIf orderBy = "Updated_Down" Then
	SQL_OrderBy = " ORDER BY Updated DESC"



ElseIf orderBy = "Phone_Up" Then
	SQL_OrderBy = " ORDER BY Phone DESC"
ElseIf orderBy = "Phone_Down" Then
	SQL_OrderBy = " ORDER BY Phone "
End If


SQL = "SELECT * FROM cEvents " & SQL_SearchFor &  SQL_OrderBy
Response.Write SQL

'SQL = "SELECT * FROM cEvents "
'Response.Write SQL

%>
<form action="events.asp" Method="GET"><!--#include file="common\searchForm.asp"--></form>

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
<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Operator_Up&page=<%If NOT (orderby = "Operator_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Operator&nbsp;<a href="?orderby=Operator_Down&page=<%If NOT (orderby = "Operator_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Category_Up&page=<%If NOT (orderby = "Category_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Category&nbsp;<a href="?orderby=Category_Down&page=<%If NOT (orderby = "Category_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Date_Up&page=<%If NOT (orderby = "Date_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Start Time&nbsp;<a href="?orderby=Date_Down&page=<%If NOT (orderby = "Date_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=PostCode_Up&page=<%If NOT (orderby = "PostCode_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Post Code&nbsp;<a href="?orderby=PostCode_Down&page=<%If NOT (orderby = "PostCode_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Updated_Up&page=<%If NOT (orderby = "Updated_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Updated&nbsp;<a href="?orderby=Updated_Down&page=<%If NOT (orderby = "Updated_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"> </td>
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
<a href="events_add.asp?AddID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Edit</a>
&nbsp;&nbsp;
<a href="events.asp?DeleteID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Remove</a></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Operator")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("Category")%></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=FormatDateTime(RS("StartTime"), vbShortDate)%>
<br><%=FormatDateTime(RS("StartTime"), vbLongTime)%></font></td>

<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"> <%=RS("SitePostCode")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"> <%=RS("Updated")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1">
<a href="..\WeekView.asp?Operator=<%=RS("Operator")%>">    Diary </a></font></td>
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

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>
</body>
</html>
<!--#include file="dsn2.asp"-->
