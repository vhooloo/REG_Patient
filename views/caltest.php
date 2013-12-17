<?php

require_once('include/MVC/View/views/view.list.php');
require_once('modules/Calendar/Calendar.php');
require_once('modules/Calendar/CalendarDisplay.php');
require_once("modules/Calendar/CalendarGrid.php");

Class caltest{

public function test(){
global $cal_strings, $current_language;
$cal_strings = return_module_language($current_language, 'Calendar');

if(empty($_REQUEST['view'])){
	$_REQUEST['view'] = SugarConfig::getInstance()->get('calendar.default_view','week');
}

$cal = new Calendar($_REQUEST['view']);

if(in_array($cal->view,array('day','week','month'))){
	$cal->add_activities($GLOBALS['current_user']);	
}else if($cal->view == 'shared'){
	$cal->init_shared();	
	global $shared_user;				
	$shared_user = new User();	
	foreach($cal->shared_ids as $member){
		$shared_user->retrieve($member);
		$cal->add_activities($shared_user);
	}
}

if(in_array($cal->view, array("day","week","month","shared"))){
	$cal->load_activities();
}

if (!empty($_REQUEST['print']) && $_REQUEST['print'] == 'true') {
    $cal->setPrint(true);
}
/*
$_REQUEST['year']='2014';
$_REQUEST['month']='12';
$_REQUEST['day']='8';*/
//var_dump($_REQUEST);
	
$display = new CalendarDisplay($cal);
echo "<div style='width:448px'>"	;	
$display->display_calendar_header(false);

		$display->display();
	echo "</div>";
}

}
?>