<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports1 extends ViewList {
 
	function REG_PatientViewReports1(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
/* <<<<<<< HEAD
		$sql = "SELECT p.id,p.first_name,p.last_name,p.dob FROM reg_patient p WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.next_pmp_review_due_c is not null) ORDER By p.last_name, p.first_name";
======= */
		$sql = "SELECT p.id,p.first_name,p.last_name,p.dob, rec.mrn_c AS mrn,(SELECT p1b.name provname FROM reg_provider p1b,reg_provider_reg_patient_c p2b WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id AND p2b.reg_provider_reg_patientreg_patient_idb = p.id AND p2b.deleted =0)provname FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON rec.id_c = p.id WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.last_pmp_review_done_c is not null) ORDER By p.last_name, p.first_name";
// >>>>>>> 3097a71433de82fec730df252659026274347e46
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}

		$sql1 = "SELECT p.id, rec.mrn_c AS mrn,(SELECT p1b.name provname FROM reg_provider p1b,reg_provider_reg_patient_c p2b WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id AND p2b.reg_provider_reg_patientreg_patient_idb = p.id AND p2b.deleted =0)provname FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON rec.id_c = p.id WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.last_pmp_review_done_c is not null) GROUP BY provname ORDER By p.last_name, p.first_name";
		$resultb1 = $db->query($sql1, true);
		$final1 = array();
		while($row1 = $db->fetchByAssoc($resultb1))
		{
			$final1[] = $row1;
		}
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("data",$final);

        $sugarSmarty->assign("data1",$final1);
		$sugarSmarty->assign("title","Patients who do not have PMP");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/Report1REG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>