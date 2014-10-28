<?php
    class risksnippet{
	
		function mydisplay() {
			if (empty($_REQUEST['patid']) )	
			{
					return;
			} 
			echo $_REQUEST['patid'];
			$myquery = "SELECT finalscore FROM reg_patient_risk where  pid  = '".$_REQUEST['patid']."'" ;
			$smarty = new Sugar_Smarty();
			$db = DBManagerFactory::getInstance();  
			$result = $db->query($myquery);
			$enclist = array();
			$row = null;
			while($row = $db->fetchRow($result))
			{
					$enclist[]=$row['finalscore'];
			};
					
				//$smarty->assign("enclist", $enclist);
				
				
			 	//return $smarty->fetch('custom/modules/REG_Patient/tpls/encounterlistsnippet.tpl');
				return 'boo';
			}
	}
	
	//$els = new encounterlistsnippet();
	//$els->display();
?>