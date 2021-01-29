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


'2016
'SQL_totExcl  = "EXEC dbo.PnL 53 ," & uid
'Set RS = SQLCN.Execute(SQL_totExcl)
'FormatNumber(RS("Sales"), 2)

'Sales16 = FormatNumber(RS("Sales"), 2)
'TOT_COST_OF_SALES16=RS("TOT_COST_OF_SALES")
'Purchases16 = FormatNumber(RS("Purchases"), 2)
'SubContractor16 = RS("SubContractor")
'totAdmin16= RS("TOT_ADMIN")

Sales16 = "&nbsp; TO DATE"
TOT_COST_OF_SALES16= "&nbsp;"
Purchases16 = "&nbsp;"
SubContractor16  = "&nbsp;"
totAdmin16= "&nbsp;"
grossProfit16= "&nbsp;"

'2015
SQL_totExcl  = "EXEC dbo.PnL 52 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales15 = RS("Sales")
TOT_COST_OF_SALES15=RS("TOT_COST_OF_SALES")
Purchases15 = FormatNumber(RS("Purchases"), 2)
SubContractor15 = RS("SubContractor")
totAdmin15= RS("TOT_ADMIN")
grossProfit15= RS("GROSS_PROFIT")

'2014
SQL_totExcl  = "EXEC dbo.PnL 51 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales14 = RS("Sales")
TOT_COST_OF_SALES14=RS("TOT_COST_OF_SALES")
Purchases14 = FormatNumber(RS("Purchases"), 2)
SubContractor14 = RS("SubContractor")
totAdmin14= RS("TOT_ADMIN")
grossProfit14= RS("GROSS_PROFIT")

'2013
SQL_totExcl  = "EXEC dbo.PnL 50 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales13 = RS("Sales")
TOT_COST_OF_SALES13=RS("TOT_COST_OF_SALES")
Purchases13 = FormatNumber(RS("Purchases"), 2)
SubContractor13 = RS("SubContractor")
totAdmin13= RS("TOT_ADMIN")
grossProfit13= RS("GROSS_PROFIT")


'2012
SQL_totExcl  = "EXEC dbo.PnL 29 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales12 = RS("Sales")
Purchases12 = FormatNumber(RS("Purchases"), 2)
SubContractor12 = RS("SubContractor")
totAdmin12= RS("TOT_ADMIN")
TOT_COST_OF_SALES12=RS("TOT_COST_OF_SALES")
grossProfit12= RS("GROSS_PROFIT")


'2011
SQL_totExcl  = "EXEC dbo.PnL 28," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales11 = RS("Sales")
Purchases11 = FormatNumber(RS("Purchases"), 2)
SubContractor11 = RS("SubContractor")
TOT_COST_OF_SALES11=RS("TOT_COST_OF_SALES")
totAdmin11= RS("TOT_ADMIN")
grossProfit11= RS("GROSS_PROFIT")

'2010
SQL_totExcl  = "EXEC dbo.PnL 27 ," & uid
Set RS = SQLCN.Execute(SQL_totExcl)
Sales10 = RS("Sales")
Purchases10 = FormatNumber(RS("Purchases"), 2)
SubContractor10 = RS("SubContractor")
TOT_COST_OF_SALES10=RS("TOT_COST_OF_SALES")
totAdmin10= RS("TOT_ADMIN")
grossProfit10= RS("GROSS_PROFIT")


%>

