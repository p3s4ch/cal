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
SQL_totExcl  = "EXEC dbo.PnL 29, 400 "
Set RS = SQLCN.Execute(SQL_totExcl)

Sales = FormatNumber(RS("Sales"), 2)
Purchases = FormatNumber(RS("PURCHASES"), 2)
SubContractor= RS("SubContractor")
TOT_COST_OF_SALES = FormatNumber(RS("TOT_COST_OF_SALES"), 2)


'employee
WagesStaff = FormatNumber(RS("WagesStaff"), 2)
WagesDirector = FormatNumber(RS("WagesDirector"), 2)
EmployersNI = FormatNumber(RS("EmployersNI"), 2)
Travel =RS("TRAVEL")
Petrol =RS("PETROL")
Motor =RS("VEHICLES")
'premises
RENT =RS("RENT")
RATES=RS("COUNCIL")
UTILITIES=RS("UTILITIES")
TELECOM=RS("TELECOM")
POSTAGE=RS("POSTAGE")
STATIONARY=RS("STATIONARY")
SUBSCRIPTIONS=RS("SUBSCRIPTIONS")
INSURANCE=RS("INSURANCE")
SOFTWARE=RS("SOFTWARE")
'BANK_LOAN=RS("BANK_LOAN")
'INTEREST=RS("INTEREST")
'NET WAGES=RS("TRAVEL")
'FLIGHTS=RS("FLIGHTS")
'MISC=RS("MISC")
BANK_CHARGE=RS("BANK_CHARGE")


'MEDIA=RS("MEDIA")
EQUIPMENT=RS("EQUIPMENT")
TOOLS= RS("TOOLS")
FURNITURE= RS("FURNITURE")

DEPRECIATION=RS("DEPRECIATION")
EXPENSES=RS("EXPENSES")


ACCOUNTANCY_FEES=RS("ACCOUNTANCY_FEES")
PROMOTIONS=RS("PROMOTIONS")
TOT_ADMIN=RS("TOT_ADMIN")

'2011
SQL_totExcl  = "EXEC dbo.PnL 28, 400 "
Set RS = SQLCN.Execute(SQL_totExcl)
Sales11 =RS("Sales")
Purchases11 =RS("PURCHASES")
SubContractor11=RS("SubContractor")
TOT_COST_OF_SALES11=RS("TOT_COST_OF_SALES")
'employee
WagesStaff11 =RS("WagesStaff")
WagesDirector11 =RS("WagesDirector")
EmployersNI11 =RS("EmployersNI")
Travel11 =RS("TRAVEL")
Petrol11 =RS("PETROL")
Motor11 =RS("VEHICLES")
'premises
RENT11 =RS("RENT")
RATES11=RS("COUNCIL")
UTILITIES11=RS("UTILITIES")
TELECOM11=RS("TELECOM")
POSTAGE11=RS("POSTAGE")
STATIONARY11=RS("STATIONARY")
SUBSCRIPTIONS11=RS("SUBSCRIPTIONS")
INSURANCE11=RS("INSURANCE")
SOFTWARE11=RS("SOFTWARE")
BANK_CHARGE11=RS("BANK_CHARGE")
'Expense11=RS("Expense")
'MEDIA11=RS("MEDIA")
EQUIPMENT11=RS("EQUIPMENT")
TOOLS11= RS("TOOLS")
FURNITURE11= RS("FURNITURE")

DEPRECIATION11=RS("DEPRECIATION")
EXPENSES11=RS("EXPENSES")

ACCOUNTANCY_FEES11=RS("ACCOUNTANCY_FEES")
PROMOTIONS11=RS("PROMOTIONS")

TOT_ADMIN11=RS("TOT_ADMIN")



fnt = "<font face=arial size=2 color=#000000>"
fnt2 = "</font>"

fntRed = "<font face=arial size=2 color=red>"

z1= fnt & "Sales" & fnt2
f1= fnt & Sales & fnt2
e1= fnt & Sales11 & fnt2
d1= fnt & Sales10 & fnt2
c1= fnt & Sales9 & fnt2
b1= fnt & Sales8 & fnt2
a1= fnt & Sales7 & fnt2

z2= fnt & "PURCHASES" & fnt2
f2= fnt & PURCHASES & fnt2
e2= fnt & PURCHASES11 & fnt2
d2= fnt & PURCHASES10 & fnt2
c2= fnt & PURCHASES9 & fnt2
b2= fnt & PURCHASES8 & fnt2
a2= fnt & PURCHASES7 & fnt2

