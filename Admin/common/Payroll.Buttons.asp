

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetween_4myheader = "Where Pay Date Is Between  '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = "  "


SQL = "select 'Please select a report' "
myheader="Payroll"

SQL_SELECT ="select ID id2Edit ,  Ref,Name,Surname , Email ,Mobile, [NI Num], StartDate,Comment from employees"
SQL_SELECT_WAGES ="select * from vWages"


if filter_on = "" OR filter_on="INITIAL" then
  myheader="Payroll"
   SQL = "select * from dbo.employees "
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
<form action="payroll.asp" name="frmUser" Method="GET">
<input type="hidden"  name="uid" value=<%=uid%> />
<input type="hidden"  name="group1" value="showDirectorsOnly"   />
<input type="hidden"  name="periodID" value="51" />
<input type="hidden"  name="bttns" value="Payroll.Buttons" />
<input type="hidden"  name="hasDates" value="YES" />
<input type="hidden"  name="filter_on" value="FINAL_WAGES" /> <%=spacing%>
<input type="submit"  name="Submit" value="Show Wages"  class="inputSubmit">
</form>
</TD>






<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="FINAL_WAGES_NON_DIR" /> <%=spacing%>
<input type="submit" name="Submit" value="Wages - Non Directors"  class="inputSubmit">
</form>
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
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="FINAL_WAGES_DIR" /> <%=spacing%>
<input type="submit" name="Submit" value="Wages - Directors"  class="inputSubmit">
</form>
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
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="hasDates" value="YES" /> Employee:
<input type="text"      name="employeeName" value="" />
<input type="hidden" name="filter_on" value="WAGES_EMPLOYEE" /> <%=spacing%>
<input type="submit" name="Submit" value="Wages "  class="inputSubmit">
</form>
</TD>



</TR>


</Table>


<%
if hasDates="YES" then
%>
<form action="?" Method="GET">
   <input type="hidden"   name="tableName"   value="wages" />
   <input type="hidden"   name="bttns"  value="Payroll.Buttons" />
   <input type="hidden"   name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
   <!--#include file="searchMonthForm.asp"-->
</form>


<%
End If
%>
