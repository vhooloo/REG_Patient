<?PHP

require_once('include/MVC/View/views/view.edit.php');

class REG_PatientViewRiskEvaluation extends ViewEdit {
 
	function REG_PatientViewViewRiskEvaluation(){
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
		$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname, tab1.date_modified, tab3.next_rx_refill_due_c refill, tab2.pat patid, tab5.mrn_c mrn FROM reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_patient tab4, reg_patient_cstm tab5 WHERE tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb AND tab4.id = tab2.pat AND tab5.id_c = tab4.id UNION SELECT tab4a.first_name fname, tab4a.last_name lname, null datemod, null refill, tab4a.id patid, tab5a.mrn_c mrn FROM reg_patient  tab4a , reg_patient_cstm tab5a where tab4a.id not in (select reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c )and tab4a.id = tab5a.id_c ORDER BY refill DESC';  
		
		$select_base = 'SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn, tab4.id patid ';
		$from_base = ' FROM reg_patient tab4, reg_patient_cstm tab5';
		$where_base = ' WHERE tab5.id_c = tab4.id ';

        $select_refill = ' , DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") refill,  DATE_FORMAT(tab3.next_uts_due_c,"%m/%d/%Y") uts ';
        $from_refill =   ' , reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3 ';
        $where_refill = ' AND tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb  AND tab4.id = tab2.pat ';	
        
        $select_norefill = ', ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill,  ( SELECT DATE_FORMAT(tab3.next_uts_due_c,"%m/%d/%Y") uts11 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  uts ';

        $select_noprovider = ', (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname ';
		$select_provider = ' ,p1b.name provname';
		$from_provider = ' ,reg_provider p1b, reg_provider_reg_patient_c p2b ';
		$where_provider = ' AND p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = tab4.id ';
		
		$testselect = $select_base;
		$testfrom = $from_base;
		$testwhere = $where_base;
		
		//when week filter need to add week interval
		//when provfilter need to add prov
		
		//if ($_POST['mysort'] == 'week')
		if (!empty($_POST['mysort']) AND $_POST['mysort'] != 'all' AND $_POST['mysort'] != 'none')		
		{
			$testselect .= $select_refill;
			$testfrom   .= $from_refill;
			if ($_POST['mysort'] != 'cust')
				$testwhere  .= $where_refill . ' AND tab3.next_rx_refill_due_c BETWEEN DATE_ADD(NOW(), INTERVAL -1 DAY)  AND DATE_ADD(NOW(), INTERVAL '. $_POST['mysort'] . ' DAY) '; 
		    else
				$testwhere  .= $where_refill . ' AND tab3.next_rx_refill_due_c BETWEEN str_to_date("' . $_POST['last_pcp_visit_c1'] . '", "%m/%d/%Y") AND str_to_date("' . $_POST['last_pcp_visit_c2'] . '", "%m/%d/%Y") ';
		}
		
		else $testselect .= $select_norefill;
		
		if (!empty($_POST['provsort']) AND $_POST['provsort'] != "none")       		
		{
			$testselect .= $select_provider;
			$testfrom   .= $from_provider;
			$testwhere  .= $where_provider . " AND p1b.name = '" . $_POST['provsort'] . "' " ; 
		}
		else $testselect .= $select_noprovider;
		
		$testquery = $testselect . $testfrom . $testwhere . ' ORDER BY refill DESC, provname  ASC';
		
        //var_dump($testquery);
		
		//$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname, tab1.date_modified, DATE_FORMAT(tab3.next_rx_refill_due_c,"%m/%d/%Y") refill, tab2.pat patid, tab5.mrn_c mrn, p1b.name provname FROM reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_patient tab4, reg_patient_cstm tab5, reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb AND tab4.id = tab2.pat AND tab5.id_c = tab4.id  AND p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = tab4.id ';   
 		
		//if ($_POST['mysort'] == 'week') $myquery.= ' AND tab3.next_rx_refill_due_c BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 60 DAY) ';
		//if (!empty($_POST['provsort']) AND $_POST['provsort'] != "none") $myquery.= " AND p1b.name = '" . $_POST['provsort'] . "' ";

		//var_dump($_POST);
		//var_dump($myquery);
         
		$result = $db->query($testquery);
		$mydata = null;
		while($row = $db->fetchRow($result))
		{
			$mydata[]=$row;
		};	
		$smarty->assign("mydata", $mydata);
		//query for all providers
		$db1 = DBManagerFactory::getInstance(); 
		$provquery = 'SELECT p1b.name provname  from reg_provider p1b';
		$resultprov = $db1->query($provquery);
		$provdata[] = "";
		while($provrow = $db1->fetchRow($resultprov))
		{
			$provdata[]=$provrow;
		};
		$smarty->assign("provdata", $provdata);
		
        $smarty->display('custom/modules/REG_Patient/tpls/RiskEvaluationREG_Patient.tpl');
		
    }
}
?>