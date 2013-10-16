<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');




/**
 * Store Risk Evaluation
 */
class RiskEvaluation {

	// public attributes
	var $id;
	var $name;
	var $parent_folder;
	var $has_child = 0; // flag node has child
	var $is_group = 0;
	var $is_dynamic = 0;
	var $dynamic_query = '';
	var $assign_to_id;
	var $created_by;
	var $modified_by;
	var $date_created;
	var $date_modified;
	var $deleted;
	var $folder_type;

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
	function RiskEvalaution() {
		$this->db = DBManagerFactory::getInstance();
	}

	

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
	function addBean($bean, $user=null) {
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

	/**
	 * Builds up a metacollection of user/group folders to be passed to processor methods
	 * @param object User object, defaults to $current_user
	 * @return array Array of abstract folder objects
	 */
	function retrieveREForProcessing($user, $subscribed=true) {
		global $sugar_config;
		global $current_language, $current_user;

		$emails_mod_strings = return_module_language($current_language, "Emails");
		$myEmailTypeString = 'inbound';
		$myDraftsTypeString = 'draft';
		$mySentEmailTypeString = 'sent';

		if(empty($user)) {
			global $current_user;
			$user = $current_user;
		}
		$rootWhere = '';
        $teamSecurityClause = '';



    	$rootWhere .= "AND (f.parent_folder IS NULL OR f.parent_folder = '')";

		if($subscribed) {
			$q = $this->coreSubscribed.$teamSecurityClause.$this->coreWhereSubscribed."'{$user->id}' ".$rootWhere.$this->coreOrderBy;
		} else {
			$q = $this->core.$teamSecurityClause.$this->coreWhere.$rootWhere.$this->coreOrderBy;
		}
		$r = $this->db->query($q);
		$return = array();

		$found = array();
		while($a = $this->db->fetchByAssoc($r)) {
			if ((($a['folder_type'] == $myEmailTypeString) ||
				($a['folder_type'] == $myDraftsTypeString) ||
				($a['folder_type'] == $mySentEmailTypeString)) &&
				($a['created_by'] != $current_user->id)) {

				continue;
			} // if
			if (!isset($found[$a['id']])) {
                $found[$a['id']] = true;
			    $return[] = $a;
			}
		}
		return $return;
	}
  

	/**
	 * Flags a folder as deleted
	 * @return bool True on success
	 */
	function delete() {
		global $current_user;

		if(!empty($this->id)) {
			if($this->has_child) {
				$this->deleteChildrenCascade($this->id);
			}

			$ownerCheck = ($current_user->is_admin == 0) ? " AND created_by = '{$current_user->id}'" : "";
			$q = "UPDATE folders SET deleted = 1 WHERE id = '{$this->id}'{$ownerCheck}";
			$r = $this->db->query($q);
			return true;
		}
		return false;
	}

	

	/**
	 * Saves folder
	 * @return bool
	 */
	function save($addSubscriptions = TRUE) {
		global $current_user;

	

		if((empty($this->id) && $this->new_with_id == false) || (!empty($this->id) && $this->new_with_id == true))
		{

		    if( empty($this->id) )
		    {
			    $guid = create_guid();
			    $this->id = $guid;
		    }

			$q = "INSERT INTO REGPatient_Risk(id, name,  ".
				"created_by, modified_by, deleted)".

				" VALUES('{$this->id}', '{$this->name}',  " .
				"'{$current_user->id}', '{$current_user->id}', 0)";


			
			
		}
		else {
			$q = "UPDATE REGPatient_Risk SET name = '{$this->name}',  " .
				"modified_by = '{$current_user->id}' WHERE id = '{$this->id}'";
		}

		$this->db->query($q, true);

		return true;
	}

	
	}


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
	function retrieve($id) {
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
} // end class def