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
		//first step calc number of active patients per provider
		$numpatientsquery = "SELECT count(*) prov_pat_count from reg_provider_reg_patient_c p2xb  WHERE p2xb.reg_provider_reg_patientreg_provider_ida = '". $_REQUEST['provid'] . "'";  
		
		/**second step calculate numbers for
		** 1. % patients with treatment agreements
		** 2. % patients with MEDD>50
		** 3. % patients with respiratory
		**/
		
		$patienttreatment = "SELECT COUNT(*) pattreatct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.narcotic_contract_in_chart_c = '1' AND p2xb.reg_provider_reg_patientreg_provider_ida = 'e362a206-f7a8-cfb0-344d-524d95d83bc9' ";
		
		$resultpatienttreatment = $db->query($patienttreatment);
		$rowpatienttreatment = $db->fetchRow($resultpatienttreatment);
		$smarty->assign("patienttreatment", $rowpatienttreatment);

		$patientmedd = "SELECT COUNT(*)  patmeddct FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.med_safety_high_medd_c = '1' AND p2xb.reg_provider_reg_patientreg_provider_ida = 'e362a206-f7a8-cfb0-344d-524d95d83bc9' ";
		
		$resultpatientmedd = $db->query($patientmedd);
		$rowpatientmedd = $db->fetchRow($resultpatientmedd);
		$smarty->assign("patientmedd", $rowpatientmedd);
		
		$patientsresp = "SELECT COUNT(*)  FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND tab3.med_safety_pulm_prob_c = '1' AND p2xb.reg_provider_reg_patientreg_provider_ida = 'e362a206-f7a8-cfb0-344d-524d95d83bc9' ";
		
		/** 
		** Calculate numbers for urine tox screens
		**/
		$utsquery = " SELECT COUNT(*) FROM (SELECT  tab5.mrn_c mrn, ( SELECT count( * ) uts_count1 FROM (	SELECT DISTINCT test_date, patient_mrn	FROM reg_patient_uts_import t1 WHERE test_date >= '2013-01-01') t2  WHERE t2.patient_mrn = mrn GROUP BY patient_mrn   ) uts_count FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND p2xb.reg_provider_reg_patientreg_provider_ida = 'e362a206-f7a8-cfb0-344d-524d95d83bc9' ) tabuts WHERE uts_count is null OR uts_count < 2";
		
		/** uts and moderate risk **/
		$utsmoderate = "SELECT COUNT(*) FROM (SELECT  tab5.mrn_c mrn, tab3.risklvl_c  risklvl , ( SELECT count( * ) uts_count1 FROM (	SELECT DISTINCT test_date, patient_mrn	FROM reg_patient_uts_import t1 WHERE test_date >= '2013-01-01') t2  WHERE t2.patient_mrn = mrn GROUP BY patient_mrn   ) uts_count FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND p2xb.reg_provider_reg_patientreg_provider_ida = 'e362a206-f7a8-cfb0-344d-524d95d83bc9' ) tabuts WHERE (uts_count is null OR uts_count < 2) AND ( risklvl >= 4 AND risklvl <= 6)"; 
		
		/** uts and high risk **/
		$utshigh = "SELECT COUNT(*) FROM (SELECT  tab5.mrn_c mrn, tab3.risklvl_c  risklvl , ( SELECT count( * ) uts_count1 FROM (	SELECT DISTINCT test_date, patient_mrn	FROM reg_patient_uts_import t1 WHERE test_date >= '2013-01-01') t2  WHERE t2.patient_mrn = mrn GROUP BY patient_mrn   ) uts_count FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_provider_reg_patient_c p2xb WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat AND p2xb.reg_provider_reg_patientreg_patient_idb = tab4.id AND p2xb.reg_provider_reg_patientreg_provider_ida = 'e362a206-f7a8-cfb0-344d-524d95d83bc9' ) tabuts WHERE (uts_count is null OR uts_count < 2) AND  risklvl >= 7 "; 
		
		$myquery = "SELECT tab4a.first_name fname, tab4a.last_name lname,  tab5a.mrn_c mrn, tab4a.gender gender FROM reg_patient  tab4a , reg_patient_cstm tab5a WHERE tab4a.id = tab5a.id_c AND tab4a.id = '". $_REQUEST['patid'] . "'";  
		
	    
		$patdata = null;

		
		
		$risk = new RiskEvaluation();
		
		//when week filter need to add week interval
		//get patient risk if exists
		
		//if ($_POST['mysort'] == 'week')
		if (!empty($_REQUEST['patid']) )	
		{
			$risk->getRisk($_REQUEST['patid']);
			$smarty->assign("pid", $_REQUEST['patid']);
		}
		//echo 'request'.$_REQUEST['patid'];
		//else return false; //param not found 
		//var_dump($risk);

		$smarty->assign("myrisk", $risk);
        global $current_user;
		$smarty->assign("myuser", $current_user);
		$smarty->assign("test", "test");
		
        $smarty->display('custom/modules/REG_Patient/tpls/AcademicDetailREG_Patient.tpl');
		
    }
}
?>