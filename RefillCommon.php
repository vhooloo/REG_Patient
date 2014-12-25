<?php
    //These are common functions used by PRescriptionRefill.php (the edit view for refills) and Encounter_edit.php (the read only view obtained when clicking on history)
	function setEditUserRole(&$dv3)
	{
	
		echo "In function";
		global $current_user;
		if(isset($current_user) AND ( $current_user->check_role_membership('WASSER_PATIENTS') OR $current_user->check_role_membership('ALL_PATIENTS') )) 
			{ echo "This user is in role"; $dv3->ss->assign("myrole", 'WASSER_PATIENTS');;} 
		else { echo "This user is not in role"; $dv3->ss->assign("myrole", 'NOT_WASSER_PATIENTS');}
	}


?>