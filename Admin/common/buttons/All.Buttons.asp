

<%

bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

if filter_on = "" OR filter_on="INITIAL" then
  myheader=" "
   SQL = "select 'please select from one of the above reports' "
End If

if  InStr(filter_on,"SQL=") then
   myheader="FULLY COOKED SQL "
   SQL =  Replace(filter_on, "SQL=", "")
   SQL =  Replace(SQL,       "repQ", "'")
   
   SQL_SELECT4ADD= "select -1  ID, 'TableSchema' TableN_hidden, 'c1','c2','c3','c4','c5','c6','c7','c8','c9','c10','c11','c12', " &_
     "getDate() as Departs_GS6datetime_Ext , getDate() Arrives_GS6datetime_Ext , '0' i1_hidden ,'0.0' f1_hidden  "
   
'where t1=tableName  ... 
  
   addEditPgLink="GSEdit5.asp"
   printPgLink="GSEdit5.asp"
   editPgLink="GSEdit6.asp"
   tableName="dbo.flights"
   actionPage="GSAdd5.update.asp"
   procName ="procGSc6d2"
   button_sql =SQL_SELECT4ADD
   act= "GSAdd5.asp" 


   SQL_Where =""
   SQL_Where = SQL_WhereBetween

   If NOT (SearchFor = "") Then
        SQL_SearchFor = " AND  (" &_
   		" c1 LIKE '%" & SearchFor & "%' or " &_
   		" c2 LIKE '%" & SearchFor & "%' or " &_
   		" c3 LIKE '%" & SearchFor & "%' or " &_
   		" c4 LIKE '%" & SearchFor & "%'  " &_
   		")"
        SQL_Where = SQL_Where  & SQL_SearchFor
    End If

    button_sql =SQL_SELECT4ADD
    act= "GSAdd5.asp"

   editSQL=        "select ID,t1,c1,c2,c3,'c4_0' c4_hidden, 'c5_0' c5_hidden, 'c6_0' c6_hidden " &_
                   ",d1 Departs_GS6datetime_Ext , d2 Arrives_GS6datetime_Ext ,'0' i1_hidden ,'0.0' f1_hidden FROM dbo.AGTable where ID="

   
   
  SQL =  Replace(filter_on, "SQL=", "")
  SQL =  Replace(SQL,       "repQ", "'")
  SQL = SQL & SQL_Where
   
   
   
   
End If


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
   editSQL= "select ID, '"& Admin_ID & "' UpdatedBy_hidden              , Planet,  Title ,  FirstName , Surname Topic , Address , Postcode,   Email , Phone  ,  Mobile , Comment FlexCommnt_Ext ,  isDeleted    FROM dbo.TelephoneBook where ID="

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

IF filter_on="search_customers" THEN
    SQL_WHERE = " where ( Title  like '%" & SearchFor  & "%' " &_
                  " OR FirstName like '%" & SearchFor  & "%' " &_
                  " OR Surname   like '%" & SearchFor  & "%' " &_
                  " OR Address   like '%" & SearchFor  & "%' " &_
                  " OR Postcode  like '%" & SearchFor  & "%' " &_
                  " OR Email     like '%" & SearchFor  & "%' " &_
                  " OR Phone     like '%" & SearchFor  & "%' " &_
                  " OR Mobile    like '%" & SearchFor  & "%' " &_
                  " OR Comment   like '%" & SearchFor  & "%' " &_
                  " OR PUN like '%" & SearchFor        & "%' "  &_
             ")  "
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

if filter_on="CUSTOMERS"  then
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



spacing = "&nbsp; &nbsp; &nbsp; "
%>

<table>
<tr>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="<%=bttns%>" />
<input type="hidden" name="filter_on"  value="<%=filter_on%>"  />

<input type="hidden" name="ControlledResource"  value="<%=ControlledResource%>"  />

...  Sounds like
<input type="text"   name="SearchFor" value="" />
<input type="submit" name="Submit" value="Find All" class="inputSubmit">
</form>
</TD>
</tr>


<tr>
<td>
<form action="GSAdd5.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"  value="<%=tableName%>" />
<input type="hidden" name="procName"   value="<%=procName%>" />
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden" name="hasDates"   value="NO" />
<input type="hidden" name="bttns"      value="<%=bttns%>" />
<input type="hidden" name="mysql"      value="<%=button_sql %>"          />
<input type="hidden" name="actionPage" value="<%=actionPage%>" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="ADD NEW GET" class="inputSubmit">
</form>

</td>

<td>
<form action="<%=actionURL%>" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="<%=tableName%>" />
<input type="hidden" name="procName"   value="<%=procName%>" />
<input type="hidden" name="txtBody"  value="<%=txtBody%>"  />
<input type="hidden" name="myheader"   value="Add New" />
<input type="hidden"      name="hasDates" value="NO" />
<input type="hidden"      name="bttns" value="<%=bttns%>" />
<input type="hidden"      name="mysql"  value="<%=button_sql%>"          />
<input type="hidden" name="actionPage" value="<%=nextActionURL%>"  /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="<%=buttonLabel%>" class="inputSubmit">
</form>
</td>


<tr>


</table>

