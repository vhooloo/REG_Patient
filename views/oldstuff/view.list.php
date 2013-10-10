<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewList extends ViewList {
 
	function REG_PatientViewList(){
		parent::ViewList();
	}
	
	//function listViewProcess(){
	//	$this->lv->setup($this->seed, 'custom/modules/REG_Patient/tpls/ListViewREG_Patient.tpl', $this->where, $this->params);
	//}
	
	function display(){
	    
         echo '<form method="POST" action="index.php?module=REG_Patient&action=topcare">Choose an option to filter:	<select name="mysort" onchange="this.form.submit()"><option value="none"></option><option value="all">All Refills</option><option value="week">Next Seven Days</option></select></form>';
		
        parent::display();
		
    }
}
?>