z3= fnt & "Subcontractor Costs" & fnt2
f3= fnt & SubContractor & fnt2
e3= fnt & SubContractor11 & fnt2
d3= fnt & SubContractor10 & fnt2
c3= fnt & SubContractor9 & fnt2
b3= fnt & SubContractor8 & fnt2
a3= fnt & SubContractor7 & fnt2


z3b=  "&nbsp;"
f3b= fnt & TOT_COST_OF_SALES & fnt2
e3b= fnt & TOT_COST_OF_SALES11 & fnt2
d3b= fnt & TOT_COST_OF_SALES10 & fnt2
c3b= fnt & TOT_COST_OF_SALES9 & fnt2
b3b= fnt & TOT_COST_OF_SALES8 & fnt2
a3b= fnt & TOT_COST_OF_SALES7 & fnt2


z4= fnt & "Wages" & fnt2
f4= fnt & WagesStaff & fnt2
e4= fnt & WagesStaff11 & fnt2
d4= fnt & WagesStaff10 & fnt2
c4= fnt & WagesStaff9 & fnt2
b4= fnt & WagesStaff8 & fnt2
a4= fnt & WagesStaff7 & fnt2

z5= fnt & "WagesDirector" & fnt2
f5= fnt & WagesDirector & fnt2
e5= fnt & WagesDirector11 & fnt2
d5= fnt & WagesDirector10 & fnt2
c5= fnt & WagesDirector9 & fnt2
b5= fnt & WagesDirector8 & fnt2
a5= fnt & WagesDirector7 & fnt2

z6= fnt & "Employers NI" & fnt2
f6= fnt & EmployersNI & fnt2
e6= fnt & EmployersNI11 & fnt2
d6= fnt & EmployersNI10 & fnt2
c6= fnt & EmployersNI9 & fnt2
b6= fnt & EmployersNI8 & fnt2
a6= fnt & EmployersNI7 & fnt2


z7= fnt & "Travel" & fnt2
f7= fnt & Travel & fnt2
e7= fnt & Travel11  & fnt2
d7= fnt & Travel10  & fnt2
c7= fnt & Travel9  & fnt2
b72= fnt & Travel8  & fnt2
a7= fnt & Travel7  & fnt2

z8= fnt & "Petrol"& fnt2
f8= fnt & Petrol & fnt2
e8= fnt & Petrol11  & fnt2
d8= fnt & Petrol10  & fnt2
c8= fnt & Petrol9  & fnt2
b8= fnt & Petrol8  & fnt2
a8= fnt & Petrol7  & fnt2

z9= fntRed & "Motor"& fnt2
f9= fntRed & Motor & fnt2
e9= fnt & Motor11  & fnt2
d9= fnt & Motor10  & fnt2
c9= fnt & Motor9  & fnt2
b9= fnt & Motor8  & fnt2
a9= fnt & Motor7  & fnt2


'premises
z10 = fnt & "RENT" & fnt2
f10 = fnt & RENT & fnt2
e10 = fnt & RENT11  & fnt2
d10 = fnt & RENT10  & fnt2
c10 = fnt & RENT9  & fnt2
b10 = fnt & RENT8  & fnt2
a10 = fnt & RENT7  & fnt2

z11= fnt & "RATES" & fnt2
f11= fnt & RATES & fnt2
e11= fnt & RATES11 & fnt2
d11= fnt & RATES10 & fnt2
c11= fnt & RATES9 & fnt2
b11= fnt & RATES8 & fnt2
a11= fnt & RATES7 & fnt2

z12= fnt & "UTILITIES" & fnt2
f12= fnt & UTILITIES & fnt2
e12= fnt & UTILITIES11 & fnt2
d12= fnt & UTILITIES10 & fnt2
c12= fnt & UTILITIES9 & fnt2
b12= fnt & UTILITIES8 & fnt2
a12= fnt & UTILITIES7 & fnt2

'General Admin:


z13= fnt & "TELECOM" & fnt2
f13= fnt & TELECOM & fnt2
e13= fnt & TELECOM11 & fnt2
d13= fnt & TELECOM10 & fnt2
c13= fnt & TELECOM9 & fnt2
b13= fnt & TELECOM8 & fnt2
a13= fnt & TELECOM7 & fnt2

z14= fnt & "POSTAGE"
f14= fnt & POSTAGE
e14= fnt & POSTAGE11
d14= fnt & POSTAGE10 & fnt2
c14= fnt & POSTAGE9
b14= fnt & POSTAGE8
a14= fnt & POSTAGE7

z15= fnt & "STATIONARY" & fnt2
f15= fntRed & STATIONARY & fnt2
e15= fnt & STATIONARY11 & fnt2
d15= fnt & STATIONARY10 & fnt2
c15= fnt & STATIONARY9
b15= fnt & STATIONARY8
a15= fnt & STATIONARY7

