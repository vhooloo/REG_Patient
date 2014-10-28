<?PHP

require_once('include/MVC/View/views/view.edit.php');
require_once('custom/modules/REG_Patient/RiskEvaluation.php');

class REG_PatientViewRiskEvaluation extends ViewEdit {
 
	function REG_PatientViewViewRiskEvaluation(){
		parent::ViewEdit();
	}
	
	//function editViewProcess(){
	//	$this->lv->setup($this->seed, 'custom/modules/REG_Patient/tpls/ListViewREG_Patient.tpl', $this->where, $this->params);
	//}
	
	function display(){
	    /* get sort order from session */
		//session_start(); // Make a reference to the current session object,set order 
		
		//$_SESSION['regnamesort']= 'test' ; Set a value in a session variable  
		//$GLOBALS['log']->fatal('start display');
		//var_dump($this->bean);
		
        $smarty = new Sugar_Smarty();
		
        //parent::display();
 		$db = DBManagerFactory::getInstance();  
		$myquery = "SELECT tab4a.first_name fname, tab4a.last_name lname,  tab5a.mrn_c mrn, tab4a.gender gender FROM reg_patient  tab4a , reg_patient_cstm tab5a WHERE tab4a.id = tab5a.id_c AND tab4a.id = '". $_REQUEST['patid'] . "'";  
		
	    $result = $db->query($myquery);
		$patdata = null;
		$row = $db->fetchRow($result);
			
		$smarty->assign("patdata", $row);
		
		$risk = new RiskEvaluation();
		
		//when week filter need to add week interval
		//get patient risk if exists
		
		//if ($_POST['mysort'] == 'week')
		if (!empty($_REQUEST['patid']) )	
		{
			$risk->getRisk($_REQUEST['patid']);
			$smarty->assign("pid", $_REQUEST['patid']);
		}
		//echo 'request'.$_REQUEST['patid'];
		//else return false; //param not found 
		//var_dump($risk);

		$smarty->assign("myrisk", $risk);
        global $current_user;
		$smarty->assign("myuser", $current_user);
		$smarty->assign("test", "test");
		
        $smarty->display('custom/modules/REG_Patient/tpls/RiskEvaluationREG_Patient.tpl');
		
    }
	
	function snippet(){
	    /* get sort order from session */
		//session_start(); // Make a reference to the current session object,set order 
		
		//$_SESSION['regnamesort']= 'test' ; Set a value in a session variable  
		//$GLOBALS['log']->fatal('start display');
		//var_dump($this->bean);
		
        $smarty = new Sugar_Smarty();
		
        //parent::display();
 		$db = DBManagerFactory::getInstance();  
		$myquery = "SELECT tab4a.first_name fname, tab4a.last_name lname,  tab5a.mrn_c mrn, tab4a.gender gender FROM reg_patient  tab4a , reg_patient_cstm tab5a WHERE tab4a.id = tab5a.id_c AND tab4a.id = '". $_REQUEST['patid'] . "'";  
		
	    $result = $db->query($myquery);
		$patdata = null;
		$row = $db->fetchRow($result);
			
		$smarty->assign("patdata", $row);
		
		$risk = new RiskEvaluation();
		
		//when week filter need to add week interval
		//get patient risk if exists
		
		//if ($_POST['mysort'] == 'week')
		if (!empty($_REQUEST['patid']) )	
		{
			$risk->getRisk($_REQUEST['patid']);
			$smarty->assign("pid", $_REQUEST['patid']);
		}
		//echo 'request'.$_REQUEST['patid'];
		//else return false; //param not found 
		//var_dump($risk);

		$smarty->assign("myrisk", $risk);
        global $current_user;
		$smarty->assign("myuser", $current_user);
		$smarty->assign("test", "test");
		
        return $smarty->fetch('custom/modules/REG_Patient/tpls/RiskEvaluationREG_Patient.tpl');
		
    }
}
?>