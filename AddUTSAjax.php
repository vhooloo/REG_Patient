<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

//$xy = '{"test1_key":"test1_val",    "test2_key":"test2_val",    "test3_key":"test3_val"}';
// if update patient audit status and patient audit date;

/* $audit_flag = 0;

if(isset($_REQUEST['audit_flag'])  && !empty($_REQUEST['audit_flag']) &&  $_REQUEST['audit_flag'] == '1') $audit_flag = 1;
//echo "got pid " . $_REQUEST['pid'];

if (isset($_REQUEST['pid'])  ) {
	echo "got pid " . $_REQUEST['pid'];
	if  (!empty($_REQUEST['pid'])) {
		$q = "UPDATE reg_patient_cstm SET  audit_flag_c = ".$audit_flag.",  audit_date_c = NOW() WHERE id_c = '".$_REQUEST['pid']."'";
		//echo $q;
		$db = DBManagerFactory::getInstance();
		$db->query($q, true);
	
	}	
} */


//print_r(json_decode($_POST['myjson']));
//print_r(json_decode(file_get_contents("php://input")));
$xy = json_decode(file_get_contents("php://input"));
print_r($xy);
//print_r(json_decode($xy));
//echo "Good";

?>
