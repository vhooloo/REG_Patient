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
	    
        $smarty = new Sugar_Smarty();
        parent::display();
 		$db = DBManagerFactory::getInstance();  
		$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname, tab1.date_modified, tab3.next_rx_refill_due_c refill, tab2.pat patid, tab5.mrn_c mrn FROM reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_patient tab4, reg_patient_cstm tab5 WHERE tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb AND tab4.id = tab2.pat AND tab5.id_c = tab4.id UNION SELECT tab4a.first_name fname, tab4a.last_name lname, null datemod, null refill, tab4a.id patid, tab5a.mrn_c mrn FROM reg_patient  tab4a , reg_patient_cstm tab5a where tab4a.id not in (select reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c )and tab4a.id = tab5a.id_c ORDER BY refill DESC';  
        if ($_POST['mysort'] == 'week') {
			$myquery = 'SELECT tab4.first_name fname, tab4.last_name lname, tab1.date_modified, tab3.next_rx_refill_due_c refill, tab2.pat patid, tab5.mrn_c mrn FROM reg_patient_reg_encounter_c tab1, ( SELECT max( date_modified ) dat, reg_patient_reg_encounterreg_patient_ida pat FROM reg_patient_reg_encounter_c GROUP BY reg_patient_reg_encounterreg_patient_ida) tab2, reg_encounter_cstm tab3, reg_patient tab4, reg_patient_cstm tab5 WHERE tab1.date_modified = tab2.dat AND tab1.reg_patient_reg_encounterreg_patient_ida = tab2.pat AND tab3.id_c = tab1.reg_patient_reg_encounterreg_encounter_idb AND tab4.id = tab2.pat AND tab5.id_c = tab4.id  AND tab3.next_rx_refill_due_c BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY) ';    }  		
			
		$result = $db->query($myquery);
		while($row = $db->fetchRow($result))
		{
			$mydata[]=$row;
		};	
		$smarty->assign("mydata", $mydata);
		//query for all providers
		$db1 = DBManagerFactory::getInstance(); 
		$provquery = 'SELECT p1b.name provname  from reg_provider p1b';
		$resultprov = $db1->query($provquery);
		while($provrow = $db1->fetchRow($resultprov))
		{
			$provdata[]=$provrow;
		};
		$smarty->assign("provdata", $provdata);
		
        $smarty->display($this->lv->tpl);
		
    }
}
?>