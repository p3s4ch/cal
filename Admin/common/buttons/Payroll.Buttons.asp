

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")




If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" ID LIKE ('%" & SearchFor & "%') or " &_
	" Surname   LIKE ('%" & SearchFor & "%') or " &_
	" Date LIKE ('%" & SearchFor & "%') or " &_
	" Gross  LIKE ('%" & SearchFor & "%') or " &_
	" Net  LIKE ('%" & SearchFor & "%') or " &_
	" Surname LIKE ('%" & SearchFor & "%') or " &_
	" Ref LIKE ('%" & SearchFor & "%') )"
End If


SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetween_4myheader = "Where Pay Date Is Between  '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = " order by date  "


SQL = "select 'Please select a report' "
myheader="Payroll"

addEditPgLink="GSEdit5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSEdit5.asp"
tableName="wages"

SQL_SELECT4ADD    = " select '' Ref , '' Yr , '' Period  , getDate() as PayDayEntryTime_Ext , '' Gross , 0 NI_Both , 0 NI_Employee,0  Tax,0  Net, '' Comment"
SQL_SELECT4EDIT   = " select Ref , Yr ,Period ,date as PayDayEntryTime_Ext , Gross , BothNI , EmpleeNI, Tax, Net, Comment"

editSQL=SQL_SELECT4EDIT & " FROM wages where ID="


SQL_SELECT       ="select ID id2Edit ,  Ref,Name,Surname , Email ,Mobile, [NI Num], StartDate,Comment from employees"
SQL_SELECT_WAGES ="select ID id2edit, Surname,yr,Period,Ref,BothNI,EmpleeNI,Gross,Tax,Net,Date,Comment from vWages"

SQL_Where = SQL_WhereBetween & SQL_SearchFor & SQL_ORDERBY


if filter_on = "" OR filter_on="INITIAL" then
   myheader="Payroll"
   SQL = SQL_SELECT_WAGES  &  SQL_Where
End If


if filter_on="FINAL_WAGES" then
   myheader="Payroll: Wages " & SQL_WhereBetween_4myheader
   SQL = SQL_SELECT_WAGES & SQL_WhereBetween
End If


if filter_on="FINAL_WAGES_SIKUM" then
   myheader="Payroll: <i>Total</i> Wages " & SQL_WhereBetween_4myheader
   SQL = " select Surname , Ref,  Sum(BothNI) BothNI ,  Sum(EmpleeNI) EmpleeNI,   Sum(Gross) Gross,   Sum(Tax) Tax, Sum(Net) Net  " &_
         " from vWages " & SQL_WhereBetween & " Group By Surname , Ref " &_
         " union select 'z.<b>Total</b>' Surname , '0' Ref, Sum(BothNI) BothNI , Sum(EmpleeNI) EmpleeNI, Sum(Gross) Gross, Sum(Tax) Tax, Sum(Net) Net from vWages " &_
          SQL_WhereBetween
End If




if filter_on="FINAL_WAGES_NON_DIR" then
   myheader="Payroll: WAGES Non Directors"
   SQL =   SQL = " select Surname , Ref,  Sum(BothNI) BothNI ,  Sum(EmpleeNI) EmpleeNI,   Sum(Gross) Gross,   Sum(Tax) Tax, Sum(Net) Net  " &_
         " from vWages " & SQL_WhereBetween & "  Group By Surname , Ref " &_
         " union select 'z.<b>Total</b>' Surname , '0' Ref, Sum(BothNI) BothNI , Sum(EmpleeNI) EmpleeNI, Sum(Gross) Gross, Sum(Tax) Tax, Sum(Net) Net from vWages " &_
          SQL_WhereBetween

End If



if filter_on="Show_Active_Employees" then
   myheader="Payroll: Active Employees "
   SQL_SELECT ="select ID id2edit ,  Ref,Name,Surname , Email ,Mobile, [NI Num], StartDate,Comment from employees"
   SQL = SQL_SELECT & " where isActive=1 "
   SQL_SELECT4EDIT=" select  ID , Ref , Name , Surname , DOB , Address, Postcode , Email , Mobile, [NI Num] , StartDate  StartEntryTime_Ext, EndDate  EndEntryTime_Ext,  Comment, isActive "
   editSQL= SQL_SELECT4EDIT & " FROM employees where ID= "
   tableName="employees"
   editPgLink="GSEdit5.asp"
   Response.Write editPgLink
