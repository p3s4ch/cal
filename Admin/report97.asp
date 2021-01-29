<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<h2 ALIGN=CENTER>Detailed Profit and Loss </h2>



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


'2012
SQL_totExcl  = "EXEC dbo.PnL '1 May 2011' , '30 apr 2012'"
Set RS = SQLCN.Execute(SQL_totExcl)

Sales = FormatNumber(RS("Sales"), 2)
Purchases = FormatNumber(RS("Purchases"), 2)
SubContractor = FormatNumber(RS("SubContractor"), 2)
WagesStaff = FormatNumber(RS("WagesStaff"), 2)
WagesDirector = FormatNumber(RS("WagesDirector"), 2)
EmployersNI = FormatNumber(RS("EmployersNI"), 2)
Travel = FormatNumber(RS("Travel"), 2)
Petrol = FormatNumber(RS("Petrol"), 2)
Motor = FormatNumber(RS("Motor"), 2)
Entertainment = FormatNumber(RS("Entertainment"), 2)
Premises = FormatNumber(RS("Premises"), 2)
Rates = FormatNumber(RS("Rates"), 2)
Utilities = FormatNumber(RS("Utilities"), 2)
TELECOM = FormatNumber(RS("TELECOM"), 2)
'Postage = FormatNumber(RS("Postage"), 2)
Stationery = FormatNumber(RS("Stationery"), 2)
Publications = FormatNumber(RS("Publications"), 2)
Subscriptions = FormatNumber(RS("Subscriptions"), 2)
BankCharges = FormatNumber(RS("BankCharges"), 2)
Insurance = FormatNumber(RS("Insurance"), 2)
Software = FormatNumber(RS("Software"), 2)
Bad_debts = FormatNumber(RS("Bad_debts"), 2)
'Equipment = FormatNumber(RS("Equipment"), 2)
'Expenses = FormatNumber(RS("Expenses"), 2)
Accountancy = FormatNumber(RS("Accountancy"), 2)
PROMOTIONS = FormatNumber(RS("AdvertisingPR"), 2)
profServices = FormatNumber(RS("profServices"), 2)

totAdmin= FormatNumber(RS("totAdmin"), 2)


'2011
SQL_totExcl  = "EXEC dbo.PnL '1 May 2010' , '30 apr 2011'"
Set RS11 = SQLCN.Execute(SQL_totExcl)

Sales11 = FormatNumber(RS11("Sales"), 2)
Purchases11 = FormatNumber(RS11("Purchases"), 2)
SubContractor11 = FormatNumber(RS11("SubContractor"), 2)
WagesStaff11 = FormatNumber(RS11("WagesStaff"), 2)
WagesDirector11 = FormatNumber(RS11("WagesDirector"), 2)
EmployersNI11 = FormatNumber(RS11("EmployersNI"), 2)
Travel11 = FormatNumber(RS11("Travel"), 2)
Petrol11 = FormatNumber(RS11("Petrol"), 2)
Motor11= FormatNumber(RS11("Motor"), 2)
Entertainment11 = FormatNumber(RS11("Entertainment"), 2)
Premises11 = FormatNumber(RS11("Premises"), 2)
Rates11 = FormatNumber(RS11("Rates"), 2)
Utilities11 = FormatNumber(RS11("Utilities"), 2)
TELECOM11 = FormatNumber(RS11("TELECOM"), 2)
'Postage11 = FormatNumber(RS11("Postage"), 2)
Stationery11 = FormatNumber(RS11("Stationery"), 2)
Publications11 = FormatNumber(RS11("Publications"), 2)
Subscriptions11 = FormatNumber(RS11("Subscriptions"), 2)
BankCharges11 = FormatNumber(RS11("BankCharges"), 2)
Insurance11 = FormatNumber(RS11("Insurance"), 2)
Software11 = FormatNumber(RS11("Software"), 2)
Bad_debts11 = FormatNumber(RS11("Bad_debts"), 2)
'Equipment11 = FormatNumber(RS11("Equipment"), 2)
'Expenses11 = FormatNumber(RS11("Expenses"), 2)
Accountancy11 = FormatNumber(RS11("Accountancy"), 2)
PROMOTIONS11 = FormatNumber(RS11("AdvertisingPR"), 2)
profServices11 = FormatNumber(RS11("profServices"), 2)

