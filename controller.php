<?PHP
require_once('custom/modules/REG_Patient/REG_PatientListView.php');
require_once('include/MVC/View/views/view.list.php');
//require_once('custom/modules/REG_Patient/RiskEvaluation.php');
require_once('custom/modules/REG_Patient/TreatmentPlan.php');

class REG_PatientController extends SugarController {
/*** when we call MassUpdate with $addAllBeanFields then it will use this in the query.
*
* @param
*/
	function action_listview() {
		$this->view = 'toplist';
		//$GLOBALS['log']->fatal('in controller');
		$this->bean = new REG_PatientListView();
	}
	function action_topcare() {
		$this->view = 'list';
		//$GLOBALS['log']->fatal('in controller');
		$this->bean = new REG_PatientListView();
	}
	//function action_riskevaluation() {
	//	$this->view = 'riskevaluation';
		//$GLOBALS['log']->fatal('in controller');
		//$this->bean = new REG_PatientRiskView();
	//	$this->bean = new RiskEvaluation();
	//}
	function action_academicdetail() {		$this->view = 'academicdetail';		//$GLOBALS['log']->fatal('in controller');		//$this->bean = new REG_PatientRiskView();		//$this->bean = new RiskEvaluation();	
	}	
	function action_treatmentplan() {
		$this->view = 'treatmentplan';
		$this->bean = new TreatmentPlan();
	}
	
	function action_report1() {		$this->view = 'reports1';	}
	function action_report2(){		$this->view = 'reports2';	}		
	function action_report3(){		$this->view = 'reports3';	}		
	function action_report4(){		$this->view = 'reports4';	}	
	function action_report5(){		$this->view = 'reports5';	}	
	function action_report6(){		$this->view = 'reports6';	}	
//<<<<<<< HEAD
	function action_test7(){		$this->view = 'test7';}
//=======
	function action_reportuts(){	$this->view = 'reportsuts';	}	
	function action_utsentry()	{	$this->view = 'utsentry';	}	
	function action_riskevaluation()	{	$this->view = 'commscore';	}
	function action_testmed()	{	$this->view = 'testmed';	}
	function action_reportmain() { $this->view = 'reportmain';}
	function action_reportmedd() { $this->view = 'reportmedd';}
//>>>>>>> 3097a71433de82fec730df252659026274347e46
}
?>