z16= fnt & "SUBSCRIPTIONS" & fnt2
f16= fntRed & SUBSCRIPTIONS & fnt2
e16= fnt & SUBSCRIPTIONS11 & fnt2
d16= fnt & SUBSCRIPTIONS10 & fnt2
c16= fnt & SUBSCRIPTIONS9 & fnt2
b16= fnt & SUBSCRIPTIONS8 & fnt2
a16= fnt & SUBSCRIPTIONS7 & fnt2

z16b= fnt & "Bank Charges" & fnt2
f16b= fntRed & BANK_CHARGE & fnt2
e16b= fntRed & BANK_CHARGE11 & fnt2
d16b= fnt & BANK_CHARGE10 & fnt2
c16b= fnt & BANK_CHARGE9 & fnt2
b16b= fnt & BANK_CHARGE8 & fnt2
a16b= fnt & BANK_CHARGE7 & fnt2

z17= fnt & "INSURANCE" & fnt2
f17= fnt & INSURANCE & fnt2
e17= fnt & INSURANCE11 & fnt2
d17= fnt & INSURANCE10 & fnt2
c17= fnt & INSURANCE9 & fnt2
b17= fnt & INSURANCE8 & fnt2
a17= fnt & INSURANCE7 & fnt2

z18= fnt & "SOFTWARE" & fnt2
f18= fnt & SOFTWARE & fnt2
e18= fnt & SOFTWARE11  & fnt2
d18= fnt & SOFTWARE10  & fnt2
c18= fnt & SOFTWARE9  & fnt2
b18= fnt & SOFTWARE8  & fnt2
a18= fnt & SOFTWARE7  & fnt2

z19= fnt & "DEPRECIATION" & fnt2
f19= fnt & DEPRECIATION & fnt2
e19= fnt & DEPRECIATION11 & fnt2
d19= fnt & DEPRECIATION10 & fnt2
c19= fnt & DEPRECIATION9 & fnt2
b19= fnt & DEPRECIATION8 & fnt2
a19= fnt & DEPRECIATION7 & fnt2

z20 = fnt & "Bad Debts" & fnt2
f20 = fnt & Bad_Debts & fnt2
e20 = fnt & Bad_Debts11 & fnt2
d20 = fnt & Bad_Debts10 & fnt2
c20 = fnt & Bad_Debts9 & fnt2
b20 = fnt & Bad_Debts8 & fnt2
a20 = fnt & Bad_Debts7 & fnt2

z21= fnt & "Sundry expenses" & fnt2
f21= fnt & EXPENSES & fnt2
e21= fnt & EXPENSES11 & fnt2
d21= fnt & EXPENSES10 & fnt2
c21= fnt & EXPENSES9 & fnt2
b21= fnt & EXPENSES8 & fnt2
a21= fnt & EXPENSES7 & fnt2

z22= fnt & "EQUIPMENT" & fnt2
f22= fntRed & EQUIPMENT & fnt2
e22= fnt & EQUIPMENT11 & fnt2
d22= fnt & EQUIPMENT10 & fnt2
c22= fnt & EQUIPMENT9 & fnt2
b22= fnt & EQUIPMENT8 & fnt2
a22= fnt & EQUIPMENT7 & fnt2


z23= "Tools"
f23= TOOLS
e23= TOOLS11
d23= TOOLS10
c23= TOOLS9
b23= TOOLS8
a23= TOOLS7

z24= fnt & "Office Furniture" & fnt2
f24= FURNITURE
e24= FURNITURE11
d24= FURNITURE10
c24= FURNITURE9
b24= FURNITURE8
a24= FURNITURE7


'Legal And Professional
'
z25= fnt & "ACCOUNTANCY_FEES" & fnt2
f25= fnt &  "<font face= fnt & arial size= fnt & 2 color= fnt & #0 & fnt20 & fnt20 & fnt20 & fnt20 & fnt20 & fnt2>" & ACCOUNTANCY_FEES & "</font>"
e25= fnt & ACCOUNTANCY_FEES11 & fnt2
d25= fnt & ACCOUNTANCY_FEES10 & fnt2
c25= fnt & ACCOUNTANCY_FEES9 & fnt2
b25= fnt & ACCOUNTANCY_FEES8 & fnt2
a25= fnt & ACCOUNTANCY_FEES7 & fnt2

