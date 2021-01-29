
<%
uid =request("uid")
bttns = request("bttns")
filter_on = request("filter_on")

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Tutorial 2"
   SQL = "select ''"
 End If

if filter_on = "Magic_Button"  then
   myheader="Magic Button"
   SQL = "select ''"
 End If



if filter_on = "x" then
   myheader="filter_on=x"
   SQL = "select Admin_ID, Admin_Pass  from users where id=" & uid
 End If

 if filter_on = "steve" then
   myheader="filter_on=steve"
   SQL = "select Admin_ID from users where id=" & uid
 End If
%>

%>



<p>
<h2>Tutorial Two: Buttons</h2><br>

There are two types of buttons depending on the action.It is either action ADD,  FILTER or NAVIGATE+FILTER<br>

This is all controlled by two parameters: 1. action and 2.filter_on <br>
filter_on=x is a hidden parameter in the form that is used in the if clause<br>
<br>
      see common\buttons\tut2.Buttons.asp<br>
<br>
Button One is done , finish Button Two with any SQL query <br>


<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="tut2.Buttons" />
<input type="hidden" name="filter_on" value="x" /> <%=spacing%>
<input type="submit" name="Submit" value="Button One" class="inputSubmit">
</form>
</TD>

<TD> &nbsp; </TD>



<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="tut2.Buttons" />
<input type="hidden" name="filter_on" value="" /> <%=spacing%>
<input type="submit" name="Submit" value="Button Two" class="inputSubmit">
</form>
</TD>

<TD> &nbsp; </TD>



<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="tut2.Buttons" />
<input type="hidden" name="filter_on" value="steve" /> <%=spacing%>
<input type="submit" name="Submit" value="Button Four - Steve" class="inputSubmit">
</form>
</TD>


<TD> &nbsp; </TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="tut3.Buttons" />
<input type="hidden" name="filter_on" value="Magic_Button" /> <%=spacing%>
<input type="submit" name="Submit" value="Magic Button" class="inputSubmit">
</form>
</TD>



</TR>



</Table>



