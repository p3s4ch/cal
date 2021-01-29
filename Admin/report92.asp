<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<h2 ALIGN=CENTER>Detailed PROFIT AND LOSS ACCOUNT</h2>



<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>
<td width="100%"><font face="Verdana" size="1">
<br>

<!--#include file="common\ExtractDates.asp"-->

<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
CostCode = request("CostCode")
SearchForNot = request("SearchForNot")


SearchForCC = request("SearchForCC")
excl_cat = request("excl_cat")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")


doGroupByCC = request("doGroupByCC")
doGroupByCCIsSet=request("doGroupByCCIsSet")


if doGroupByCC = "" and doGroupByCCIsSet="yes" then
  doGroupByCC="0"
  isGroupByCC = "hasBeenUnchecked"
else
 doGroupByCC="1"
 isGroupByCC = "checked"
end if


SqlorderBy = " order by SlipNo desc "
if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if
if  excl_cat ="" then excl_cat =0 end if


SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "



If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" SlipNo LIKE '%" & SearchFor & "%' or " &_
	" CostCode LIKE '%" & SearchFor & "%' or " &_
	" Supplier LIKE '%" & SearchFor & "%' or " &_
	" Description LIKE   '%" & SearchFor & "%' or " &_
	" Details  LIKE  '%" & SearchFor & "%' or " &_
	" [Date] LIKE '%" & SearchFor & "%' or " &_
	" Total LIKE '%" & SearchFor & "%' )"
End If



If NOT (CostCode = "") Then
     SQL_SearchFor = " AND  (" &_
	" CostCode LIKE '%" & CostCode  &  "%' )"
End If



'not sure why it bombs with supplier ???????

If NOT (SearchForNot = "") Then
     SQL_SearchFor = SQL_SearchFor & " AND (" &_
	" SlipNo not LIKE '%" & SearchForNot & "%' AND " &_
	" CostCode not LIKE '%" & SearchForNot & "%' AND " &_

	" Description not LIKE   '%" & SearchForNot & "%' AND " &_
	" Details  not LIKE  '%" & SearchForNot & "%' AND " &_
	" [Date] not LIKE '%" & SearchForNot & "%' AND " &_
	" Total not LIKE '%" & SearchForNot & "%' )"
End If
if SearchForCC <> "" then SQL_SearchFor = " AND CostCode = '"& SearchForCC &"'" end if


SQL_Where = SQL_WhereBetween & SQL_SearchFor


SQL = "select SlipNo,[Date],CostCode,Supplier,Description, Total, Scan, Payment, TxID as Tx from Costs " & SQL_Where

if isDebug then
  Response.Write "SQL="& SQL & "<br><br>"
end if


'choose any dummy table
SQL_totExcl  = "EXEC dbo.PnL '1 May 2010' , '30 apr 2011'"
Set RS = SQLCN.Execute(SQL_totExcl)

Sales = FormatNumber(RS("Sales"), 2)
Purchases = FormatNumber(RS("Purchases"), 2)
SubContractor = FormatNumber(RS("SubContractor"), 2)
'CommissionsPd = FormatNumber(RS("CommissionsPd"), 2)
GrossWages = FormatNumber(RS("GrossWages"), 2)


Travel = FormatNumber(RS("Travel"), 2)
Motor = FormatNumber(RS("Motor"), 2)
Entertainment = FormatNumber(RS("Entertainment"), 2)

Premises = FormatNumber(RS("Premises"), 2)
Rates = FormatNumber(RS("Rates"), 2)
Utilities = FormatNumber(RS("Utilities"), 2)

'TELECOM = FormatNumber(RS("TELECOM"), 2)
'Postage = FormatNumber(RS("Postage"), 2)
'Stationery = FormatNumber(RS("Stationery"), 2)
'Publications = FormatNumber(RS("Publications"), 2)
'Subscriptions = FormatNumber(RS("Subscriptions"), 2)
'Bank charges = FormatNumber(RS("[Bank charges]"), 2)
'Insurance = FormatNumber(RS("Insurance"), 2)
'Software = FormatNumber(RS("Software"), 2)
'Bad_debts = FormatNumber(RS("Bad_debts"), 2)

'Equipment = FormatNumber(RS("Equipment"), 2)
'Expenses = FormatNumber(RS("Expenses"), 2)

'Accountancy = FormatNumber(RS("Accountancy"), 2)
'PROMOTIONS = FormatNumber(RS("[PROMOTIONS]"), 2)
'NetInterest = FormatNumber(RS("[Net Interest]"), 2)