End If


SQL_Where = SQL_WhereBetween & SQL_SearchFor

if filter_on="Show_All" then
    myheader="Payroll: All Employees "
    SQL = SQL_SELECT

	editSQL=SQL_SELECT4EDIT & " FROM Operators where ID= "
    tableName="Operators"

End If



spacing = "&nbsp; &nbsp; &nbsp; "




%>

<Table>
<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden" name="filter_on" value="Show_Active_Employees" /> <%=spacing%>
<input type="submit" name="Submit" value="Show Active Employees" class="inputSubmit">
</form>
</TD>


<TD>
&nbsp;
</TD>






<TD>

&nbsp;

</TD>


</TR>
<TR>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Show All Employees" class="inputSubmit">
</form>
</TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="FINAL_WAGES_SIKUM" /> <%=spacing%>
<input type="submit" name="Submit" value="Show Wages - Total By Employee "  class="inputSubmit">
</form>

</TD>



<TD>

&nbsp;

</TD>





</TR>


<TR>
<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName" value="employees" />
<input type="hidden"      name="bttns" value="Payroll.Buttons" /> <%=spacing%>
<input type="hidden"      name="mysql" value="select   top 1 '' ID_hidden, max(Ref)+1  Ref_ExtReadOnly , ''  Name ,'' Surname ,'' DOB , '' Address, '' Postcode ,'' Email , '' Mobile, '' NINum, '' Start_GS5date_Ext, '' End_GS5date_Ext,  '' Comment, '' isActive from Employees" />
<input type="submit" name="Submit" value="Add New Employee" class="inputSubmit">
</form>

</TD>


<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName" value="wages" />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="myheader" value="Add Wages" /> <%=spacing%>
<input type="hidden"      name="mysql" value="select  '' Ref , '' Year ,'' Period  , getDate() as PayDayEntryTime_Ext , '' Gross ,'' NI_Both , '' NI_Employee, '' Tax, '' Net,  '' Comment" />
<input type="submit" name="Submit" value="Add Wages" class="inputSubmit">
</form>

</TD>


<TD>

&nbsp;

</TD>



</TR>


</Table>


<%
if hasDates="YES" then
%>
<form action="?" Method="GET">
   <input type="hidden"   name="tableName"   value="wages" />
   <input type="hidden"   name="hasDates"   value="YES" />
   <input type="hidden"   name="bttns"  value="Payroll.Buttons" />
   <input type="hidden"   name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
   <!--#include file="searchFormX.asp"-->
</form>

<%
End If
%>


<%

SQL_t= "SELECT IsNull(sum( IsNull(Gross,0)),0) as tot, IsNull(sum( IsNull(Net,0)),0) as totNet , IsNull(sum( IsNull(BothNI,0)),0) -  IsNull(sum( IsNull(EmpleeNI ,0)),0) as totEmployerNI  FROM vWages " & SQL_Where
Set RS_TOT = SQLCN.Execute(SQL_t)
tot = 0
if NOT RS_TOT.EOF then
	tot= FormatNumber(RS_TOT("tot"), 2)
    totNet= FormatNumber(RS_TOT("totNet"), 2)
    totEmployerNI= FormatNumber(RS_TOT("totEmployerNI"), 2)
    totCost = FormatNumber( RS_TOT("tot") + RS_TOT("totEmployerNI"), 2)
end if



Response.Write "<br><b>&nbsp; &nbsp; Total Gross &nbsp;&pound;" & tot &_
                " &nbsp; &nbsp; &nbsp; Total  Net &nbsp;&pound; " & totNet &_
                " &nbsp; &nbsp; &nbsp; Total  Employers NI &nbsp;&pound; " & totEmployerNI &_
                " <br>&nbsp; &nbsp; Cost of Employee = Gross + Employers NI = &nbsp;&pound; " & totCost &_
                "<b><br>"


%>