<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

// if update patient audit status and patient audit date;



 $audit_flag = 0;

if(isset($_REQUEST['audit_flag'])  && !empty($_REQUEST['audit_flag']) &&  $_REQUEST['audit_flag'] == '1') $audit_flag = 1;
echo "got pid " . $_REQUEST['pid'];

if ( isset($_REQUEST['pid']) )  {
	echo " New got pid " . $_REQUEST['pid'];
	if  (!empty($_REQUEST['pid']) && $_REQUEST['update_action'] == "audit") {
		$q = "UPDATE reg_patient_cstm SET  audit_flag_c = ".$audit_flag.",  audit_date_c = NOW() WHERE id_c = '".$_REQUEST['pid']."'";
	}
	if  ( $_REQUEST['update_action'] == "pmp") {
		$q = "UPDATE reg_patient_cstm SET  pmp_date_c = STR_TO_DATE('".$_REQUEST['pmp_date']."', '%m/%d/%Y') WHERE id_c = '".$_REQUEST['pid']."'";
	}
	try {
		echo $q;
		$db = DBManagerFactory::getInstance();
		@$db->query($q, true);
	
	}	
	catch (Exception $e) {
		echo 'Caught exception: ',  $e->getMessage(), "\n";
	}
}

?>
