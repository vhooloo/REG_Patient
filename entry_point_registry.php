<?php

if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point'); 

$entry_point_registry = array( 
    'session_setting_variable' => array('file' => 'custom/modules/REG_Patient/session_setting_variable.php', 'auth' => true),
	'getriskajax' => array('file' => 'custom/modules/REG_Patient/getriskajax.php', 'auth' => true),
	'calender' => array('file' => 'custom/modules/Calendar/views/cal.php', 'auth' => true), 	
	'Encounter_edit' => array('file' => 'custom/modules/REG_Patient/Encounter_edit.php', 'auth' => true), 	
	'TreatmentPlan_edit' => array('file' => 'custom/modules/REG_Patient/TreatmentPlan_edit.php', 'auth' => true), 	
);


?>