<?php
    class encounterlistsnippet{
	
		function mydisplay() {
			if (empty($_REQUEST['patid']) )	
			{
					return;
			} 
			echo $_REQUEST['patid'];
			$myquery = "SELECT * FROM reg_encounter where  id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$_REQUEST['patid']."' AND deleted!=1) order by date_entered desc" ;
			$smarty = new Sugar_Smarty();
			$db = DBManagerFactory::getInstance();  
			$result = $db->query($myquery);
			$enclist = array();
			$row = null;
			while($row = $db->fetchRow($result))
			{
					$enclist[]=$row;
			};
					
				$smarty->assign("enclist", $enclist);
				
				
			 	return $smarty->fetch('custom/modules/REG_Patient/tpls/encounterlistsnippet.tpl');
			}
	}
	
	//$els = new encounterlistsnippet();
	//$els->display();
?>