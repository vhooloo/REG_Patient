<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports2 extends ViewList {
 
	function REG_PatientViewReports2(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		$sql = "SELECT p.id,p.first_name,p.last_name,p.dob,e.id_c, max(e.last_pmp_review_done_c) as last_pmp_review, rec.mrn_c AS mrn,(SELECT p1b.name provname FROM reg_provider p1b,reg_provider_reg_patient_c p2b WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id AND p2b.reg_provider_reg_patientreg_patient_idb = p.id AND p2b.deleted =0)provname FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON rec.id_c = p.id,`reg_patient_reg_encounter_c` pe,reg_encounter_cstm e WHERE p.id=pe.reg_patient_reg_encounterreg_patient_ida AND pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.last_pmp_review_done_c is not null group by p.id ORDER By p.last_name, p.first_name";
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}
		
		$sql1 = "SELECT p.id,e.id_c, rec.mrn_c AS mrn,(SELECT p1b.name provname FROM reg_provider p1b,reg_provider_reg_patient_c p2b WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id AND p2b.reg_provider_reg_patientreg_patient_idb = p.id AND p2b.deleted =0)provname FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON rec.id_c = p.id,`reg_patient_reg_encounter_c` pe,reg_encounter_cstm e WHERE p.id=pe.reg_patient_reg_encounterreg_patient_ida AND pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.last_pmp_review_done_c is not null group by provname ORDER By p.last_name, p.first_name";
		$resultb1 = $db->query($sql1, true);
		$final1 = array();
		while($row1 = $db->fetchByAssoc($resultb1))
		{
			$final1[] = $row1;
		}
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("data",$final);
        $sugarSmarty->assign("data1",$final1);
		$sugarSmarty->assign("title","Patients with last PMP");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/Report2REG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>