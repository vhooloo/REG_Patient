<?php
global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
//require_once ($theme_path."layout_utils.php");
$session_pid = "P".$_REQUEST['record'];
echo '<head>

<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>Patient » SugarCRM</title>
<link href="cache/themes/Sugar5/css/yui.css?v=GogGz9QEok1-e0Ft6rexxQ" type="text/css" rel="stylesheet"><link href="include/javascript/jquery/themes/base/jquery.ui.all.css" type="text/css" rel="stylesheet"><link href="cache/themes/Sugar5/css/deprecated.css?v=GogGz9QEok1-e0Ft6rexxQ" type="text/css" rel="stylesheet"><link href="cache/themes/Sugar5/css/style.css?v=GogGz9QEok1-e0Ft6rexxQ" type="text/css" rel="stylesheet">
<script>jscal_today = 1000*1378860577; if(typeof app_strings == "undefined") app_strings = new Array();</script><script src="cache/include/javascript/sugar_grp1_jquery.js?v=GogGz9QEok1-e0Ft6rexxQ" type="text/javascript"></script><script src="cache/include/javascript/sugar_grp1_yui.js?v=GogGz9QEok1-e0Ft6rexxQ" type="text/javascript"></script><script src="cache/include/javascript/sugar_grp1.js?v=GogGz9QEok1-e0Ft6rexxQ" type="text/javascript"></script><script src="include/javascript/calendar.js?v=GogGz9QEok1-e0Ft6rexxQ" type="text/javascript"></script><script>
SUGAR.config.stockAjaxBannedModules = ["Calendar","Emails","Campaigns","Documents","DocumentRevisions","Project","ProjectTask","EmailMarketing","CampaignLog","CampaignTrackers","Releases","Groups","EmailMan","Administration","ModuleBuilder","Schedulers","SchedulersJobs","DynamicFields","EditCustomFields","EmailTemplates","Users","Currencies","Trackers","Connectors","Import_1","Import_2","Versions","vCals","CustomFields","Roles","Audit","InboundEmail","SavedSearch","UserPreferences","MergeRecords","EmailAddresses","Relationships","Employees","Import","OAuthKeys"];
SUGAR.config.disableAjaxUI = false;</script>
<script type="text/javascript">SUGAR.themes.image_server="";</script><script type="text/javascript">var name_format = "s f l";</script><script type="text/javascript">
	var time_reg_format = \'([0-9]{1,2}):([0-9]{1,2})([ ]*[ap]m)\';
	var date_reg_format = \'([0-9]{1,2})/([0-9]{1,2})/([0-9]{4})\';
	var date_reg_positions = { \'m\': 1,\'d\': 2,\'Y\': 3 };
	var time_separator = \':\';
	var cal_date_format = \'%m/%d/%Y\';
	var time_offset = 19800;
	var num_grp_sep = \',\';
	var dec_sep = \'.\';
</script><script src="cache/jsLanguage/en_us.js?v=-gIABtiJm8EHZgW0ORQT3w" type="text/javascript"></script><script src="cache/jsLanguage/REG_Patient/en_us.js?v=-gIABtiJm8EHZgW0ORQT3w" type="text/javascript"></script><script type="text/javascript">
var sugar_cache_dir = \'cache/\';
var module_sugar_grp1 = \'REG_Patient\';
var action_sugar_grp1 = \'ajaxui\';
</script>
<script src="cache/themes/Sugar5/js/style.js?v=GogGz9QEok1-e0Ft6rexxQ" type="text/javascript"></script>



<script src="cache/include/javascript/sugar_field_grp.js?v=GogGz9QEok1-e0Ft6rexxQ" type="text/javascript"></script>
<link href="themes/Sugar5/images/sugar_icon.ico?v=GogGz9QEok1-e0Ft6rexxQ" type="image/x-icon" rel="icon"><script id="yui_3_3_0_1_13788423908072" type="text/javascript" charset="utf-8" src="http://yui.yahooapis.com/combo?3.3.0/build/oop/oop-min.js&amp;3.3.0/build/event-custom/event-custom-base-min.js&amp;3.3.0/build/io/io-base-min.js"></script>';

echo "
	<!--script src='custom/jquery/jquery-1.9.1.js' /-->
	<!--script src='custom/jquery/accordion/js/jquery-ui-1.10.0.custom.js' /-->
	<!--script src='custom/jquery/accordion/js/jquery-migrate-1.2.1.min.js' /-->
	<link rel='stylesheet' type='text/css' href='themes/" . $theme . "/style.css' />
<script type='text/javascript'>




				function set_session(a,b){var xmlhttp;

                if (window.XMLHttpRequest) {
                    xmlhttp=new XMLHttpRequest();
                } else {
                    xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
                }

                xmlhttp.onreadystatechange=function() {
				 
                    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                        // Do stuff when script returns
                       
                    }
                }

                xmlhttp.open('GET','index.php?entryPoint=session_setting_variable&' + 'id=".$session_pid."' + a + '&value='+b+ '&t='+Math.random(),true);
                xmlhttp.send();
				
            }
			

	</script>
	

	

	</head>";
	
