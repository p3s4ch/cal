
<%

uid = request("uid")
 %>

<form action="admin/main.asp" name="frmUser" Method="POST">
 &nbsp; 
 <input type="hidden" name="uid" value="<%=uid%>" >
 <input type="submit" name="Submit" value="Home" class="inputSubmit">
</form>
