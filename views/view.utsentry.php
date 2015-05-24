<?PHP

require_once('include/MVC/View/views/view.list.php');
require_once('custom/modules/REG_Patient/views/view.testmed.php');

class REG_PatientViewutsentry extends ViewList {
 
	function REG_PatientViewutsentry(){
//		parent::ViewList();
	}
	
	
	function display(){
	
	
		$db = DBManagerFactory::getInstance(); 
		

		
		$sql = "SELECT pc.mrn_c pmrn, p.id patid,  (SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = patid) provname, last_name,first_name  FROM reg_patient p, reg_patient_cstm pc WHERE  p.id=pc.id_c ";
		
	
		$resultb = $db->query($sql, true);
		$final = array();
		while($row = $db->fetchByAssoc($resultb))
		{
			$final[] = $row;
		}


		
		$sugarSmarty = new Sugar_Smarty();
        
        //$sugarSmarty->assign("duration",$duration);
		$sugarSmarty->assign("mydata",$final);
		$sugarSmarty->assign("title","UTS Entry");
		
		$snip = new REG_PatientViewTestMed();
		//echo $snip->snippy();
		$sugarSmarty->assign("snippet", $snip->snippet());
        $sugarSmarty->display('custom/modules/REG_Patient/tpls/utsentryREG_Patient.tpl');
		
//        parent::display();
		
    }
}
?>