<table border=1 >
<TR><TD><b>&nbsp;</b>            </TD>   <TD>  2016           </TD><TD>  2015           </TD> <TD>  2014          </TD><TD>  2013           </TD><TD>  2012           </TD><TD>   2011       </TD>                  <TD> 2010               </TD> </TR>
<TR><TD><b>&nbsp;</b>            </TD>   <TD>  &pound;        </TD><TD>  &pound;        </TD> <TD>  &pound;        </TD><TD>  &pound;        </TD><TD>  &pound;        </TD><TD>   &pound; </TD>                    <TD> &pound;             </TD> </TR>
<TR><TD><b>Sales  &nbsp;</b>     </TD>   <TD>  <%= Sales16 %> </TD><TD> <%= Sales15 %>  </TD> <TD> <%= Sales14 %>     </TD><TD> <%= Sales13 %>     </TD><TD> <%= Sales12 %>     </TD><TD> <%= Sales11 %> </TD>   <TD> <%= Sales10 %>   </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>      </TD>   <TD>  &nbsp;&nbsp;           </TD><TD>  &nbsp;&nbsp;   </TD> <TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>
<TR><TD><b>Cost of Sales:</b>    </TD>   <TD>  &nbsp;&nbsp;           </TD><TD>  &nbsp;&nbsp; </TD> <TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>

<TR><TD>Purchases (Materials)     </TD>  <TD>  <%= Purchases16 %>           </TD><TD> <%= Purchases15 %>         </TD><TD> <%= Purchases14 %>         </TD><TD> <%= Purchases13 %>         </TD><TD> <%= Purchases12 %>       </TD><TD> <%= Purchases11 %> </TD>      <TD> <%= Purchases10 %></TD> </TR>
<TR><TD>Subcontractors   </TD>           <TD>  <%= SubContractor16%>           </TD><TD> <%= SubContractor15%>     </TD><TD> <%= SubContractor14 %>     </TD><TD> <%= SubContractor13 %>     </TD><TD> <%= SubContractor12 %>   </TD><TD> <%= SubContractor11 %> </TD>  <TD> <%= SubContractor10 %></TD> </TR>
<TR><TD><b>TOT_COST_OF_SALES</b>  </TD>  <TD>  <%= TOT_COST_OF_SALES16 %>           </TD><TD> <%= TOT_COST_OF_SALES15 %> </TD><TD> <%= TOT_COST_OF_SALES14 %> </TD><TD> <%= TOT_COST_OF_SALES13 %> </TD><TD> <%= TOT_COST_OF_SALES12 %> </TD><TD> <%= TOT_COST_OF_SALES11 %></TD><TD>  <%= TOT_COST_OF_SALES10 %> </TD> </TR>


<TR><TD>
<b>Admin Expenses: </b> <br>
Employee Costs: <br>
.~EMPLOYER_NI_DIR<br>
.~EMPLOYER_NI_STAFF<br>
.~GROSS_SALARY<br>
.~GROSS_WAGES_STAFF<br>
TRAVEL<br>
FURNITURE<br>
FLIGHTS<br>
PETROL<br>



<br>
Premises: <br>
RENT <br>
RATES <br>
UTILITIES<br>
<br>


General EXPENSES:<br>
TELECOM<br>
POSTAGE<br>
STATIONARY<br>
SUBSCRIPTIONS<br>
BANK_CHARGE<br>

INSURANCE<br>
EQUIPMENT<br>
TOOLS<br>

SOFTWARE<br>

DEPRECIATION <br>

<br>
Legal An Profesional: <br>
ACCOUNTANCY_FEES<br>
PROMOTIONS<br>



</TD>

<TD> XX </TD>

<TD> <%= totAdmin15 %> </TD><TD> <%= totAdmin14 %> </TD><TD> <%= totAdmin13 %> </TD><TD> <%= totAdmin12 %> </TD><TD> <%= totAdmin11 %></TD><TD>  <%= totAdmin10 %> </TD> </TR>



<TR><TD><b> Profit</b>     </TD>
			   <TD> <%= grossProfit16 %> </TD>
               <TD> <%= grossProfit15 %> </TD>
               <TD> <%= grossProfit14 %> </TD>
               <TD> <%= grossProfit13 %> </TD>
               <TD> <%= grossProfit12 %> </TD>
               <TD> <%= grossProfit11 %></TD>
               <TD> <%= grossProfit10 %> </TD>

               </TR>


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
