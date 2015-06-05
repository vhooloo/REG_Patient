<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
	
	
	function GetLocations(){
		global $current_user;
		$db = DBManagerFactory::getInstance();  
		$locations = "";
		$sql ="";
		if(isset($current_user) AND $current_user->check_role_membership('PRESCRIBER_ONLY'))
		{		
		    
			$sql= "SELECT CONCAT('^',cstm.provider_location_c,'^') loc FROM users_reg_provider_1_c provlink, reg_provider_cstm cstm  where cstm.id_c = provlink.users_reg_provider_1reg_provider_idb
		AND users_reg_provider_1users_ida = '"  . $current_user->id . "'";
		}
		if(isset($current_user) AND $current_user->check_role_membership('MULTI_LOCATION'))
		{
			$sql = "SELECT location_list_c loc FROM users_cstm where id_c = '"  . $current_user->id . "'";
		}
		
		
		if ($sql == "") return "''"; /* empty location - no authorization */
		
		 
		$sql = $db->query($sql);
		while ( ($a = $db->fetchByAssoc($sql)) != null) {
			$locations = $a["loc"];
		}
		
		//echo "locations for". $current_user->id .  " ". $locations;
		//echo "replace " . str_replace( "^", "'",$locations);
		return str_replace( "^", "'",$locations);
	}

	
	function GetProviders(){
		global $current_user;
		$db = DBManagerFactory::getInstance();  
		$locations = "";
		$sql="";
		$providers="";
	
		if(isset($current_user) AND $current_user->check_role_membership('PRESCRIBER_ONLY'))
		{
			$sql = "SELECT prov.name provname, prov.id provid FROM users_reg_provider_1_c provlink, reg_provider prov  where prov.id = provlink.users_reg_provider_1reg_provider_idb
			AND users_reg_provider_1users_ida = '"  . $current_user->id . "'";
			
		}

		if(isset($current_user) AND $current_user->check_role_membership('MULTI_LOCATION'))
		{
		   $locations = GetLocations();
		   $sql="SELECT prov.name provname, prov.id provid  FROM reg_provider prov, reg_provider_cstm cstm  where  cstm.id_c = prov.id
		   AND cstm.provider_location_c IN ({$locations})";
		 }

		if ($sql=="") return "''";
	 
	 
	   $sql = $db->query($sql);
		while ( ($a = $db->fetchByAssoc($sql)) != null) {
			//echo "<p>". $a["provname"] . "</p>";
			if ($providers == "") {$providers = "'". $a["provid"] . "'";}
			else {
				$providers = "'". $a["provid"] . "',". $providers;
			}
		}
		//echo "list of providers: " . $providers;
		return $providers;
   	 }

	
	//GetLocations();
	//GetProviders();

?>