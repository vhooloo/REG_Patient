<?php 
 //WARNING: The contents of this file are auto-generated


 // created: 2013-09-17 13:04:40
$layout_defs["REG_Patient"]["subpanel_setup"]['reg_labresults_reg_patient'] = array (
  'order' => 100,
  'module' => 'REG_LabResults',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_REG_LABRESULTS_REG_PATIENT_FROM_REG_LABRESULTS_TITLE',
  'get_subpanel_data' => 'reg_labresults_reg_patient',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


 // created: 2013-09-17 13:04:39
$layout_defs["REG_Patient"]["subpanel_setup"]['reg_patient_reg_encounter'] = array (
  'order' => 100,
  'module' => 'REG_Encounter',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_REG_PATIENT_REG_ENCOUNTER_FROM_REG_ENCOUNTER_TITLE',
  'get_subpanel_data' => 'reg_patient_reg_encounter',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


 // created: 2013-09-17 13:04:39
$layout_defs["REG_Patient"]["subpanel_setup"]['reg_patient_reg_sf12'] = array (
  'order' => 100,
  'module' => 'REG_SF12',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_REG_PATIENT_REG_SF12_FROM_REG_SF12_TITLE',
  'get_subpanel_data' => 'reg_patient_reg_sf12',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


 // created: 2013-09-17 13:04:38
$layout_defs["REG_Patient"]["subpanel_setup"]['reg_treatment_plan_reg_patient'] = array (
  'order' => 100,
  'module' => 'REG_Treatment_Plan',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_REG_TREATMENT_PLAN_REG_PATIENT_FROM_REG_TREATMENT_PLAN_TITLE',
  'get_subpanel_data' => 'reg_treatment_plan_reg_patient',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


//auto-generated file DO NOT EDIT
$layout_defs['REG_Patient']['subpanel_setup']['reg_patient_reg_encounter']['override_subpanel_name'] = 'REG_Patient_subpanel_reg_patient_reg_encounter';

?>