

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")



SQL_SELECT        = "select ID, Description , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_FROM          = " from Invoices "

SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetweenStartDate = " where StartDate BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetweenDateOfInvoice = " where DateOfInvoice BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetween_4myheader = "Where Pay Date Is Between  '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL_ORDERBY      = " order by DateOfInvoice desc "

SQL = "select * from Invoices where Status='Unpaid'" & SQL_ORDERBY
myheader="Invoices"

addEditPgLink="Invoices_add.asp"
printPgLink="invoice_print.asp"
editPgLink="GSEdit5.asp"

if filter_on = "" OR filter_on="INITIAL" then
  myheader=" "
   SQL = "select 'please select from one of the above reports' "
End If


SQL_SELECT ="select ID ,  Ref,Name,Surname , Email ,Mobile, [NI Num], StartDate,Comment from employees"
SQL_SELECT_WAGES ="select * from vWages"



if filter_on="SALES_REPORT"  then
   myheader="<h4> This Sales report shows invoices for this period that may or may not have been paid by the end of the period </h4> " &_
             "<h4> This is used for calculating company profit. </h4> " &_
             "<h4> VAT came off the Cash accounting on the Flat Rate Scheme on May 2012. </h4> "
   SQL = "select 'REPORT NOT READY' "
End If



if filter_on="Accounting_Notes" then
   hasDates="NO"
   myheader="<h4> This Sales report shows invoices for this period that may or may not have been paid by the end of the period </h4> " &_
                "<h4> This is used for calculating company profit. </h4> " &_
                "<h4> VAT came off the Cash accounting on the Flat Rate Scheme on May 2012. </h4> "
   SQL_SELECT =" select i.ID id2edit ,Description,  c.Surname Customer, Total, VATpct [VAT %], VAT , TotalInclVAT [ TOT &pound;] ,  DateOfInvoice, Status  "
   SQL_WHERE =  SQL_WhereBetweenDateOfInvoice
   SQL = " select 'please select one of the reports' "
   hasTotal="NO"
End If




if filter_on="INVOICES" then
   periodID = request("periodID")
   CostCode = request("CostCode")
   hasDates="YES"
   myheader="<h4> This Sales report shows invoices that may or may not have been paid by the end of the period used for calculating company profit. </h4> " &_
                "<h4> See Notes </h4> "
   SQL_SELECT =" select i.ID id2edit ,Description,  c.Surname Customer, Total, VATpct [VAT %], VAT , TotalInclVAT [ TOT &pound;] ,  DateOfInvoice, Status  "
   SQL_WHERE =  SQL_WhereBetweenDateOfInvoice
   SQL = SQL_SELECT  & " from vFinalPaidInvoices i, Customers c " & SQL_WhereBetweenDateOfInvoice &_
                                             " AND i.CustomerID =c.ID  order by DateOfInvoice"
   hasTotal="YES"
   SQL_TOT = "select sum(Total) tot from vFinalPaidInvoices " & SQL_WHERE
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
End If




if filter_on="COSTS" then
   periodID = request("periodID")
   CostCode = request("CostCode")
   hasDates="YES"
   cc= Replace(CostCode,"~","")
   cc= Replace(cc,".","")
   cc = cc & "S"
   myheader="Breakdown of " & cc & " based on bank transactions "

   SQL_SELECT =" select SlipNo id2edit , SlipNo Slip, Date , CostCode , Total , Description , Scan , Payment, TxID LINE "
   SQL_SELECT4EDIT = " select SlipNo id , Date , CostCode , Total , Description , Scan , Payment, TxID "
   SQL_WHERE =  SQL_WhereBetween & "  AND CostCode = '" & CostCode &"' OR  '" & CostCode &"' = 'ALL'  "
   SQL = SQL_SELECT  & " from Costs " & SQL_WHERE & " order by date"
   hasTotal="YES"
   SQL_TOT = "select sum(Total) tot from Costs " & SQL_WHERE
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
   editPgLink="costs_add.asp"

   editSQL= ""
End If

if filter_on="COSTS.GROUPBY" then
   periodID = request("periodID")
   CostCode = request("CostCode")
   hasDates="YES"

   myheader="Breakdown of items by Cost Code based on bank transactions "

   SQL_SELECT =" select CostCode , sum(Total) Total "
   SQL_WHERE =  SQL_WhereBetween
   SQL = SQL_SELECT  & " from Costs " & SQL_WHERE & " group by CostCode"

   hasTotal="YES"
   SQL_TOT = "select sum(Total) tot from Costs " & SQL_WHERE
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
End If



