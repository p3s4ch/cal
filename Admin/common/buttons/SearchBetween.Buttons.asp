
<h2 ALIGN=CENTER>Search Between AGTab v15</h2>


<%
 
ControlledResource   = request("ControlledResource")
c00tabSchem=ControlledResource
if isDebug then
   Response.Write "<br>c00 (table Schema) =" & c00tabSchem & "<br>"
end if

bttns = request("bttns")
filter_on = request("filter_on")

Response.Write "<br>filter_on =" & filter_on & "<br>"
SQL =  Replace(filter_on, "SQL=", "")
SQL =  Replace(SQL,       "repQ", "'")

Response.Write "<br>SQL =" & SQL & "<br>"

mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")
procName    = PlaceHolder_DONT_DEL
 
'thedatefield can be InvoiceDate 
thedatefield = "d01"
if filter_on="deposits" then thedatefield= "date" end if
%>

<!--#include file="func_SQL_WhereBetweenMonth.asp"-->
<!--#include file="searchBetween.extract.asp"-->

<%

Response.Write "<br> step 2 :: SQL =" & SQL & "<br>"

SQL_SELECT  =   "select ID id2edit, c01, c02,c03,c04,d01 Date,f01,i01 FROM dbo.AGTab " 
SQL_Where = " WHERE c00= '"& c00tabSchem &"'" & SQL_SearchFor  & AND_date_range 


'sqlWhereBetween=d01 between '1 January 1900' AND '31 December 2099'
AND_date_range=""

If NOT (sqlWhereBetween = "" ) Then
   AND_date_range = " AND " & sqlWhereBetween 
End If


Response.Write "<br>AND_date_range=" & AND_date_range & "<br>"


Find   =  request("Find")
Response.Write "<br>Find=" & Find & "<br>"

SQL_Where=""

If NOT (Find = "") Then
        SQL_SearchFor = "  (" &_
   		" c01 LIKE '%" & Find & "%' or " &_
   		" c02 LIKE '%" & Find & "%' or " &_
   		" c03 LIKE '%" & Find & "%' or " &_
   		" c04 LIKE '%" & Find & "%' or " &_
		" c05 LIKE '%" & Find & "%' or " &_
		" c06 LIKE '%" & Find & "%' or " &_
        " c07 LIKE '%" & Find & "%' or " &_
        " c08 LIKE '%" & Find & "%' or " &_
   		" c09 LIKE '%" & Find & "%' or " &_
   		" c10 LIKE '%" & Find & "%' or " &_
   		" c11 LIKE '%" & Find & "%' or " &_
		" c12 LIKE '%" & Find & "%' or " &_
		" c13 LIKE '%" & Find & "%' or " &_
        " c14 LIKE '%" & Find & "%' or " &_
        " c15 LIKE '%" & Find & "%' or " &_
	    " c16 LIKE '%" & Find & "%' or " &_
		" c17 LIKE '%" & Find & "%' or  " &_
		" c18 LIKE '%" & Find & "%' or  " &_
		" txt LIKE '%" & Find & "%'   " &_
           ")"
        SQL_Where = " AND " & SQL_SearchFor  & AND_date_range 
End If
   

Response.Write "<br>  *******************  <br>"   
Response.Write "<br> step 6 SQL_Where =" & SQL_Where & "<br>"   
 
finalSQL=SQL & SQL_Where
Response.Write "<br> step 6 finalSQL =" & finalSQL & "<br>"   

SQL = finalSQL

Response.Write "<br> step 8 SQL =" & SQL & "<br>"  


if filter_on = "" OR filter_on="INITIAL" OR  filter_on = "AGTab"  then
	myheader="AGTab"  
    addEditPgLink="GSEdit5.asp"
	printPgLink="GSEdit5.asp"
	editPgLink="GSEdit5.asp"

    RawCols18= "'c1' c1,'using Raw' c2,'c3' c3,'version5' c4,'c5' c5,'c6' c6,'c7' c7,'c8' c8, 'c9' c9 "  &_ 
			   ",'c10 is ok' c10,  'c11' c11_hidden, 'backDoor' c12_hidden,'c13' c13_hidden,'c14' c14_hidden,'c15' c15_hidden,'c16' c16_hidden,'c17' c17_hidden,'c18' c18_hidden "

	RawColsDilf= ", getDate() as d1_GS6datetime_Ext , getDate() d2_GS6datetime_Ext"  &_
				 ",'0' i1_hidden, '0' i2_hidden,'0' i3_hidden,'0' i4_hidden " &_
				 ",'1.0' f1_hidden,'2.0' f2_hidden,'3.0' f3_hidden,'4.0' f4_hidden "
	SQL_SELECT4ADD= "select 'exec dbo.aaG18 ' cmd0, -1 C0ze, '"& uid & "' c01,'"& c00tabSchem &"' c00,"  &_
					 RawCols18 	 
	SQL_SELECT4EDIT="select 'exec dbo.aaG18 ' cmd0, ID C0ze, '"& uid & "' c0b,'"& c00tabSchem &"' c00,"  &_
	                 RawCols18 
	editSQL=        SQL_SELECT4EDIT & " FROM dbo.AGTab where ID="
	button_sql=     SQL_SELECT4ADD   
