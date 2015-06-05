<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


class PatientMedList  { //extends SugarBean {

	var 	$patid;
	var		$medid;
	
	var 	$medlist = Array();
	var 	$db;
	var 	$medctr = 0;
	/**
	 * Sole constructor
	 */
	function PatientMedList($id) {
		$this->db = DBManagerFactory::getInstance();
		$this->patid = $id;
		//parent::SugarBean();
	}
	
	function GetMedsDB(){
	
		$sql = "SELECT * FROM reg_patient_med where patid = '"  . $this->patid . "'";
		$sql = $this->db->query($sql);
		while ( ($a = $this->db->fetchByAssoc($sql)) != null) {
			$this->medlist[] = Array("crud"=> "U", "medid" => $a["medid"], 
													"name"=>$a["name"], 
													"dose"=>$a["TabDose"], 
													"freq"=>$a["Frequency"], 
													"qty"=>$a["Qty"], 
													"desc"=>$a["description"]);
			if ($a["medid"] > $this->medctr) $this->medctr = $a["medid"];
		}
	}
	
	function SaveMeds() {
	
		//foreach ($this->medlist as $a) {
		//	if (($a["medid"] != null) && ($a["medid"] > $this->medctr)) $this->medctr = $a["medid"];
		//}
		//echo "Saving...";
		$this->db->query("DELETE FROM reg_patient_med WHERE patid = '$this->patid'", true);
		$this->medctr = 0;
		//echo "deleted";
		foreach ($this->medlist as $med) {
			/*if ($med["crud"] == "U") {
				$sql = "UPDATE reg_patient_med SET patid='". $this->patid ."', medid='". $med["medid"] ."', name='".$med["name"]."', description='".$med["desc"]."' WHERE patid = '" .$this->patid . "' AND medid = '".  $med["medid"]. "'" ;
				echo $sql . "\n";
				$this->db->query($sql, true);
			}
			if ($med["crud"] == "C") {
				$this->AddMed($med["name"], $med["desc"]);
			}
			if ($med["crud"] == "D") {
				$this->DeleteMed($med["medid"]);
			}
			*/
			//echo "adding";
			$this->AddMed($med["name"], $med["desc"], $med["dose"], $med["freq"], $med["qty"]);
		}
	}
	
	function BuildList($crud, $medid, $name, $description, $dose, $qty, $freq)
	{
			$this->medlist[] = Array("crud"=>$crud, "medid" => $medid, "name"=>$name, "desc"=>$description, "dose"=>$dose, "qty"=>$qty, "freq"=>$freq);
	}
	
	function AddMed($name, $description, $dose, $qty, $freq)
	{
		$this->medctr++;
		$sql = "INSERT INTO reg_patient_med(patid, medid,name, description, TabDose, Qty, Frequency) 
		VALUES('$this->patid', '$this->medctr', '$name', '$description', '$dose', '$qty', '$freq')";
		echo $sql . "\n";
		$this->db->query($sql, true);

	}
	
	function DeleteMed($medid) {
	//delete
		$sql = "DELETE FROM reg_patient_med WHERE patid = '$this->patid' AND medid = '$medid'";
		echo $sql . "\n";
		$this->db->query($sql, true);
	
	}


}


?>