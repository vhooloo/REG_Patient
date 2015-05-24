<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


/**
 * Store Risk Evaluation
 */
class RiskEvaluation  extends SugarBean {

	// public attributes
	var $id;
	var $name;

	var $assign_to_id;
	var $created_by;
	var $modified_by;
	var $date_created;
	var $date_modified;
	var $deleted;

	 var	$id_c; 					//char(36) NOT NULL,
	 var	$pid;					//char(36) NOT NULL,
	 var	$ort; 	               //varchar(12) DEFAULT NULL,
	 var	$ort1a; 	               //varchar(12) DEFAULT NULL,
	 var	$ort1b; 	               //varchar(12) DEFAULT NULL,
	 var	$ort1c; 	               //varchar(12) DEFAULT NULL,
	 var	$ort2a; 	               //varchar(12) DEFAULT NULL,
	 var	$ort2b; 	               //varchar(12) DEFAULT NULL,
	 var	$ort2c; 	               //varchar(12) DEFAULT NULL,
	 var	$ort3 ;	               //varchar(12) DEFAULT NULL,
	 var	$ort4; 	               //varchar(12) DEFAULT NULL,
	 var	$ort5a; 	               //varchar(12) DEFAULT NULL,
	 var	$ort5b; 	               //varchar(12) DEFAULT NULL,
	 var	$ortsum; 	               //varchar(12) DEFAULT NULL,
	 var	$medd;	               //varchar(12) DEFAULT NULL,
	 var	$pulmonary; 	               //varchar(12) DEFAULT NULL,
	 var	$currentrx;	               //varchar(12) DEFAULT NULL,
	 var	$histopioid;	               //varchar(12) DEFAULT NULL,
	 var	$preocc;	               //varchar(12) DEFAULT NULL,
	 var	$unstable;	               //varchar(12) DEFAULT NULL,
	 var	$insecure;	               //varchar(12) DEFAULT NULL,
	 var	$prioraberrant;	               //varchar(12) DEFAULT NULL,
	 var	$ncmscore;	               //varchar(12) DEFAULT NULL,
	 var	$long_opioid;	               //varchar(12) DEFAULT 0,
	 var	$short_opioid;	               //varchar(12) DEFAULT 0,
	 var	$finalscore;	               //varchar(12) DEFAULT NULL,
	 var	$comment;	               //mediumtext DEFAULT NULL,
	 var    $lastmodified;            //date when was it last modified?


    var $comm_id_c;
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
	function RiskEvaluation() {
		$this->db = DBManagerFactory::getInstance();
		parent::SugarBean();
	}

	function getComm($patid) {
		
    	$sql = "SELECT * FROM reg_patient_comm where pid = '"  . $patid . "'";
		$sql = $this->db->query($sql);
		if ( ($a = $this->db->fetchByAssoc($sql)) != null) {
				 $this->comm_id_c =  	$a['id_c']; 	
				 $this->pid = 	 $a['pid'];	
				 //$this->ort =  	 $a['ort']; 	
				 $this->comm_terms["COMM-1"] =  	 $a['comm_1']; 	
				 $this->comm_terms["COMM_1"] =  	 $a['comm_1']; 
				 $this->comm_terms["COMM-2"]  =  	 $a['comm_2']; 	
				 $this->comm_terms["COMM-3"]  =  	 $a['comm_3']; 	
				 $this->comm_terms["COMM-4"]  =  	 $a['comm_4']; 	
				 $this->comm_terms["COMM-5"]  =  	 $a['comm_5']; 	
				 $this->comm_terms["COMM-6"]  =  	 $a['comm_6']; 	
				 $this->comm_terms["COMM-7"]   = 	 $a['comm_7'];	
				 $this->comm_terms["COMM-8"]  =  	 $a['comm_8']; 	
				 $this->comm_terms["COMM-9"]  =  	 $a['comm_9']; 	
				 $this->comm_terms["COMM-10"]  =  	 $a['comm_10']; 	
				 $this->comm_terms["COMM-11"]  =  	 $a['comm_11']; 	
				 $this->comm_terms["COMM-12"]  = 	 $a['comm_12'];	
				 $this->comm_terms["COMM-13"]  =  	 $a['comm_13']; 	
				 $this->comm_terms["COMM-14"]  = 	 $a['comm_14'];	
				 $this->comm_terms["COMM-15"]  = 	 $a['comm_15'];	
				 $this->comm_terms["COMM-16"]  = 	 $a['comm_16'];	
				 $this->comm_terms["COMM-17"]  = 	 $a['comm_17'];	
				 
				 if(isset($a['date_modified']) && !empty($a['date_modified'])) $this->lastmodified = strtotime($a['date_modified']) ; else $this->lastmodified = strtotime($a['date_entered']);

		}
		
		else return false; 
		return true;
	}
	 
