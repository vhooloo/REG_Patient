<?PHP

require_once('include/MVC/View/views/view.edit.php');
//require_once('custom/modules/REG_Patient/RiskEvaluation.php');

class REG_PatientViewReportMedd extends ViewEdit {
 
	function REG_PatientViewReportMedd(){
		parent::ViewEdit();
	}
	

	
	function display(){
	 
	     $provid = '0';
		 
		 var_dump($_GET);
		 
	     if(isset($_GET['provid']) &&  !empty($_GET['provid']) )
			$provid = $_GET['provid'];
			
		$datalist = Array();
        $smarty = new Sugar_Smarty();
		
        //parent::display();
 		$db = DBManagerFactory::getInstance();  
		
		$queryprov = "select p1.last_name lname, p1.first_name, p1c.mrn_c, p1.phone_home, r.finalscore,  r.ortsum ortsum, r.short_opioid, prov.name, r.medd FROM reg_provider prov, reg_provider_reg_patient_c provpat, 
		reg_patient p1, reg_patient_cstm p1c, reg_patient_risk r
		WHERE prov.id = '{$provid}' AND
		prov.id = provpat.reg_provider_reg_patientreg_provider_ida AND
		p1.id = provpat.reg_provider_reg_patientreg_patient_idb AND
		p1.id = p1c.id_c AND p1c.active_c = '1' AND
		p1.id = r.pid AND r.medd in ('0-3', '4-7', 'gt7')
		ORDER BY r.medd, p1.last_name, p1.first_name";
		
		$sql = $db->query($queryprov);
		while ( ($a = $db->fetchByAssoc($sql)) != null) {
			$datalist[] = Array("lname"=> $a["lname"], "fname"=> $a["first_name"], "mrn"=> $a["mrn_c"],"phone"=> $a["phone_home"], "ncm" => $a["finalscore"] , "medd" => $a["medd"], "ortsum" => $a["ortsum"]);

		}
		
		echo "here with provid " . $provid;
		echo "<p>".$queryprov."</p>";
		$smarty->assign("datalist", $datalist);
		
        $smarty->display('custom/modules/REG_Patient/tpls/ReportMedd.tpl');
		
    }
}
?>