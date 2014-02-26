<?php

class REG_PatientReportView extends REG_Patient{
	
	function create_new_list_query($order_by, $where,$filter=array(),$params=array(), $show_deleted = 0,$join_type='', $return_array = false,$parentbean=null, $singleSelect = false)
	{

		//return  parent::create_new_list_query($order_by, $where, $filter, $params, $show_deleted, $join_type, $return_array, $parentbean, $singleSelect);

		$ret_array['select'] =  'SELECT p.id,CONCAT(p.first_name," ",p.last_name) as name,p.dob,p.gender ';
		$ret_array['from'] = ' FROM reg_patient p ';
        $ret_array['where'] = ' WHERE p.id not in (SELECT distinct pe.reg_patient_reg_encounterreg_patient_ida FROM `reg_patient_reg_encounter_c` pe, reg_encounter_cstm e WHERE pe.reg_patient_reg_encounterreg_encounter_idb=e.id_c AND e.last_pmp_review_done_c is not null)';
		$ret_Array['order_by'] = ' ORDER BY p.last_name ASC ';
		return $ret_array;


	}
}

?>