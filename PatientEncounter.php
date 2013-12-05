<?php


global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
//require_once ($theme_path."layout_utils.php");
echo "<link rel='stylesheet' type='text/css' href='../themes/" . $theme . "/style.css' />";
$session_pid = "E".$_REQUEST['record'];
//echo $session_pid;
//SESSION VARIABLES
/*<script src="custom/jquery/jquery.ui.core.js"></script>
	<script src="custom/jquery//jquery.ui.widget.js"></script>
	<script src="custom/jquery/jquery.ui.tabs.js"></script>*/
echo '<script type="text/javascript"src="custom/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="custom/jquery/accordion/js/jquery-ui-1.10.0.custom.js"></script>
	<script type="text/javascript" src="custom/jquery/accordion/js/jquery-migrate-1.2.1.min.js"></script>
	
	<script type="text/javascript">
	$(function() {
		$( "#tabs" ).tabs({
			beforeLoad: function( event, ui ) {
				ui.jqXHR.error(function() {
					ui.panel.html(
						"Couldn\'t load this tab. We\'ll try to fix this as soon as possible. " +
						"If this wouldn\'t be a demo." );
				});
			}
		});
	});
	</script>';


	echo '<script type="text/javascript">	
	
	$(document).ready(function() {
    
    
    $(".add-tab").click(function() {

        var num_tabs = $("div#tabs ul#tablist li").length + 1;
		var a = $(this).attr("link");
		var tab_name = $(this).attr("tab_name");
        $("div#tabs ul#tablist").append(
            "<li ><a href=\'#tabs-" + num_tabs + "\'>" + tab_name + "</a><span class=\"ui-icon ui-icon-close\">Remove Tab</span></li>"
        );
	$("div#tabs").append(
			"<div style=\'margin: 0 auto;display: table-footer-group;\' id=\'tabs-" + num_tabs + "\'><iframe scrolling=\'no\' frameborder=\'0\' width=\'1081px\' height=\'473px\' src =\'"+a+"\'></iframe></div>"
           
        );
        $("div#tabs").tabs("refresh");
		
		
		$( "div#tabs" ).tabs( "option", "active", num_tabs-1 );
    });     
		var tabsa=$("div#tabs").tabs();
	  tabsa.delegate( "span.ui-icon-close", "click", function() {
      var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
      $( "#" + panelId ).remove();
      tabsa.tabs( "refresh" );
	  
    });	
});

	</script> ';



/*
if(!isset($_SESSION[$session_pid.'summary']))
{
echo "<script type='text/javascript'> document.getElementById('summary').value='';</script>";
}
else
{
echo "<script type='text/javascript'> document.getElementById('summary').value='".$_SESSION[$session_pid.'summary']."';</script>";
}
if(!isset($_SESSION[$session_pid.'sf12_c']))
{
echo "<script type='text/javascript'> document.getElementById('sf12_c').value='';</script>";
}
else
{
echo "<script type='text/javascript'> document.getElementById('sf12_c').value='".$_SESSION[$session_pid.'sf12_c']."';</script>";
}
if(!isset($_SESSION[$session_pid.'peg_c']))
{
echo "<script type='text/javascript'> document.getElementById('peg_c').value='';</script>";
}
else
{
echo "<script type='text/javascript'> document.getElementById('peg_c').value='".$_SESSION[$session_pid.'peg_c']."';</script>";
}
if(!isset($_SESSION[$session_pid.'pillcount_c']))
{
echo "<script type='text/javascript'> document.getElementById('pillcount_c').value='';</script>";
}
else
{
echo "<script type='text/javascript'> document.getElementById('pillcount_c').value='".$_SESSION[$session_pid.'pillcount_c']."';</script>";
}
if(!isset($_SESSION[$session_pid.'urinetoxscreen_c']))
{
echo "<script type='text/javascript'> document.getElementById('urinetoxscreen_c').value='';</script>";
}
else
{
echo "<script type='text/javascript'> document.getElementById('urinetoxscreen_c').value='".$_SESSION[$session_pid.'urinetoxscreen_c']."';</script>";
}
if(!isset($_SESSION[$session_pid.'uts_not_collected_c']))
{
echo "<script type='text/javascript'> document.getElementById('uts_not_collected_c').value='';</script>";
}
else
{
echo "<script type='text/javascript'> document.getElementById('uts_not_collected_c').value='".$_SESSION[$session_pid.'uts_not_collected_c']."';</script>";
}
*/
//var_dump($_SESSION);

echo "<script type='text/javascript'>

		

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
			
	
	</script>";
	

	
	

/*
echo "<script type='text/javascript'>function toggle_entryfields(a){
			if(!a)
			{
			document.getElementById('sf12_c').value='';
			set_session('sf12_c','');
			document.getElementById('sf12_c').disabled=true;
			document.getElementById('sf12_c').style.backgroundColor='#ddd';
			document.getElementById('peg_c').value='';
			set_session('peg_c','');
			document.getElementById('peg_c').disabled=true;
			document.getElementById('peg_c').style.backgroundColor='#ddd';
			document.getElementById('pillcount_c').value='';
			set_session('pillcount_c','');
			document.getElementById('pillcount_c').disabled=true;
			document.getElementById('pillcount_c').style.backgroundColor='#ddd';
			}
			else{
			document.getElementById('sf12_c').disabled=false;
			document.getElementById('sf12_c').style.backgroundColor='#fff';
			document.getElementById('peg_c').disabled=false;
			document.getElementById('peg_c').style.backgroundColor='#fff';
			document.getElementById('pillcount_c').disabled=false;
			document.getElementById('pillcount_c').style.backgroundColor='#fff';
			}
            }
			
	
	</script>";	
	*/
