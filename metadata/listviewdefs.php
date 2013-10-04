<?php
//var_dump($this);
$module_name = 'REG_Patient';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '20%',
    'label' => 'LBL_NAME',
    'link' => true,
    'default' => true,
    'related_fields' => 
    array (
      0 => 'last_name',
      1 => 'first_name',
    ),
  ),
  
  'GENDER' => 
  array (
    'type' => 'radioenum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_GENDER',
    'width' => '20%',
  ),
  
  'NEXT_RF_DATE' => 
  array (
    'type' => 'radioenum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'Next Refill Date',
    'width' => '20%',
	'sortable' => false,
    //'orderBy' => 'NEXT_RF_DATE', 
	//'sort_order' => 'asc',	
  ),
  
  'RISK_LEVEL' => 
  array (
    'type' => 'radioenum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'Risk Level',
    'width' => '20%',
	'sortable' => false,
  ),  
  
  'PHONE_HOME' => 
  array (
    'width' => '20%',
    'label' => 'LBL_HOME_PHONE',
    'default' => true,
  ),
  'PHONE_MOBILE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_MOBILE_PHONE',
    'default' => false,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'link' => true,
    'type' => 'relate',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'id' => 'ASSIGNED_USER_ID',
    'width' => '10%',
    'default' => false,
  ),
  'SSN' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_SSN',
    'width' => '10%',
    'default' => false,
  ),
  'EMERGENCYNUMBER' => 
  array (
    'type' => 'phone',
    'label' => 'LBL_EMERGENCYNUMBER',
    'width' => '10%',
    'default' => false,
  ),
  'DO_NOT_CALL' => 
  array (
    'width' => '10%',
    'label' => 'LBL_DO_NOT_CALL',
    'default' => false,
  ),
  'PHONE_WORK' => 
  array (
    'width' => '15%',
    'label' => 'LBL_OFFICE_PHONE',
    'default' => false,
  ),
  'TITLE' => 
  array (
    'width' => '15%',
    'label' => 'LBL_TITLE',
    'default' => false,
  ),
  'EMAIL1' => 
  array (
    'width' => '15%',
    'label' => 'LBL_EMAIL_ADDRESS',
    'sortable' => false,
    'link' => true,
    'customCode' => '{$EMAIL1_LINK}{$EMAIL1}</a>',
    'default' => false,
  ),
  'PHONE_OTHER' => 
  array (
    'width' => '10%',
    'label' => 'LBL_WORK_PHONE',
    'default' => false,
  ),
  'PHONE_FAX' => 
  array (
    'width' => '10%',
    'label' => 'LBL_FAX_PHONE',
    'default' => false,
  ),
  'ADDRESS_STREET' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_STREET',
    'default' => false,
  ),
  'ADDRESS_CITY' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_CITY',
    'default' => false,
  ),
  'ADDRESS_STATE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_STATE',
    'default' => false,
  ),
  'ADDRESS_POSTALCODE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_POSTALCODE',
    'default' => false,
  ),
  'DATE_ENTERED' => 
  array (
    'width' => '10%',
    'label' => 'LBL_DATE_ENTERED',
    'default' => false,
  ),
  'CREATED_BY_NAME' => 
  array (
    'width' => '10%',
    'label' => 'LBL_CREATED',
    'default' => false,
  ),
  'NAME2' => 
  array (
    'width' => '20%',
    'label' => 'Actions',
    'link' => true,
    'default' => true,
	'customCode'=> '<ul id="detail_header_action_menu" class="clickMenu fancymenu " name=""><li class="sugar_action_button"><a href="./index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Patient%26action%3DPatientEncounter%26record%3D'.'{$ID}'.'" id="edit_button">&nbsp; Patient Encounter &nbsp;</a> <ul style="display:none;" id="subnav-'.'{$ID}'.'" class="subnav"><li><a id="duplicate_button" class="sugar_action_button" href=./index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Patient%26action%3DPrescriptionRefill%26record%3D'.'{$ID}'.'>Prescription Refill</a> </li></ul><span  onclick="javascript:  var innerlist = getElementById(\'subnav-'.'{$ID}'.'\'); innerlist.style.display=\'block\';"  class="ab"></span></li></ul>',
  ),
);
?>











