<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<h2 ALIGN=CENTER>P and L </h2>

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




'2015
SQL_totExcl  = "EXEC dbo.PnL 52 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
'FormatNumber(RS("Sales"), 2)

'Sales15 = FormatNumber(RS("Sales"), 2)
'TOT_COST_OF_SALES15=RS("TOT_COST_OF_SALES")
'Purchases15 = FormatNumber(RS("Purchases"), 2)
'SubContractor15 = RS("SubContractor")
'totAdmin14= RS("TOT_ADMIN")


Sales15 = "&nbsp;"
TOT_COST_OF_SALES15= "&nbsp;"
Purchases15 = "&nbsp;"
SubContractor15  = "&nbsp;"
totAdmin15= "&nbsp;"






'2014
SQL_totExcl  = "EXEC dbo.PnL 51 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales14 = FormatNumber(RS("Sales"), 2)
TOT_COST_OF_SALES14=RS("TOT_COST_OF_SALES")
Purchases14 = FormatNumber(RS("Purchases"), 2)
SubContractor14 = RS("SubContractor")

'WagesStaff14 = FormatNumber(RS("WagesStaff"), 2)
'WagesDirector14 = FormatNumber(RS("WagesDirector"), 2)
totAdmin14= RS("TOT_ADMIN")


'2013
SQL_totExcl  = "EXEC dbo.PnL 50 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales13 = FormatNumber(RS("Sales"), 2)
TOT_COST_OF_SALES13=RS("TOT_COST_OF_SALES")
Purchases13 = FormatNumber(RS("Purchases"), 2)
SubContractor13 = RS("SubContractor")

'WagesStaff13 = FormatNumber(RS("WagesStaff"), 2)
'WagesDirector13 = FormatNumber(RS("WagesDirector"), 2)
totAdmin13= RS("TOT_ADMIN")


'2012
SQL_totExcl  = "EXEC dbo.PnL 29 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales12 = FormatNumber(RS("Sales"), 2)
Purchases12 = FormatNumber(RS("Purchases"), 2)
SubContractor12 = RS("SubContractor")
totAdmin12= RS("TOT_ADMIN")
TOT_COST_OF_SALES12=RS("TOT_COST_OF_SALES")

'2011
SQL_totExcl  = "EXEC dbo.PnL 28," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales11 = FormatNumber(RS("Sales"), 2)
Purchases11 = FormatNumber(RS("Purchases"), 2)
SubContractor11 = RS("SubContractor")
TOT_COST_OF_SALES11=RS("TOT_COST_OF_SALES")
totAdmin11= RS("TOT_ADMIN")

'2010
SQL_totExcl  = "EXEC dbo.PnL 27 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales10 = FormatNumber(RS("Sales"), 2)
Purchases10 = FormatNumber(RS("Purchases"), 2)
SubContractor10 = RS("SubContractor")
TOT_COST_OF_SALES10=RS("TOT_COST_OF_SALES")
totAdmin10= RS("TOT_ADMIN")


%>

<table border=1 >
<TR><TD><b>&nbsp;</b>            </TD><TD>  2015           </TD> <TD>  2014          </TD><TD>  2013           </TD><TD>  2012           </TD><TD>   2011       </TD>                  <TD> 2010               </TD> </TR>
<TR><TD><b>&nbsp;</b>            </TD><TD>  &pound;        </TD> <TD>  &pound;        </TD><TD>  &pound;        </TD><TD>  &pound;        </TD><TD>   &pound; </TD>                    <TD> &pound;             </TD> </TR>
<TR><TD><b>Sales  &nbsp;</b>     </TD><TD> <%= Sales15 %>  </TD> <TD> <%= Sales14 %>     </TD><TD> <%= Sales13 %>     </TD><TD> <%= Sales12 %>     </TD><TD> <%= Sales11 %> </TD>   <TD> <%= Sales10 %>   </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>      </TD><TD>  &nbsp;&nbsp;   </TD> <TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>
<TR><TD><b>Cost of Sales:</b>      </TD><TD>  &nbsp;&nbsp; </TD> <TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>

<TR><TD>Purchases (Materials)     </TD> <TD> <%= Purchases15 %>         </TD><TD> <%= Purchases14 %>         </TD><TD> <%= Purchases13 %>         </TD><TD> <%= Purchases12 %>       </TD><TD> <%= Purchases11 %> </TD>      <TD> <%= Purchases10 %></TD> </TR>
<TR><TD>Subcontractors   </TD><TD> <%= SubContractor15 %>     </TD><TD> <%= SubContractor14 %>     </TD><TD> <%= SubContractor13 %>     </TD><TD> <%= SubContractor12 %>   </TD><TD> <%= SubContractor11 %> </TD>  <TD> <%= SubContractor10 %></TD> </TR>
<TR><TD><b>TOT_COST_OF_SALES</b>     </TD><TD> <%= TOT_COST_OF_SALES15 %> </TD><TD> <%= TOT_COST_OF_SALES14 %> </TD><TD> <%= TOT_COST_OF_SALES13 %> </TD><TD> <%= TOT_COST_OF_SALES12 %> </TD><TD> <%= TOT_COST_OF_SALES11 %></TD><TD>  <%= TOT_COST_OF_SALES10 %> </TD> </TR>


<TR><TD>
<b>Admin Expenses: </b> <br>
Employee Costs: <br>
.~EMPLOYER_NI_DIR<br>
.~EMPLOYER_NI_STAFF<br>
.~GROSS_SALARY<br>
.~GROSS_WAGES_STAFF<br>
<br>
Premises: <br>
RENT <br>
RATES <br>
UTILITIES<br>
<br>


General EXPENSES:<br>
DEPRECIATION <br>
TELECOM<br>
PETROL<br>
TOOLS<br>
SOFTWARE<br>
INSURANCE<br>
TRAVEL<br>
FURNITURE<br>
SUBSCRIPTIONS<br>
FLIGHTS<br>
EQUIPMENT<br>
BANK_CHARGE<br>

POSTAGE<br>

STATIONARY<br>

<br>
Legal An Profesional: <br>
ACCOUNTANCY_FEES<br>
PROMOTIONS<br>



</TD><TD> <%= totAdmin15 %> </TD><TD> <%= totAdmin14 %> </TD><TD> <%= totAdmin13 %> </TD><TD> <%= totAdmin12 %> </TD><TD> <%= totAdmin11 %></TD><TD>  <%= totAdmin10 %> </TD> </TR>



<TR><TD><b>Gross Profit</b>     </TD><TD> <%= grossProfit15 %> </TD><TD> <%= grossProfit14 %> </TD><TD> <%= grossProfit13 %> </TD>
        <TD> <%= grossProfit12 %> </TD><TD> <%= grossProfit11 %></TD><TD>  <%= grossProfit10 %> </TD> </TR>


</table>

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