global $mod_strings;
global $app_list_strings;
global $app_strings;
require_once('include/DetailView/DetailView2.php');
require_once('include/EditView/EditView2.php');
$metadataFile = $this->getMetaDataFile();
 	    $this->dv = new DetailView2();
 	    $this->dv->ss =&  $this->ss;
 	    $this->dv->setup($this->module, $this->bean, $metadataFile, get_custom_file_if_exists('include/DetailView/DetailView.tpl'));
		

	
		//EncounterView
		TemplateHandler::clearCache('REG_Encounter','EditView.tpl');   //ADDED :--------> to prevent reg_encounter edit view from caching
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
		//var_dump($this->ss);
		//$this->bean3->retrieve('e7370d19-2754-77fa-10ee-519530915b6f');
		//var_dump($this->bean3);
		//-----------------
		//include/EditView/EditView.tpl 
		//custom/modules/REG_Encounter/tpls/PR_EditView.tpl
		
		$this->dv3->setup('REG_Encounter', $this->bean3, $encounterMetadataFile, get_custom_file_if_exists('custom/modules/REG_Encounter/tpls/PR_EditView.tpl'));
		$this->dv3->ss->assign("encountype", "encounter"); //this is an encounter
		
		//logic for showing last values of fields having Last
	if($flag3!=1 || ($flag3==1&&$this->bean3->id==null)){
		if($flag3==1){
			echo "<script type='text/javascript'>alert('The Encounter does not exist. It will be saved as a new Encounter'); </script>";
		}	
		$query2a = "SELECT * FROM reg_encounter natural join reg_encounter_cstm where id=id_c  and id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1 ) order by date_entered desc" ;
		
		$queryprov = "SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = '" . $this->bean->id . "'";
		$db = DBManagerFactory::getInstance();  
		$provider = $db->query($queryprov); 
		$provrow = $db->fetchRow($provider);
		
		$this->dv3->ss->assign("provrow", $provrow);
		
		
		$result = $this->bean->db->query($query2a, true); 
		
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		    //assign to smarty
			$this->dv3->ss->assign("datarow", $row);
			
			if($row['pcp_name_c']!=null){
				
				echo "<script>document.getElementById('pcp_dummy').value='".$row['pcp_name_c']."'; document.getElementById('pcp_name_c').value='".$row['pcp_name_c']."'</script>";
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
				echo "<script>document.getElementById('pills_bottle_disp_c').value='".$row['pills_bottle_disp_c']."'</script>";
				}
			if($row['risklvl_c']!=null){
				echo "<script>document.getElementById('risklvl_c').value='".$row['risklvl_c']."'</script>";
				}
		 
		 
			if($row['last_uts_c']!=null){
				$date1=strtotime($row['last_uts_c']);
				echo "<script>document.getElementById('last_uts_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($row['last_pcp_visit_c']!=null){
				$date1=strtotime($row['last_pcp_visit_c']);
				echo "<script>document.getElementById('last_pcp_visit_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($row['last_pain_nurse_visit_c']!=null){
				$date1=strtotime($row['last_pain_nurse_visit_c']);
				echo "<script>document.getElementById('last_pain_nurse_visit_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($row['last_nurse_phone_contact_c']!=null){
				$date1=strtotime($row['last_nurse_phone_contact_c']);
				echo "<script>document.getElementById('last_nurse_phone_contact_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($row['last_pmp_review_done_c']!=null){
				$date1=strtotime($row['last_pmp_review_done_c']);
				echo "<script>document.getElementById('last_pmp_review_done_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($row['narcotic_contract_in_chart_c']==1){
				echo "<script> $('#narcotic_contract_in_chart_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('narcotic_contract_in_chart_c').checked=true</script>";
			}
			
			if($row['narcotic_contract_sign_c']!=null){
				$date1=strtotime($row['narcotic_contract_sign_c']);
				echo "<script>document.getElementById('narcotic_contract_sign_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			
			
			if($row['pt_confirms_taking_c']==1){
				echo "<script> $('#pt_confirms_taking_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('pt_confirms_taking_c').checked=true;</script>";
			}				
			if($row['pt_confirms_storing_c']==1){
				echo "<script> $('#pt_confirms_storing_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('pt_confirms_storing_c').checked=true;</script>";
			}
			if($row['aberrant_behavior_noted_c']==1){
				echo "<script> $('#aberrant_behavior_noted_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('aberrant_behavior_noted_c').checked=true;</script>";
			}
			if($row['med_safety_pulm_prob_c']==1){
				echo "<script> $('#med_safety_pulm_prob_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('med_safety_pulm_prob_c').checked=true;</script>";
			}
			if($row['med_safety_sedatives_c']==1){
				echo "<script> $('#med_safety_sedatives_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('med_safety_sedatives_c').checked=true;</script>";
			}
			
			if($row['med_safety_high_medd_c']==1){
				echo "<script> $('#med_safety_high_medd_c').prop('checked', true); </script>";
				//echo "<script>document.getElementById('med_safety_high_medd_c').checked=true;</script>";
			}
			
			if($row['pt_active_c']==0)
			{	
				echo "<script> $('#pt_active_dummy').prop('checked', false); $('#pt_active_c').prop('checked', false);</script>";
				
				//echo "<script>document.getElementById('pt_active_dummy').checked=false; document.getElementById('pt_active_c').checked=false</script>";
			}
			
			
			$datenow = date('m/d/Y');
			
			if($row['next_rx_refill_due_c']!=null){
				$date1=strtotime($row['next_rx_refill_due_c']);
				
				echo "<script>document.getElementById('next_rx_refill_due_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
					echo "<script>document.getElementById('next_rx_refill_due_c').style.color='red'</script>";
				}
			}
			if($row['next_uts_due_c']!=null){
				$date1=strtotime($row['next_uts_due_c']);
				echo "<script>document.getElementById('next_uts_due_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('next_uts_due_c').style.color='red'</script>";
				}
			}
			
			if($row['next_pcp_visit_c']!=null){
				$date1=strtotime($row['next_pcp_visit_c']);
				echo "<script>document.getElementById('next_pcp_visit_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('next_pcp_visit_c').style.color='red'</script>";
				}
			}
			if($row['nxt_appt_pain_c']!=null){
				$date1=strtotime($row['nxt_appt_pain_c']);
				echo "<script>document.getElementById('nxt_appt_pain_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('nxt_appt_pain_c').style.color='red'</script>";
				}
			}
			
			if($row['next_appt_other_c']!=null){
				echo "<script>document.getElementById('next_appt_other_c').value='".$row['next_appt_other_c']."'</script>";
				}
				
			if($row['next_pmp_review_due_c']!=null){
				$date1=strtotime($row['next_pmp_review_due_c']);
				echo "<script>document.getElementById('next_pmp_review_due_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('next_pmp_review_due_c').style.color='red'</script>";
				}
			}
			
			
			
			
			
			
			
			
		}
		
	}	
	else if($flag3==1){
	
		if($this->bean3->pcp_name_c!=null){
				
				echo "<script>document.getElementById('pcp_dummy').value='".$this->bean3->pcp_name_c."'; document.getElementById('pcp_name_c').value='".$this->bean3->pcp_name_c."'</script>";
			}
		if($this->bean3->presc_refill_early_c==0){
				echo "<script> $('#presc_refill_early_c').prop('checked', false);</script>";
				//echo "<script>document.getElementById('presc_refill_early_c').checked=false;</script>";
			}	
			
		if($this->bean3->pt_active_c==0){
				echo "<script> $('#pt_active_dummy').prop('checked', false); $('#pt_active_c').prop('checked', false);</script>";
				//echo "<script>document.getElementById('pt_active_dummy').checked=false; document.getElementById('pt_active_c').checked=false</script>";
			}	
	
	/*	if($this->bean3->last_rx_generated_c!=null){
				$date1=strtotime($this->bean3->last_rx_generated_c);
				echo "<script>document.getElementById('last_rx_generated_c').value='".date('m/d/Y',$date1)."'</script>";
			}
		*/ 
			
		 
			if($this->bean3->last_uts_c!=null){
				$date1=strtotime($this->bean3->last_uts_c);
				echo "<script>document.getElementById('last_uts_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($this->bean3->last_pcp_visit_c!=null){
				$date1=strtotime($this->bean3->last_pcp_visit_c);
				echo "<script>document.getElementById('last_pcp_visit_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($this->bean3->last_pain_nurse_visit_c!=null){
				$date1=strtotime($this->bean3->last_pain_nurse_visit_c);
				echo "<script>document.getElementById('last_pain_nurse_visit_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($this->bean3->last_nurse_phone_contact_c!=null){
				$date1=strtotime($this->bean3->last_nurse_phone_contact_c);
				echo "<script>document.getElementById('last_nurse_phone_contact_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($this->bean3->last_pmp_review_done_c!=null){
				$date1=strtotime($this->bean3->last_pmp_review_done_c);
				echo "<script>document.getElementById('last_pmp_review_done_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			if($this->bean3->narcotic_contract_in_chart_c==1){
				echo "<script> $('#narcotic_contract_in_chart_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('narcotic_contract_in_chart_c').checked=true</script>";
			}
			
			if($this->bean3->narcotic_contract_sign_c!=null){
				$date1=strtotime($this->bean3->narcotic_contract_sign_c);
				echo "<script>document.getElementById('narcotic_contract_sign_c').value='".date('m/d/Y',$date1)."'</script>";
			}
			
			$datenow = date('m/d/Y');
			
			if($this->bean3->next_rx_refill_due_c!=null){
				$date1=strtotime($this->bean3->next_rx_refill_due_c);
				
				echo "<script>document.getElementById('next_rx_refill_due_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
					echo "<script>document.getElementById('next_rx_refill_due_c').style.color='red'</script>";
				}
			}
			if($this->bean3->next_uts_due_c!=null){
				$date1=strtotime($this->bean3->next_uts_due_c);
				echo "<script>document.getElementById('next_uts_due_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('next_uts_due_c').style.color='red'</script>";
				}
			}
			
			if($this->bean3->next_pcp_visit_c!=null){
				$date1=strtotime($this->bean3->next_pcp_visit_c);
				echo "<script>document.getElementById('next_pcp_visit_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('next_pcp_visit_c').style.color='red'</script>";
				}
			}
			if($this->bean3->nxt_appt_pain_c!=null){
				$date1=strtotime($this->bean3->nxt_appt_pain_c);
				echo "<script>document.getElementById('nxt_appt_pain_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('nxt_appt_pain_c').style.color='red'</script>";
				}
			}
			
			
			if($this->bean3->next_appt_other_c!=null){
				echo "<script>document.getElementById('next_appt_other_c').value='".$this->bean3->next_appt_other_c."'</script>";
				}
				
				
			if($this->bean3->next_pmp_review_due_c!=null){
				$date1=strtotime($this->bean3->next_pmp_review_due_c);
				echo "<script>document.getElementById('next_pmp_review_due_c').value='".date('m/d/Y',$date1)."'</script>";
				if(date('m/d/Y',$date1)<$datenow){
				  echo "<script>document.getElementById('next_pmp_review_due_c').style.color='red'</script>";
				}
			}	
			
			if($this->bean3->history_c!=null){
				echo "<script>document.getElementById('history_c').value='".trim($this->bean3->history_c)."'</script>";
				}
			if($this->bean3->pills_bottle_disp_c!=null){
				echo "<script>document.getElementById('pills_bottle_disp_c').value='".$this->bean3->pills_bottle_disp_c."'</script>";
				}
			if($this->bean3->risklvl_c!=null){
				echo "<script>document.getElementById('risklvl_c').value='".$this->bean3->risklvl_c."'</script>";
				}

			if($this->bean3->summary!=null){
				$summ=explode(":",$this->bean3->summary);
				echo "<script>document.getElementById('summary').value='".$summ[1]."'</script>";
				}
						
			if($this->bean3->pt_confirms_taking_c==1){
				echo "<script> $('#pt_confirms_taking_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('pt_confirms_taking_c').checked=true;</script>";
			}				
			if($this->bean3->pt_confirms_storing_c==1){
				echo "<script> $('#pt_confirms_storing_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('pt_confirms_storing_c').checked=true;</script>";
			}
			if($this->bean3->aberrant_behavior_noted_c==1){
				echo "<script> $('#aberrant_behavior_noted_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('aberrant_behavior_noted_c').checked=true;</script>";
			}
			if($this->bean3->med_safety_pulm_prob_c==1){
				echo "<script> $('#med_safety_pulm_prob_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('med_safety_pulm_prob_c').checked=true;</script>";
			}
			if($this->bean3->med_safety_sedatives_c==1){
				echo "<script> $('#med_safety_sedatives_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('med_safety_sedatives_c').checked=true;</script>";
			}
			
			if($this->bean3->med_safety_high_medd_c==1){
				echo "<script> $('#med_safety_high_medd_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('med_safety_high_medd_c').checked=true;</script>";
			}
			if($this->bean3->patient_present_c==1){
				echo "<script> $('#patient_present_c').prop('checked', true);</script>";
				//echo "<script>document.getElementById('patient_present_c').checked='true';</script>";
			}else{
				echo "<script> $('#patient_present_c').prop('checked', false);</script>";
				//echo "<script>document.getElementById('patient_present_c').checked=false;</script>";
			}
			
			if($this->bean3->date_modified!=null){
				$date1=strtotime($this->bean3->date_modified);
				echo "<script>document.getElementById('date_last_modified').value='".date('m/d/Y',$date1)."'</script>";
			}
	
	
	}
	
	/*	else
		{
		  echo "<script>document.getElementById('sf12_1').innerHTML='Not Available'</script>";
		   echo "<script>document.getElementById('peg_1').innerHTML='Not Available'</script>";
		 echo "<script>document.getElementById('pillcount_1').innerHTML='Not Available'</script>";
		  echo "<script>document.getElementById('date_1').innerHTML='Not Available'</script>";
		 
		}
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		 echo "<script>document.getElementById('sf12_2').innerHTML='".$row['sf12_c']."'</script>";
		  echo "<script>document.getElementById('peg_2').innerHTML='".$row['peg_c']."'</script>";
		 echo "<script>document.getElementById('pillcount_2').innerHTML='".$row['pillcount_c']."'</script>";
		  $date2=strtotime($row['date_entered']);
		 echo "<script>document.getElementById('date_2').innerHTML='".date('m-d-Y',$date2)."'</script>";
		}
		else{
		  echo "<script>document.getElementById('sf12_2').innerHTML='Not Available'</script>";
		   echo "<script>document.getElementById('peg_2').innerHTML='Not Available'</script>";
		 echo "<script>document.getElementById('pillcount_2').innerHTML='Not Available'</script>";
		  echo "<script>document.getElementById('date_2').innerHTML='Not Available'</script>";
		}
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		 echo "<script>document.getElementById('sf12_3').innerHTML='".$row['sf12_c']."'</script>";
		  echo "<script>document.getElementById('peg_3').innerHTML='".$row['peg_c']."'</script>";
		 echo "<script>document.getElementById('pillcount_3').innerHTML='".$row['pillcount_c']."'</script>";
		 $date3=strtotime($row['date_entered']);
		 echo "<script>document.getElementById('date_3').innerHTML='".date('m-d-Y',$date3)."'</script>";
		}
		else{
		  echo "<script>document.getElementById('sf12_3').innerHTML='Not Available'</script>";
		   echo "<script>document.getElementById('peg_3').innerHTML='Not Available'</script>";
		 echo "<script>document.getElementById('pillcount_3').innerHTML='Not Available'</script>";
		  echo "<script>document.getElementById('date_3').innerHTML='Not Available'</script>";
		}
		
	*/	
		
		
		
		
		
		
		
		
		//javascript
	//	echo "<script src='custom/jquery/jquery.js'></script><script src='custom/jquery/accordion/js/jquery-ui-1.10.0.custom.js'></script>";
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//display treatment plan details
      $this->dv2 = new DetailView2();
      $this->dv2->ss =& $this->dv->ss;
      $this->bean2 = new REG_Treatment_Plan();
	  $query = "SELECT * FROM reg_treatment_plan a, reg_treatment_plan_reg_patient_c b WHERE a.id = b.reg_treatment_plan_reg_patientreg_treatment_plan_idb and a.status!='Closed' and b.reg_treatment_plan_reg_patientreg_patient_ida = '".$this->bean->id."' and b.deleted!=1";
	
	
	
	
	
	
    $result = $this->bean->db->query($query, true); 
     $this->row = $this->bean->db->fetchByAssoc($result); 
    $tmp;
     //var_dump($this->bean);
	  if(!empty($this->row))
	 {
	$tmp = $this->row['reg_treatment_plan_reg_patientreg_treatment_plan_idb'];
	// echo $tmp;
      $this->bean2->retrieve($tmp);
      $treatment_planMetadataFile = 'modules/REG_Treatment_Plan/metadata/detailviewdefs.php';
      $treatment_planTemplate = 'custom/modules/REG_Treatment_Plan/tpls/treatment_planDetailView.tpl';
     // $this->dv2->setup('REG_Treatment_Plan', $this->bean2, $treatment_planMetadataFile, get_custom_file_if_exists('include/DetailView/DetailView.tpl'));
	   $this->dv2->setup('REG_Treatment_Plan', $this->bean2, $treatment_planMetadataFile, $treatment_planTemplate);
      }
	  
	
	//echo "<h1 color='r\"e\"d'>hahhahah</h1>";
	
	
	 if(empty($this->bean->id)){
            sugar_die($GLOBALS['app_strings']['ERROR_NO_RECORD']);
        }		

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
		
		/***** UTS processing **/
		$this->dv3->ss->assign("notes_flag", "false");
		$myqueryuts = "SELECT DISTINCT DATE_FORMAT(test_date,'%m/%d/%Y') thisdate1, test_date thisdate, (SELECT DISTINCT test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'OXYCODONE' AND test_results_code <> 'PEN') oxy,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'OPIATE URINE' AND test_results_code <> 'PEN') opiate,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'METHADONE' AND test_results_code <> 'PEN') methadone,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'COCAIN METAB' AND test_results_code <> 'PEN') cocaine,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'BUPRENO UR' AND test_results_code <> 'PEN') bupreno,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'BENZODIAZ UR' AND test_results_code <> 'PEN') benzo,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'BARBITURA UR'AND test_results_code <> 'PEN') barbi,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND test_date = thisdate AND test_type = 'AMPHETAMI UR' AND test_results_code <> 'PEN') amph FROM reg_patient_uts_import WHERE patient_mrn = '".$mrn."' order by 2 desc";
        $dbuts = DBManagerFactory::getInstance(); 
		$resultuts = $dbuts->query($myqueryuts);  
		 $lastuts = "";
		 $mydatauts = array();
		 $ctr = 0;
		while($rowuts = $dbuts->fetchRow($resultuts))
		{
			if ($ctr == 0) $lastuts = $rowuts['thisdate1'];   //grab date of last uts
			$ctr = $ctr + 1;
			$mydatauts[]=$rowuts;
		};	
		$this->dv3->ss->assign("mydatauts", $mydatauts); 
		$this->dv3->ss->assign("lastuts", $lastuts); 
		
        $this->dv->process();
       // echo $this->dv->display();
	   
		$this->dv3->process();
		echo "<table width='100%'><tr><td  width='70%' style='border-color: rgb( 100, 100, 255); border-style: ridge;border-width: 2px;margin-top: 0;vertical-align: top;'  >";
		echo '<div   id="tabs">
	<ul id ="tablist">
		<li><a href="#tabs-1"><b>New</b></a></li>
		
	</ul>
	<div style="margin: 0 auto;display: table-footer-group;" id="tabs-1">';
		echo "<input type='hidden' id ='patient_name' value='".$this->bean->name."'></input>";
		
        echo "<div><font style='font-size: 15px; font-weight: bold'>Patient Encounter : ".$this->bean->name."  &nbsp;&nbsp;".$mrn."</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Indication for Pain Medication</b><input type='text' id = 'indication' size='15' onblur='set_session(this.id,this.value);'  value='".$value."'> </input> &nbsp;&nbsp; <b>Patient Active</b> <input type='checkbox' name='pt_active_dummy' id='pt_active_dummy' onclick='javascript:document.getElementById(\"pt_active_c\").checked=this.checked' checked style='vertical-align:middle;'> &nbsp;&nbsp; <b>PCP Name</b> <input type='text' size='15' id='pcp_dummy' width onblur='javascript:document.getElementById(\"pcp_name_c\").value=this.value' value='".$provrow['provname']."' disabled></input></div>";

	
		echo $this->dv3->display("Encounter View");
		echo "</div></div>";
		
		
	/*	$query2 = "SELECT * FROM reg_encounter natural join reg_encounter_cstm where id=id_c and id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1 ) order by date_modified desc" ;

		$result = $this->bean->db->query($query2, true); 
		
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		
		 echo "<script>document.getElementById('sf12_1').innerHTML='".$row['sf12_c']."'</script>";
		 echo "<script>document.getElementById('peg_1').innerHTML='".$row['peg_c']."'</script>";
		 echo "<script>document.getElementById('pillcount_1').innerHTML='".$row['pillcount_c']."'</script>";
		 $date1=strtotime($row['date_entered']);
		 echo "<script>document.getElementById('date_1').innerHTML='".date('m-d-Y',$date1)."'</script>";
		}
		else
		{
		  echo "<script>document.getElementById('sf12_1').innerHTML='Not Available'</script>";
		   echo "<script>document.getElementById('peg_1').innerHTML='Not Available'</script>";
		 echo "<script>document.getElementById('pillcount_1').innerHTML='Not Available'</script>";
		  echo "<script>document.getElementById('date_1').innerHTML='Not Available'</script>";
		 
		}
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		 echo "<script>document.getElementById('sf12_2').innerHTML='".$row['sf12_c']."'</script>";
		  echo "<script>document.getElementById('peg_2').innerHTML='".$row['peg_c']."'</script>";
		 echo "<script>document.getElementById('pillcount_2').innerHTML='".$row['pillcount_c']."'</script>";
		  $date2=strtotime($row['date_entered']);
		 echo "<script>document.getElementById('date_2').innerHTML='".date('m-d-Y',$date2)."'</script>";
		}
		else{
		  echo "<script>document.getElementById('sf12_2').innerHTML='Not Available'</script>";
		   echo "<script>document.getElementById('peg_2').innerHTML='Not Available'</script>";
		 echo "<script>document.getElementById('pillcount_2').innerHTML='Not Available'</script>";
		  echo "<script>document.getElementById('date_2').innerHTML='Not Available'</script>";
		}
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
		 echo "<script>document.getElementById('sf12_3').innerHTML='".$row['sf12_c']."'</script>";
		  echo "<script>document.getElementById('peg_3').innerHTML='".$row['peg_c']."'</script>";
		 echo "<script>document.getElementById('pillcount_3').innerHTML='".$row['pillcount_c']."'</script>";
		 $date3=strtotime($row['date_entered']);
		 echo "<script>document.getElementById('date_3').innerHTML='".date('m-d-Y',$date3)."'</script>";
		}
		else{
		  echo "<script>document.getElementById('sf12_3').innerHTML='Not Available'</script>";
		   echo "<script>document.getElementById('peg_3').innerHTML='Not Available'</script>";
		 echo "<script>document.getElementById('pillcount_3').innerHTML='Not Available'</script>";
		  echo "<script>document.getElementById('date_3').innerHTML='Not Available'</script>";
		}
		*/
		
		echo "<div id='accordion1'>";
		
		
	
		
		//display Lab results
		/*
		$query2 = "SELECT * FROM reg_labresults where id in( SELECT  reg_labresults_reg_patientreg_labresults_idb from reg_labresults_reg_patient_c where reg_labresults_reg_patientreg_patient_ida = '".$this->bean->id."' AND deleted!=1) order by date_modified desc" ;
		$result = $this->bean->db->query($query2, true); 
		
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
			//echo "<br/>";
			//echo "<tr><td style='border-color: rgb( 100, 100, 255); border-style: ridge;border-width: 2px;' >";
			//$query1 = "SELECT * FROM reg_structured_element where id in( SELECT reg_treatm68ecelement_idb from reg_treatment_plan_reg_structured_element_c where reg_treatment_plan_reg_structured_elementreg_treatment_plan_ida = '".$tmp."' AND deleted!=1)" ;
			//$result = $this->bean->db->query($query1, true); 
			$flag1=1;
			$count=0;
			$i=0;
			$name = array();
			$name[0]= "Date";
			$name[1]= "UTS (Opioids)" ;
			$name[2]= "UTS (Cocaine)";
			$name[3]= "UTS (THC)";
			$name[4]= "UTS (Benzos)";
			$name[5]= "UTS (Methadone)";
			$name[6]= "UTS (Oxycodone)";
			$name[7]= "UTS (Hydrocodone)";
			$name[8]= "UTS (Propoxyphene)";
			$name[9]= "UTS (Buprenorphine)";

			
			$tmp = array();
			$tmp[0] = array();
			$tmp[1] = array();
			$tmp[2] = array();
			$tmp[3] = array();
			
			do{
			    $tmp[$i][0]=date('m-d-Y',strtotime($row['date_modified']));
				$tmp[$i][1]=$row['uts_opioids'];
				$tmp[$i][2]=$row['uts_cocaine'];
				$tmp[$i][3]=$row['uts_thc'];
				$tmp[$i][4]=$row['uts_benzos'];
				$tmp[$i][5]=$row['uts_methadone'];
				$tmp[$i][6]=$row['uts_oxycodone'];
				$tmp[$i][7]=$row['uts_hydrocodone'];
				$tmp[$i][8]=$row['uts_propoxyphene'];
				$tmp[$i][9]=$row['uts_buprenorphine'];
				$i++;
			}while(($row = $this->bean->db->fetchByAssoc($result) ) != null );
			while($i<4)
			{
			
				$tmp[$i][0]='Not Available';
				$tmp[$i][1]='Not Available';
				$tmp[$i][2]='Not Available';
				$tmp[$i][3]='Not Available';
				$tmp[$i][4]='Not Available';
				$tmp[$i][5]='Not Available';
				$tmp[$i][6]='Not Available';
				$tmp[$i][7]='Not Available';
				$tmp[$i][8]='Not Available';
				$tmp[$i][9]='Not Available';
				$i++;
			}
//var_dump($tmp);
			while ($count<10){ 
				
				if($flag1==1){
					$flag1=0;
					
					echo "<h3 style='font-size:16px;font-weight:bold;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lab Results</h3><div>";
					echo "<table cellpadding=\"0\" cellspacing=\"0\" style='width:70%;' border=\"0\" class=\"list view\"><tbody><tr height=\"10\"><th scope=\"col\" style='width:3%;text-align:center;'><span sugar=\"slot0\" style=\"white-space:normal;\"> &nbsp;</span></th><th scope=\"col\" style='width:3%;text-align:center;'><span sugar=\"slot0\" style=\"white-space:normal;\">Most Recent &nbsp;</span></th><th scope=\"col\" style='width:3%;text-align:center;'><span sugar=\"slot1\" style=\"white-space:normal;\"> 2nd Past&nbsp;</span></th><th scope=\"col\" style='width:3%;text-align:center;'><span sugar=\"slot1\" style=\"white-space:normal;\">3rd Past&nbsp;</span></th><th scope=\"col\" style='width:3%;text-align:center;'><span sugar=\"slot1\" style=\"white-space:normal;\">4th Past&nbsp;</span></th></tr>";
				}
				//print_r($row);
				//print_r($row);
//			echo "<br/>";
				//echo $row['id'].".........".$row['name'];
				
					if(($count+1)%2==1){
						echo "<tr height=\"10\" class=\"oddListRowS1\"><th scope=\"col\" ><span sugar=\"slot0\" style=\"white-space:normal;\">".$name[$count]."</span></th><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[0][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:black;\">".$tmp[0][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[0][$count]."</span>";}
						echo "</td><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[1][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:black;\">".$tmp[1][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[1][$count]."</span>";}
						echo "</td><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[2][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:back;\">".$tmp[2][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[2][$count]."</span>";}
						echo "</td><td scope=\"row\" valign=\"top\" style='text-align:center;'  class=\"\">";
						if(strtoupper($tmp[3][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:back;\">".$tmp[3][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[3][$count]."</span>";}
						echo"</td></tr>";
					}
					else
					{
						echo "<tr height=\"10\" class=\"evenListRowS1\"><th scope=\"col\" ><span sugar=\"slot0\" style=\"white-space:normal;\">".$name[$count]."</span></th><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[0][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:black;\">".$tmp[0][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[0][$count]."</span>";}
						echo "</td><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[1][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:black;\">".$tmp[1][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[1][$count]."</span>";}
						echo "</td><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[2][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:black;\">".$tmp[2][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[2][$count]."</span>";}
						echo "</td><td scope=\"row\" valign=\"top\" style='text-align:center;' class=\"\">";
						if(strtoupper($tmp[3][$count])=='NEG'){ echo "<span sugar=\"slot1b\" style=\"color:black;\">".$tmp[3][$count]."</span>"; } else{ echo"<span sugar=\"slot1b\" >".$tmp[3][$count]."</span>";}
						echo"</td></tr>";
					}
				
				$count=$count+1;
				//return $row; 
			} 
				if($flag1==0)
				{ 
					echo "</tbody></table></div>";
		
				}
			//echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"45%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Name &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Date Modified &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">&nbsp;</span></th></tr><tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D2a7c04e6-512e-f69e-4f38-50d3470f645b\">Test2</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">12/20/2012 05:16pm</span></td><td scope=\"row\" valign=\"top\" class=\"inlineButtons\"></td></tr><tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot5b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D9615402c-b343-64d8-2c3c-50d33d6780a6\">Test1</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot6b\">12/20/2012 04:33pm</span></td><td scope=\"row\" valign=\"top\" class=\"inlineButtons\"></td></tr></tbody></table>";
			
		}
		*/
		echo "</div>";
		
		echo "</td>";
		
		//Alert Section
		echo "<td style='border-color: rgb( 100, 100, 255); border-style: ridge;border-width: 2px;vertical-align: top;' ><div id='accordion'>";
		
