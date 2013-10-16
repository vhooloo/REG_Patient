<?PHP

require_once('custom/modules/REG_Patient/REG_PatientListView.php');
require_once('include/MVC/View/views/view.list.php');

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
	function action_risk() {
		$this->view = 'riskview';
		//$GLOBALS['log']->fatal('in controller');
		$this->bean = new REG_PatientRiskView();
	}
}
?>