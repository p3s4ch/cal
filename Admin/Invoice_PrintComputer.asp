<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="common/SQL_CN.asp"-->


<HTML>
<HEAD>

<%

AddID = request("ID")
Operator = Trim(request("Operator"))

If (AddID <> "") Then
	  SQL = "select * from invoices left join customers ON invoices.CustomerID = Customers.ID WHERE invoices.ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

     if (RS.EOF) then
       Response.Write "Invoice Not found = " & AddID
 	   Response.Write "<BR>"
 	   Response.End
     end if

     totIncVat= RS("TotalInclVAT")
     if (Not IsNumeric(totIncVat) ) then totIncVat = 0 end if
	 tot = totIncVat/1.175
	 vat = totIncVat - tot

	 totIncVat = FormatNumber(totIncVat, 2)
	 tot = FormatNumber(tot, 2)
	 vat = FormatNumber(vat, 2)


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
}

P.c_small {
margin-left: '10%';
font-size:12;
color : grey;

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





<p class=MsoNormal><span style='font-size:16.0pt;font-family:"Century Gothic";
color:blue'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
(Order <span class=GramE>a</span> handyman.com)<o:p></o:p></span></p>


15 OAKWOOD DRIVE  &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Tel: 020 24 24 825 <BR>
HA8 9LG, EDGWARE  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
Email:  admin@micromen.co.uk <BR>
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  www.orderAhandyman.com <BR>

<BR>
<BR>


<P class=c_invoice>
Invoice No: <%= AddID %>
</P>

Customer: <%= RS("FirstName") %> &nbsp; <%= RS("Surname") %> <BR>
Address:
<%= RS("Address")%>  ,<%= RS("PostCode") %>


<BR>


<BR>
<BR>
Description of Services:
<P class=c_describe>
<%= RS("Description") %>

</P>



 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
         Total             &nbsp; &nbsp; &nbsp;    <%= tot %>     <BR>

&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          VAT @ 17.5%    &nbsp; &nbsp; &nbsp; <%=   vat  %>
                                              <BR>

&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
         Total including VAT &nbsp; &nbsp; &nbsp; <%= totIncVat   %><BR>

<BR><BR>




<p class=MsoNormal style='margin-top:14.75pt;mso-pagination:none;tab-stops:
25.95pt;mso-layout-grid-align:none;text-autospace:none'><b>

<span lang=EN-US style='font-size:10.0pt;font-family:"Monotype Corsiva";mso-bidi-font-family:
"Monotype Corsiva";color:#006231;mso-ansi-language:EN-US'><span
style='mso-tab-count:2'> </span></span></b><b><span lang=EN-US
style='font-family:"Monotype Corsiva";mso-bidi-font-family:"Monotype Corsiva";
color:#006231;mso-ansi-language:EN-US'>&nbsp; &nbsp; &nbsp; &nbsp; Computer Consultancy, Building services
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
	PAYMENT TYPE :  CHEQUE / CASH               DATE :      <BR>

<BR>
<BR>

Cheques should be made payable to:  MICRO MEN LTD. <BR>
  Sent to: 15 Oakwood Drive London HA8 9LG

</BODY>
</HTML>
<!--#include file="dsn2.asp"-->
