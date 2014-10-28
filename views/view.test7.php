<?PHP

require_once('include/MVC/View/views/view.list.php');

class REG_PatientViewTest7 extends ViewList {
 
	function REG_PatientViewTest7(){
//		parent::ViewList();
	}
	
	
	function display(){
	
		$db = DBManagerFactory::getInstance(); 
		if (empty($_REQUEST['patid']) )	
			{
					return;
			} 
		//echo $_REQUEST['patid'];
		$myquery = "SELECT finalscore FROM reg_patient_risk where  pid  = '".$_REQUEST['patid']."'" ;;
		$resultb = $db->query($myquery, true);
		
		while($row = $db->fetchByAssoc($resultb))
		{
			$finalscore = $row['finalscore'];
		}
		
		echo 'nopw';
		echo $finalscore;
		echo $_REQUEST['patid'];
	
		echo 'test';
//        parent::display();
		
    }
}
?>