totAdmin11= FormatNumber(RS11("totAdmin"), 2)

'2010
SQL_totExcl  = "EXEC dbo.PnL '1 May 2009' , '30 apr 2010'"
Set RS10 = SQLCN.Execute(SQL_totExcl)
Sales10 = FormatNumber(RS10("Sales"), 2)
Purchases10 = FormatNumber(RS10("Purchases"), 2)
SubContractor10 = FormatNumber(RS10("SubContractor"), 2)
WagesStaff10 = FormatNumber(RS10("WagesStaff"), 2)
WagesDirector10 = FormatNumber(RS10("WagesDirector"), 2)
EmployersNI10 = FormatNumber(RS10("EmployersNI"), 2)
Travel10 = FormatNumber(RS10("Travel"), 2)
Petrol10 = FormatNumber(RS10("Petrol"), 2)
Motor10 = FormatNumber(RS10("Motor"), 2)
Entertainment10 = FormatNumber(RS10("Entertainment"), 2)
Premises10 = FormatNumber(RS10("Premises"), 2)
Rates10 = FormatNumber(RS10("Rates"), 2)
Utilities10 = FormatNumber(RS10("Utilities"), 2)
TELECOM10 = FormatNumber(RS10("TELECOM"), 2)
'Postage = FormatNumber(RS10("Postage"), 2)
Stationery10 = FormatNumber(RS10("Stationery"), 2)
Publications10 = FormatNumber(RS10("Publications"), 2)
Subscriptions10 = FormatNumber(RS10("Subscriptions"), 2)
BankCharges10 = FormatNumber(RS10("BankCharges"), 2)
Insurance10 = FormatNumber(RS10("Insurance"), 2)
Software10 = FormatNumber(RS10("Software"), 2)
Bad_debts10 = FormatNumber(RS10("Bad_debts"), 2)
'Equipment10 = FormatNumber(RS10("Equipment"), 2)
'Expenses10 = FormatNumber(RS10("Expenses"), 2)
Accountancy10 = FormatNumber(RS10("Accountancy"), 2)
PROMOTIONS10 = FormatNumber(RS10("AdvertisingPR"), 2)
profServices10 = FormatNumber(RS10("profServices"), 2)

totAdmin10= FormatNumber(RS10("totAdmin"), 2)

%>

<table border=1 >
<TR><TD><b>&nbsp;</b>            </TD><TD>  2012           </TD><TD>   2011       </TD>                 <TD>&nbsp;&nbsp;</TD> <TD> 2010               </TD> </TR>
<TR><TD><b>&nbsp;</b>            </TD><TD>  &pound;        </TD><TD>   &pound; </TD>                 <TD> &nbsp;&nbsp; </TD><TD> &pound;             </TD> </TR>

<TR><TD><b>Sales  &nbsp;</b>     </TD><TD> <%= Sales %>     </TD><TD> <%= Sales11 %> </TD>                       <TD> &nbsp;&nbsp; </TD><TD> <%= Sales10 %>   </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>      </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>

<TR><TD><b>Purchases (Materials) </b>
                                </TD><TD> <%= Purchases %>   </TD><TD> <%= Purchases11 %> </TD>                <TD> &nbsp;&nbsp; </TD><TD> <%= Purchases10 %></TD> </TR>
<TR><TD><b>Subcontractors /Professional Services  </b>
                                </TD><TD> <%= SubContractor %> </TD><TD> <%= SubContractor11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= SubContractor10 %></TD> </TR>

<TR><TD><b>&nbsp;&nbsp;</b>     </TD><TD>  &nbsp;&nbsp;       </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>     </TD><TD>  &nbsp;&nbsp;       </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>



