<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports4 extends ViewList {
 
	function REG_PatientViewReports4(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		$sql = "SELECT tab4.first_name fname, tab4.last_name lname,  tab5.mrn_c mrn,tab5.date_incative_c as date_inactive, tab4.id patid, tab5.location_c location, (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname FROM reg_patient tab4, reg_patient_cstm tab5 WHERE  tab5.id_c = tab4.id AND (tab5.active_c!=1 OR tab5.active_c is NULL) ORDER BY tab4.last_name, tab4.first_name";
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("data",$final);
		$sugarSmarty->assign("title","Patients who are Inactive");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/Report4REG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>