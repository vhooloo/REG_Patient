<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports2 extends ViewList {
 
	function REG_PatientViewReports2(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		$sql = "SELECT p.id,p.first_name,p.last_name,p.dob,e.id_c, max(e.last_pmp_review_done_c) as last_pmp_review FROM reg_patient p,`reg_patient_reg_encounter_c` pe,reg_encounter_cstm e WHERE p.id=pe.reg_patient_reg_encounterreg_patient_ida AND pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.last_pmp_review_done_c is not null group by p.id ORDER By p.first_name";
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("data",$final);
		$sugarSmarty->assign("title","Patients with last PMP");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/Report2REG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>