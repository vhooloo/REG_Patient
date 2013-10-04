<?php



class REG_PatientListView extends REG_Patient{
	
	function create_new_list_query($order_by, $where,$filter=array(),$params=array(), $show_deleted = 0,$join_type='', $return_array = false,$parentbean=null, $singleSelect = false)
	{
		
		
		return  parent::create_new_list_query($order_by, $where, $filter, $params, $show_deleted, $join_type, $return_array, $parentbean, $singleSelect);
		
		//$ret_array['select'] =  'SELECT  reg_patient.id id, reg_patient.last_name name ';
		//$ret_array['from'] = ' FROM reg_patient ';
        //$ret_array['where'] = ' WHERE 1 = 1';
		//$ret_Array['order_by'] = ' ORDER BY reg_patient.last_name ASC ';
		//return $ret_array;



	}
}

?>