End If
    


Response.Write "<br> step 71 SQL =" & SQL & "<br>"

IF filter_on="TelephoneBook" THEN

   ControlledResource   = request("ControlledResource")
   myheader="Controlled Resource = Dropbox Folder : " & ControlledResource
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="TelephoneBook"
   procName="add_TelephoneBook"
   action= "GSAdd5.asp"
   actionPage="GSAdd6_wo_UID.update.asp"

   SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, '"& ControlledResource & "' Planet_hidden,  '' Title , '' Contact ,'' Topic , ''Address , '' Postcode,  '' Email ,  '' Phone  , '' Mobile , '' FlexCommnt_Ext , 0 isDeleted "
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"
   editSQL= "select ID, '"& Admin_ID & "' UpdatedBy_hidden , Planet,  Title ,  FirstName , Surname Topic , Address , Postcode,   Email , Phone  ,  Mobile , Comment FlexCommnt_Ext ,  isDeleted    FROM dbo.TelephoneBook where ID="

   SQL = "select ID id2edit,  ID Num,   Planet, Surname Topic , FirstName Name, Email Logins ,substring (comment,0,80) from dbo.TelephoneBook " &_
         " where " &_
         "( surname      like '%" & SearchFor  & "%' " &_
         " OR Title     like '%" & SearchFor  & "%' " &_
         " OR FirstName like '%" & SearchFor  & "%' " &_
         " OR Surname   like '%" & SearchFor  & "%' " &_
         " OR Address   like '%" & SearchFor  & "%' " &_
         " OR Postcode  like '%" & SearchFor  & "%' " &_
         " OR Email     like '%" & SearchFor  & "%' " &_
         " OR Phone     like '%" & SearchFor  & "%' " &_
         " OR Mobile    like '%" & SearchFor  & "%' " &_
         " OR Comment   like '%" & SearchFor  & "%' " &_
         " ) and ( Planet    like '%" & ControlledResource & "%' OR 'Pluto' like '%" & ControlledResource  & "%')" &_
         " order by Surname"

End IF

IF filter_on="BLUE_LINKS" THEN
   myheader="BLUE_LINKS"
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="dbo.RBAC_Links"
   actionPage="GSAdd5.update.asp"

   SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden,  '' UserRole , ''  Link , '' MyURL_Ext"
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"
   editSQL= "select ID, '"& Admin_ID & "' UpdatedBy_hidden , UserRole , Link , MyURL MyURL_Ext  FROM dbo.RBAC_Links where ID="
   SQL = "select ID id2edit, ID Num, Link , MyURL from dbo.RBAC_Links where not MyUrl is Null "

   actionURL="GSAdd5.asp"
   buttonLabel="ADD Blue Link"

End IF


IF filter_on="search_customers" THEN
   myheader="Customers Found"
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="Customers"
   actionPage="GSAdd5.update.asp"
   SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, 'NEW' [Pickle Name], '' [Category Of Service - Cats_Ext], '' Title , '' Contact ,'' [Surname or Organization] , ''Address , '' Postcode,  '' Email ,  '' Phone  , '' Mobile , 1 ReqInv,  '' [Heard About] ,'' OfficeUse"
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"
   editSQL= "select ID, '"& Admin_ID & "' UpdatedBy_hidden , PUN [Pickle Unique Name], CATS [Category Of Service - Cats_Ext], Title, FirstName, Surname,  Address ,Postcode, Email, Phone, Mobile, ReqInv, HeardAboutUs, Comment OfficeUseOnly   FROM Customers where ID="
   SQL = "select ID id2edit, ID Num, PUN, CATS,  FirstName [Contact], Surname [Surname or Org], Postcode, Email, Phone, Mobile from Customers " & SQL_WHERE &_
             " order by Surname"

   actionURL="http://orderonline.me.uk/calendar/Admin/customers/"
   buttonLabel="Customers v2 PHP"

