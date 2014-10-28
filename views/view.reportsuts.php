<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewReportsuts extends ViewList {
 
	function REG_PatientViewReportsuts(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		
		if(isset($_POST['duration']) && $_POST['duration']!="")
			$duration = $_POST['duration'];
		else
			$duration = 1;
		
		if($duration == 1)
		{
			$where_duration = " AND test_date= SUBDATE(CURDATE(),1)";
		}
		else if($duration == 2)
		{
			$where_duration = " AND test_date between (CURRENT_DATE() - INTERVAL 1 WEEK) AND CURRENT_DATE() ";
		}
		else if($duration == 3)
		{
			$where_duration = " AND test_date between (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE() ";
		}
		else if($duration == 4)
		{
			$where_duration = " ";
		}
		
		$sql = "SELECT DISTINCT DATE_FORMAT(test_date,'%m/%d/%Y') thisdate1, test_date thisdate, patient_mrn pmrn,p.id patid, ( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'OXYCODONE' AND test_results_code <> 'PEN' limit 1) oxy,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'OPIATE URINE' AND test_results_code <> 'PEN' limit 1) opiate,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'METHADONE' AND test_results_code <> 'PEN' limit 1) methadone,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'COCAIN METAB' AND test_results_code <> 'PEN' limit 1) cocaine,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'BUPRENO UR' AND test_results_code <> 'PEN' limit 1) bupreno,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'BENZODIAZ UR' AND test_results_code <> 'PEN' limit 1) benzo,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'BARBITURA UR' AND test_results_code <> 'PEN' limit 1) barbi,( SELECT DISTINCT test_results_code FROM  reg_patient_uts_import WHERE  patient_mrn = pmrn AND test_date = thisdate AND test_type = 'AMPHETAMI UR' AND test_results_code <> 'PEN' limit 1) amph, (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname, last_name,first_name  FROM reg_patient_uts_import uts, reg_patient p, reg_patient_cstm pc WHERE  p.id=pc.id_c AND pc.mrn_c=uts.patient_mrn $where_duration ORDER BY test_date DESC";
		
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}

		
		
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("duration",$duration);
		$sugarSmarty->assign("mydata",$final);
		$sugarSmarty->assign("title","UTS Report");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/ReportutsREG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>