// Display Treatment Plan
		if(!empty($this->row))
		{
		//echo "<br/>";
		//echo "<tr><td style='border-color: rgb( 100, 100, 255); border-style: ridge;border-width: 2px;' valign='top'  width='40%'>";
		$this->dv2->process();
echo "<h3 style='font-size:16px;font-weight:bold;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Active Treatment Plan</h3><div>";
        echo $this->dv2->display();
	    $this->row=NULL;
		$query1 = "SELECT * FROM reg_structured_element where id in( SELECT reg_treatm68ecelement_idb from reg_treatment_plan_reg_structured_element_c where reg_treatment_plan_reg_structured_elementreg_treatment_plan_ida = '".$tmp."' AND deleted!=1)" ;
     	$result = $this->bean->db->query($query1, true); 
		$flag=1;
		$count=0;
		while (($row = $this->bean->db->fetchByAssoc($result) ) != null ){ 
			$count=$count+1;
			if($flag==1){
				$flag=0;
				echo"<br/>";
				echo "<h3>Structured Elements</h3>";
				echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"25%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Summary &nbsp;</span></th><th scope=\"col\" width=\"25%\"><span sugar=\"slot10\" style=\"white-space:normal;\">Type &nbsp;</span></th><th scope=\"col\" width=\"25%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Start Date&nbsp;</span></th><th scope=\"col\" width=\"25%\"><span sugar=\"slot1\" style=\"white-space:normal;\ width=\"25%\">End Date &nbsp;</span></th></tr>";
			}
			//print_r($row);
			//print_r($row);
			//echo "<br/>";
			//echo $row['id'].".........".$row['name'];
			if($count%2==1){
				echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['setype']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['startdate']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['enddate']."</span></td></tr>";
			}
			else
			{
				echo "<tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['setype']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['startdate']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['enddate']."</span></td></tr>";
				//echo "<tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot5b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot6b\">"$row['startdate']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['enddate']."</span></td></tr>";
			}
		
			//return $row; 
		} 
		if($flag==0)
		{ 
			echo "</tbody></table>";
		
		}
		//echo $tmp;
		//DISPLAYING TREATMENT PLAN NOTES
		$query1 = "SELECT * FROM notes a where a.id in( SELECT reg_treatment_plan_notesnotes_idb from reg_treatment_plan_notes_c  b where  reg_treatment_plan_notesreg_treatment_plan_ida = '".$tmp."' AND deleted!=1)" ;
     	$result = $this->bean->db->query($query1, true); 
		$flag=1;
		$count=0;
		while (($row = $this->bean->db->fetchByAssoc($result) ) != null ){ 
			$count=$count+1;
			if($flag==1){
				$flag=0;
				echo"<br/>";
				echo "<h3>Treatment Plan Elements</h3>";
				echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"25%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Subject &nbsp;</span></th><th scope=\"col\" width=\"50%\"><span sugar=\"slot10\" style=\"white-space:normal;  \">Description &nbsp;</span></th><th scope=\"col\" width=\"25%\"><span sugar=\"slot1\" style=\"white-space:normal;\ width=\"25%\">Created Date &nbsp;</span></th></tr>";
			}
			//print_r($row);
			//print_r($row);
			//echo "<br/>";
			//echo $row['id'].".........".$row['name'];
			if($count%2==1){
				echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DNotes%26action%3DDetailView%26record%3D".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['description']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['date_entered']."</span></td></tr>";
			}
			else
			{
				echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DNotes%26action%3DDetailView%26record%3D".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['description']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['date_entered']."</span></td></tr>";
			
			}
		
			//return $row; 
		} 
		if($flag==0)
		{ 
			echo "</tbody></table>";
		
		}
		
		//Displaying activities
		//DISPLAYING TREATMENT PLAN NOTES
		$query1 = "SELECT * FROM tasks where parent_id='".$tmp."' AND deleted!=1" ;
     	$result = $this->bean->db->query($query1, true); 
		$flag=1;
		$count=0;
		while (($row = $this->bean->db->fetchByAssoc($result) ) != null ){ 
			$count=$count+1;
			if($flag==1){
				$flag=0;
				echo"<br/>";
				echo "<h3>Activites</h3>";
				echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"25%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Subject &nbsp;</span></th><th scope=\"col\" width=\"50%\"><span sugar=\"slot10\" style=\"white-space:normal;  \">Description &nbsp;</span></th><th scope=\"col\" width=\"25%\"><span sugar=\"slot1\" style=\"white-space:normal;\ width=\"25%\">Created Date &nbsp;</span></th></tr>";
			}
			//print_r($row);
			//print_r($row);
			//echo "<br/>";
			//echo $row['id'].".........".$row['name'];
			if($count%2==1){
				echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DTasks%26action%3DDetailView%26record%3D".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['description']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['date_entered']."</span></td></tr>";
			}
			else
			{
				echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DTasks%26action%3DDetailView%26record%3D".$row['id']."\">".$row['name']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['description']."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row['date_entered']."</span></td></tr>";
			
			}
		
			//return $row; 
		} 
		if($flag==0)
		{ 
			echo "</tbody></table>";
		
		}
		
		
		//echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"45%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Name &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Date Modified &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">&nbsp;</span></th></tr><tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D2a7c04e6-512e-f69e-4f38-50d3470f645b\">Test2</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">12/20/2012 05:16pm</span></td><td scope=\"row\" valign=\"top\" class=\"inlineButtons\"></td></tr><tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot5b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D9615402c-b343-64d8-2c3c-50d33d6780a6\">Test1</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot6b\">12/20/2012 04:33pm</span></td><td scope=\"row\" valign=\"top\" class=\"inlineButtons\"></td></tr></tbody></table>";
		//echo "</td></tr>";
echo "</div>";
		}
		
		//display encounter list view
		//$query2 = "SELECT * FROM reg_structured_element where id in( SELECT reg_treatm68ecelement_idb from reg_treatment_plan_reg_structured_element_c where reg_treatment_plan_reg_structured_elementreg_treatment_plan_ida = '".$tmp."' AND deleted!=1)" ;
		$query2 = "SELECT * FROM reg_encounter where  id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1) order by date_entered desc" ;
		$result = $this->bean->db->query($query2, true); 
		
		if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
		{
			//echo "<br/>";
			//echo "<tr><td style='border-color: rgb( 100, 100, 255); border-style: ridge;border-width: 2px;' >";
			//$query1 = "SELECT * FROM reg_structured_element where id in( SELECT reg_treatm68ecelement_idb from reg_treatment_plan_reg_structured_element_c where reg_treatment_plan_reg_structured_elementreg_treatment_plan_ida = '".$tmp."' AND deleted!=1)" ;
			//$result = $this->bean->db->query($query1, true); 
			$flag1=1;
			$count=0;
			do{ 
				$count=$count+1;
				if($flag1==1){
					$flag1=0;
					
					echo "<h3 style='font-size:16px;font-weight:bold;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Encounters</h3><div>";
					echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"45%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Summary &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Created Date &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Created By&nbsp;</span></th></tr>";
				}
				//print_r($row);
				//print_r($row);
//			echo "<br/>";
				//echo $row['id'].".........".$row['name'];
				$query3 = "SELECT first_name,last_name from users where id='".$row['created_by']."'";
				$result2 = $this->bean->db->query($query3, true); 
				$row2=$this->bean->db->fetchByAssoc($result2);
				$date_created = str_split($row['date_entered'],16);
				if($count%2==1){
					echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a class='add-tab'  tab_name='". $row['summary']."'  link=\"index.php?entryPoint=Encounter_edit&record=".$this->bean->id."&enc_id=".$row['id']."\">".$row['summary']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$date_created[0]."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row2['first_name']."&nbsp;".$row2['last_name']."</span></td></tr>";
				}
				else
				{
					echo "<tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a class='add-tab' tab_name='". $row['summary']."' link=\"index.php?entryPoint=Encounter_edit&record=".$this->bean->id."&enc_id=".$row['id']."\">".$row['summary']."</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$date_created[0]."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row2['first_name']."&nbsp;".$row2['last_name']."</span></td></tr>";
				}
		
				//return $row; 
			} while (($row = $this->bean->db->fetchByAssoc($result) ) != null );
				if($flag1==0)
				{ 
					echo "</tbody></table></div>";
		
				}
			//echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"45%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Name &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Date Modified &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">&nbsp;</span></th></tr><tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D2a7c04e6-512e-f69e-4f38-50d3470f645b\">Test2</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">12/20/2012 05:16pm</span></td><td scope=\"row\" valign=\"top\" class=\"inlineButtons\"></td></tr><tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot5b\"><a href=\"?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Structured_Element%26action%3DDetailView%26record%3D9615402c-b343-64d8-2c3c-50d33d6780a6\">Test1</a></span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot6b\">12/20/2012 04:33pm</span></td><td scope=\"row\" valign=\"top\" class=\"inlineButtons\"></td></tr></tbody></table>";
			
		}
		
		
		
		
		echo "</div></td></tr>";
		echo "</table>";
		 

	$ida = $this->bean->id;
	echo "<script type='text/javascript'>
 
   
	\$(function(){\$('.moduleTitle').remove();});		
	    \$(function(){ \$('.action_buttons div').remove(); \$('.action_buttons').append('<input type=\"button\" id=\"back\" title=\"Back to registry\" value=\"Back to Registry\" onclick=\"javascript:window.location.href=\'index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Patient%26action%3Dindex%26parentTab%3DRegistry\'\">');
	\$('.action_buttons').append($('#copy_text_div'))});
	 document.getElementsByName('uts_not_collected_c')[0].value='PatientEncounter';
	  document.getElementById('reg_patient_reg_encounterreg_patient_ida').value='".$ida."';
	  var combine = document.getElementById('next_appt_other_c').value;
      var values_of = combine.split('#');
	  
	  for (var i=0;i<values_of.length;i++){
	  var values_indi = values_of[i].split(',');
	  var selectedtext=document.getElementById(values_indi[0]).text;
	  var date_value=values_indi[1];
	 \$('<li style=\"margin-left:0px;\"> <img src=\"custom/modules/REG_Encounter/tpls/cross.jpg\" class=\"remove\"></img>'+selectedtext+' - '+date_value+' </li>').appendTo('#entry_list');
	  }
	 
	</script>";
		echo "<script type='text/javascript'>\$(function(){\$('#accordion').accordion();  \$('#accordion1').accordion(); }); </script>";
		
	if($flag3==1){
	
	echo "<script type='text/javascript'>	\$(function(){\$( '#accordion').accordion({ active: 1 });   }); </script>";


	}
		
?>