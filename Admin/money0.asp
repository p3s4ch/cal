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


If (AddID <> "") Then
	    Response.Write "Edit ID " & AddID
	    Response.Write  " "

		StartDate = request("StartDate")
		StartHour = request("StartHour")
		EndDate = request("EndDate")
		EndHour = request("EndHour")
		Title = request("Title")
		Details = request("Details")
		Assigned = request("Assigned")
		Category = request("Category")
        Operator = request("Operator")
		AllDayEvent =request("AllDayEvent")
		CatA = request("CatA")
		CatB = request("CatB")
		CustomerID = request("CustomerID")
		Office = request("Office")
		Email    = request("Email")
		SiteAddress   = request("Address")
		SitePostCode  = request("PostCode")
		SameAsBill  = request("SameAsBill")
		Phone    = request("Phone")
		BillTotal = request("BillTotal")
		if BillTotal = "" then BillTotal=0 end if
		if AllDayEvent = "yes" then
		CatA = 1
		else
		CatA      = 0
		end if


		if CustomerID      = "" then CustomerID =0 end if

		if SameAsBill      = "" then
                          SameAsBill =0
			   ELSE
					  Response.Write "<br> SameAsBill "

					 sql_2 = "select * from Customers where ID = " &   CustomerID
					 Set RSCustomer = SQLCN.Execute(sql_2 )

					 'Response.Write "<br>  sql_2" & sql_2
					 SiteAddress = RSCustomer("Address")
					 SitePostCode =RSCustomer("PostCode")
					 'Response.Write "<br> SameAsBill done "& SiteAddress
			   end if



	x= StartDate & " " & StartHour
	z= EndDate & " " & EndHour
	cDtStart =  CDate(x)
	cDtEnd   =  CDate(z)
	StartTime =Month(cDtStart) & "/" & Day(cDtStart)& "/" &Year(cDtStart)& " " & StartHour
	Endtime   =Month(cDtEnd) & "/" & Day(cDtEnd)& "/" &Year(cDtEnd)& " " & EndHour

	Response.Write "Add Edit </br>"
	Response.Write  "using addEvent Proc <br>"
	Response.Write  "yes"

	StartTime  	="'" & StartTime 	&"'"
	EndTime    	="'" & EndTime		&"'"
	Title  		="'" & Title  		&"'"
	Details 		="'" & Details		&"'"
	Category      ="'" & Category 	&"'"
	Office        ="'" & Office    	&"'"
	SiteAddress   ="'" & SiteAddress 	&"'"
	SitePostCode 	="'" & SitePostCode &"'"
	Color 		="'" & Color  		&"'"
	Operator 		="'" & Operator		&"'"



    if AllDay = "" then AllDay =0 end if
    if CatB = "" then CatB =0 end if
    if CustomerID = "" then CustomerID =0 end if
    if BillTotal = "" then BillTotal =0 end if
    if SameAsBill = "" then SameAsBill =0 end if
    if siteID = "" then siteID =0 end if
    if GroupID = "" then GroupID =0 end if


	sql="exec addEvent " & AddID & "," & StartTime    & "," & EndTime    & "," & Title  & "," & Details &_
	  				       "," & Category    & "," & AllDay     & "," & CatB   & "," & CustomerID &_
	  				       "," & Office      & "," & BillTotal  & "," & SiteAddress  & "," & SitePostCode &_
	  				       "," & SameAsBill  & "," & siteID     & "," & GroupID 	 & "," & Color & "," & Operator



    Response.Write "<br>"
    Response.Write sql
    Response.Write "<br>"
    Set RSADD = SQLCN.Execute(sql)
    Response.Write "done"

End If




SQL_SearchFor0 = " where BillTotal  > 0 "
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

ElseIf orderBy = "BillTotal_Up" Then
	SQL_OrderBy = " ORDER BY BillTotal DESC"

ElseIf orderBy = "BillTotal_Down" Then
	SQL_OrderBy = " ORDER BY BillTotal "


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

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=BillTotal_Up&page=<%If NOT (orderby = "BillTotal_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>
&nbsp;BillTotal&nbsp;
<a href="?orderby=BillTotal_Down&page=<%If NOT (orderby = "BillTotal_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>




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

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=WeekdayName(Weekday(RS("StartTime") )  )%>
, <%=Day(RS("StartTime") ) %> <%=MonthName(Month(RS("StartTime")) ) %> <%=Year(RS("StartTime") ) %> </font></td>

<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"> <%=RS("BillTotal")%></font></td>

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



<
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
