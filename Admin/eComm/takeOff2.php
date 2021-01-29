<!DOCTYPE html>
<html>
<head>
	<script language="JavaScript" type="text/javascript">


function checkCancel(){
    return confirm('Are you sure you want to cancel the payment process?This reservation CANNOT be cancelled here.If You wish to AMEND or CANCEL a reservation,please use the original booking site that was used to make the booking.You can do web check later when you are ready.REMEMBER the sooner you use the web check-in,the more you save!!!');
}
function checkEdit(){
    return confirm('Are you sure you want to Edit the Check in details?');
}
</script>
<style>
input[type="submit"]:hover{

    border: 12px solid #999;color:#383;
}
td{

    border: 12px solid #999;color:#383;
}
</style>
</head>
<body>
<img width=800 height=150 src="gifs/banner2.png" >
<br>
Order Summary:<br>

<?php


$orderid = $_GET['orderid'];
$amount  = $_GET['amount'];

echo "<div style=width:800px; margin:0 auto;> Your Order is : ". $orderid."<br>";
echo "Amount : &pound;  ". $amount ."<br> </div>";


$str =        "AMOUNT=". $amount . "Mysecretsig1875!?";
$str = $str . "CURRENCY=GBPMysecretsig1875!?LANGUAGE=en_USMysecretsig1875!?";
$str = $str . "ORDERID=". $orderid . "Mysecretsig1875!?";
$str = $str . "PSPID=epdq1091457Mysecretsig1875!?";

$shucks = sha1($str);

?>

<br>
<table>
<FORM METHOD="post" ACTION="https://payments.epdq.co.uk/ncol/PROD/orderstandard.asp" id=form1 name=form1>

	<INPUT type="hidden" NAME="AMOUNT"  value="<?php echo $amount ?>">
	<INPUT type="hidden" NAME="CURRENCY" value="GBP">
	<INPUT type="hidden" NAME="LANGUAGE" value="en_US">
	<INPUT type="hidden" NAME="ORDERID" value="<?php echo $orderid ?>">
	<INPUT type="hidden" NAME="PSPID" value="epdq1091457">
	<!-- lay out information -->

	<INPUT type="hidden" NAME="TITLE" value="">

	<INPUT type="hidden" NAME="BGCOLOR" value="">
	<INPUT type="hidden" NAME="TXTCOLOR" value="">
	<INPUT type="hidden" NAME="TBLBGCOLOR" value="">
	<INPUT type="hidden" NAME="TBLTXTCOLOR" value="">
	<INPUT type="hidden" NAME="BUTTONBGCOLOR" value="">
	<INPUT type="hidden" NAME="BUTTONTXTCOLOR" value="">
	<INPUT type="hidden" NAME="FONTTYPE" value="">

	<INPUT type="hidden" NAME="LOGO" value="">
	<!-- or dynamic template page -->
	<INPUT type="hidden" NAME="TP" value="">
	<!-- post-payment redirection -->
	<INPUT type="hidden" NAME="ACCEPTURL" VALUE="">
	<INPUT type="hidden" NAME="DECLINEURL" VALUE="">
	<INPUT type="hidden" NAME="EXCEPTIONURL" VALUE="">
	<INPUT type="hidden" NAME="CANCELURL" VALUE="">
	<INPUT type="hidden" NAME="BACKURL" VALUE="">
	<!-- miscellanous -->
	<INPUT type="hidden" NAME="HOMEURL" VALUE="">
	<INPUT type="hidden" NAME="CATALOGURL" VALUE="">
	<INPUT type="hidden" NAME="CN" value="">
	<INPUT type="hidden" name="EMAIL" value="">
	<INPUT type="hidden" NAME="PM" VALUE="">
	<INPUT type="hidden" NAME="BRAND" VALUE="">
	<INPUT type="hidden" NAME="OWNERZIP" VALUE="">
	<INPUT type="hidden" NAME="OWNERADDRESS" VALUE="">
	<INPUT type="hidden" NAME="OWNERADDRESS2" VALUE="">
	<INPUT type="hidden" NAME="SHASIGN" value="<?php echo sha1($str) ?>">
	<INPUT type="hidden" NAME="ALIAS" VALUE="">
	<INPUT type="hidden" NAME="ALIASUSAGE" VALUE="">
	<INPUT type="hidden" NAME="ALIASOPERATION" VALUE="">
	<INPUT type="hidden" NAME="COM" VALUE="">
	<INPUT type="hidden" NAME="COMPLUS" VALUE="">
	<INPUT type="hidden" NAME="PARAMPLUS" VALUE="">
	<INPUT type="hidden" NAME="USERID" VALUE="">
	<INPUT type="hidden" NAME="CREDITCODE" VALUE="">


	<tr><td><input type="submit" value="Pay Now" id="submit2" name="submit2"></td>
	</tr>


	</form>

</table>



</body>
</html>