End IF

IF filter_on="sms" THEN
   myheader="SMS Text Message"
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="Customers"
   actionPage="GSAdd5.update.asp"

   SQL = "select 'SMS Text Message"

   actionURL="pickleMobVerification.asp?__action=EMailToSMS&tp=5066139"
   buttonLabel="SMS 24X"
   txtBody="221A122"

End IF

if filter_on="CUSTOMERS_TODEL"  then
   myheader="<h4> Customers </h4> "
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit5.asp"
   tableName="Customers"
   actionPage="GSAdd5.update.asp"

   SQL = "select top 10 ID id2edit , ID Customer, PUN, CATS, Surname from Customers order by ID desc"
   SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, '' [Pickle Name], '' [Service Category, CATS], '' Title , '' Contact ,'' [Surname or Organization] , ''Address , '' Postcode,  '' Email ,  '' Phone  , '' Mobile , 1 ReqInv,  '' [Heard About] ,'' OfficeUse"
   SQL_SELECT4EDIT=" select ID, '"& Admin_ID & "' UpdatedBy_hidden ,PUN [Pickle Name], Cats [Service CAT],  Title, FirstName, Surname [Surname or Organization], Address,  Postcode, Email ,  Phone  , Mobile,  ReqInv,  HeardAboutUs ,'NA' OfficeUse  "
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"
   editSQL=SQL_SELECT4EDIT & " FROM dbo.Customers where ID="

End If


if filter_on="INITIAL"  then
   myheader="<h4> AccessControl determines which Roles can use which tools </h4> "
   SQL = "select * from AccessControl"
End If





Response.Write "<br> step 72 SQL =" & SQL & "<br>"

Response.Write "<br> ************ Bypass filter_on  *********************   <br>"
     
    
myheader="AGTab SQL="  
	
Response.Write "<br> step 9 SQL =" & SQL & "<br>"  	
    
	   
addEditPgLink="GSAdd5.asp"
printPgLink="GSEdit5.asp"
editPgLink="GSAdd5.asp"

RawCols18=  " ,'c02' c02 " &_ 
            " ,'c03' c03 " &_ 
            " ,'c04' c04 " &_ 
            " ,'c05' c05 " &_ 
            " ,'c06' c06 " &_ 
            " ,'c07' c07 " &_ 
            " ,'c08' c08 " &_ 
            " ,'c09' c09 " &_ 
            " ,'c10' c10 " &_ 
            " ,'c11' c11 " &_ 
            " ,'c12' c12 " &_ 
            " ,'c13' c13 " &_ 
            " ,'c14' c14 " &_ 
            " ,'c15' c15 " &_ 
            " ,'c16' c16 " &_ 
            " ,'c17' c17 " &_ 
            " ,'c18' c18 " 
            
   
           

RawColsDilf= ", getDate() as d1_GS6datetime_Ext , getDate() d2_GS6datetime_Ext"  &_
             ",'0' i1_hidden, '0' i2_hidden,'0' i3_hidden,'0' i4_hidden " &_
             ",'1.0' f1_hidden,'2.0' f2_hidden,'3.0' f3_hidden,'4.0' f4_hidden "
SQL_SELECT4ADD= "select 'exec dbo.aaG18 ' cmd0, -1 C0ze, '"& uid & "' c01,'"& ControlledResource &"' c00,"  &_
                 RawCols18 	 
 
button_sql=     SQL_SELECT4ADD

    
	RawColsDilf= ", getDate() as d1_GS6datetime_Ext , getDate() d2_GS6datetime_Ext"  &_
				 ",'0' i1_hidden, '0' i2_hidden,'0' i3_hidden,'0' i4_hidden " &_
				 ",'1.0' f1_hidden,'2.0' f2_hidden,'3.0' f3_hidden,'4.0' f4_hidden "
	SQL_SELECT4ADD= "select 'exec dbo.aaG18 ' cmd0, -1 C0ze, '"& uid & "' c01,'"& c00tabSchem &"' c00,"  &_
					 RawCols18 	 
					 
    SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, '' [WhatAWaste] " 
	  
	SQL_SELECT4EDIT="select 'exec dbo.aaG18 ' cmd0, ID C0ze, '"& uid & "' c0b,'"& c00tabSchem &"' c00,"  &_
	                 RawCols18 
	editSQL=        SQL_SELECT4EDIT & " FROM dbo.AGTab where ID="
	button_sql=     SQL_SELECT4ADD  


