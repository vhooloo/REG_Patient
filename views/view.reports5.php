<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports5 extends ViewList {
 
	function REG_PatientViewReports5(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		$sql = "SELECT p.id patid,p.first_name,p.last_name,p.dob, rec.mrn_c as mrn, ( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink, ( SELECT DATE_FORMAT(tab3.next_rx_refill_due_c,'%m/%d/%Y') ref1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  refill, ( SELECT DATE_FORMAT(tab4.next_pill_ct_c,'%m/%d/%Y') ref1 FROM reg_encounter_cstm tab4 where tab4.id_c = enclink )  next_pill_count, ( SELECT risklvl_c risk1 FROM reg_encounter_cstm tab3 where tab3.id_c = enclink )  risk,(SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON  rec.id_c=p.id WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND (next_pill_ct_c is not null)) ORDER BY p.last_name, p.first_name";
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}

		$sql1 = "SELECT p.id patid,( SELECT tab1.reg_patient_reg_encounterreg_encounter_idb enclink  FROM reg_patient_reg_encounter_c tab1 WHERE  tab1.reg_patient_reg_encounterreg_patient_ida = patid AND tab1.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = patid) )  enclink,(SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON  rec.id_c=p.id WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND (next_pill_ct_c is not null)) GROUP BY provname ORDER BY p.last_name, p.first_name";
		$resultb1 = $db->query($sql1, true);
		$final1 = array();
		while($row1 = $db->fetchByAssoc($resultb1))
		{
			$final1[] = $row1;
		}
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("data",$final);
        $sugarSmarty->assign("data1",$final1);
		$sugarSmarty->assign("title","Patients who not have Next Pill Count");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/Report5REG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>