if filter_on="FINAL_WAGES" then
   myheader="Payroll: Wages " & SQL_WhereBetween_4myheader
   SQL = SQL_SELECT_WAGES & SQL_WhereBetween
End If




if filter_on="DIR" then
   myheader="Directors Account - Net Drawings per year ( negative indicates a net investment into company by directors ) "
   SQL = "select * from [dbo].[fDirectorsDrawings] ('"& uid &"')"
   hasTotal="YES"
   SQL_TOT = "select sum(Total) tot from Costs where CostCode= '.~DIRECTOR'"
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
End If


if filter_on="VAT_EC_Sales" then
   myheader="VAT_EC_Sales" & SQL_WhereBetweenStartDate
   SQL = " select * from [dbo].fVAT_ECSL ('5') " & SQL_WhereBetweenStartDate
End If




if filter_on="FINAL_WAGES_SIKUM" then
   myheader="Payroll: <i>Total</i> Wages " & SQL_WhereBetween_4myheader
   SQL = " select Surname , Ref,  Sum(BothNI) BothNI ,  Sum(EmpleeNI) EmpleeNI,   Sum(Gross) Gross,   Sum(Tax) Tax, Sum(Net) Net  " &_
         " from vWages " & SQL_WhereBetween & " Group By Surname , Ref " &_
         " union select 'z.<b>Total</b>' Surname , '0' Ref, Sum(BothNI) BothNI , Sum(EmpleeNI) EmpleeNI, Sum(Gross) Gross, Sum(Tax) Tax, Sum(Net) Net from vWages " &_
          SQL_WhereBetween
End If


if filter_on="Show_Active" then
   myheader="Payroll: Active Employees "
   SQL = SQL_SELECT & " where isActive=1 "
End If


if filter_on="Show_All" then
    myheader="Payroll: All Employees "
    SQL = SQL_SELECT
End If


spacing = "&nbsp; &nbsp; &nbsp; "

%>


<h2 ALIGN=CENTER> Financial Reports </h2>



<table>
<tr>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Accounts.Buttons" />
<input type="hidden"      name="hasDates" value="NO" />
<input type="hidden" name="filter_on" value="DIR" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 1: Directors Account" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Payroll.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="FINAL_WAGES" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 2: Payroll" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="CostCode" value=".~SALE" />
<input type="hidden"      name="bttns" value="Accounts.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="INVOICES" />&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 3: Invoiced Sales" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="CostCode" value=".~SALE" />
<input type="hidden"      name="bttns" value="Accounts.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="COSTS" />&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 5: Banked Sales" class="inputSubmit">
</form></td>
<tr>


<td><form action="report7.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 7: CF and Directors" class="inputSubmit">
</form></td>

<td><form action="vat.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 9: VAT" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden"  name="uid" value=<%=uid%> />
<input type="hidden"  name="bttns" value="Accounts.Buttons" />
<input type="hidden"  name="hasDates" value="YES" />
<input type="hidden"  name="filter_on" value="VAT_EC_Sales" />&nbsp; &nbsp; &nbsp;
<input type="submit"  name="Submit" value="Report 9B: VAT EC Sales" class="inputSubmit">
</form></td>




<td><form action="report8.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 10: BalanceSheet" class="inputSubmit">
</form></td>

<td><form action="report9.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 12: P n L" class="inputSubmit">
</form></td>




<tr>
<td><form action="report10.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 13: cheques" class="inputSubmit">
</form></td>


<td><form action="Costs.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="doGroupByCC" value="1" />
<input type="hidden" name="doGroupByCCIsSet" value="yes" /> &nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 14: Costs (Basic Report) " class="inputSubmit">
</form></td>



<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="CostCode" value="ALL" />
<input type="hidden"      name="bttns" value="Accounts.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="COSTS.GROUPBY" />&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 15: All Categories" class="inputSubmit">
</form></td>

<td><form action="HSBC_BIB.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="doGroupByCC" value="1" />
<input type="hidden" name="doGroupByCCIsSet" value="yes" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 18: Bank Statements" class="inputSubmit">
</form></td>


<td><form action="report7.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 23: Cashflow" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="CostCode" value="ALL" />
<input type="hidden"      name="bttns" value="Accounts.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="Accounting_Notes" />&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Accounting Notes" class="inputSubmit">
</form></td>


</tr>




</table>






<%

if hasTotal="YES" then
     Response.Write "<b>Sum for items below &nbsp;&pound;" & tot & " <b>"
     Response.Write "<br>"
End If

%>



<%
if hasDates="YES" then
%>
      <!--#include file="searchGSBetweenDates5.asp"-->
<%
End If
%>
