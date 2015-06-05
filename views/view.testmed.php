<?PHP

require_once('include/MVC/View/views/view.list.php');
require_once('custom/modules/REG_Patient/PatientMed.php');

class REG_PatientViewTestMed extends ViewList {
 
	function REG_PatientViewTestMed(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		echo("TESTING ONLY");
		$pm = new PatientMedList('123'); 
		$pm->GetMedsDB();
		echo("there");
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("duration",$duration);
		$sugarSmarty->assign("med",$pm->medlist);
		$sugarSmarty->assign("patid",$pm->patid);
		$sugarSmarty->assign("title","Test med");
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/testmed.tpl');
		
//        parent::display();
		
    }
	
	function snippet($patid){
	
		//echo("here");
		$pm = new PatientMedList($patid); 
		$pm->GetMedsDB();
		//echo("there");
		$sugarSmarty = new Sugar_Smarty();
        
        $sugarSmarty->assign("duration",$duration);
		$sugarSmarty->assign("med",$pm->medlist);
		$sugarSmarty->assign("patid",$pm->patid);
		$sugarSmarty->assign("title","Test med");
		//return ("");
        return $sugarSmarty->fetch('custom/modules/REG_Patient/tpls/testmed.tpl');
		
//        parent::display();
		
    }
	
	
	function snippy(){ return("<b>snip</b>");}
}
?>