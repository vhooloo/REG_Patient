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
	 var	$finalscore;	               //varchar(12) DEFAULT NULL,

	var $db;
	var $new_with_id = false;

	// core queries
	var $core = "SELECT f.id, f.name, f.has_child, f.is_group, f.is_dynamic, f.dynamic_query, f.folder_type, f.created_by, i.deleted FROM folders f left join inbound_email i on f.id = i.groupfolder_id ";
	var $coreSubscribed = "SELECT f.id, f.name, f.has_child, f.is_group, f.is_dynamic, f.dynamic_query, f.folder_type, f.created_by, i.deleted FROM folders f LEFT JOIN folders_subscriptions fs ON f.id = fs.folder_id LEFT JOIN inbound_email i on  i.groupfolder_id = f.id ";
	var $coreWhere = "WHERE f.deleted = 0 ";
	var $coreWhereSubscribed = "WHERE f.deleted = 0 AND fs.assigned_user_id = ";
	var $coreOrderBy = " ORDER BY f.is_dynamic, f.is_group, f.name ASC ";

	var $hrSortLocal = array(
            'flagged' => 'type',
            'status'  => 'reply_to_status',
            'from'    => 'emails_text.from_addr',
            'subject' => 'name',
            'date'    => 'date_sent',
            'AssignedTo' => 'assigned_user_id',
            'flagged' => 'flagged'
        );
    var $defaultSort = 'date';
    var $defaultDirection = "DESC";

	// private attributes
	var $_depth;

	/**
	 * Sole constructor
	 */
	function RiskEvaluation() {
		$this->db = DBManagerFactory::getInstance();
		parent::SugarBean();
	}

/*	

	function getCountItems ( $folderId ) {
		global $current_user ;
		global $beanList ;
		global $sugar_config ;
		global $app_strings ;

		$this->retrieve ( $folderId ) ;
		if ($this->is_dynamic) {
	    	$pattern = '/SELECT(.*?)(\s){1}FROM(\s){1}/is';  // ignores the case
	    	$replacement = 'SELECT count(*) c FROM ';
	    	$modified_select_query = preg_replace($pattern, $replacement, $this->generateSugarsDynamicFolderQuery(), 1);
	    	$r = $this->db->query ( from_html ( $modified_select_query )) ;
		} else {
			// get items and iterate through them
			$q = "SELECT count(*) c FROM folders_rel JOIN emails ON emails.id = folders_rel.polymorphic_id" .
			" WHERE folder_id = '{$folderId}' AND folders_rel.deleted = 0 AND emails.deleted = 0" ;
			if ($this->is_group) {
				$q .= " AND (emails.assigned_user_id is null or emails.assigned_user_id = '')";
			}
			$r = $this->db->query ( $q ) ;
		}

		$a = $this->db->fetchByAssoc($r);
		return $a['c'];
	}

    


	/**
	 * Convenience method, pass a SugarBean and User to this to add anything to a given folder
	 */
