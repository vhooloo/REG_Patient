<?php

define('sugarEntry', true);
$sugarEntry = true;
$sugar_config['external_cache_disabled'] = true;
set_include_path("../../.."); 
require("config.php");
require("include/TimeDate.php");
require("include/utils.php");
require_once('include/SugarLogger/SugarLogger.php');
require_once('include/SugarLogger/LoggerManager.php');
require("include/utils/sugar_file_utils.php");
require("include/SugarCache/SugarCache.php");
require("include/SugarObjects/VarDefManager.php");
require("include/database/DBManagerFactory.php");
require("data/SugarBean.php");
require_once('PatientMed.php');


$GLOBALS['log'] = LoggerManager::getLogger('SugarCRM');

//$s = new SugarBean();
$med = new PatientMedList('123');
$med->GetMedsDB();
var_dump($med->medlist);
$med->BuildList('C',null,'newmed', 'newdesc');
$med->BuildList('C',null,'secmed', 'secnewdesc');
$med->BuildList('D','7','firstmed', 'firstdesc');
$med->BuildList('D','14','secmed', 'secnewdesc');
$med->BuildList('C',null,'newmed', 'newdesc');
$med->SaveMeds();

?>