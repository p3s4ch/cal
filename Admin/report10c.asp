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
SQL_totExcl  = "EXEC dbo.PnL '1 May 2011' , '30 apr 2012'"
Set RS = SQLCN.Execute(SQL_totExcl)

Sales = FormatNumber(RS("Sales"), 2)
Purchases = FormatNumber(RS("PURCHASES"), 2)
SubContractor= FormatNumber(RS("SubContractor"), 2)


'employee
WagesStaff = FormatNumber(RS("WagesStaff"), 2)
WagesDirector = FormatNumber(RS("WagesDirector"), 2)
EmployersNI = FormatNumber(RS("EmployersNI"), 2)
Travel = FormatNumber(RS("TRAVEL"), 2)
Petrol = FormatNumber(RS("PETROL"), 2)
Motor = FormatNumber(RS("VEHICLES"), 2)


'premises
RENT = FormatNumber(RS("RENT"), 2)
RATES= FormatNumber(RS("COUNCIL"), 2)
UTILITIES= FormatNumber(RS("UTILITIES"), 2)



TELECOM= FormatNumber(RS("TELECOM"), 2)
POSTAGE= FormatNumber(RS("POSTAGE"), 2)
STATIONARY= FormatNumber(RS("STATIONARY"), 2)
SUBSCRIPTIONS= FormatNumber(RS("SUBSCRIPTIONS"), 2)


INSURANCE= FormatNumber(RS("INSURANCE"), 2)
SOFTWARE= FormatNumber(RS("SOFTWARE"), 2)

FURNITURE= FormatNumber(RS("FURNITURE"), 2)

'BANK_LOAN= FormatNumber(RS("BANK_LOAN"), 2)
'INTEREST= FormatNumber(RS("INTEREST"), 2)
TOOLS= FormatNumber(RS("TOOLS"), 2)
'NET WAGES= FormatNumber(RS("TRAVEL"), 2)
'FLIGHTS= FormatNumber(RS("FLIGHTS"), 2)
'MISC= FormatNumber(RS("MISC"), 2)
BANK_CHARGE= FormatNumber(RS("BANK_CHARGE"), 2)
'Expense= FormatNumber(RS("Expense"), 2)


'MEDIA= FormatNumber(RS("MEDIA"), 2)

EQUIPMENT= FormatNumber(RS("EQUIPMENT"), 2)


ACCOUNTANCY_FEES= FormatNumber(RS("ACCOUNTANCY_FEES"), 2)
PROMOTIONS= FormatNumber(RS("PROMOTIONS"), 2)



z1="Sales"
f1=Sales
e1=Sales
d1=Sales
c1=0
b1=0
a1=0

z2="Purchases"
f2=PURCHASES
e2=PURCHASES
d2=PURCHASES
c2=0
b2=0
a2=0

z3="Subcontractor Costs"
f3=SubContractor
e3=0
d3=0
c3=0
b3=0
a3=0

z4="Wages"
f4=WagesStaff
e4=0
d4=0
c4=0
b4=0
a4=0

z5="WagesDirector"
f5=WagesDirector
e5=0
d5=0
c5=0
b5=0
a5=0

z6="Employers NI"
f6=EmployersNI
e6=0
d6=0
c6=0
b6=0
a6=0


z7="Travel"
f7=Travel
e7=0
d7=0
c7=0
b72=0
a7=0

z8="Petrol"
f8=Petrol
e8=0
d8=0
c8=0
b8=0
a8=0

z9="Motor"
f9=Motor
e9=0
d9=0
c9=0
b9=0
a9=0


'premises
z10="RENT"
f10=RENT
e10=0
d10=0
c10=0
b10=0
a10=0

z11="RATES"
f11=RATES
e11=0
d11=0
c11=0
b11=0
a11=0

z12="UTILITIES"
f12=UTILITIES
e12=0
d12=0
c12=0
b12=0
a12=0

'General Admin:


z13="TELECOM"
f13=TELECOM
e13=0
d13=0
c13=0
b13=0
a13=0

z14="POSTAGE"
f14=POSTAGE
e14=POSTAGE11
d14=POSTAGE10
c14=POSTAGE9
b14=POSTAGE8
a14=POSTAGE7

z15="STATIONARY"
f15=STATIONARY
e15=STATIONARY11
d15=STATIONARY10
c15=STATIONARY9
b15=STATIONARY8
a15=STATIONARY7

z16="SUBSCRIPTIONS"
f16=SUBSCRIPTIONS
e16=SUBSCRIPTIONS11
d16=SUBSCRIPTIONS10
c16=SUBSCRIPTIONS9
b16=SUBSCRIPTIONS9
a16=SUBSCRIPTIONS7


z17="INSURANCE"
f17=INSURANCE
e17=0
d17=0
c17=0
b17=0
a17=0

z18="SOFTWARE"
f18=SOFTWARE
e18=0
d18=0
c18=0
b18=0
a18=0

z19="Depreciation"
f19=0
e19=0
d19=0
c19=0
b19=0
a19=0

z20="Bad Debts"
f20=0
e20=0
d20=0
c20=0
b20=0
a20=0

z21="Sundry"
f21=0
e21=0
d21=0
c21=0
b21=0
a21=0

z22=""
f22=0
e22=0
d22=0
c22=0
b22=0
a22=0

z23=""
f23=0
e23=0
d23=0
c23=0
b23=0
a23=0




z24=""
f24=0
e24=0
d24=0
c24=0
b24=0
a24=0


'Legal And Professional
z25="ACCOUNTANCY_FEES"
f25= "<font face=arial size=2 color=#000000>" & ACCOUNTANCY_FEES & "</font>"
e25=0
d25=0
c25=0
b25=0
a25=0

z26="PROMOTIONS"
f26=PROMOTIONS
e26=0
d26=0
c26=0
b26=0
a26=0


z27=""
f27=0
e27=0
d27=0
c27=0
b27=0
a27=0

z28=""
f28=0
e28=0
d28=0
c28=0
b28=0
a28=0

z29=""
f29=0
e29=0
d29=0
c29=0
b29=0
a29=0

z30=""
f30=0
e30=0
d30=0
c30=0
b30=0
a30=0



%>



<table border =1 >
<tr><td>   </td>           <td>2012</td> <td>2011</td> <td>2010</td>  <td>2009</td> <td>2008</td> <td>2007</td> </tr>
<tr><td><%=z1%></td>       <td><%=f1%></td> <td><%=e1%></td> <td><%=d1%></td> <td><%=c1%></td> <td><%=b1%></td> <td><%=a1%></td>  </tr>
<tr><td>&nbsp;</td>        <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr> </tr>
<tr><td>Cost of Sales</td> <td>&nbsp; </td> <td>&nbsp;</td> <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>     <td>&nbsp;</td>  </tr>
<tr> <td><%=z2%></td> <td><%=f2%></td> <td><%=e2%></td> <td><%=d2%></td> <td><%=c2%></td> <td><%=b2%></td> <td><%=a2%></td>  </tr>
<tr> <td><%=z3%></td> <td><%=f3%></td> <td><%=e3%></td> <td><%=d3%></td> <td><%=c3%></td> <td><%=b3%></td> <td><%=a3%></td>  </tr>
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
