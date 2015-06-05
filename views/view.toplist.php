<?PHP

require_once('include/MVC/View/views/view.list.php');
require_once('custom/modules/REG_patient/Security.php');

class REG_PatientViewTopList extends ViewList {
 
    
	
	function REG_PatientViewTopList(){
		parent::ViewList();
	}
	
	function listViewProcess(){
		$this->lv->setup($this->seed, 'custom/modules/REG_Patient/tpls/ListViewREG_Patient.tpl', $this->where, $this->params);
	}
	
	function display(){

		
        $smarty = new Sugar_Smarty();
        parent::display();
 		$db = DBManagerFactory::getInstance();  
		$restrict_query = "";
		global $current_user;
		//var_dump(get_defined_vars());
		//if(isset($current_user) AND $current_user->check_role_membership('WASSER_PATIENTS')) { echo "This user is in role"; $location_query = " AND location_c  IN ('BMC_WALLEY') ";} 
		//elseif (isset($current_user) AND $current_user->check_role_membership('ALL_PATIENTS')) { echo "Super user"; $location_query = "  ";} 
		//else { echo "This user is not in role"; $location_query = " AND location_c  NOT IN ('BMC_WALLEY') ";}
		if(isset($current_user) AND $current_user->check_role_membership('PRESCRIBER_ONLY'))
		{
			$provider = GetProviders();
			//echo "GOT providers";
			$restrict_query = " AND provpat.reg_provider_reg_patientreg_provider_ida IN (".$provider .") ";
		}
		if(isset($current_user) AND $current_user->check_role_membership('MULTI_LOCATION'))
		{
			$location = GetLocations();
			$restrict_query = " AND tab5.location_c IN ({$location}) ";
		}
		if(isset($current_user) AND $current_user->check_role_membership('ALL_LOCATIONS'))
		{

			$restrict_query = "  ";
		}
		
		echo "restrict is " .$restrict_query ."<<<<";
		//$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn, tab4.id patid, tab5.location_c location, tab5.active_c active, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill,  ( SELECT DATE_FORMAT(tab3.last_uts_c,"%m/%d/%Y") uts1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink ) last_uts , ( SELECT DATE_FORMAT(tab3.next_uts_due_c,"%m/%d/%Y") uts11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  uts ,  (SELECT DATE_FORMAT(tab3.next_pcp_visit_c,"%m/%d/%Y") pcp11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  next_pcp,  (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname, ( SELECT risklvl_c risk1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  risk FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3 WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat';  
		
// <<<<<<< HEAD
		//02/25//$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn, tab4.id patid, tab5.location_c location, tab5.active_c active, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill,  ( SELECT DATE_FORMAT(tab3.last_uts_c,"%m/%d/%Y") uts1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink ) last_uts , ( SELECT DATE_FORMAT(tab3.next_uts_due_c,"%m/%d/%Y") uts11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  uts ,  (SELECT DATE_FORMAT(tab3.next_pcp_visit_c,"%m/%d/%Y") pcp11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  next_pcp,  (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid AND p2b.deleted = 0) provname, ( SELECT risklvl_c risk1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  risk FROM reg_patient tab4, reg_patient_cstm tab5 WHERE  tab5.id_c = tab4.id ';

		$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname, DATE_FORMAT(tab4.dob,"%m/%d/%Y")  dob, tab4.primary_address_postalcode zip, tab5.mrn_c mrn, tab5.audit_flag_c audit_flag, tab5.reg_patient_status_c status, tab4.id patid, tab5.location_c location, tab5.active_c active, DATE_FORMAT(tab5.pmp_date_c,"%m/%d/%Y")  pmp_date, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid)  LIMIT 1 )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill, ( SELECT DATE_FORMAT(MAX(tabuts.test_date),"%m/%d/%Y") uts1 FROM reg_patient_uts_import tabuts where tabuts.patient_mrn = mrn )  last_uts,  (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid AND p2b.deleted = 0) provname, ( SELECT finalscore from reg_patient_risk where pid = tab4.id LIMIT 1 )  risk FROM reg_patient tab4, reg_patient_cstm tab5, reg_provider_reg_patient_c provpat  WHERE  tab5.id_c = tab4.id AND provpat.reg_provider_reg_patientreg_patient_idb = tab4.id ' . $restrict_query;		
// =======
/* 		$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn, tab4.id patid, tab5.location_c location, tab5.active_c active, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill,  ( SELECT DATE_FORMAT(tab3.last_uts_c,"%m/%d/%Y") uts1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink ) last_uts , ( SELECT DATE_FORMAT(tab3.next_uts_due_c,"%m/%d/%Y") uts11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  uts ,  (SELECT DATE_FORMAT(tab3.next_pcp_visit_c,"%m/%d/%Y") pcp11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  next_pcp,  (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname, ( SELECT finalscore risk1 FROM reg_patient_risk where pid = patid )  risk FROM reg_patient tab4, reg_patient_cstm tab5 WHERE  tab5.id_c = tab4.id ';   */
// >>>>>>> 3097a71433de82fec730df252659026274347e46
         
		$start = microtime(true); 
		$result = $db->query($myquery);
		$mydata = null;
		while($row = $db->fetchRow($result))
		{
			$mydata[]=$row;
		};	
		$smarty->assign("mydata", $mydata);
		
		
        $smarty->display($this->lv->tpl);
		printf("Total time cached query: %.6fs\n", microtime(true) - $start);
		
    }
}
?>