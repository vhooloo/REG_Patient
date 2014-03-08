<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReports3 extends ViewList {
 
	function REG_PatientViewReports3(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		$sql = "

SELECT * FROM (
SELECT p.id,p.first_name,p.last_name,p.dob, rec.mrn_c as mrn, (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = p.id AND p2b.deleted = 0) provname, (SELECT e.narcotic_contract_in_chart_c FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND pe.date_modified = (SELECT max( date_modified ) dat FROM reg_patient_reg_encounter_c enc1 WHERE  enc1.reg_patient_reg_encounterreg_patient_ida = p.id)) narc FROM reg_patient p LEFT JOIN reg_patient_cstm rec ON  rec.id_c=p.id ORDER By provname, p.last_name, p.first_name) rep
WHERE NARC <> '1' || NARC is null";
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