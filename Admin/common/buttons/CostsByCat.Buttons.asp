
<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")
CostCodeCat   = request("CostCodeCat")


SQL_SELECT        = "select ID, Description , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_FROM          = " from Invoices "

SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetween_4myheader = "Where Pay Date Is Between  '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetween_DateOfInvoice = " where DateOfInvoice BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "


SQL_ORDERBY      = " order by DateOfInvoice desc "

SQL = "select * from Invoices where Status='Unpaid'" & SQL_ORDERBY
myheader="Invoices"

addEditPgLink="Invoices_add.asp"
printPgLink="invoice_print.asp"
editPgLink="Invoices_add.asp"

if filter_on = "" OR filter_on="INITIAL" then
  myheader=" "
   SQL = "select 'please select from one of the above reports' "
End If

'generic not  USING FILTER
if CostCodeCat <> "" then
   myheader= CostCodeCat
   SQL =  " select CostCode, IsNull(sum(IsNull(Total,0)),0) as total from Costs " &  SQL_WhereBetween  &_
          " AND CostCode in (select CostCode from CostCodeCat where Cat='" & CostCodeCat &"') group by CostCode order by 1  "


   SQL_TOTS = " select IsNull(sum(IsNull(Total,0)),0) as tot from Costs " &  SQL_WhereBetween  &_
          " AND CostCode in (select CostCode from CostCodeCat where Cat='" & CostCodeCat &"') "

        set RS_TOT = SQLCN.Execute(SQL_TOTS )
        tot= RS_TOT("tot")
        tot   = FormatNumber(tot, 2)
       headline =    "<table> <tr><td> " & CostCodeCat &" this period  </td> <td>&pound;</td>  <td>" & tot    & "</td> </tr> </table> "


   End If



if filter_on="GROSS_PROFIT" OR   CostCodeCat= "GROSS_PROFIT"  OR   CostCodeCat= "OPERATING_PROFIT"   then
   myheader=CostCodeCat

   SQL =  " select c.CostCode, IsNull(sum(IsNull(Total*-1,0)),0) as total from Costs c, CostCodesOrder o " &  SQL_WhereBetween  &_
          " AND c.CostCode in (select CostCode from CostCodeCat where Cat='" & CostCodeCat &"' or Cat='ADMIN' ) "&_
          " AND c.CostCode = o.CostCode AND o.reportType='pl3'                                " &_
          " group by c.CostCode , o.pos   order by o.pos  "


   SQL_TOTS = " select IsNull(sum(IsNull(Total*-1,0)),0) as tot from Costs c " &  SQL_WhereBetween  &_
          " AND c.CostCode in (select CostCode from CostCodeCat where Cat='" & CostCodeCat &"' or Cat='ADMIN' ) "



        set RS_TOT = SQLCN.Execute(SQL_TOTS )
        tot= RS_TOT("tot")
        tot   = FormatNumber(tot, 2)
        headline =    "<table> <tr><td> "& CostCodeCat & " this period  </td> <td>&pound;</td>  <td>" & tot    & "</td> </tr> </table> "


   End If



if CostCodeCat = "INVOICES_NET" then
   myheader= INVOICES
   SQL_SELECT ="Select ID Invoice , Description ,CustomerID Customer, Total , VATpct [VAT %], VAT , TotalInclVAT , DateOfInvoice InvoiceDate , Cat ,Status"
   SQL =  SQL_SELECT & " from vFinalPaidInvoices " & SQL_WhereBetween_DateOfInvoice
   SQL_TOTS = " select Sum(Total) tot ,Sum(VAT) totVAT ,Sum(TotalInclVAT) totTot from vFinalPaidInvoices " & SQL_WhereBetween_DateOfInvoice
   set RS_TOT = SQLCN.Execute(SQL_TOTS )
   tot= RS_TOT("tot")
   totVAT= RS_TOT("totVAT")
   totTot= RS_TOT("totTot")
   tot   = FormatNumber(tot, 2)
   totVAT= FormatNumber(totVAT, 2)
   totTot= FormatNumber(totTot, 2)
   headline =    "<table> <tr><td> Total Invoices this period  </td> <td>&pound;</td>  <td>" & tot    & "</td> </tr> " &_
                 "<tr><td>   VAT                               </td> <td>&pound;</td>  <td>" & totVAT & "</td> </tr> " &_
                 "<tr><td>  Total + VAT                        </td> <td>&pound;</td>  <td>" & totTot & "</td> </tr> </table> "

End If



SQL_SELECT ="select ID ,  Ref,Name,Surname , Email ,Mobile, [NI Num], StartDate,Comment from employees"
SQL_SELECT_WAGES ="select * from vWages"



if filter_on="SALES_REPORT"  then
   myheader="<h4> This Sales report shows invoices for this period that may or may not have been paid by the end of the period </h4> " &_
             "<h4> This is used for calculating company profit. </h4> " &_
             "<h4> VAT came off the Cash accounting on the Flat Rate Scheme on May 2012. </h4> "
   SQL = "select 'REPORT NOT READY' "
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
   SQL_WHERE =  SQL_WhereBetween & "  AND CostCode = '" & CostCode &"' OR  '" & CostCode &"' = 'ALL'  "
   SQL = SQL_SELECT  & " from Costs " & SQL_WHERE & " order by date"
   hasTotal="YES"
   SQL_TOT = "select sum(Total) tot from Costs " & SQL_WHERE
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
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


<h2 ALIGN=CENTER> Cost Codes By Category </h2>



<table>
<tr>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="CostsByCat.Buttons" />
<input type="hidden"      name="hasDates" value="NO" />
<input type="hidden" name="filter_on" value="GROSS_PROFIT" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="GROSS_PROFIT" class="inputSubmit">
</form></td>

<td><form action="GSViewer5.asp"  name="frmUser" Method="GET">
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
<input type="hidden"      name="bttns" value="CostsByCat.Buttons" />
<input type="hidden"      name="hasDates" value="YES" />
<input type="hidden" name="filter_on" value="COSTS" />&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 3: SALES" class="inputSubmit">
</form></td>




<td><form action="CostsByMonth.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report X: blank" class="inputSubmit">
</form></td>

<td><form action="blank.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report Y: blank" class="inputSubmit">
</form></td>
</tr>


<tr>
<td><form action="report4.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="myheader" value="report 4: Receipts" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="report4 Receipts" class="inputSubmit">
</form></td>


<td><form action="report5.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="report 5 Summary" class="inputSubmit">
</form></td>

<td><form action="vat.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="report 6 VAT" class="inputSubmit">
</form></td>


<td><form action="report7.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="report 7 Cashflow" class="inputSubmit">
</form></td>

<td><form action="report8.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 8: BalanceSheet" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden"  name="uid" value=<%=uid%> />
<input type="hidden"  name="bttns" value="Accounts.Buttons" />
<input type="hidden"  name="hasDates" value="YES" />
<input type="hidden"  name="filter_on" value="COSTS" />&nbsp; &nbsp; &nbsp;
<input type="submit"  name="Submit" value="BACK TO FINANCIAL REPORTS" class="inputSubmit">
</form></td>


</table>



<%= headline %>


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
