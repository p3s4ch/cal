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
Purchases = FormatNumber(RS("PURCHASES"), 2)
SubContractor = FormatNumber(RS("SubContractor"), 2)

WagesStaff = FormatNumber(RS("WagesStaff"), 2)
WagesDirector = FormatNumber(RS("WagesDirector"), 2)
EmployersNI = FormatNumber(RS("EmployersNI"), 2)

Travel = FormatNumber(RS("TRAVEL"), 2)
Petrol = FormatNumber(RS("PETROL"), 2)
Motor = FormatNumber(RS("VEHICLES"), 2)

'REFUND = FormatNumber(RS("TRAVEL"), 2)
TELECOM= FormatNumber(RS("TELECOM"), 2)
BANK_LOAN= FormatNumber(RS("BANK_LOAN"), 2)
PREMISES RENT DEPOSIT= FormatNumber(RS("PREMISES"), 2)
INTEREST= FormatNumber(RS("INTEREST"), 2)

TOOLS= FormatNumber(RS("TOOLS"), 2)
'NET WAGES= FormatNumber(RS("TRAVEL"), 2)
PROFESSIONAL_SERVICES= FormatNumber(RS("PROFESSIONAL_SERVICES"), 2)
UTILITIES= FormatNumber(RS("UTILITIES"), 2)
SOFTWARE= FormatNumber(RS("SOFTWARE"), 2)
INSURANCE= FormatNumber(RS("INSURANCE"), 2)

FURNITURE= FormatNumber(RS("FURNITURE"), 2)
SUBSCRIPTIONS= FormatNumber(RS("SUBSCRIPTIONS"), 2)
PURCHASES= FormatNumber(RS("PURCHASES"), 2)
FLIGHTS= FormatNumber(RS("FLIGHTS"), 2)




MISC= FormatNumber(RS("MISC"), 2)
EQUIPMENT= FormatNumber(RS("EQUIPMENT"), 2)
BANK_CHARGE= FormatNumber(RS("BANK_CHARGE"), 2)
Expense= FormatNumber(RS("Expense"), 2)
ACCOUNTANCY_FEES= FormatNumber(RS("ACCOUNTANCY_FEES"), 2)
POSTAGE= FormatNumber(RS("POSTAGE"), 2)
COUNCIL= FormatNumber(RS("COUNCIL"), 2)
PROMOTIONS= FormatNumber(RS("PROMOTIONS"), 2)
MEDIA= FormatNumber(RS("MEDIA"), 2)
STATIONARY= FormatNumber(RS("STATIONARY"), 2)

'Entertainment = FormatNumber(RS("Entertainment"), 2)

totAdmin= FormatNumber(RS("totAdmin"), 2)

%>

<table border=1 >
<TR><TD><b>&nbsp;</b>            </TD><TD>  2012           </TD><TD>   2011       </TD>                 <TD>&nbsp;&nbsp;</TD> <TD> 2010               </TD> </TR>
<TR><TD><b>&nbsp;</b>            </TD><TD>  &pound;        </TD><TD>   &pound; </TD>                 <TD> &nbsp;&nbsp; </TD><TD> &pound;             </TD> </TR>

<TR><TD><b>Sales  &nbsp;</b>     </TD><TD> <%= Sales %>     </TD><TD> <%= Sales11 %> </TD>                       <TD> &nbsp;&nbsp; </TD><TD> <%= Sales10 %>   </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>      </TD><TD>  &nbsp;&nbsp;   </TD> <TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>

<TR><TD><b>Purchases (Materials) </b>
                                </TD><TD> <%= Purchases %>   </TD><TD> <%= Purchases11 %> </TD>                <TD> &nbsp;&nbsp; </TD><TD> <%= Purchases10 %></TD> </TR>
<TR><TD><b>Subcontractors  </b>
                                </TD><TD> <%= SubContractor %> </TD><TD> <%= SubContractor11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= SubContractor10 %></TD> </TR>

<TR><TD><b>&nbsp;&nbsp;</b>     </TD><TD>  &nbsp;&nbsp;       </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>
<TR><TD><b>&nbsp;&nbsp;</b>     </TD><TD>  &nbsp;&nbsp;       </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> <TD> &nbsp;&nbsp;  </TD> </TR>



<TR><TD><b>Administrative Expenses:   &nbsp;&nbsp; </b>       </TD><TD> &nbsp;&nbsp;  </TD>   <TD> &nbsp;&nbsp;     </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Wages Staff   </b>   </TD><TD> <%= WagesStaff %>   </TD><TD> <%= WagesStaff11 %>   </TD><TD> &nbsp;&nbsp;</TD><TD> <%= WagesStaff10 %>     </TD> </TR>
<TR><TD><b>Salary Director </b> </TD><TD><a href=payroll.asp?uid=<%=uid%>&group1=showDirectorsOnly&periodId=29 ><%= WagesDirector %> </a> </TD><TD> <%= WagesDirector11%> </TD><TD> &nbsp;&nbsp;</TD><TD> <%= WagesDirector10 %>  </TD> </TR>
<TR><TD><b>Employers NI  </b>   </TD><TD> <%= EmployersNI %>  </TD><TD> <%= EmployersNI11 %>  </TD><TD> &nbsp;&nbsp;</TD><TD> <%= EmployersNI10 %>    </TD> </TR>

<TR><TD><b>Travel (flights, buses, taxi)  </b> </TD><TD> <%= Travel %></TD><TD> <%= Travel11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Travel10 %></TD> </TR>
<TR><TD><b>   &nbsp;&nbsp; </b>            </TD>  <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Motor Trucks, Vans     			   </b> </TD><TD> <%= Travel %></TD><TD> <%= Travel11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Travel10 %></TD> </TR>
<TR><TD><b>Petrol     			   </b> </TD><TD> <%= Petrol %></TD><TD> <%= Petrol11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Petrol10 %></TD> </TR>

<TR><TD><b>   &nbsp;&nbsp; </b>            </TD>  <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD><b>Premises: </b> </TD> <TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp;  </TD><TD> &nbsp;&nbsp; </TD><TD> &nbsp;&nbsp; </TD> </TR>
<TR><TD>&nbsp;&nbsp;&nbsp;&nbsp;Rent    </TD>  <TD> <%= Premises %></TD><TD> <%= Premises11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Premises10 %></TD> </TR>
<TR><TD>&nbsp;&nbsp;&nbsp;&nbsp;Rates                      </TD>  <TD> <%= Rates %></TD><TD> <%= Rates11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Rates10 %></TD> </TR>
<TR><TD>&nbsp;&nbsp;&nbsp;&nbsp;Utilities   </TD>          <TD> <%= Utilities %></TD><TD> <%= Utilities11 %> </TD><TD> &nbsp;&nbsp; </TD><TD> <%= Utilities10 %></TD> </TR>
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
