<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');




/**
 * Store Risk Evaluation
 */
class RiskComm  extends SugarBean {



	 var	$id_c; 					//char(36) NOT NULL,
	 var	$pid;					//char(36) NOT NULL,
	 var	$comm_1; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_2; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_3; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_4; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_5; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_6; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_7; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_8;	               //varchar(12) DEFAULT NULL,
	 var	$comm_9; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_10; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_11; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_12; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_13;	               //varchar(12) DEFAULT NULL,
	 var	$comm_14; 	               //varchar(12) DEFAULT NULL,
	 var	$comm_15;	               //varchar(12) DEFAULT NULL,
	 var	$comm_16;	               //varchar(12) DEFAULT NULL,
	 var	$comm_17;	               //varchar(12) DEFAULT NULL,
	 var    $lastmodified;            //date when was it last modified?

	 
	 //var $comm_terms;
	 
	 var $comm_terms = array( 	"COMM-1" => 0,
								"COMM-2" => 0,
								"COMM-3" => 0,
								"COMM-4" => 0,
								"COMM-5" => 0,
								"COMM-6" => 0,
								"COMM-7" => 0,
								"COMM-8" => 0,
								"COMM-9" => 0,
								"COMM-10" => 0,
								"COMM-11" => 0,
								"COMM-12" => 0,
								"COMM-13" => 0,
								"COMM-14" => 0,
								"COMM-15" => 0,
								"COMM-16" => 0,
								"COMM-17" => 0					
							);
	 var $comm_labels = array ( "COMM-1" ,
								"COMM-2" ,
								"COMM-3" ,
								"COMM-4" ,
								"COMM-5" ,
								"COMM-6" ,
								"COMM-7" ,
								"COMM-8" ,
								"COMM-9" ,
								"COMM-10" ,
								"COMM-11" ,
								"COMM-12" ,
								"COMM-13" ,
								"COMM-14" ,
								"COMM-15" ,
								"COMM-16" ,
								"COMM-17" 					
							);
	var $db;
	var $new_with_id = false;



	/**
	 * Sole constructor
	 */
	function RiskComm() {
		$this->db = DBManagerFactory::getInstance();
		parent::SugarBean();
	}

/
	 
	function getComm($patid) {
		
    	$sql = "SELECT * FROM reg_patient_comm where pid = '"  . $patid . "'";

		
		$sql = $this->db->query($sql);
	
		if ( ($a = $this->db->fetchByAssoc($sql)) != null) {
				 $this->id_c =  	$a['id_c']; 	
				 $this->pid = 	 $a['pid'];	
				 //$this->ort =  	 $a['ort']; 	
				 $this->comm_1 =  	 $a['comm_1']; 	
				 $this->comm_2 =  	 $a['comm_2']; 	
				 $this->comm_3 =  	 $a['comm_3']; 	
				 $this->comm_4 =  	 $a['comm_4']; 	
				 $this->comm_5 =  	 $a['comm_5']; 	
				 $this->comm_6 =  	 $a['comm_6']; 	
				 $this->comm_7  = 	 $a['comm_7'];	
				 $this->comm_8 =  	 $a['comm_8']; 	
				 $this->comm_9 =  	 $a['comm_9']; 	
				 $this->comm_10 =  	 $a['comm_10']; 	
				 $this->comm_11 =  	 $a['comm_11']; 	
				 $this->comm_12 = 	 $a['comm_12'];	
				 $this->comm_12 =  	 $a['comm_13']; 	
				 $this->comm_14 = 	 $a['comm_14'];	
				 $this->comm_15 = 	 $a['comm_15'];	
				 $this->comm_16 = 	 $a['comm_16'];	
				 $this->comm_17 = 	 $a['comm_17'];	
		
				 
				 if(isset($a['date_modified']) && !empty($a['date_modified'])) $this->lastmodified = strtotime($a['date_modified']) ; else $this->lastmodified = strtotime($a['date_entered']);
		}
		else return false;
		return true;
	}
  

	/**
	 * Flags a record as deleted
	 * @return bool True on success
	 */
	function delete() {


		if(!empty($this->id_c)) {
	
    		$q = "UPDATE REG_Patient_Comm SET deleted = 1 WHERE id = '{$this->id_c}'";
			$r = $this->db->query($q);
			return true;
		}
		return false;
	}

	

