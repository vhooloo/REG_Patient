<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports3 extends ViewList {
 
	function REG_PatientViewReports3(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		$sql = "SELECT p.id,p.first_name,p.last_name,p.dob FROM reg_patient p WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND (e.narcotic_contract_in_chart_c is not null || e.narcotic_contract_in_chart_c=1)) ORDER By p.last_name, p.first_name";
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("data",$final);
		$sugarSmarty->assign("title","Patients who do not have TX Contracts");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/Report3REG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>