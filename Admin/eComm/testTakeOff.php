<!DOCTYPE html>
<html>
<body>

<?php

echo "testTakeOff.php goes to takeOff2.php <br>";
?>
<FORM METHOD="get" ACTION="takeOff2.php" id=form1 name=form1>

	<INPUT type="text" NAME="amount" value="10"> <br>
	<INPUT type="hidden" NAME="CURRENCY" value="GBP">
	<INPUT type="hidden" NAME="LANGUAGE" value="en_US">

	<INPUT type="text" NAME="orderid" value="<?php echo $orderid ?>">
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

	<input type="submit" value="Pay Chad" id=submit2 name=submit2>

	</form>





</body>
</html>
