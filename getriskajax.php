<?php

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
		
		if ( $finalscore == "") echo "N/A";
		if ( $finalscore == "0-3") echo "Low";
		if ( $finalscore == "4-7") echo "Moderate";
		if ( $finalscore == "gt7") echo "High";
		//echo $finalscore;

	
?>