	function getRisk($patid) {
		
    	$sql = "SELECT * FROM reg_patient_risk where pid = '"  . $patid . " ' LIMIT 1";

	
		$sql = $this->db->query($sql);
	
		if ( ($a = $this->db->fetchByAssoc($sql)) != null) {
				 $this->id_c =  	$a['id_c']; 	
				 $this->pid = 	 $a['pid'];	
				 //$this->ort =  	 $a['ort']; 	
				 $this->ort1a =  	 $a['ort1a']; 	
				 $this->ort1b =  	 $a['ort1b']; 	
				 $this->ort1c =  	 $a['ort1c']; 	
				 $this->ort2a =  	 $a['ort2a']; 	
				 $this->ort2b =  	 $a['ort2b']; 	
				 $this->ort2c =  	 $a['ort2c']; 	
				 $this->ort3  = 	 $a['ort3'];	
				 $this->ort4 =  	 $a['ort4']; 	
				 $this->ort5a =  	 $a['ort5a']; 	
				 $this->ort5b =  	 $a['ort5b']; 	
				 $this->ortsum =  	 $a['ortsum']; 	
				 $this->medd = 	 $a['medd'];	
				 $this->pulmonary =  	 $a['pulmonary']; 	
				 $this->currentrx = 	 $a['currentrx'];	
				 $this->histopioid = 	 $a['histopioid'];	
				 $this->preocc = 	 $a['preocc'];	
				 $this->unstable = 	 $a['unstable'];	
				 $this->insecure = 	 $a['insecure'];	
				 $this->short_opioid = 	 $a['short_opioid'];	
				 $this->long_opioid = 	 $a['long_opioid'];	
				 $this->prioraberrant = 	 $a['prioraberrant'];	
				 $this->ncmscore = 	 $a['ncmscore'];	
				 $this->comment = 	 $a['comment'];	
				 $this->finalscore = 	 $a['finalscore'];	 
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
	
    		$q = "UPDATE REG_PatientRisk SET deleted = 1 WHERE id = '{$this->id_c}'";
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
		//var $user; 
		
		//if($user == null) {
		//	$user = 'test';
		//}
     
		if(empty($this->id_c))
		{

			    $guid = create_guid();
			    $this->id_c = $guid;

			$q = "INSERT INTO reg_patient_risk(id_c, pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, ortsum, medd, pulmonary, currentrx, histopioid, preocc, unstable, insecure, prioraberrant,short_opioid, long_opioid,ncmscore, finalscore,comment, created_by, date_entered)".	" VALUES('{$this->id_c}', '{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$this->ortsum}', '{$this->medd}', '{$this->pulmonary}', '{$this->currentrx}', '{$this->histopioid}', '{$this->preocc}', '{$this->unstable}', '{$this->insecure}', '{$this->prioraberrant}', '{$this->short_opioid}', '{$this->long_opioid}', '{$this->ncmscore}', '{$this->finalscore}', '{$this->comment}','{$current_user->id}', NOW())";
			$GLOBALS['log']->fatal('sql::'.$q);
		
			$q_history = "INSERT INTO reg_patient_risk_history(pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, ortsum, medd, pulmonary, currentrx, histopioid, preocc, unstable, insecure, prioraberrant, short_opioid, long_opioid, ncmscore, finalscore, comment, created_by, date_entered)".	" VALUES('{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$this->ortsum}', '{$this->medd}', '{$this->pulmonary}', '{$this->currentrx}', '{$this->histopioid}', '{$this->preocc}', '{$this->unstable}', '{$this->insecure}', '{$this->prioraberrant}', '{$this->short_opioid}', '{$this->long_opioid}', '{$this->ncmscore}', '{$this->finalscore}', '{$this->comment}', '{$current_user->id}', NOW())";
			$GLOBALS['log']->fatal('sql::'.$q_history);
			
			$GLOBALS['log']->fatal('{this->id_c}');
		}
		else {
	

			$q = "UPDATE reg_patient_risk SET   ort1a = '{$this->ort1a}',  ort1b = '{$this->ort1b}', ort1c = '{$this->ort1c}', ort2a = '{$this->ort2a}', ort2b = '{$this->ort2b}', ort2c = '{$this->ort2c}', ort3 = '{$this->ort3}', ort4 = '{$this->ort4}', ort5a = '{$this->ort5a}', ort5b = '{$this->ort5b}', ortsum = '{$this->ortsum}', medd = '{$this->medd}', pulmonary = '{$this->pulmonary}', currentrx = '{$this->currentrx}', histopioid = '{$this->histopioid}', preocc = '{$this->preocc}', unstable = '{$this->unstable}', insecure = '{$this->insecure}', prioraberrant = '{$this->prioraberrant}', short_opioid = '{$this->short_opioid}', long_opioid = '{$this->long_opioid}', ncmscore = '{$this->ncmscore}', finalscore = '{$this->finalscore}', comment = '{$this->comment}', modified_user_id = '{$current_user->id}', date_modified = NOW() WHERE id_c = '{$this->id_c}'";
			
			$GLOBALS['log']->fatal('sql::'.$q);

			$q_history = "INSERT INTO reg_patient_risk_history(pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, ortsum, medd, pulmonary, currentrx, histopioid, preocc, unstable, insecure, prioraberrant, short_opioid, long_opioid, ncmscore, finalscore, comment, created_by, date_entered)".	" VALUES('{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$this->ortsum}', '{$this->medd}', '{$this->pulmonary}', '{$this->currentrx}', '{$this->histopioid}', '{$this->preocc}', '{$this->unstable}', '{$this->insecure}', '{$this->prioraberrant}', '{$this->short_opioid}', '{$this->long_opioid}', '{$this->ncmscore}', '{$this->finalscore}', '{$this->comment}', '{$current_user->id}', NOW())";
			$GLOBALS['log']->fatal('sql::'.$q_history);


			$GLOBALS['log']->fatal(" '{this->id_c}' ".$v);

		}
    
		echo $q . " ++" . $q_history;
		$this->db->query($q, true);
		echo "try to save 1";
		$this->db->query($q_history, true);
		echo "try to save 2";
		  if( empty($this->comm_id_c) )
		    {
			    $guid = create_guid();
			    $this->comm_id_c = $guid;
		    echo "new save {$this->comm_terms['COMM-1']} ccc" . $this->comm_terms["COMM-1"]; 

			//$q = "INSERT INTO reg_patient_risk(id_c,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, created_by, modified_by, deleted)".	" VALUES('{$this->id_c}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}','{$current_user->id}', '{$current_user->id}', 0)";
			$q = "INSERT INTO reg_patient_comm(id_c, pid,  comm_1, comm_2, comm_3, comm_4, comm_5, comm_6, comm_7, comm_8, comm_9, comm_10,  comm_11, comm_12, comm_13, comm_14, comm_15, comm_16, comm_17, created_by, date_modified)".	" VALUES('{$this->comm_id_c}', '{$this->pid}',  ".$this->comm_terms['COMM-1'].",  ".$this->comm_terms['COMM-2'].", ".$this->comm_terms['COMM-3'].", ".$this->comm_terms['COMM-4'].", ".$this->comm_terms['COMM-5'].", ".$this->comm_terms['COMM-6'].", ".$this->comm_terms['COMM-7'].", ".$this->comm_terms['COMM-8'].", ".$this->comm_terms['COMM-9'].", ".$this->comm_terms['COMM-10'].", ".$this->comm_terms['COMM-11'].", ".$this->comm_terms['COMM-12'].", ".$this->comm_terms['COMM-13'].", ".$this->comm_terms['COMM-14'].", ".$this->comm_terms['COMM-15'].", ".$this->comm_terms['COMM-16'].", ".$this->comm_terms['COMM-17'].", '{$current_user->id}', NOW())";
			//$GLOBALS['log']->fatal('sql::'.$q);
		
			$q_history = "INSERT INTO reg_patient_comm_history(id_c, pid,  comm_1, comm_2, comm_3, comm_4, comm_5, comm_6, comm_7, comm_8, comm_9, comm_10,  comm_11, comm_12, comm_13, comm_14, comm_15, comm_16, comm_17, created_by, date_modified)".	" VALUES('{$this->comm_id_c}', '{$this->pid}',  ".$this->comm_terms['COMM-1'].",  ".$this->comm_terms['COMM-2'].", ".$this->comm_terms['COMM-3'].", ".$this->comm_terms['COMM-4'].", ".$this->comm_terms['COMM-5'].", ".$this->comm_terms['COMM-6'].", ".$this->comm_terms['COMM-7'].", ".$this->comm_terms['COMM-8'].", ".$this->comm_terms['COMM-9'].", ".$this->comm_terms['COMM-10'].", ".$this->comm_terms['COMM-11'].", ".$this->comm_terms['COMM-12'].", ".$this->comm_terms['COMM-13'].", ".$this->comm_terms['COMM-14'].", ".$this->comm_terms['COMM-15'].", ".$this->comm_terms['COMM-16'].", ".$this->comm_terms['COMM-17'].", '{$current_user->id}', NOW())";
			//$GLOBALS['log']->fatal('sql::'.$q_history);
			
			//$GLOBALS['log']->fatal('{this->id_c}');
		}
		else {
	

			$q = "UPDATE reg_patient_comm SET  comm_1 = ".$this->comm_terms['COMM-1'].",  comm_2 = ".$this->comm_terms['COMM-2'].", comm_3 = ".$this->comm_terms['COMM-3'].", comm_4 = ".$this->comm_terms['COMM-4'].", comm_5 = ".$this->comm_terms['COMM-5'].", comm_6 = ".$this->comm_terms['COMM-6'].", comm_7 = ".$this->comm_terms['COMM-7'].", comm_8 = ".$this->comm_terms['COMM-8'].", comm_9 = ".$this->comm_terms['COMM-9'].", comm_10 = ".$this->comm_terms['COMM-10'].", comm_11 = ".$this->comm_terms['COMM-11'].", comm_12 = ".$this->comm_terms['COMM-12'].", comm_13 = ".$this->comm_terms['COMM-13'].", comm_14 = ".$this->comm_terms['COMM-14'].", comm_15 = ".$this->comm_terms['COMM-15'].", comm_16 = ".$this->comm_terms['COMM-16'].", comm_17= ".$this->comm_terms['COMM-17'].", created_by = '{$current_user->id}', date_modified = NOW() WHERE id_c = '{$this->comm_id_c}'";
			
			//$q = "UPDATE reg_patient_comm SET  comm_1 = ".$this->comm_terms['COMM-1'].",  comm_2 = ".$this->comm_terms['COMM-2'].", comm_3 = ".$this->comm_terms['COMM-3'].", comm_4 = ".$this->comm_terms['COMM-4'].", comm_5 = ".$this->comm_terms['COMM-5'].", comm_6 = ".$this->comm_terms['COMM-6'].", comm_7 = ".$this->comm_terms['COMM-7'].", comm_8 = ".$this->comm_terms['COMM-8'].", comm_9 = ".$this->comm_terms['COMM-9'].", comm_10 = ".$this->comm_terms['COMM-10'].", comm_11 = " . $this->comm_terms['COMM-11'].", comm_12 = ".$this->comm_terms['COMM-12'].", comm_13 = ".$this->comm_terms['COMM-13'];
			
			//$GLOBALS['log']->fatal('sql::'.$q);
			$guid = create_guid();
			$this->comm_id_c = $guid;

			$q_history = "INSERT INTO reg_patient_comm_history(id_c, pid,  comm_1, comm_2, comm_3, comm_4, comm_5, comm_6, comm_7, comm_8, comm_9, comm_10,  comm_11, comm_12, comm_13, comm_14, comm_15, comm_16, comm_17, created_by, date_modified)".	" VALUES('{$this->comm_id_c}', '{$this->pid}',  ".$this->comm_terms['COMM-1'].",  ".$this->comm_terms['COMM-2'].", ".$this->comm_terms['COMM-3'].", ".$this->comm_terms['COMM-4'].", ".$this->comm_terms['COMM-5'].", ".$this->comm_terms['COMM-6'].", ".$this->comm_terms['COMM-7'].", ".$this->comm_terms['COMM-8'].", ".$this->comm_terms['COMM-9'].", ".$this->comm_terms['COMM-10'].", ".$this->comm_terms['COMM-11'].", ".$this->comm_terms['COMM-12'].", ".$this->comm_terms['COMM-13'].", ".$this->comm_terms['COMM-14'].", ".$this->comm_terms['COMM-15'].", ".$this->comm_terms['COMM-16'].", ".$this->comm_terms['COMM-17'].", '{$current_user->id}', NOW())";
			//$GLOBALS['log']->fatal('sql::'.$q_history);
		//	die($q_history);

			//$GLOBALS['log']->fatal(" '{this->id_c}' ".$v);
			//$GLOBALS['log']->fatal(" '{this->id_c}' ");
		}
		//echo $q;
        $this->db->query($q, true);
		//echo $q_history;
        $this->db->query($q_history, true);
		return true;
	}

	
	
} // end class def