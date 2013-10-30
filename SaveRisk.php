<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('custom/modules/REG_Patient/RiskEvaluation.php');

///////////////////////////////////////////////////////////////////////////////
////	SAVE RISK EVALUATIONS
$focus = new RiskEvaluation();

// if the id is set, then this is update, else generate new id
//var_dump($_POST);

if(isset($_POST['ORT-1A_check'])  ) {
	
	if  (!empty($_POST['ORT-1A_check'])) $focus->ort1a = 1; 
} else $focus->ort1a = null;


if(isset($_POST['ORT-1B_check']) ) {

	if ( !empty($_POST['ORT-1B_check'])) $focus->ort1b = 1; 
} else $focus->ort1b = null;

if(isset($_POST['ORT-1C_check'])) {

	if ( !empty($_POST['ORT-1C_check'])) $focus->ort1c = 1;
} else $focus->ort1c = null;

if(isset($_POST['ORT-2A_check']) ) {

 if ( !empty($_POST['ORT-2A_check'])) 	$focus->ort2a = 1;
} else $focus->ort2a = null;

if(isset($_POST['ORT-2B_check']) && !empty($_POST['ORT-2B_check'])) {
	
	$focus->ort2b = 1;
} else  $focus->ort2b = null;


if(isset($_POST['ORT-2C_check']) && !empty($_POST['ORT-2C_check'])) {
	
	$focus->ort2c = 1;
} else $focus->ort2c = null;

if(isset($_POST['ORT-3_check']) && !empty($_POST['ORT-3_check'])) {
	
	$focus->ort3 = 1;
}else $focus->ort3 = null;

if(isset($_POST['ORT-4_check']) && !empty($_POST['ORT-4_check'])) {
	
	$focus->ort4 = 1;
}else $focus->ort4 = null;

if(isset($_POST['ORT-5A_check']) && !empty($_POST['ORT-5A_check'])) {
	
	$focus->ort5a = 1;
}else $focus->ort5a = null;

if(isset($_POST['ORT-5B_check']) && !empty($_POST['ORT-5B_check'])) {
	
	$focus->ort5b = 1;
}else $focus->ort5b = null;

if(isset($_POST['pid']) && !empty($_POST['pid'])) {
	
	$focus->pid = $_POST['pid'];
}

if(isset($_POST['riskid']) && !empty($_POST['riskid'])) {
	
	$focus->new_with_id = false;
	$focus->id_c = $_POST['riskid'];
}
else
{
	$focus->new_with_id = false;
}

$focus->save();


///////////////////////////////////////////////////////////////////////////////
////	PAGE REDIRECTION; BAck to patient list
///////////////////////////////////////////////////////////////////////////////

	header("Location: index.php?action=index&module=REG_Patient");
?>
