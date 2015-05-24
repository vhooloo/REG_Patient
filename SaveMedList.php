<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('custom/modules/REG_Patient/PatientMed.php');

///////////////////////////////////////////////////////////////////////////////
////	SAVE meds
$focus = new PatientMedList($_POST['patid']);

// if the id is set, then this is update, else generate new id
var_dump($_POST);

$numrows = $_POST['numrows'];
$loopctr = 0;

while ($loopctr++ <  $numrows) {
 echo "<p>". $_POST['medname_'.$loopctr] ."</p>";
 if(isset($_POST['medid_'.$loopctr]) &&  !empty($_POST['medid_'.$loopctr]) )
	$focus->BuildList('U', $_POST['medid_'.$loopctr], $_POST['medname_'.$loopctr], $_POST['meddesc_'.$loopctr]);
}



//echo $_POST[$medname.'_'.$loopctr]);
$focus->SaveMeds();

echo "done:";

?>
