<?php
$module_name = 'REG_Patient';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'LBL_CONTACT_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
      'syncDetailEditViews' => true,
    ),
    'panels' => 
    array (
      'lbl_contact_information' => 
      array (
        0 => 
        array (
          0 => 'last_name',
          1 => 
          array (
            'name' => 'first_name',
            'customCode' => '{html_options name="salutation" id="salutation" options=$fields.salutation.options selected=$fields.salutation.value}&nbsp;<input name="first_name"  id="first_name" size="25" maxlength="25" type="text" value="{$fields.first_name.value}">',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'mrn_c',
            'label' => 'LBL_MRN',
          ),
          1 => 
          array (
            'name' => 'dob',
            'label' => 'LBL_DOB',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'gender',
            'studio' => 'visible',
            'label' => 'LBL_GENDER',
          ),
          1 => 'phone_mobile',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'emergencycontact',
            'label' => 'LBL_EMERGENCYCONTACT',
          ),
          1 => 'phone_home',
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'race',
            'studio' => 'visible',
            'label' => 'LBL_RACE',
          ),
          1 => 
          array (
            'name' => 'ethnicity',
            'studio' => 'visible',
            'label' => 'LBL_ETHNICITY',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'primary_address_street',
            'hideLabel' => true,
            'type' => 'address',
            'displayParams' => 
            array (
              'key' => 'primary',
              'rows' => 2,
              'cols' => 30,
              'maxlength' => 150,
            ),
          ),
        ),
        6 => 
        array (
          0 => 'description',
          1 => 'email1',
        ),
        7 => 
        array (
          0 => 'assigned_user_name',
          1 => 
          array (
            'name' => 'reg_provider_reg_patient_name',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'location_c',
            'studio' => 'visible',
            'label' => 'LBL_LOCATION',
          ),
          1 => 
          array (
            'name' => 'active_c',
            'label' => 'LBL_ACTIVE',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'reg_patient_status_c',
            'studio' => 'visible',
            'label' => 'LBL_REG_PATIENT_STATUS',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