if filter_on="ANY_EXAMPLE01"  then
   myheader="<h4> ANY_EXAMPLE01 </h4> "
   tableName="tableName_NOT_SET_USING_dbo.AGTab"
   actionPage="GSAdd5.update.asp"

   SQL = "select top 10 ID id2edit , ID Customer, PUN, CATS, Surname from Customers order by ID desc"
   SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, '' [Pickle Name], '' [Service Category, CATS], '' Title , '' Contact ,'' [Surname or Organization] , ''Address , '' Postcode,  '' Email ,  '' Phone  , '' Mobile , 1 ReqInv,  '' [Heard About] ,'' OfficeUse"
   SQL_SELECT4EDIT=" select ID, '"& Admin_ID & "' UpdatedBy_hidden ,PUN [Pickle Name], Cats [Service CAT],  Title, FirstName, Surname [Surname or Organization], Address,  Postcode, Email ,  Phone  , Mobile,  ReqInv,  HeardAboutUs ,'NA' OfficeUse  "
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp"
   editSQL=SQL_SELECT4EDIT & " FROM dbo.Customers where ID="
   
    SQL_SELECT4ADD= " select -1 ID, ' "& Admin_ID &"' enteredBy_hidden, '' [WhatAWaste] " 
    button_sql=     SQL_SELECT4ADD  
End If


editSQL=        SQL_SELECT4ADD & " FROM dbo.AGTab where ID=104885"

   Response.Write "<br> *********************************   <br>"
   Response.Write "<br>SQL       =   " & SQL        &      "<br>"
   Response.Write "<br>button_sql=   " & button_sql &      "<br>"
   Response.Write "<br>editSQL=      " & editSQL    &      "<br>"
   Response.Write "<br> *********************************   <br>"

%>




<Table>
<TR>
<TD>

<form action="GSAdd5.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="<%=c00tabSchem%>" />
<input type="hidden" name="ControlledResource"    value="<%=c00tabSchem%>" />
<input type="hidden" name="procName"   value=<%=procName%> />
<input type="hidden" name="paramX"   value="123"/>
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden" name="bttns"  value="SearchBetween.Buttons" />
<input type="hidden" name="mysql"  value="<%=button_sql%>"          />
<input type="hidden" name="actionPage" value="GSAdd6.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="<%=filter_on%>" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TR>
</Table>


<form  Method="POST">
   <br>
     <input type="hidden"   name="tableName"   value="<%=c00tabSchem%>" />
	 <input type="hidden" name="ControlledResource"   value="<%=c00tabSchem%>" />
     <input type="hidden"   name="bttns"  value="SearchBetween.Buttons" />
     <input type="hidden" name="filter_on" value"<%=filter_on%>" /> <%=spacing%>
   


<DIV ALIGN=center>
Between
<input type=text name=FromDay value="<%=FromDay%>" class="inputbox" size="1" maxlength="20">
<select name=FromMonth class="inputbox">
<option value=1 <%if FromMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if FromMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if FromMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if FromMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if FromMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if FromMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if FromMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if FromMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if FromMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if FromMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if FromMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if FromMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>
<input type=text name=FromYr value="<%=FromYr%>" class="inputbox" size="4" maxlength="55">

&nbsp;&nbsp;and &nbsp;  &nbsp;

<input type=text name=ToDay value="<%=ToDay%>" class="inputbox" size="1" maxlength="20">
<select name=ToMonth class="inputbox">
<option value=1 <%if ToMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if ToMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if ToMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if ToMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if ToMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if ToMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if ToMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if ToMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if ToMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if ToMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if ToMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if ToMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>
<input type=text name=ToYr value="<%=ToYr%>" class="inputbox" size="4" maxlength="55">

<br><br>
</DIV>

<table border="0" cellpadding="5" cellspacing="0" align="center"><tr>
<td bgcolor="#DAE3F0">
<table border="0" cellpadding="2" cellspacing="0" align="center">

<tr>

<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"><b>Find</b></font> </td>
<td bgcolor="#DAE3F0"><input type="text" size="80" name="Find" class="inputBox"  >   </td>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"></font>      </td>
<td bgcolor="#DAE3F0"></td>

<td bgcolor="#DAE3F0">

<input type="hidden" name="uid" value="<%=uid%>" >
<input type="submit" value="Go" class="inputSubmit"></td>
</tr></table>


</td></tr>

</table>


</form>

