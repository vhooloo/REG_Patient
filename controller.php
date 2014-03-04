<?PHP
require_once('custom/modules/REG_Patient/REG_PatientListView.php');
require_once('include/MVC/View/views/view.list.php');
require_once('custom/modules/REG_Patient/RiskEvaluation.php');
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
	function action_riskevaluation() {
		$this->view = 'riskevaluation';
		//$GLOBALS['log']->fatal('in controller');
		//$this->bean = new REG_PatientRiskView();
		$this->bean = new RiskEvaluation();
	}
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
}
?>