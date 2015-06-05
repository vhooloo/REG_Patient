<?php
    require_once('custom/modules/REG_Patient/views/view.testmed.php');
	global $theme;
	$theme_path="themes/".$theme."/";
	$image_path=$theme_path."images/";
	//require_once ($theme_path."layout_utils.php");
	echo "<link rel='stylesheet' type='text/css' href='../themes/" . $theme . "/style.css' />";
	$session_pid = "P".$_REQUEST['record'];

	echo '<script type="text/javascript"src="custom/jquery/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="custom/jquery/accordion/js/jquery-ui-1.10.0.custom.js"></script>
		<script type="text/javascript" src="custom/jquery/accordion/js/jquery-migrate-1.2.1.min.js"></script>
		
			<script type="text/javascript" src="custom/topcarejs/json2.js"></script>
		
		<!--script type="text/javascript" src="custom/topcarejs/jquery-sticky-notes/script/jquery.stickynotes.js"></script>
		<link rel="stylesheet" href="custom/topcarejs/jquery-sticky-notes/css/jquery.stickynotes.css" type="text/css"-->
		<script type="text/javascript">
		$(function() {
			$( "#tabs" ).tabs({
				beforeLoad: function( event, ui ) {
					ui.jqXHR.error(function() {
						ui.panel.html(
							"Couldn\'t load tab" );
					});
				}
			});
		});
	</script>';

	echo '<script type="text/javascript">	
		
		var clicksave = function() {
		
		  var note_ids = jQuery.fn.stickyNotes.currentlyEditedNotes();
				for (var i = note_ids.length - 1; i >= 0; i--){
					var note_id = note_ids[i]
					if (note_id != null) {
						jQuery.fn.stickyNotes.stopEditing(note_id);
					}				
				};
			 document.getElementById("stickynotes_history_c").value= JSON.stringify(jQuery.fn.stickyNotes.notes);
			 
			 savelistbox();
			 
			 var _form = document.getElementById(\'EditView\'); 
			 _form.action.value=\'Save\'; 
			 if(check_form(\'EditView\')) _form.submit();
		};

		var created = function(note) {
		  document.getElementById("history_c").value= JSON.stringify(jQuery.fn.stickyNotes.notes);
		}	
		
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

	echo '<script type="text/javascript">
		$(document).ready(function() {

			var options;

			if ( document.getElementById("stickynotes_history_c").value != "" )
				{ try {options = JSON.parse(\'{"notes":\' + document.getElementById("stickynotes_history_c").value + \'}\'); $("#notes").stickyNotes(options);}  catch(err){alert("bombed");$("#notes").stickyNotes();}  }
			else { $("#notes").stickyNotes();}
		});
	</script>';


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


	global $mod_strings;
	global $app_list_strings;
	global $app_strings;
	require_once('include/DetailView/DetailView2.php');
	require_once('include/EditView/EditView2.php');
	require_once('custom/Modules/REG_Patient/RefillCommon.php');

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
	
	setEditUserRole($this->dv3);
	
	$this->dv3->setup('REG_Encounter', $this->bean3, $encounterMetadataFile, get_custom_file_if_exists('custom/modules/REG_Encounter/tpls/PR_EditView.tpl'));
	$this->dv3->ss->assign("encountype", $rftype); //this is a refill

	$query2a = "SELECT * FROM reg_encounter natural join reg_encounter_cstm where id=id_c  and id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1 ) order by date_entered desc" ;
	
	$queryprov = "SELECT p1b.name provname  from reg_provider p1b, reg_provider_reg_patient_c p2b  WHERE p2b.reg_provider_reg_patientreg_provider_ida = p1b.id  AND p2b.reg_provider_reg_patientreg_patient_idb = '" . $this->bean->id . "'";
	$db = DBManagerFactory::getInstance();  
	$provider = $db->query($queryprov); 
	$provrow = $db->fetchRow($provider);
	
	$queryrefill = "SELECT pills_bottle_disp_c pills FROM reg_encounter natural join reg_encounter_cstm where id=id_c  and summary like 'RxRF%' and id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1 ) order by date_entered desc LIMIT 0,1" ;
	$refillprevious = 0;
	$refilldays = $db->query($queryrefill);
	if ( ($refillrow = $db->fetchRow($refilldays)) != null ) {
	
		$refillprevious = $refillrow['pills'];
		$this->dv3->ss->assign("refillprevious", $refillprevious); }
	
	$this->dv3->ss->assign("provrow", $provrow);
	$this->dv3->ss->assign("notes_flag", "false");   //do not default notes
	
	
	$result = $this->bean->db->query($query2a, true); 
	
	if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
	{
		//assign to smarty
		$this->dv3->ss->assign("datarow", $row);
		
	}

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
	
	$pmpdate;
	$query2b = "SELECT mrn_c, pmp_date_c FROM reg_patient_cstm where id_c = '".$this->bean->id."'" ;
	$resultb = $this->bean->db->query($query2b, true);		
	if(($rowb = $this->bean->db->fetchByAssoc($resultb) ) != null )
	{
		$mrn = $rowb['mrn_c'];
		$pmpdate = $rowb['pmp_date_c'];
				
	} else {
		$mrn = "";
	}
	echo "<script> set_session('mrn','".$mrn."');</script>";
	$this->dv3->ss->assign("thismrn", $mrn);
	$this->dv3->ss->assign("pmpdate", $pmpdate);
	/***** UTS processing **/
	
	$myqueryuts = "SELECT DISTINCT DATE_FORMAT(test_date,'%m/%d/%Y') thisdate1, test_date thisdate, sdid mysdid, (SELECT DISTINCT test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'OXYCODONE' AND test_results_code <> 'PEN') oxy,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'OPIATE URINE' AND test_results_code <> 'PEN') opiate,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'METHADONE' AND test_results_code <> 'PEN') methadone,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'COCAIN METAB' AND test_results_code <> 'PEN') cocaine,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'BUPRENO UR' AND test_results_code <> 'PEN') bupreno,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'BENZODIAZ UR' AND test_results_code <> 'PEN') benzo,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'BARBITURA UR'AND test_results_code <> 'PEN') barbi,(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '".$mrn."' AND sdid = mysdid AND test_type = 'AMPHETAMI UR' AND test_results_code <> 'PEN') amph FROM reg_patient_uts_import WHERE patient_mrn = '".$mrn."' order by 2 desc, 3 desc";
	$dbuts = DBManagerFactory::getInstance(); 
	$resultuts = $dbuts->query($myqueryuts);  
	 $lastuts = "";
	 $mydatauts = array();
	 $ctr = 0; $utsctr = 0;
	 $prevdate = "";   // make changes for expanded opioid
	while($rowuts = $dbuts->fetchRow($resultuts))
	{
		if ($ctr == 0) $lastuts = $rowuts['thisdate1'];   //grab date of last uts
		if ( $rowuts['thisdate1'] == $prevdate )  //collapse this row into previous row
		{	
			if ($rowuts['oxy'] != null ) $mydatauts[$utsctr-1]['oxy'] = $rowuts['oxy']; 
			if ($rowuts['opiate'] != null ) $mydatauts[$utsctr-1]['opiate'] = $rowuts['opiate'];
			if ($rowuts['methadone'] != null ) $mydatauts[$utsctr-1]['methadone'] = $rowuts['methadone'];
			if ($rowuts['cocaine'] != null ) $mydatauts[$utsctr-1]['cocaine'] = $rowuts['cocaine'];
			if ($rowuts['bupreno'] != null ) $mydatauts[$utsctr-1]['bupreno'] = $rowuts['bupreno'];
			if ($rowuts['benzo'] != null ) $mydatauts[$utsctr-1]['benzo'] = $rowuts['benzo'];
			if ($rowuts['barbi'] != null ) $mydatauts[$utsctr-1]['barbi'] = $rowuts['barbi'];
			if ($rowuts['amph'] != null ) $mydatauts[$utsctr-1]['amph'] = $rowuts['amph'];
			
		} 
		else { $mydatauts[] =$rowuts; $utsctr = $utsctr + 1;} //generate new row
		$ctr = $ctr + 1;
		$prevdate = $rowuts['thisdate1'];
		//$mydatauts[]=$rowuts;
	};	
	$this->dv3->ss->assign("mydatauts", $mydatauts); 
	$this->dv3->ss->assign("lastuts", $lastuts); 
	
	/*** MEDS TEST ****/
	
	$snip = new REG_PatientViewTestMed();
		//echo $snip->snippy();
		//$GLOBALS['log']->fatal("test refill");
	$this->dv3->ss->assign("snippet", $snip->snippet($this->bean->id));
	
	/**** ALL SMARTY assignments must be done above *****/
			
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
	
	if ($rftype == "refill")
	echo "<div  class='col-md-12' ><font style='font-size: 15px; font-weight: bold'>Prescription Refill : ".$this->bean->name."  &nbsp;&nbsp;".$mrn."</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--b>Indication for Pain Medication</b><input type='text' id = 'indication' size='15' onblur'='set_session(this.id,this.value);'  value='".$value."'> </input--> &nbsp;&nbsp; <b>Patient Active</b> <input type='checkbox' name='pt_active_dummy' id='pt_active_dummy' onclick='javascript: $(\"#pt_active_c\").prop(\"checked\", this.checked);' checked style='vertical-align:middle;'> &nbsp;&nbsp; <span style='white-space: nowrap;'><b>PCP Name</b> <input type='text' size='35' id='pcp_dummy' width onblur='javascript:document.getElementById(\"pcp_name_c\").value=this.value' value='".$provrow['provname']."' disabled></input></span></div>";
	else
	 echo "<div  class='col-md-12' ><font style='font-size: 15px; font-weight: bold'>Encounter : ".$this->bean->name."  &nbsp;&nbsp;".$mrn."</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--b>Indication for Pain Medication</b><input type='text' id = 'indication' size='15' onblur'='set_session(this.id,this.value);'  value='".$value."'> </input--> &nbsp;&nbsp; <b>Patient Active</b> <input type='checkbox' name='pt_active_dummy' id='pt_active_dummy' onclick='javascript: $(\"#pt_active_c\").prop(\"checked\", this.checked);' checked style='vertical-align:middle;'> &nbsp;&nbsp; <span style='white-space: nowrap;'><b>PCP Name</b> <input type='text' size='35' id='pcp_dummy' width onblur='javascript:document.getElementById(\"pcp_name_c\").value=this.value' value='".$provrow['provname']."' disabled></input></span></div>";

	echo $this->dv3->display("Encounter View");
	echo "</div></div>";
	echo "</td>";
	
	//Encounter List Accordion Section
	echo "<td style='border-color: rgb( 100, 100, 255); border-style: ridge;border-width: 2px;vertical-align: top;' ><div id='accordion'>";

	$query2 = "SELECT * FROM reg_encounter where  id in( SELECT  reg_patient_reg_encounterreg_encounter_idb from reg_patient_reg_encounter_c where reg_patient_reg_encounterreg_patient_ida = '".$this->bean->id."' AND deleted!=1) order by date_entered desc" ;
	$result = $this->bean->db->query($query2, true); 
	
	if(($row = $this->bean->db->fetchByAssoc($result) ) != null )
	{

		$flag1=1;
		$count=0;
		do{ 
			$count=$count+1;
			if($flag1==1){
				$flag1=0;
				
				echo "<h3 style='font-size:16px;font-weight:bold;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Encounters</h3><div>";
				echo "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\" class=\"list view\"><tbody><tr height=\"20\"><th scope=\"col\" width=\"45%\"><span sugar=\"slot0\" style=\"white-space:normal;\">Summary &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Created Date &nbsp;</span></th><th scope=\"col\" width=\"45%\"><span sugar=\"slot1\" style=\"white-space:normal;\">Created By&nbsp;</span></th></tr>";
			}

			$query3 = "SELECT first_name,last_name from users where id='".$row['created_by']."'";
			$result2 = $this->bean->db->query($query3, true); 
			$row2=$this->bean->db->fetchByAssoc($result2);
			$date_created = str_split($row['date_entered'],16);
			if($count%2==1){

				echo "<tr height=\"20\" class=\"oddListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a class='add-tab'  tab_name='". $row['summary']."'  link=\"index.php?entryPoint=Encounter_edit&record=".$this->bean->id."&enc_id=".$row['id']."\">".$row['summary']."</a></span>";
				
				if(isset($row['abherrent_behaviors_c']) && $row['abherrent_behaviors_c']!="")
					echo "<img src='custom/themes/default/images/aberrant_behavior.gif'>";
					
				echo "</td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$date_created[0]."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row2['first_name']."&nbsp;".$row2['last_name']."</span></td></tr>";

			}
			else
			{

				echo "<tr height=\"20\" class=\"evenListRowS1\"><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot1b\"><a class='add-tab' tab_name='". $row['summary']."' link=\"index.php?entryPoint=Encounter_edit&record=".$this->bean->id."&enc_id=".$row['id']."\">".$row['summary']."</a></span>";
				
				if(isset($row['abherrent_behaviors_c']) && $row['abherrent_behaviors_c']!="")
					echo "<img src='custom/themes/default/images/aberrant_behavior.gif'>";
					
				echo "</td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$date_created[0]."</span></td><td scope=\"row\" valign=\"top\" class=\"\"><span sugar=\"slot2b\">".$row2['first_name']."&nbsp;".$row2['last_name']."</span></td></tr>";

			}
	
			//return $row; 
		} while (($row = $this->bean->db->fetchByAssoc($result) ) != null );

		if($flag1==0)
		{ 
			echo "</tbody></table></div>";
		}
		
	}

	echo "</div></td></tr>";
	echo "</table>";
		 

	$ida = $this->bean->id;
	
	echo "<script type='text/javascript'>
  
	\$(function(){
		
	\$('.moduleTitle').remove();});		
	//\$('#SAVE_HEADER').remove();
	    \$(function(){ \$('.action_buttons div').remove();  \$('.action_buttons').append('<input type=\"button\" id=\"mysave\" title=\"Mysave\" value=\"Save\"  onclick=\" clicksave();\">');\$('.action_buttons').append('<input type=\"button\" id=\"back\" title=\"Back\" value=\"Back\" onclick=\"javascript:window.location.href=\'index.php?module=REG_Patient&action=index&parentTab=Registry\'\">'); \$('.action_buttons').append('<input type=\"button\" id=\"mycopy\" title=\"Copy To Clipboard\" value=\"Copy\"  onclick=\" copyToClipboard()();\">');
		//\$('.action_buttons').append('<input type=\"button\" id=\"mysave1\" title=\"Mysave\" value=\"My Save\" onclick=\"document.getElementById(\'history_c\').value= JSON.stringify(jQuery.fn.stickyNotes.notes);alert(JSON.stringify(jQuery.fn.stickyNotes.notes));var _form = document.getElementById(\'EditView\'); _form.action.value=\'Save\'; if(check_form(\'EditView\')) _form.submit();\">');
		
	\$('.action_buttons').append($('#copy_text_div'))});
	  document.getElementById('reg_patient_reg_encounterreg_patient_ida').value='".$ida."';
	 
	 
	</script>";
	echo "<script type='text/javascript'>\$(function(){\$('#accordion').accordion();  \$('#accordion1').accordion();  }); </script>";
		
	if($flag3==1){
		echo "<script type='text/javascript'>	\$(function(){\$( '#accordion').accordion({ active: 1 });   }); </script>";
	}
		
?>