echo '<script type="text/javascript">
$(document).ready(function() {
	

	var options;

	if ( document.getElementById("stickynotes_history_c").value != "" )
     	{ try {options = JSON.parse(\'{"notes":\' + document.getElementById("stickynotes_history_c").value + \'}\'); $("#notes").stickyNotes(options);}  catch(err){$("#notes").stickyNotes();}  }
	else { $("#notes").stickyNotes();}
});
</script>
';


global $mod_strings;
global $app_list_strings;
global $app_strings;
require_once('include/DetailView/DetailView2.php');
require_once('include/EditView/EditView2.php');
require_once('custom/Modules/REG_Patient/RefillCommon.php');
TemplateHandler::clearCache('REG_Encounter','EditView.tpl');   //ADDED :--------> to prevent reg_encounter edit view from caching
		$this->ss = new Sugar_Smarty();
		$this->dv3 = new EditView();
        $this->dv3->ss =& $this->ss;
		$encounterMetadataFile = 'custom/modules/REG_Encounter/editviewdefs_inprescriptionrefill.php';
		$this->bean3 = new REG_Encounter();
		//----------------To add patient name
		$this->bean3->reg_patient_reg_encounter_name=$this->bean->name;
		$this->bean3->reg_patient_reg_encounterreg_patient_ida=$this->bean->id;
		$flag3=0;
		if(isset($_REQUEST['enc_id'])){
			$enc_id = $_REQUEST['enc_id'];
			$this->bean3->retrieve($enc_id);
			$flag3=1;
			
		}
		
		if(isset($_REQUEST['record'])){     //added - we also need to get the bean for patient - missing in original version
			$rec_id = $_REQUEST['record'];
			$this->bean = new REG_Patient();
			$this->bean->retrieve($rec_id);
			//var_dump($this->bean);
		}
		//var_dump($this->bean3);
		//$this->bean3->retrieve('e7370d19-2754-77fa-10ee-519530915b6f');
		//var_dump($this->bean3);
		//-----------------
		//include/EditView/EditView.tpl 
		//custom/modules/REG_Encounter/tpls/PR_EditView.tpl
		echo "testing permissions....";
		if ( $this->bean->ACLAccess('view') ) {
			echo "User can view this record in the DetailView";}
		setEditUserRole($this->dv3);
		
		$query2a = "SELECT assistant FROM reg_patient where id = '".$this->bean->id."' AND deleted!=1" ;
		$result = $this->bean->db->query($query2a, true);

		$value = null;
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
			$value = $row['assistant'];
			echo "<script> set_session('indication','".$value."');</script>";		
		}
		
		$query2b = "SELECT mrn_c FROM reg_patient_cstm where id_c = '".$this->bean->id."'" ;
		$resultb = $this->bean->db->query($query2b, true);		
		if(($rowb = $this->bean->db->fetchByAssoc($resultb) ) != null )
		{
			$mrn = $rowb['mrn_c'];
					
		} else {
		    $mrn = "";
		}
		echo "<script> set_session('mrn','".$mrn."');</script>";
		
		
		$this->dv3->setup('REG_Encounter', $this->bean3, $encounterMetadataFile, get_custom_file_if_exists('custom/modules/REG_Encounter/tpls/PR_EditView.tpl'));
		

		//$this->dv3->process();
		
		
		$riskquery = "select finalscore from reg_patient_risk where pid='".$this->bean->id."'";
		$score = $this->bean->db->query($riskquery, true);
		$rowr = $this->bean->db->fetchByAssoc($score);
		$finalscore = $rowr['finalscore'];
		$this->dv3->ss->assign("finalscore", $finalscore); 
		
		$summary = $this->bean3->summary;
		$enc_detail=explode(":",$summary);
		$type= $enc_detail[0];
		$typevalue="Rx. Refill";
		$this->dv3->ss->assign("encountype", "refill"); //this is a refill
		
		if(!strcmp($type,"PEnc")){
			$typevalue="Patient Encounter";
			$this->dv3->ss->assign("encountype", "encounter"); //this is an encounter
		}
		$this->dv3->process();
		
		echo "<input type='hidden' id ='patient_name' value='".$this->bean->name."'></input>";
		
        echo "<div style='font-family:Verdana,Arial,sans-serif !important'><font style='font-size: 14px; font-weight: bold'>".$typevalue." : ".$this->bean->name."  &nbsp;&nbsp;".$mrn."</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Pain Medication Ind. </b> <input type='text' disabled id = 'indication' size='30' onblur='set_session(this.id,this.value);'  value='".$value."'> </input><br> &nbsp;<b>Encounter Date:</b>  " .$this->bean3->date_entered . "&nbsp;&nbsp; <b>Patient Active</b> <input type='checkbox' name='pt_active_dummy' id='pt_active_dummy' disabled onclick='javascript:$(\"#pt_active_c\").prop(\"checked\", this.checked);' checked style='vertical-align:middle;'> &nbsp;&nbsp; <b>PCP Name</b> <input type='text' size='15' id='pcp_dummy' width onblur='javascript:document.getElementById(\"pcp_name_c\").value=this.value' value=''></input></div>";

		
		//echo $this->dv3->display("Encounter View");
		
		
		$queryprov = "SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = '" . $this->bean->id . "'";
		$db = DBManagerFactory::getInstance();  
		$provider = $db->query($queryprov); 
		$provrow = $db->fetchRow($provider);
		
		$this->dv3->ss->assign("provrow", $provrow);
		$this->dv3->ss->assign("notes_flag", "true");   //show notes on view of previous 
		

		//logic for showing last values of fields having Last
	if($flag3!=1 || ($flag3==1&&$this->bean3->id==null)){
		if($flag3==1){
			echo "<script type='text/javascript'>alert('The RxRf does not exist. It will be saved as a new RxRf'); </script>";
		}	
		//echo "in flag";
		$query2a = "SELECT * FROM reg_encounter natural join reg_encounter_cstm where id=id_c  and id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1 ) order by date_entered desc" ;

		$result = $this->bean->db->query($query2a, true); 
		
		
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		    //echo "got row";
			echo"<script type='text/javascript'>
			$(document).ready(function() {
			";
			
		    $this->dv3->ss->assign("datarow", $row);
			if($row['pcp_name_c']!=null){
				
				echo "\r\n document.getElementById('pcp_dummy').value='".$row['pcp_name_c']."'; document.getElementById('pcp_name_c').value='".$row['pcp_name_c']."';";
			}
			
			// Last Rx date should be defaulted to last Rx generated date 
			// no longer required
		/*	if($row['date_entered']!=null){
				$date1=strtotime($row['date_entered']);
				echo "<script>document.getElementById('last_rx_generated_c').value='".date('m/d/Y',$date1)."'</script>";
			}
		 */
		/*	if($this->bean3->history_c!=null){
				echo "<script>document.getElementById('history_c').value='".trim($this->bean3->history_c)."'</script>";
				}
		*/	if($row['pills_bottle_disp_c']!=null){
				//echo "\r\n document.getElementById('pills_bottle_disp_c').value='".$row['pills_bottle_disp_c']."'";
				}
			//if($row['risklvl_c']!=null){
				//echo "\r\n document.getElementById('risklvl_c').value='".$row['risklvl_c']."';";
				//}
		 if($row['risklvl_c']!=null && $row['risklvl_c']!=0)
			{
				if(is_numeric($row['risklvl_c']))
				{
					if($row['risklvl_c'] >= 7)
					{
						echo " var values = 'HIGH'; $('#risklvl_c').val(values);";
					}
					else if($row['risklvl_c'] >= 4 && $row['risklvl_c'] <= 6)
					{
						echo " var values = 'MODERATE'; $('#risklvl_c').val(values);";
					}
					else if($row['risklvl_c'] >= 0 && $row['risklvl_c'] <= 3)
					{
						echo " var values = 'LOW'; $('#risklvl_c').val(values);";
					}
				}
				else
				{
					echo " var values = '".$row['risklvl_c']."'; $('#risklvl_c').val(values);";
				}
			
			}
			else
			{
				echo " var values = 'N/A'; $('#risklvl_c').val(values);";
			}
			
		 
			if($row['last_uts_c']!=null){
				$date1=strtotime($row['last_uts_c']);
				//echo "\r\n document.getElementById('last_uts_c').value='".date('m/d/Y',$date1)."';";
			}
			if($row['last_pcp_visit_c']!=null){
				$date1=strtotime($row['last_pcp_visit_c']);
				//echo "\r\n document.getElementById('last_pcp_visit_c').value='".date('m/d/Y',$date1)."';";
			}
			if($row['last_pain_nurse_visit_c']!=null){
				//$date1=strtotime($row['last_pain_nurse_visit_c']);
				//echo "\r\n document.getElementById('last_pain_nurse_visit_c').value='".date('m/d/Y',$date1)."';";
			}
			if($row['last_nurse_phone_contact_c']!=null){
				$date1=strtotime($row['last_nurse_phone_contact_c']);
				//echo "\r\n document.getElementById('last_nurse_phone_contact_c').value='".date('m/d/Y',$date1)."';";
			}
			if($row['last_pmp_review_done_c']!=null){
				$date1=strtotime($row['last_pmp_review_done_c']);
				//echo "\r\n document.getElementById('last_pmp_review_done_c').value='".date('m/d/Y',$date1)."';";
			}
			if($row['narcotic_contract_in_chart_c']==1){
				echo "\r\n  $('#narcotic_contract_in_chart_c').prop('checked', true); ";
				//echo "\r\n document.getElementById('narcotic_contract_in_chart_c').checked=true</script>";
			}
			
			if($row['narcotic_contract_sign_c']!=null){
				$date1=strtotime($row['narcotic_contract_sign_c']);
				echo "\r\n document.getElementById('narcotic_contract_sign_c').value='".date('m/d/Y',$date1)."';";
			}
			
			
			if($row['pt_confirms_taking_c']==1){
				echo "\r\n  $('#pt_confirms_taking_c').prop('checked', true); ";
				//echo "\r\n document.getElementById('pt_confirms_taking_c').checked=true;</script>";
			}				
			if($row['pt_confirms_storing_c']==1){
				echo "\r\n  $('#pt_confirms_storing_c').prop('checked', true); ";
				//echo "\r\n document.getElementById('pt_confirms_storing_c').checked=true;</script>";
			}
			if($row['aberrant_behavior_noted_c']==1){
				echo "\r\n  $('#aberrant_behavior_noted_c').prop('checked', true); ";
				//echo "<script>document.getElementById('aberrant_behavior_noted_c').checked=true;</script>";
			}
			if($row['med_safety_pulm_prob_c']==1){
				echo "\r\n  $('#med_safety_pulm_prob_c').prop('checked', true); ";
				//echo "<script>document.getElementById('med_safety_pulm_prob_c').checked=true;</script>";
			}
			if($row['med_safety_sedatives_c']==1){
				echo "\r\n  $('#med_safety_sedatives_c').prop('checked', true); ";
				//echo "<script>document.getElementById('med_safety_sedatives_c').checked=true;</script>";
			}
			
			if($row['med_safety_high_medd_c']==1){
				echo "\r\n  $('#med_safety_high_medd_c').prop('checked', true); ";
				//echo "<script>document.getElementById('med_safety_high_medd_c').checked=true;</script>";
			}
			
			if($row['pt_active_c']==0)
			{	
				echo "\r\n  $('#pt_active_dummy').prop('checked', false); $('#pt_active_c').prop('checked', false);";
				
				//echo "<script>document.getElementById('pt_active_dummy').checked=false; document.getElementById('pt_active_c').checked=false</script>";
			}
			
			
			$datenow = date('m/d/Y');
			
			if($row['next_rx_refill_due_c']!=null){
				$date1=strtotime($row['next_rx_refill_due_c']);
				
				echo "\r\n document.getElementById('next_rx_refill_due_c').value='".date('m/d/Y',$date1)."';";
				if(date('m/d/Y',$date1)<$datenow){
					echo "\r\n document.getElementById('next_rx_refill_due_c').style.color='red';";
				}
			}
			if($row['next_uts_due_c']!=null){
				$date1=strtotime($row['next_uts_due_c']);
				//echo "\r\n document.getElementById('next_uts_due_c').value='".date('m/d/Y',$date1)."';";
				//if(date('m/d/Y',$date1)<$datenow){
				  //echo "\r\n document.getElementById('next_uts_due_c').style.color='red';";
				//}
			}
			
			if($row['next_pcp_visit_c']!=null){
				$date1=strtotime($row['next_pcp_visit_c']);
				//echo "\r\n document.getElementById('next_pcp_visit_c').value='".date('m/d/Y',$date1)."';";
				//if(date('m/d/Y',$date1)<$datenow){
				  //echo "\r\n document.getElementById('next_pcp_visit_c').style.color='red';";
				//}
			}
			if($row['nxt_appt_pain_c']!=null){
				$date1=strtotime($row['nxt_appt_pain_c']);
				//echo "\r\n document.getElementById('nxt_appt_pain_c').value='".date('m/d/Y',$date1)."';";
				//if(date('m/d/Y',$date1)<$datenow){
				  //echo "\r\n document.getElementById('nxt_appt_pain_c').style.color='red';";
				//}
			}
			
			if($row['next_appt_other_c']!=null){
				echo "var values = [".$row['next_appt_other_c']."];
			$('#next_appt_other_c').val(values);
			});	";
				}
				
			if($row['next_pmp_review_due_c']!=null){
				$date1=strtotime($row['next_pmp_review_due_c']);
				echo "\r\n document.getElementById('next_pmp_review_due_c').value='".date('m/d/Y',$date1)."';";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "\r\n document.getElementById('next_pmp_review_due_c').style.color='red';";
				}
			}
			
			echo "}); </script>";
			
			
			
			
			
			
		}
		
	}	
	else if($flag3==1){
	
	    
		$query2b = "SELECT * FROM reg_encounter natural join reg_encounter_cstm where id=id_c  and id = '{$enc_id}'";
       
		$result1 = $this->bean->db->query($query2b, true); 
		
		if(($row1 = $this->bean->db->fetchRow($result1) ) != null )
		{
		    $this->dv3->ss->assign("datarow", $row1);
	    }
		
		echo "<script type='text/javascript'>
		$(document).ready(function() {
		";
		if($this->bean3->pcp_name_c!=null){
				
				echo "\r\n document.getElementById('pcp_dummy').value='".$this->bean3->pcp_name_c."'; document.getElementById('pcp_name_c').value='".$this->bean3->pcp_name_c."';";
			}
		if($this->bean3->presc_refill_early_c==0){
				echo "\r\n  $('#presc_refill_early_c').prop('checked', false);";
				//echo "<script>document.getElementById('presc_refill_early_c').checked=false;</script>";
			}	
			
		if($this->bean3->pt_active_c==0){
				echo "\r\n  $('#pt_active_dummy').prop('checked', false); $('#pt_active_c').prop('checked', false);";
				//echo "<script>document.getElementById('pt_active_dummy').checked=false; document.getElementById('pt_active_c').checked=false</script>";
			}	
	
	/*	if($this->bean3->last_rx_generated_c!=null){
				$date1=strtotime($this->bean3->last_rx_generated_c);
				echo "\r\n document.getElementById('last_rx_generated_c').value='".date('m/d/Y',$date1)."'";
			}
		*/ 
			
		 
			if($this->bean3->last_uts_c!=null){
				$date1=strtotime($this->bean3->last_uts_c);
				//echo "\r\n document.getElementById('last_uts_c').value='".date('m/d/Y',$date1)."';";
			}
			if($this->bean3->last_pcp_visit_c!=null){
				$date1=strtotime($this->bean3->last_pcp_visit_c);
				//echo "\r\n document.getElementById('last_pcp_visit_c').value='".date('m/d/Y',$date1)."';";
			}
			if($this->bean3->last_pain_nurse_visit_c!=null){
				//$date1=strtotime($this->bean3->last_pain_nurse_visit_c);
				//echo "\r\n document.getElementById('last_pain_nurse_visit_c').value='".date('m/d/Y',$date1)."';";
			}
			if($this->bean3->last_nurse_phone_contact_c!=null){
				$date1=strtotime($this->bean3->last_nurse_phone_contact_c);
				//echo "\r\n document.getElementById('last_nurse_phone_contact_c').value='".date('m/d/Y',$date1)."';";
			}
			if($this->bean3->last_pmp_review_done_c!=null){
				$date1=strtotime($this->bean3->last_pmp_review_done_c);
				//echo "\r\n document.getElementById('last_pmp_review_done_c').value='".date('m/d/Y',$date1)."';";
			}
			if($this->bean3->narcotic_contract_in_chart_c==1){
				echo "\r\n  $('#narcotic_contract_in_chart_c').prop('checked', true);";
				//echo "<script>document.getElementById('narcotic_contract_in_chart_c').checked=true</script>";
			}
			
			if($this->bean3->narcotic_contract_sign_c!=null){
				$date1=strtotime($this->bean3->narcotic_contract_sign_c);
				echo "\r\n document.getElementById('narcotic_contract_sign_c').value='".date('m/d/Y',$date1)."';";
			}
			
			$datenow = date('m/d/Y');
			
			if($this->bean3->next_rx_refill_due_c!=null){
				$date1=strtotime($this->bean3->next_rx_refill_due_c);
				
				echo "\r\n document.getElementById('next_rx_refill_due_c').value='".date('m/d/Y',$date1)."';";
				if(date('m/d/Y',$date1)<$datenow){
					echo "\r\n document.getElementById('next_rx_refill_due_c').style.color='red';";
				}
			}
			if($this->bean3->next_uts_due_c!=null){
				$date1=strtotime($this->bean3->next_uts_due_c);
				//echo "\r\n document.getElementById('next_uts_due_c').value='".date('m/d/Y',$date1)."';";
				//if(date('m/d/Y',$date1)<$datenow){
				  //echo "\r\n document.getElementById('next_uts_due_c').style.color='red';";
				//}
			}
			
			if($this->bean3->next_pcp_visit_c!=null){
				$date1=strtotime($this->bean3->next_pcp_visit_c);
				//echo "\r\n document.getElementById('next_pcp_visit_c').value='".date('m/d/Y',$date1)."';";
				//if(date('m/d/Y',$date1)<$datenow){
				  //echo "\r\n document.getElementById('next_pcp_visit_c').style.color='red';";
				//}
			}
			if($this->bean3->nxt_appt_pain_c!=null){
				$date1=strtotime($this->bean3->nxt_appt_pain_c);
				//echo "\r\n document.getElementById('nxt_appt_pain_c').value='".date('m/d/Y',$date1)."';";
				//if(date('m/d/Y',$date1)<$datenow){
				  //echo "\r\n document.getElementById('nxt_appt_pain_c').style.color='red';";
				//}
			}
			
			
			if($this->bean3->next_appt_other_c!=null){
				echo "\r\n document.getElementById('next_appt_other_c').value='".$this->bean3->next_appt_other_c."';";
				}
				
				
			if($this->bean3->next_pmp_review_due_c!=null){
				$date1=strtotime($this->bean3->next_pmp_review_due_c);
				echo "\r\n document.getElementById('next_pmp_review_due_c').value='".date('m/d/Y',$date1)."';";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "\r\n document.getElementById('next_pmp_review_due_c').style.color='red';";
				}
			}	
			
			if($this->bean3->history_c!=null){
				//echo "<script>document.getElementById('history_c').value='".trim($this->bean3->history_c)."'</script>";
				}
			if($this->bean3->pills_bottle_disp_c!=null){
				//echo "\r\n document.getElementById('pills_bottle_disp_c').value='".$this->bean3->pills_bottle_disp_c."'";
				}
			if($this->bean3->risklvl_c!=null)
			{
				if(is_numeric($this->bean3->risklvl_c))
				{
					if($this->bean3->risklvl_c >= 7)
					{
						echo " var values = 'HIGH'; $('#risklvl_c').val(values);";
					}
					else if($this->bean3->risklvl_c >= 4 && $this->bean3->risklvl_c <= 6)
					{
						echo " var values = 'MODERATE'; $('#risklvl_c').val(values);";
					}
					else if($this->bean3->risklvl_c >= 0 && $this->bean3->risklvl_c <= 3)
					{
						echo " var values = 'LOW'; $('#risklvl_c').val(values);";
					}
				}
				else
				{
					echo " var values = '".$this->bean3->risklvl_c."'; $('#risklvl_c').val(values);";
				}
			
			}
			else
			{
				//echo " var values = 'N/A'; $('#risklvl_c').val(values);";
			}
				
			

			if($this->bean3->summary!=null){
				$summ=explode(":",$this->bean3->summary);
				echo "\r\n document.getElementById('summary').value='".$summ[1]."';";
				}
						
			if($this->bean3->pt_confirms_taking_c==1){
				echo "\r\n  $('#pt_confirms_taking_c').prop('checked', true);";
				//echo "<script>document.getElementById('pt_confirms_taking_c').checked=true;</script>";
			}				
			if($this->bean3->pt_confirms_storing_c==1){
				echo "\r\n  $('#pt_confirms_storing_c').prop('checked', true);";
				//echo "<script>document.getElementById('pt_confirms_storing_c').checked=true;</script>";
			}
			if($this->bean3->aberrant_behavior_noted_c==1){
				echo "\r\n  $('#aberrant_behavior_noted_c').prop('checked', true);";
				//echo "<script>document.getElementById('aberrant_behavior_noted_c').checked=true;</script>";
			}
			if($this->bean3->med_safety_pulm_prob_c==1){
				echo "\r\n  $('#med_safety_pulm_prob_c').prop('checked', true);";
				//echo "<script>document.getElementById('med_safety_pulm_prob_c').checked=true;</script>";
			}
			if($this->bean3->med_safety_sedatives_c==1){
				echo "\r\n  $('#med_safety_sedatives_c').prop('checked', true);";
				//echo "<script>document.getElementById('med_safety_sedatives_c').checked=true;</script>";
			}
			
			if($this->bean3->med_safety_high_medd_c==1){
				echo "\r\n  $('#med_safety_high_medd_c').prop('checked', true);";
				//echo "<script>document.getElementById('med_safety_high_medd_c').checked=true;</script>";
			}
			if($this->bean3->patient_present_c==1){
				echo "\r\n  $('#patient_present_c').prop('checked', true);";
				//echo "<script>document.getElementById('patient_present_c').checked='true';</script>";
			}else{
				echo "\r\n  $('#patient_present_c').prop('checked', false);";
				//echo "<script>document.getElementById('patient_present_c').checked=false;</script>";
			}
			
			if($this->bean3->date_modified!=null){
				$date1=strtotime($this->bean3->date_modified);
				echo "\r\n document.getElementById('date_last_modified').value='".date('m/d/Y',$date1)."';";
			}
	echo "});	";
		echo "</script>";
	}

	if($this->bean3->abherrent_behaviors_c!=null)
		{
		    //echo "Abherring"; echo $this->bean3->abherrent_behaviors_c;
			//$tmp = str_replace("^","'",$this->bean3->abherrent_behaviors_c); 
			//$tmp = str_replace("^,^","<br>",$this->bean3->abherrent_behaviors_c);
			//$tmp = str_replace("^","",$tmp);
			$this->dv3->ss->assign("abherrent_behaviors", str_replace("^","",$this->bean3->abherrent_behaviors_c));   //show notes on view of previous 
			$tmp = str_replace("^,^","</li><li>",$this->bean3->abherrent_behaviors_c);
			$tmp = str_replace("^","<li>",$tmp);
			//print $this->bean3->abherrent_behaviors_c;
			echo "<script type='text/javascript'>
			$(document).ready(function() {
			//var values = [".$tmp."];
			//$('#abherrent_behaviors_c').val(values);
			$('<br><span><ul style=\'margin:0px !important;padding:0px !important \'>".$tmp."</ul></span>').insertAfter('#abherrent_behaviors_c');
			$('#abherrent_behaviors_c').hide();
			
			/*for(var i in values) {
				var optionVal = values[i];
				$('#abherrent_behaviors_c').find('option[value='+optionVal+']').prop('selected', 'selected');
			}*/

			});	
			</script>";

		}
		else
		{
			echo "<script type='text/javascript'>
			$(document).ready(function() {
				$('<span>N/A</span>').insertAfter('#abherrent_behaviors_c');
				$('#abherrent_behaviors_c').hide();

			});	
			</script>";
		}

	echo $this->dv3->display("Encounter View");
	
	$ida = $this->bean->id;
	//	\$('#history_c').removeAttr('disabled');
	echo "<script type='text/javascript'>
 
	var FormName= document.getElementById('EditView');
	 
	 for(i=0; i<FormName.elements.length; i++) {
	 
		FormName.elements[i].disabled=true;
		}
		
		
	var notesarea= document.getElementById('history_c');
	notesarea.disabled=false;
	notesarea.readOnly=true;
	
	
	\$(function(){\$('.moduleTitle').remove();});		
	    \$(function(){ \$('.action_buttons div').remove();\$('.action_buttons input').remove(); 
	\$('.action_buttons').append($('#copy_text_div'))});
	
	\$('#copy-button').removeAttr('disabled');
	\$('#indication').attr('disabled', 'true');
	\$('#pcp_dummy').attr('disabled', 'true');
	
	  document.getElementById('reg_patient_reg_encounterreg_patient_ida').value='".$ida."';
	 /* var combine = document.getElementById('next_appt_other_c').value;
      var values_of = combine.split('#');
	  
	  for (var i=0;i<values_of.length;i++){
	  var values_indi = values_of[i].split(',');
	  var selectedtext=document.getElementById(values_indi[0]).text;
	  var date_value=values_indi[1];
	 \$('<li style=\"margin-left:0px;\"> <img src=\"custom/modules/REG_Encounter/tpls/cross.jpg\" class=\"remove\"></img>'+selectedtext+' - '+date_value+' </li>').appendTo('#entry_list');
	  }
	  */
	  
	</script>";
		
	
	
	

?>	