/*	function addBean($bean, $user=null) {
		if(empty($bean->id) || empty($bean->module_dir)) {
			$GLOBALS['log']->fatal("*** FOLDERS: addBean() got empty bean - not saving");
			return false;
		} elseif(empty($this->id)) {
			$GLOBALS['log']->fatal("*** FOLDERS: addBean() is trying to save to a non-saved or non-existent folder");
			return false;
		}

		global $current_user;
		if($user == null) {
			$user = $current_user;
		}

		$guid = create_guid();

		$q = "INSERT INTO REGPatient_Risk (id, name)
				VALUES('{$guid}', '{$this->name}')";
		$r = $this->db->query($q);
		return true;
	}


	 */
	 
	function getRisk($patid) {
		
    	$sql = "SELECT * FROM reg_patient_risk where pid = '"  . $patid . "'";

		
		$sql = $this->db->query($sql);
	
		if ( ($a = $this->db->fetchByAssoc($sql)) != null) {
				 $this->id_c =  	$a['id_c']; 	
				 $this->pid = 	 $a['pid'];	
				 $this->ort =  	 $a['ort']; 	
				 $this->ort1a =  	 $a['ort1a']; 	
				 $this->ort1b =  	 $a['ort1b']; 	
				 $this->ort1c =  	 $a['ort1c']; 	
				 $this->ort2a =  	 $a['ort2a']; 	
				 $this->ort2b =  	 $a['ort2b']; 	
				 $this->ort2c =  	 $a['ort2c']; 	
				 $this->ort3  = 	 $a['ort3 '];	
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
				 $this->prioraberrant = 	 $a['prioraberrant'];	
				 $this->ncmscore = 	 $a['ncmscore'];	
				 $this->finalscore = 	 $a['finalscore'];	 
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
     
		if((empty($this->id_c) && $this->new_with_id == false) || (!empty($this->id_c) && $this->new_with_id == true))
		{

		    if( empty($this->id_c) )
		    {
			    $guid = create_guid();
			    $this->id_c = $guid;
		    }

			//$q = "INSERT INTO reg_patient_risk(id_c,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, created_by, modified_by, deleted)".	" VALUES('{$this->id_c}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}','{$current_user->id}', '{$current_user->id}', 0)";
			$q = "INSERT INTO reg_patient_risk(id_c, pid,  ort1a, ort1b, ort1c, ort2a, ort2b, ort2c, ort3, ort4, ort5a, ort5b, created_by, date_entered)".	" VALUES('{$this->id_c}', '{$this->pid}',  '{$this->ort1a}',  '{$this->ort1b}', '{$this->ort1c}', '{$this->ort2a}', '{$this->ort2b}', '{$this->ort2c}', '{$this->ort3}', '{$this->ort4}', '{$this->ort5a}', '{$this->ort5b}', '{$current_user->id}', NOW())";
			$GLOBALS['log']->fatal('sql::'.$q);
			$GLOBALS['log']->fatal('{this->id_c}');
		}
		else {

			//$q = "UPDATE reg_patient_risk SET   modified_by = '{$current_user->id}', ort1a = '{$this->ort1a}',  ort1b = '{$this->ort1b}', ort1c = '{$this->ort1c}', ort2a = '{$this->ort2a}', ort2b = '{$this->ort2b}', ort2c = '{$this->ort2c}', ort3 = '{$this->ort3}', ort4 = '{$this->ort4}', ort5a = '{$this->ort5a}', ort5b = '{$this->ort5b}' WHERE id_c = '{$this->id_c}'";
			$q = "UPDATE reg_patient_risk SET   ort1a = '{$this->ort1a}',  ort1b = '{$this->ort1b}', ort1c = '{$this->ort1c}', ort2a = '{$this->ort2a}', ort2b = '{$this->ort2b}', ort2c = '{$this->ort2c}', ort3 = '{$this->ort3}', ort4 = '{$this->ort4}', ort5a = '{$this->ort5a}', ort5b = '{$this->ort5b}', modified_user_id = '{$current_user->id}', date_modified = NOW() WHERE id_c = '{$this->id_c}'";
			
			$GLOBALS['log']->fatal('sql::'.$q);
			$GLOBALS['log']->fatal(" '{this->id_c}' " . $v);
		}
    
		
		$this->db->query($q, true);
     
		return true;
	}

	
	

/*
	function updateFolder($fields) {
		global $current_user;

		$this->dynamic_query = $this->db->quote($this->dynamic_query);
		$id = $fields['record'];
		$name = $fields['name'];
		$parent_folder = $fields['parent_folder'];
		// first do the retrieve
		$this->retrieve($id);
		


		$this->name = $name;
		$this->parent_folder = $parent_folder;
		$q2 = "UPDATE folders SET name = '{$this->name}', parent_folder = '{$this->parent_folder}', 			dynamic_query = '{$this->dynamic_query}', " .
			"modified_by = '{$current_user->id}' WHERE id = '{$this->id}'";
		$r2 = $this->db->query($q2);
		if (!empty($this->parent_folder)) {
			$q3 = "UPDATE folders SET has_child = 1 WHERE id = '{$this->parent_folder}'";
			$r3 = $this->db->query($q3);
		} // if
		return array('status' => "done");

	} // fn

	

	/**
	 * Retrieves and populates object
	 * @param string $id ID of folder
	 * @return bool True on success
	 */
/*	function retrieve($id) {
		$q = "SELECT * FROM REGPatient_Risk WHERE id = '{$id}' AND deleted = 0";
		$r = $this->db->query($q);
		$a = $this->db->fetchByAssoc($r);

		if(!empty($a)) {
			foreach($a as $k => $v) {
				if($k == 'dynamic_query') {
					$v = from_html($v);
				}
				$this->$k = $v;
			}
			return true;
		}

		return false;
	}
*/	
} // end class def