<TR><TD><b>Administrative Expenses:   &nbsp;&nbsp; </b>       </TD><TD> &nbsp;&nbsp;  </TD>   <TD> &nbsp;&nbsp;     </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Wages Staff   </b>   </TD><TD> <%= WagesStaff %>   </TD><TD> <%= WagesStaff11 %>   </TD><TD> &nbsp;&nbsp;</TD><TD> <%= WagesStaff10 %>     </TD> </TR>
<TR><TD><b>Salary Director </b> </TD><TD><%= WagesDirector %> </TD><TD> <%= WagesDirector11%> </TD><TD> &nbsp;&nbsp;</TD><TD> <%= WagesDirector10 %>  </TD> </TR>
<TR><TD><b>Employers NI  </b>   </TD><TD> <%= EmployersNI %>  </TD><TD> <%= EmployersNI11 %>  </TD><TD> &nbsp;&nbsp;</TD><TD> <%= EmployersNI10 %>    </TD> </TR>
<TR><TD><b>Travel (flights, buses, taxi)  </b> </TD><TD> <%= Travel %></TD><TD> <%= Travel11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Travel10 %></TD> </TR>

<TR><TD><b>   &nbsp;&nbsp; </b>            </TD>  <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Motor Trucks, Vans     			   </b> </TD><TD> <%= Travel %></TD><TD> <%= Travel11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Travel10 %></TD> </TR>
<TR><TD><b>Petrol     			   </b> </TD><TD> <%= Petrol %></TD><TD> <%= Petrol11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Petrol10 %></TD> </TR>

<TR><TD><b>   &nbsp;&nbsp; </b>            </TD>  <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Premises: </b> </TD> <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>

<TR><TD><b>Rent   &nbsp;&nbsp;</b> </TD>  <TD> <%= Premises %></TD><TD> <%= Premises11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Premises10 %></TD> </TR>
<TR><TD><b>Rates      </b>                </TD>  <TD> <%= Rates %></TD><TD> <%= Rates11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Rates10 %></TD> </TR>
<TR><TD><b>Utilities  </b> </TD>          <TD> <%= Utilities %></TD><TD> <%= Utilities11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Utilities10 %></TD> </TR>
<TR><TD><b>   &nbsp;&nbsp; </b>            </TD>  <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>


<TR><TD><b>Telecom      		   </b> </TD><TD> <%= TELECOM %></TD><TD> <%= TELECOM11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= TELECOM10 %></TD> </TR>

<TR><TD><b>BankCharges             </b> </TD><TD> <%= BankCharges %></TD><TD> <%= BankCharges11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= BankCharges10 %></TD> </TR>
<TR><TD><b>Insurance               </b> </TD><TD> <%= Insurance %></TD><TD> <%= Insurance11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Insurance10 %></TD> </TR>
<TR><TD><b>Software                </b> </TD><TD> <%= Software %></TD><TD> <%= Software11 %> </TD><TD> &nbsp;&nbsp;      </TD><TD> <%= Software10 %></TD> </TR>
<TR><TD><b>Bad_debts               </b> </TD><TD> <%= Bad_debts %></TD><TD> 200* </TD><TD> &nbsp;&nbsp;                   </TD><TD> 1840*</TD> </TR>


<TR><TD><b>   &nbsp;&nbsp; </b>         </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Legal and Professional  </b> </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Accountancy fees                </b> </TD><TD> <%= Accountancy %></TD><TD> <%= Accountancy11 %> </TD><TD> &nbsp;&nbsp;      </TD><TD> <%= Accountancy10 %></TD> </TR>
<TR><TD><b>Adverts & PR                </b> </TD><TD> <%= PROMOTIONS %></TD><TD> <%= PROMOTIONS11 %> </TD><TD> &nbsp;&nbsp;      </TD><TD> <%= PROMOTIONS10 %></TD> </TR>
<TR><TD><b>Other                    </b> </TD><TD> <%= Accountancy %></TD><TD> <%= Accountancy11 %> </TD><TD> &nbsp;&nbsp;      </TD><TD> <%= Accountancy10 %></TD> </TR>


<TR><TD><b>Total Admin </b>             </TD><TD> <%= totAdmin %></TD><TD> <%= totAdmin11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= totAdmin10 %></TD> </TR>

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
