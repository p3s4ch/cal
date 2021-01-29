<!--#include file="common/SQL_CN.asp"-->
<HTML>
<HEAD>

<%

AddID = request("ID")


If (AddID <> "") Then
	  SQL = "select * from vRevenue WHERE ID = " & AddID

	  'Response.Write SQL
	  Set RS = SQLCN.Execute(SQL)




     if (RS.EOF) then
       Response.Write "Receipt Not found = " & AddID
 	   Response.Write "<BR>"
 	   Response.End
     end if

     Amount=FormatNumber(RS("Amount"), 2)
     PostCode = RS("Postcode")
     InvoiceID=RS("InvoiceID")
     FirstName = RS("FirstName")
     Surname = RS("Surname")
     Address = RS("Address")
     Postcode = RS("Postcode")
     Email = RS("Email")
     Phone = RS("Phone")
     Mobile = RS("Mobile")

     DateReceived = RS("DateReceived")
     sqlDate = DateReceived
     %>
        <!--#include file="common/times/getPrintDate.asp"-->
     <%


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


10 Fernhurst Gardens &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
Telephone: 0208 24 24 825 <BR>
HA8 7PH, EDGWARE  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
Mobile : &nbsp; &nbsp;&nbsp; 07791232942 <BR>
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
email: gil@micromen.co.uk <BR>
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
<a href="http://www.orderAhandyman.com">  www.orderAhandyman.com </a><BR>

&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;


<BR>


<%= printDate  %><BR>

<BR>



<b><span
lang=EN-US style='font-size:36.0pt;font-family:"Monotype Corsiva";mso-bidi-font-family:
"Monotype Corsiva";color:#006231'>Received with thanks</span></b>


<P class=c_invoice> Invoice #&nbsp; <%= InvoiceID %> &nbsp;
</P>

From:&nbsp;<%= Title %>&nbsp; <%= FirstName %> &nbsp; <%= Surname %> <BR>
Address:&nbsp; <%= Address %>  ,<%= PostCode %><BR>
Email:&nbsp; &nbsp;  &nbsp; &nbsp;<%= Email %> <BR>
Phone:&nbsp; &nbsp;  &nbsp; &nbsp;<%= Phone %>  ,&nbsp;<%= Mobile %>  <BR>

[Receipt No: <%= AddID %>]

<P class=c_breakdown>

		<BR>
        Amount Received  &nbsp; &nbsp; &nbsp;                            &pound; <%= Amount %> <BR>
</P>
<BR>




<p class=MsoNormal style='margin-top:14.75pt;mso-pagination:none;tab-stops:
25.95pt;mso-layout-grid-align:none;text-autospace:none'><b>

<span lang=EN-US style='font-size:10.0pt;font-family:"Monotype Corsiva";mso-bidi-font-family:
"Monotype Corsiva";color:#006231;mso-ansi-language:EN-US'><span
style='mso-tab-count:2'> </span></span></b><b><span lang=EN-US
style='font-family:"Monotype Corsiva";mso-bidi-font-family:"Monotype Corsiva";
color:#006231;mso-ansi-language:EN-US'>&nbsp; &nbsp; &nbsp; &nbsp; Handyman, Man & Van Small Furniture Removals, Building services
&amp; Property Maintenance<o:p></o:p></span></b></p>

<P class=c_small>
Company Number 577 5942   VAT 882 060626 Reg Office 112 Station Rd, HA8 7BJ
</P>

</BODY>
</HTML>