	/**
	 * Saves risk
	 * @return bool
	 */
	function save() {
	
		global $current_user;

		if((empty($this->id_c) && $this->new_with_id == false) || (!empty($this->id_c) && $this->new_with_id == true))
		{

		    if( empty($this->id_c) )
		    {
			    $guid = create_guid();
			    $this->id_c = $guid;
		    }

			
			$q = "INSERT INTO reg_patient_risk(id_c, pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, ortsum, medd, pulmonary, currentrx, histopioid, preocc, unstable, insecure, prioraberrant,short_opioid, long_opioid,ncmscore, finalscore,comment, created_by, date_entered)".	" VALUES('{$this->id_c}', '{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$this->ortsum}', '{$this->medd}', '{$this->pulmonary}', '{$this->currentrx}', '{$this->histopioid}', '{$this->preocc}', '{$this->unstable}', '{$this->insecure}', '{$this->prioraberrant}', '{$this->short_opioid}', '{$this->long_opioid}', '{$this->ncmscore}', '{$this->finalscore}', '{$this->comment}','{$current_user->id}', NOW())";
			$GLOBALS['log']->fatal('sql::'.$q);
		
			$q_history = "INSERT INTO reg_patient_risk_history(pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, ortsum, medd, pulmonary, currentrx, histopioid, preocc, unstable, insecure, prioraberrant, short_opioid, long_opioid, ncmscore, finalscore, comment, created_by, date_entered)".	" VALUES('{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$this->ortsum}', '{$this->medd}', '{$this->pulmonary}', '{$this->currentrx}', '{$this->histopioid}', '{$this->preocc}', '{$this->unstable}', '{$this->insecure}', '{$this->prioraberrant}', '{$this->short_opioid}', '{$this->long_opioid}', '{$this->ncmscore}', '{$this->finalscore}', '{$this->comment}', '{$current_user->id}', NOW())";

		}
		else {
	
			
			$q = "UPDATE reg_patient_risk SET   ort1a = '{$this->ort1a}',  ort1b = '{$this->ort1b}', ort1c = '{$this->ort1c}', ort2a = '{$this->ort2a}', ort2b = '{$this->ort2b}', ort2c = '{$this->ort2c}', ort3 = '{$this->ort3}', ort4 = '{$this->ort4}', ort5a = '{$this->ort5a}', ort5b = '{$this->ort5b}', ortsum = '{$this->ortsum}', medd = '{$this->medd}', pulmonary = '{$this->pulmonary}', currentrx = '{$this->currentrx}', histopioid = '{$this->histopioid}', preocc = '{$this->preocc}', unstable = '{$this->unstable}', insecure = '{$this->insecure}', prioraberrant = '{$this->prioraberrant}', short_opioid = '{$this->short_opioid}', long_opioid = '{$this->long_opioid}', ncmscore = '{$this->ncmscore}', finalscore = '{$this->finalscore}', comment = '{$this->comment}', modified_user_id = '{$current_user->id}', date_modified = NOW() WHERE id_c = '{$this->id_c}'";
			
			$GLOBALS['log']->fatal('sql::'.$q);

			$q_history = "INSERT INTO reg_patient_risk_history(pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, ortsum, medd, pulmonary, currentrx, histopioid, preocc, unstable, insecure, prioraberrant, short_opioid, long_opioid, ncmscore, finalscore, comment, created_by, date_entered)".	" VALUES('{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$this->ortsum}', '{$this->medd}', '{$this->pulmonary}', '{$this->currentrx}', '{$this->histopioid}', '{$this->preocc}', '{$this->unstable}', '{$this->insecure}', '{$this->prioraberrant}', '{$this->short_opioid}', '{$this->long_opioid}', '{$this->ncmscore}', '{$this->finalscore}', '{$this->comment}', '{$current_user->id}', NOW())";
			$GLOBALS['log']->fatal('sql::'.$q_history);
		

			
		}
    
		
		$this->db->query($q, true);
		$this->db->query($q_history, true);
     
		return true;
	}

	

} // end class def