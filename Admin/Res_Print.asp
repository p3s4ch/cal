
<!--#include file="dsn.asp"-->
<!--#include file="common/SQL_CN.asp"-->


<HTML>
<HEAD>

<%

AddID = request("ID")
Operator = Trim(request("Operator"))

If (AddID <> "") Then

	 'This code is due to Gordon Brown drop in the stupid VAT Rate
	 SQL = "select dbo.getVATRate(DateOfInvoice) as VAT_RATE, * from invoices left join customers ON invoices.CustomerID = Customers.ID WHERE invoices.ID = 786 "
	 Set RS = SQLCN.Execute(SQL)

     if (RS.EOF) then
       Response.Write "Invoice Not found = " & AddID
 	   Response.Write "<BR>"
 	   Response.End
     end if


     vatRate        = RS("VAT_RATE")

	 DateOfInvoice = RS("DateOfInvoice")

     Status= RS("Status")
     tot= RS("Total")
     VAT= RS("VAT")
     totIncVat= RS("TotalInclVAT")

     'if (Not IsNumeric(totIncVat) ) then totIncVat = 0 end if
	 'tot = totIncVat/(1 + vatRate)
	 'vat = totIncVat - tot

	 'totIncVat = FormatNumber(totIncVat, 2)
	 'tot = FormatNumber(tot, 2)
	 'vat = FormatNumber(vat, 2)


End If

%>


<STYLE>
P.c_invoice{
 margin-left: '25%'; color: '#000000';
 font-size:30;
}

P.c_describe {
color : black;
border-style: groove;
margin-right: '30%';
}

P.c_small {
margin-left: '10%';
font-size:12;
color : grey;

}

P.c_breakdown
{
margin-left: '20%';
}


</STYLE>
<!------------------------------------------------------------------------------------------------>



</HEAD>
<BODY>

<p class=MsoNormal style='margin-top:12.0pt;mso-pagination:none;tab-stops:75.0pt;
mso-layout-grid-align:none;text-autospace:none'><span lang=EN-US
style='font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-US'><span
style='mso-tab-count:1'> </span></span><b><span
lang=EN-US style='font-size:36.0pt;font-family:"Book Antiqua";mso-bidi-font-family:
"Book Antiqua";color:#006231;mso-ansi-language:EN-US'>

&nbsp;
Micro Men Ltd.</span></b><b><span
lang=EN-US style='font-size:45.5pt;font-family:"Book Antiqua";mso-bidi-font-family:
"Book Antiqua";color:#006231;mso-ansi-language:EN-US'><o:p></o:p></span></b></p>





<p class=MsoNormal><span style='font-size:12.0pt;font-family:"Century Gothic";color:blue'>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
(Order <span class=GramE>a</span> handyman.com)<o:p></o:p></span></p>


<table width=100% border=0>
<tr>
<td> 12 FERNHURST GARDENS   <br>
      EDGWARE          <br>
      HA8 7PH,         <br>  </td> <td> </td><td> </td>   <td>  Tel: 07 88 19 66 867 <br>
                                                                Email: admin@micromen.co.uk <br>
                                                                www.orderAhandyman.com <br></td></tr>

<tr>
<td> </td> <td> </td><td> </td> <td><%= Day(DateOfInvoice) %>  &nbsp; <%= MonthName(Month(DateOfInvoice)) %>  &nbsp; <%= Year(DateOfInvoice) %> </td>
</tr>
</table>


<P class=c_invoice>
Invoice No: <%= AddID %>  &nbsp; &nbsp; &nbsp; &nbsp; Status:  <%= Status %>
</P>

Customer:<%= RS("Title")%>&nbsp; <%= RS("FirstName") %> &nbsp; <%= RS("Surname") %> <BR>
Address:
<%= RS("Address")%>  ,<%= RS("PostCode") %> , Email:  <%= RS("email") %> <br>
Mobile: <%= RS("mobile") %>


<BR>
<BR>

Description of Services:
<P class=c_describe>
<%= RS("Description") %>
</P>


<P class=c_breakdown>
		<b>Total          </b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
		                       &pound; <%= tot %>       <BR>
           VAT @ <i><%=vatRate*100%>%</i>    &nbsp; &nbsp; &nbsp;   &nbsp;  &nbsp;   &pound; <%= vat %>       <BR>
        <b>Total incl VAT </b> &nbsp; &nbsp; &nbsp;                            &pound; <%= totIncVat %> <BR>
</P>
<BR>




<p class=MsoNormal style='margin-top:14.75pt;mso-pagination:none;tab-stops:
25.95pt;mso-layout-grid-align:none;text-autospace:none'><b>

<span lang=EN-US style='font-size:10.0pt;font-family:"Monotype Corsiva";mso-bidi-font-family:
"Monotype Corsiva";color:#006231;mso-ansi-language:EN-US'><span
style='mso-tab-count:2'> </span></span></b><b><span lang=EN-US
style='font-family:"Monotype Corsiva";mso-bidi-font-family:"Monotype Corsiva";
color:#006231;mso-ansi-language:EN-US'>&nbsp; &nbsp; &nbsp; &nbsp; Computer Services, Handyman, Decorator,Garden, Building services
&amp; Property Maintenance<o:p></o:p></span></b></p>

<P class=c_small>
Company Number 577 5942   VAT 882 060626 Reg Office 112 Station Rd, HA8 7BJ
</P>

<BR>
[Tear Off Slip]
<HR>

<P class=c_invoice>
Invoice No: <%= AddID %>
</P>


    PAYMENT  ENCLOSED                          ___________ <BR>
	PAYMENT TYPE :  CHEQUE / CASH          &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
	 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
	  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
	DATE :      <BR>

<BR>
Bank Payments made to MICRO MEN Sort 40-05-26 Account 7150 8334. (Use the invoice number as reference) <BR>
Cheques made payable to: MICRO MEN LTD and sent to: 12 Fernhurst Gardens, London HA8 7PH

</BODY>
</HTML>
<!--#include file="dsn2.asp"-->
