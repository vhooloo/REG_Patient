<?PHP

require_once('include/MVC/View/views/view.edit.php');
require_once('custom/modules/REG_Patient/RiskEvaluation.php');

class REG_PatientViewAcademicDetail extends ViewEdit {
 
	function REG_PatientViewAcademicDetail(){
		parent::ViewEdit();
	}
	
	//function editViewProcess(){
	//	$this->lv->setup($this->seed, 'custom/modules/REG_Patient/tpls/ListViewREG_Patient.tpl', $this->where, $this->params);
	//}
	
	function display(){
	    /* get sort order from session */
		//session_start(); // Make a reference to the current session object,set order 
		
		//$_SESSION['regnamesort']= 'test' ; Set a value in a session variable  
		//$GLOBALS['log']->fatal('start display');
		//var_dump($this->bean);
		
        $smarty = new Sugar_Smarty();
		
        //parent::display();
 		$db = DBManagerFactory::getInstance();  
		
		$queryprov = "SELECT p1b.name provname  from reg_provider p1b WHERE  p1b.id  = '" . $_REQUEST['provid'] . "'";
		$provider = $db->query($queryprov); 
		$provrow = $db->fetchRow($provider);
		$smarty->assign("provider", $provrow);
		
		
		//first step calc number of active patients per provider
		//$numpatientsquery = "SELECT count(*) prov_pat_count from reg_provider_reg_patient_c p2xb  WHERE p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";  
		//$numpatientsquery = "SELECT count(*) numpatientct from reg_provider_reg_patient_c p2xb  WHERE p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'"; 
		$numpatientsquery = "SELECT COUNT(*) numpatientct  FROM reg_patient tab4, reg_patient_cstm tab5,  reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id   AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '" . $_REQUEST['provid'] . "'";
		
		$resultnumpatient = $db->query($numpatientsquery);
		$rownumpatient = $db->fetchRow($resultnumpatient);
		$smarty->assign("numpatient", $rownumpatient);
		/**second step calculate numbers for
		** 1. % patients with treatment agreements
		** 2. % patients with MEDD>50
		** 3. % patients with respiratory
		**/
		
		$patienttreatment = "SELECT COUNT(*) pattreatct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.narcotic_contract_in_chart_c = '1'  AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		
		$resultpatienttreatment = $db->query($patienttreatment);
		$rowpatienttreatment = $db->fetchRow($resultpatienttreatment);
		$smarty->assign("patienttreatment", $rowpatienttreatment);
		
		$testperc = $rowpatienttreatment["pattreatct"]/$rownumpatient["numpatientct"]*100;
		$smarty->assign("testperc", $testperc);

		$patientmedd = "SELECT COUNT(*)  patmeddct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.med_safety_high_medd_c = '1'  AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		
		$resultpatientmedd = $db->query($patientmedd);
		$rowpatientmedd = $db->fetchRow($resultpatientmedd);
		$smarty->assign("patientmedd", $rowpatientmedd);
		
		$patientresp = "SELECT COUNT(*) patrespct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.med_safety_pulm_prob_c = '1'  AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		$resultpatientresp = $db->query($patientresp);
		$rowpatientresp = $db->fetchRow($resultpatientresp);
		$smarty->assign("patientresp", $rowpatientresp);
		
		/** 
		** Calculate numbers for urine tox screens
		**/
		$utsquery = " SELECT COUNT(*) utsct FROM (SELECT  tab5.mrn_c mrn, ( SELECT count( * ) uts_count1 FROM (	SELECT DISTINCT test_date, patient_mrn	FROM reg_patient_uts_import t1 WHERE test_date >= '2013-01-01') t2  WHERE t2.patient_mrn = mrn GROUP BY patient_mrn   ) uts_count FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "' ) tabuts WHERE uts_count is null OR uts_count < 2";
		$resultuts = $db->query($utsquery);
		$rowuts = $db->fetchRow($resultuts);
		$smarty->assign("uts", $rowuts);
		
		/** uts and moderate risk **/
		$utsmoderate = "SELECT COUNT(*) utsct FROM (SELECT  tab5.mrn_c mrn, tab3.risklvl_c  risklvl , ( SELECT count( * ) uts_count1 FROM (	SELECT DISTINCT test_date, patient_mrn	FROM reg_patient_uts_import t1 WHERE test_date >= '2013-01-01') t2  WHERE t2.patient_mrn = mrn GROUP BY patient_mrn   ) uts_count FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "' ) tabuts WHERE (uts_count is null OR uts_count < 2) AND ( risklvl >= 4 AND risklvl <= 6)"; 
		$resultutsmod = $db->query($utsmoderate);
		$rowutsmod = $db->fetchRow($resultutsmod);
		$smarty->assign("utsmod", $rowuts);
		
		/** uts and high risk **/
		$utshigh = "SELECT COUNT(*) utsct FROM (SELECT  tab5.mrn_c mrn, tab3.risklvl_c  risklvl , ( SELECT count( * ) uts_count1 FROM (	SELECT DISTINCT test_date, patient_mrn	FROM reg_patient_uts_import t1 WHERE test_date >= '2013-01-01') t2  WHERE t2.patient_mrn = mrn GROUP BY patient_mrn   ) uts_count FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "' ) tabuts WHERE (uts_count is null OR uts_count < 2) AND  risklvl >= 7 "; 
		
		$resultutshigh = $db->query($utshigh);
		$rowutshigh = $db->fetchRow($resultutshigh);
		$smarty->assign("utshigh", $rowuts);
		
		/** patient histories - substance abuse and mental helath from risk evaluation **/
		$substancehx = "SELECT COUNT(*) substancect FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb, reg_patient_risk risktab WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND risktab.pid = tab4.id AND ( risktab.ort2a = '1' OR    risktab.ort2b = '1' OR  risktab.ort2c = '1') AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		$resultsubstance = $db->query($substancehx);
		$rowsubstance = $db->fetchRow($resultsubstance);
		$smarty->assign("substancehx", $rowsubstance);
		
		$mentalhx = "SELECT COUNT(*) mentalct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb, reg_patient_risk risktab WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND risktab.pid = tab4.id AND ( risktab.ort5a = '1' OR    risktab.ort5b = '1') AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		$resultmental = $db->query($mentalhx);
		$rowmental = $db->fetchRow($resultmental);
		$smarty->assign("mentalhx", $rowmental);
		
		$longacting = " SELECT COUNT(*)  longactingct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.longacting_c = '1' AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		$resultlongacting = $db->query($longacting);
		$rowlongacting = $db->fetchRow($resultlongacting);
		$smarty->assign("longacting", $rowlongacting);
		
		
		$shortacting = " SELECT COUNT(*)  shortactingct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.shortacting_c = '1' AND tab5.active_c = 1 AND p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";
		$resultshortacting = $db->query($shortacting);
		$rowshortacting = $db->fetchRow($resultshortacting);
		$smarty->assign("shortacting", $rowshortacting);
		
		
		
		////////////////////////////
		
        global $current_user;
		$smarty->assign("myuser", $current_user);

		
        $smarty->display('custom/modules/REG_Patient/tpls/AcademicDetailREG_Patient.tpl');
		
    }
}
?>