z26= fnt & "Advertising & PR" & fnt2
f26= fntRed & PROMOTIONS & fnt2
e26= fnt & PROMOTIONS11 & fnt2
d26= fnt & PROMOTIONS10 & fnt2
c26= fnt & PROMOTIONS9 & fnt2
b26= fnt & PROMOTIONS8 & fnt2
a26= fnt & PROMOTIONS7 & fnt2


z27= fnt & "" & fnt2
f27= fnt & 0 & fnt2
e27= fnt & 0 & fnt2
d27= fnt & 0 & fnt2
c27= fnt & 0 & fnt2
b27= fnt & 0 & fnt2
a27= fnt & 0 & fnt2

z28= fnt & "" & fnt2
f28= fnt & 0 & fnt2
e28= fnt & 0 & fnt2
d28= fnt & 0 & fnt2
c28= fnt & 0 & fnt2
b28= fnt & 0 & fnt2
a28= fnt & 0 & fnt2

z29= fnt & "" & fnt2
f29= fnt & 0 & fnt2
e29= fnt & 0 & fnt2
d29= fnt & 0 & fnt2
c29= fnt & 0 & fnt2
b29= fnt & 0 & fnt2
a29= fnt & 0 & fnt2

z30 = fnt & "TOT_ADMIN" & fnt2
f30 = fnt & TOT_ADMIN & fnt2
e30 = fnt & TOT_ADMIN11 & fnt2
d30 = fnt & TOT_ADMIN10 & fnt2
c30 = fnt & TOT_ADMIN9 & fnt2
b30 = fnt & TOT_ADMIN8 & fnt2
a30 = fnt & TOT_ADMIN7 & fnt2

%>



<table border =1 >
<tr><td>   </td>           <td>2012</td> <td>2011</td> <td>2010</td>  <td>2009</td> <td>2008</td> <td>2007</td> </tr>
<tr><td><%=z1%></td>       <td><%=f1%></td> <td><%=e1%></td> <td><%=d1%></td> <td><%=c1%></td> <td><%=b1%></td> <td><%=a1%></td>  </tr>
<tr><td>&nbsp;</td>        <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr> </tr>
<tr><td>Cost of Sales</td> <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr>
<tr> <td><%=z2%></td> <td><%=f2%></td> <td><%=e2%></td> <td><%=d2%></td> <td><%=c2%></td> <td><%=b2%></td> <td><%=a2%></td>  </tr>
<tr> <td><%=z3%></td> <td><%=f3%></td> <td><%=e3%></td> <td><%=d3%></td> <td><%=c3%></td> <td><%=b3%></td> <td><%=a3%></td>  </tr>
<tr> <td><%=z3b%></td> <td><%=f3b%></td> <td><%=e3b%></td> <td><%=d3b%></td> <td><%=c3b%></td> <td><%=b3b%></td> <td><%=a3b%></td>  </tr>

<tr><td>&nbsp;</td>        <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr> </tr>
<tr><td><b>Admin Expenses </b></td> <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr>
<tr> <td><%=z4%></td> <td><%=f4%></td> <td><%=e4%></td> <td><%=d4%></td> <td><%=c4%></td> <td><%=b4%></td> <td><%=a4%></td>  </tr>
<tr> <td><%=z5%></td> <td><%=f5%></td> <td><%=e5%></td> <td><%=d5%></td> <td><%=c5%></td> <td><%=b5%></td> <td><%=a5%></td>  </tr>
<tr> <td><%=z6%></td> <td><%=f6%></td> <td><%=e6%></td> <td><%=d6%></td> <td><%=c6%></td> <td><%=b6%></td> <td><%=a6%></td>  </tr>
<tr> <td><%=z7%></td> <td><%=f7%></td> <td><%=e7%></td> <td><%=d7%></td> <td><%=c7%></td> <td><%=b7%></td> <td><%=a7%></td>  </tr>
<tr> <td><%=z8%></td> <td><%=f8%></td> <td><%=e8%></td> <td><%=d8%></td> <td><%=c8%></td> <td><%=b8%></td> <td><%=a8%></td>  </tr>
<tr> <td><%=z9%></td> <td><%=f9%></td> <td><%=e9%></td> <td><%=d9%></td> <td><%=c9%></td> <td><%=b9%></td> <td><%=a9%></td>  </tr>
<tr><td>&nbsp;</td>        <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr> </tr>
<tr><td>Premises</td> <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr>
<tr> <td><%=z10%></td> <td><%=f10%></td> <td><%=e10%></td> <td><%=d10%></td> <td><%=c10%></td> <td><%=b10%></td> <td><%=a10%></td>
<tr> <td><%=z11%></td> <td><%=f11%></td> <td><%=e11%></td> <td><%=d11%></td> <td><%=c11%></td> <td><%=b11%></td> <td><%=a11%></td>  </tr>
<tr> <td><%=z12%></td> <td><%=f12%></td> <td><%=e12%></td> <td><%=d12%></td> <td><%=c12%></td> <td><%=b12%></td> <td><%=a12%></td>  </tr>

