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
<TR><TD><b>&nbsp;</b>            </TD><TD>  2013           </TD><TD>  2012           </TD><TD>   2011       </TD>                  <TD> 2010               </TD> </TR>
<TR><TD><b>&nbsp;</b>            </TD><TD>  &pound;        </TD><TD>  &pound;        </TD><TD>   &pound; </TD>                 <TD> &pound;             </TD> </TR>
<TR><TD><b>Sales  &nbsp;</b>     </TD><TD> <%= Sales13 %>     </TD><TD> <%= Sales12 %>     </TD><TD> <%= Sales11 %> </TD> <TD> <%= Sales10 %>   </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>      </TD><TD>  &nbsp;&nbsp;   </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>
<TR><TD><b>Purchases (Materials) </b>
                                </TD><TD> <%= Purchases13 %>         </TD><TD> <%= Purchases12 %>       </TD><TD> <%= Purchases11 %> </TD>      <TD> <%= Purchases10 %></TD> </TR>
<TR><TD><b>Subcontractors  </b> </TD><TD> <%= SubContractor13 %>     </TD><TD> <%= SubContractor12 %>   </TD><TD> <%= SubContractor11 %> </TD>  <TD> <%= SubContractor10 %></TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>     </TD><TD> <%= TOT_COST_OF_SALES13 %> </TD><TD> <%= TOT_COST_OF_SALES12 %> </TD><TD> <%= TOT_COST_OF_SALES11 %></TD><TD>  <%= TOT_COST_OF_SALES10 %> </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>     </TD><TD>  &nbsp;&nbsp;       </TD><TD>  &nbsp;&nbsp;       </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>
<TR><TD><b>Admin Expenses: </b> <br>
DEPRECIATION <br>
TELECOM<br>
PETROL<br>
TOOLS<br>
UTILITIES<br>
SOFTWARE<br>
INSURANCE<br>
TRAVEL<br>
FURNITURE<br>
SUBSCRIPTIONS<br>
FLIGHTS<br>
EQUIPMENT<br>
BANK_CHARGE<br>
ACCOUNTANCY_FEES<br>
POSTAGE<br>
PROMOTIONS<br>
STATIONARY<br>
EXPENSES<br>
.~EMPLOYER_NI_DIR<br>
.~EMPLOYER_NI_STAFF<br>
.~GROSS_SALARY<br>
.~GROSS_WAGES_STAFF<br>






  </TD><TD> <%= totAdmin13 %><TD> <%= totAdmin12 %></TD><TD> <%= totAdmin11 %> </TD><TD> <%= totAdmin10 %></TD> </TR>











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
