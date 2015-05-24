<?php 
 //WARNING: The contents of this file are auto-generated

 
$dictionary['REG_Patient']['indices'][] = array(
     'name' => 'idx_mrn_cstm',
     'type' => 'index',
     'fields' => array(
         0 => 'NAME',
		 1 => 'MRN',
		 2 => 'mrn',
     ),
     'source' => 'non-db',

    );



// created: 2013-09-17 13:04:40
$dictionary["REG_Patient"]["fields"]["reg_labresults_reg_patient"] = array (
  'name' => 'reg_labresults_reg_patient',
  'type' => 'link',
  'relationship' => 'reg_labresults_reg_patient',
  'source' => 'non-db',
  'side' => 'right',
  'vname' => 'LBL_REG_LABRESULTS_REG_PATIENT_FROM_REG_LABRESULTS_TITLE',
);


// created: 2013-09-17 13:04:39
$dictionary["REG_Patient"]["fields"]["reg_patient_reg_encounter"] = array (
  'name' => 'reg_patient_reg_encounter',
  'type' => 'link',
  'relationship' => 'reg_patient_reg_encounter',
  'source' => 'non-db',
  'side' => 'right',
  'vname' => 'LBL_REG_PATIENT_REG_ENCOUNTER_FROM_REG_ENCOUNTER_TITLE',
);


// created: 2013-09-17 13:04:39
$dictionary["REG_Patient"]["fields"]["reg_patient_reg_sf12"] = array (
  'name' => 'reg_patient_reg_sf12',
  'type' => 'link',
  'relationship' => 'reg_patient_reg_sf12',
  'source' => 'non-db',
  'side' => 'right',
  'vname' => 'LBL_REG_PATIENT_REG_SF12_FROM_REG_SF12_TITLE',
);


// created: 2013-09-17 13:04:39
$dictionary["REG_Patient"]["fields"]["reg_provider_reg_patient"] = array (
  'name' => 'reg_provider_reg_patient',
  'type' => 'link',
  'relationship' => 'reg_provider_reg_patient',
  'source' => 'non-db',
  'vname' => 'LBL_REG_PROVIDER_REG_PATIENT_FROM_REG_PROVIDER_TITLE',
  'id_name' => 'reg_provider_reg_patientreg_provider_ida',
);
$dictionary["REG_Patient"]["fields"]["reg_provider_reg_patient_name"] = array (
  'name' => 'reg_provider_reg_patient_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_REG_PROVIDER_REG_PATIENT_FROM_REG_PROVIDER_TITLE',
  'save' => true,
  'id_name' => 'reg_provider_reg_patientreg_provider_ida',
  'link' => 'reg_provider_reg_patient',
  'table' => 'reg_provider',
  'module' => 'REG_Provider',
  'rname' => 'name',
);
$dictionary["REG_Patient"]["fields"]["reg_provider_reg_patientreg_provider_ida"] = array (
  'name' => 'reg_provider_reg_patientreg_provider_ida',
  'type' => 'link',
  'relationship' => 'reg_provider_reg_patient',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_REG_PROVIDER_REG_PATIENT_FROM_REG_PATIENT_TITLE',
);


// created: 2013-09-17 13:04:38
$dictionary["REG_Patient"]["fields"]["reg_treatment_plan_reg_patient"] = array (
  'name' => 'reg_treatment_plan_reg_patient',
  'type' => 'link',
  'relationship' => 'reg_treatment_plan_reg_patient',
  'source' => 'non-db',
  'side' => 'right',
  'vname' => 'LBL_REG_TREATMENT_PLAN_REG_PATIENT_FROM_REG_TREATMENT_PLAN_TITLE',
);


 // created: 2013-11-07 17:31:39

 

 // created: 2014-11-23 13:51:24

 

 // created: 2014-11-23 13:50:04

 

 // created: 2014-01-13 14:40:35
$dictionary['REG_Patient']['fields']['ethnicity']['default']='';

 

 // created: 2013-11-06 11:17:51

 

 // created: 2013-09-17 10:55:29

 

 // created: 2015-04-30 10:34:40

 

 // created: 2014-01-13 14:40:06
$dictionary['REG_Patient']['fields']['race']['default']='';

 

 // created: 2014-02-28 12:51:53

 
?>