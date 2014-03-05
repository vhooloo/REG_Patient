<?PHP

require_once('include/MVC/View/views/view.list.php');


class REG_PatientViewTopList extends ViewList {
 
	function REG_PatientViewTopList(){
		parent::ViewList();
	}
	
	function listViewProcess(){
		$this->lv->setup($this->seed, 'custom/modules/REG_Patient/tpls/ListViewREG_Patient.tpl', $this->where, $this->params);
	}
	
	function display(){

		$start = microtime(true); 
        $smarty = new Sugar_Smarty();
        parent::display();
 		$db = DBManagerFactory::getInstance();  
		//$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn, tab4.id patid, tab5.location_c location, tab5.active_c active, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill,  ( SELECT DATE_FORMAT(tab3.last_uts_c,"%m/%d/%Y") uts1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink ) last_uts , ( SELECT DATE_FORMAT(tab3.next_uts_due_c,"%m/%d/%Y") uts11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  uts ,  (SELECT DATE_FORMAT(tab3.next_pcp_visit_c,"%m/%d/%Y") pcp11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  next_pcp,  (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname, ( SELECT risklvl_c risk1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  risk FROM reg_patient tab4, reg_patient_cstm tab5, reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3 WHERE  tab5.id_c = tab4.id  AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat';  
		
		$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn, tab4.id patid, tab5.location_c location, tab5.active_c active, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill,   ( SELECT DATE_FORMAT(MAX(tabuts.test_date),"%m/%d/%Y") uts1 FROM reg_patient_uts_import tabuts where tabuts.patient_mrn = mrn )  last_uts ,    (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname, ( SELECT risklvl_c risk1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  risk FROM reg_patient tab4, reg_patient_cstm tab5 WHERE  tab5.id_c = tab4.id ';  
         
		$result = $db->query($myquery);
		$mydata = null;
		while($row = $db->fetchRow($result))
		{
			$mydata[]=$row;
		};

		printf("Total time  query: %.6fs\n", microtime(true) - $start);


	
		$smarty->assign("mydata", $mydata);
		

        $smarty->display($this->lv->tpl);

		
		
	
		
       
		
		}
}
?>