<tr><td>&nbsp;</td>        <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr> </tr>
<tr><td>General</td> <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr>

<tr> <td><%=z13%></td> <td><%=f13%></td> <td><%=e13%></td> <td><%=d13%></td> <td><%=c13%></td> <td><%=b13%></td> <td><%=a13%></td>  </tr>
<tr> <td><%=z14%></td> <td><%=f14%></td> <td><%=e14%></td> <td><%=d14%></td> <td><%=c14%></td> <td><%=b14%></td> <td><%=a14%></td>  </tr>
<tr> <td><%=z15%></td> <td><%=f15%></td> <td><%=e15%></td> <td><%=d15%></td> <td><%=c15%></td> <td><%=b15%></td> <td><%=a15%></td>  </tr>
<tr> <td><%=z16%></td> <td><%=f16%></td> <td><%=e16%></td> <td><%=d16%></td> <td><%=c16%></td> <td><%=b16%></td> <td><%=a16%></td>  </tr>
<tr> <td><%=z16b%></td> <td><%=f16b%></td> <td><%=e16b%></td> <td><%=d16b%></td> <td><%=c16b%></td> <td><%=b16b%></td> <td><%=a16b%></td>  </tr>
<tr> <td><%=z17%></td> <td><%=f17%></td> <td><%=e17%></td> <td><%=d17%></td> <td><%=c17%></td> <td><%=b17%></td> <td><%=a17%></td>  </tr>
<tr> <td><%=z18%></td> <td><%=f18%></td> <td><%=e18%></td> <td><%=d18%></td> <td><%=c18%></td> <td><%=b18%></td> <td><%=a18%></td>  </tr>

<tr> <td><%=z19%></td> <td><%=f19%></td> <td><%=e19%></td> <td><%=d19%></td> <td><%=c19%></td> <td><%=b19%></td> <td><%=a19%></td>  </tr>

<tr> <td><%=z20%></td> <td><%=f20%></td> <td><%=e20%></td> <td><%=d20%></td> <td><%=c20%></td> <td><%=b20%></td> <td><%=a20%></td>
<tr> <td><%=z21%></td> <td><%=f21%></td> <td><%=e21%></td> <td><%=d21%></td> <td><%=c21%></td> <td><%=b21%></td> <td><%=a21%></td>  </tr>
<tr> <td><%=z22%></td> <td><%=f22%></td> <td><%=e22%></td> <td><%=d22%></td> <td><%=c22%></td> <td><%=b22%></td> <td><%=a22%></td>  </tr>
<tr> <td><%=z23%></td> <td><%=f23%></td> <td><%=e23%></td> <td><%=d23%></td> <td><%=c23%></td> <td><%=b23%></td> <td><%=a23%></td>  </tr>
<tr> <td><%=z24%></td> <td><%=f24%></td> <td><%=e24%></td> <td><%=d24%></td> <td><%=c24%></td> <td><%=b24%></td> <td><%=a24%></td>  </tr>


<tr><td>&nbsp;</td>        <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr> </tr>
<tr><td>Legal & Professional</td> <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr>
<tr> <td><%=z25%></td> <td><%=f25%></td> <td><%=e25%></td> <td><%=d25%></td> <td><%=c25%></td> <td><%=b25%></td> <td><%=a25%></td>  </tr>
<tr> <td><%=z26%></td> <td><%=f26%></td> <td><%=e26%></td> <td><%=d26%></td> <td><%=c26%></td> <td><%=b26%></td> <td><%=a26%></td>  </tr>
<tr> <td><%=z27%></td> <td><%=f27%></td> <td><%=e27%></td> <td><%=d27%></td> <td><%=c27%></td> <td><%=b27%></td> <td><%=a27%></td>  </tr>
<tr> <td><%=z28%></td> <td><%=f28%></td> <td><%=e28%></td> <td><%=d28%></td> <td><%=c28%></td> <td><%=b28%></td> <td><%=a28%></td>  </tr>
<tr> <td><%=z29%></td> <td><%=f29%></td> <td><%=e29%></td> <td><%=d29%></td> <td><%=c29%></td> <td><%=b29%></td> <td><%=a29%></td>  </tr>
<tr> <td><%=z30%></td> <td><%=f30%></td> <td><%=e30%></td> <td><%=d30%></td> <td><%=c30%></td> <td><%=b30%></td> <td><%=a30%></td>  </tr>

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
