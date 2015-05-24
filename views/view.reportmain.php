<?PHP

require_once('include/MVC/View/views/view.edit.php');
//require_once('custom/modules/REG_Patient/RiskEvaluation.php');

class REG_PatientViewReportMain extends ViewEdit {
 
	function REG_PatientViewReportMain(){
		parent::ViewEdit();
	}
	

	
	function display(){
	 
		//$provlist = Array();
        $smarty = new Sugar_Smarty();
		
        //parent::display();
 		$db = DBManagerFactory::getInstance();  
		
		$queryprov = "SELECT p1b.id provid, p1b.name provname  from reg_provider p1b ORDER BY provname";
		
		$sql = $db->query($queryprov);
		while ( ($a = $db->fetchByAssoc($sql)) != null) {
			$provlist[] = Array("provid"=> $a["provid"], "provname" => $a["provname"]);

		}
		
		echo "here";
		$smarty->assign("provlist", $provlist);
		
        $smarty->display('custom/modules/REG_Patient/tpls/ReportMain.tpl');
		
    }
}
?>