SQL_totExcl  = "EXEC dbo.PnL '1 May 2009' , '30 apr 2010'"
Set RS2012 = SQLCN.Execute(SQL_totExcl)
Sales2012 = FormatNumber(RS2012("Sales"), 2)
Purchases2012 = FormatNumber(RS2012("Purchases"), 2)
SubContractor2012 = FormatNumber(RS2012("SubContractor"), 2)

sql3  =  "select IsNull(sum(IsNull(Total,0)),0)  as tot from Costs " &  SQL_Where
Set RS = SQLCN.Execute(sql3)
tot = FormatNumber(RS("tot"), 2)
Response.Write "<b>Total for all items below  &nbsp;&pound;" & tot & " <b>"

%>

<table>
    <TR><TD><b>&nbsp;&pound;</b>                         </TD> <TD>  2012           </TD><TD>   2011       </TD> <TD> 2009               </TD> </TR>
    <TR><TD><b>&nbsp;&pound;</b>                         </TD> <TD>  &pound;           </TD><TD>   &pound; </TD> <TD> &pound;             </TD> </TR>


    <TR><TD><b>Sales  &nbsp;</b> </TD> <%= Sales %>     <TD> <%= Sales %>    </TD><TD> <%= Sales %> </TD> <TD> <%= Sales2012 %>   </TD> </TR>
    <TR><TD><b>Purchases (Materials)  &nbsp;&pound;</b> </TD>  <TD> <%= Purchases %></TD><TD> <%= Sales %> </TD><TD> <%= Purchases2012 %></TD> </TR>

    <TR><TD><b>&nbsp;&nbsp;</b>                         </TD> <TD>  &nbsp;&nbsp;       </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>

    <TR><TD><b>Subcontractors /Professional Services  &nbsp;&pound;</b> </TD>  <TD> <%= SubContractor %></TD><TD> <%= SubContractor %> </TD><TD> <%= SubContractor %></TD> </TR>
    <TR><TD><b>GrossWages          &nbsp; </b> </TD>  <TD> <%= GrossWages %></TD><TD> <%= GrossWages %> </TD><TD> <%= GrossWages2012 %></TD> </TR>

    <TR><TD><b>Purchases (Materials)  &nbsp;&pound;</b> </TD>  <TD> <%= Purchases %></TD><TD> <%= Sales %> </TD><TD> <%= Purchases2012 %></TD> </TR>
    <TR><TD><b>Purchases (Materials)  &nbsp;&pound;</b> </TD>  <TD> <%= Purchases %></TD><TD> <%= Sales %> </TD><TD> <%= Purchases2012 %></TD> </TR>

    <TR><TD><b>GrossWages  &nbsp;&pound;</b> </TD> <%= GrossWages %> <TD></TD> <TD>  </TD><TD> <%= GrossWages %>                         </TD> </TR>


    <TR><TD><b>Premises (Materials)  &nbsp;&pound;</b> </TD>  <TD> <%= Premises %></TD><TD> <%= Premises %> </TD><TD> <%= Premises %></TD> </TR>
    <TR><TD><b>Rates                 &nbsp;&pound;</b> </TD>  <TD> <%= Rates %></TD><TD> <%= Rates %> </TD><TD> <%= Rates %></TD> </TR>
    <TR><TD><b>Utilities             &nbsp;&pound;</b> </TD>  <TD> <%= Utilities %></TD><TD> <%= Utilities %> </TD><TD> <%= Utilities %></TD> </TR>


</table>

<br><b>PROFESSIONAL_SERVICES &nbsp;&pound;  <%= CommissionsPd %>  <b><br><br>
<br><b>Gross Wages  &nbsp;&pound;  <%= GrossWages %>  <b><br><br>
<br><b>Travel  &nbsp;&pound;  <%= Travel %>  <b><br><br>
<br><b>Motor  &nbsp;&pound;  <%= Motor %>  <b><br><br>
<br><b>Premises  &nbsp;&pound;  <%= Premises %>  <b><br><br>
<br><b>Rates  &nbsp;&pound;  <%= Rates %>  <b><br><br>
<br><b>Utilities  &nbsp;&pound;  <%= Utilities %>  <b><br><br>
<br><b>Entertainment  &nbsp;&pound;  <%= Entertainment %>  <b><br><br>

TO BE DONE


THE REST IS UNDER CONSTRUCTION


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
