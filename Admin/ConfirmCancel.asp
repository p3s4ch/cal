<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="common/GilonHiddenURLSession.asp"-->
<!--#include file="common/update_customers.asp"-->
<!--#include file="common/Apopup.asp"-->
<%

orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
AddID = request("DeleteID")

SQL ="select convert(varchar, starttime, 100) Starts, o.Mobile Op_Mob, SiteAddress, Category from cEvents e , operators o where o.Name=e.operator and e.ID = "+AddID
Set RS = SQLCN.Execute(SQL)

Category=RS("Category")
Starts=RS("Starts")
Op_Mob=RS("Op_Mob")
SiteAddress=RS("SiteAddress")

if IsNull(Op_Mob) OR Len(Trim(Op_Mob))=0 then Op_Mob="07881966867" End If

Op_msg="CANCEL booking "&AddID  &"-"& Category &" for "&  Starts &" "& SiteAddress

%>

<br>


<p align=centre>

   <form id="form1" action="main.asp?__action=EMailToSMS&tp=<%= rnd(1)*100*timer %>" method="POST" >
       <input id="__action" type="hidden" value="" />

    <div align=center>
       <h3><font color=red>
       Please Confirm that you would like to CANCEL the booking below. !</font></h3>

       </br>
       Booking Number:  <%=AddID%> for  <%=Category%> for <%=Starts%> </br>



       <input type=radio name=pickleStatus value=pickleOn checked /> Send SMS Text to Confirm (Recommended) <br />


       <input type=radio name=pickleStatus value=pickleOff /> Do not send SMS
       <input type=hidden  value="admin@orderAhandyman.com" name="txtFrom" />
       <input type=hidden value="<%=msg%>" name=txtBody />
       <input type=hidden value="<%=mob%>" name=txtTo />
       <input type=hidden value="<%=Op_Mob%>" name=txtToOp />
       <input type=hidden value="<%=Op_msg%>" name=txtBodyOp />

       <input type=hidden value="<%=uid%>" name=uid />

       <input type=hidden value="<%=AddID%>" name=DeleteID />

        <br> <br>
         <input type=submit value="Click here to submit"  size=250 />
   </div>
   </form>
</p>
