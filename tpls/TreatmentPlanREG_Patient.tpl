{literal}
<style type="text/css">
table.view { border-collapse:collapse; }
table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } 
table.view tr:nth-of-type(odd) {
  background-color: #def;
}
 p.MsoNormal, li.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0.0pt;
	margin-left:0.1in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Arial";}
 p.Header
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0.0pt;
	margin-left:0.0in;
	line-height:115%;
	font-size:12.0pt;
	font-family:"Arial";}
 p.SubHeader
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0.0pt;
	margin-left:0.1in;
	line-height:115%;
	font-size:12.0pt;
	color:white;
	font-family:"Arial";}
</style>
{/literal}

{literal}
<script type="text/javascript">
	if (typeof jQuery == "undefined") document.write("<script src='custom/include/jquery/jquery.min.js'></" + "script>");
</script>


<script>
function myFunction()
{


//document.getElementById("dyn").innerHTML = '<input class="date_input"  autocomplete="off" type="text" name="last_pcp_visit_c1" id="last_pcp_visit_c1" value="" title=""  size="8" maxlength="10" onchange="check_date(this);"><img src="themes/Sugar5/images/jscalendar.gif" alt="Enter Date" style="position:relative; top:3px" border="0" id="last_pcp_visit_c_trigger1"><input class="date_input"  autocomplete="off" type="text" name="last_pcp_visit_c2" id="last_pcp_visit_c2" value="" title=""  size="8" maxlength="10" onchange="check_date(this);"><img src="themes/Sugar5/images/jscalendar.gif" alt="Enter Date" style="position:relative; top:3px" border="0" id="last_pcp_visit_c_trigger2"><input type="submit" value="Go">';

var newcontent = document.createElement('div');
newcontent.innerHTML = '<div><input class="date_input"  autocomplete="off" type="text" name="last_pcp_visit_c1" id="last_pcp_visit_c1" value="" title=""  size="8" maxlength="10" onchange="check_date(this);"><img src="themes/Sugar5/images/jscalendar.gif" alt="Enter Date" style="position:relative; top:3px" border="0" id="last_pcp_visit_c_trigger1"><input class="date_input"  autocomplete="off" type="text" name="last_pcp_visit_c2" id="last_pcp_visit_c2" value="" title=""  size="8" maxlength="10" onchange="check_date(this);"><img src="themes/Sugar5/images/jscalendar.gif" alt="Enter Date" style="position:relative; top:3px" border="0" id="last_pcp_visit_c_trigger2"><input type="submit" value="Go"></div>';

while (newcontent.firstChild) {
        document.getElementById("dyn1").appendChild(newcontent.firstChild);
    }


//alert ( document.getElementById("dyn1").outerHTML);

Calendar.setup ({inputField : "last_pcp_visit_c1",ifFormat : "%m/%d/%Y %I:%M%P",daFormat : "%m/%d/%Y %I:%M%P", button : "last_pcp_visit_c_trigger1",
				singleClick : true,
				dateStr : "",
				startWeekday: 0,
				step : 1,
				weekNumbers:false
				}
				);
Calendar.setup ({inputField : "last_pcp_visit_c2",ifFormat : "%m/%d/%Y %I:%M%P",daFormat : "%m/%d/%Y %I:%M%P", button : "last_pcp_visit_c_trigger2",
				singleClick : true,
				dateStr : "",
				startWeekday: 0,
				step : 1,
				weekNumbers:false
				}
				);			
    		
{/literal}
	document.getElementById("last_pcp_visit_c1").value = "{$smarty.post.last_pcp_visit_c1}";
	document.getElementById("last_pcp_visit_c2").value = "{$smarty.post.last_pcp_visit_c2}";
}
</script>

<link type="text/css" rel="stylesheet" href="custom/jquery/accordion/css/ui-lightness/jquery-ui-1.10.0.custom.css" />
<script type="text/javascript" src='custom/jquery/jquery-1.9.1.js'></script>
<script type="text/javascript" src='custom/jquery/jquery-ui.js'></script>


<link type="text/css" rel="stylesheet" href="custom/topcarejs/jquery.dropdown.css" />
<script type="text/javascript" src="custom/topcarejs/jquery.dropdown.js"></script>

 
{literal} 
 <script>

function sortTable(sort_dir){

// clear it if being hit twice
  if ( document.getElementById('sortmemory').value == sort_dir ) 
  {
    sort_dir = ""; $('#desc').css( "color", "black" ); $('#asc').css( "color", "black" );
	
  }
  else document.getElementById('sortmemory').value = sort_dir;

  var rows = $('#mytable tbody  tr').get();
  


  if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp=new XMLHttpRequest();
  }
  else {
    xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
  }

	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
		//alert(xmlhttp.responseText);
		
		}
	  }
  
//xmlhttp.open("GET","custom/modules/REG_Patient/tstfile.php?regnamesort="+sort_dir,true);
xmlhttp.open('GET','index.php?entryPoint=session_setting_variable&id=regnamesort&value='+ sort_dir,true);
xmlhttp.send();
  
  if (sort_dir == 'asc') { $('#asc').css( "color", "green" ); $('#desc').css( "color", "black" );}
  if (sort_dir == 'desc') { $('#desc').css( "color", "green" ); $('#asc').css( "color", "black" );}
  
  rows.sort(function(a, b) {

  var A = $(a).children('td').eq(0).text().toUpperCase();
  var B = $(b).children('td').eq(0).text().toUpperCase();
  
  if(A < B) {
     return (sort_dir == 'asc') ? -1 : 1 ;
  }

  if(A > B) {
    return (sort_dir == 'asc') ? 1 : -1 ; 
  }

  return 0;

  });

  $.each(rows, function(index, row) {
    $('#mytable').children('tbody').append(row);
  });
}

  
  
  </script>
  
  <script>
function myajax()
{



if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }

xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    alert(xmlhttp.responseText);
	
    }
  }
xmlhttp.open("GET","custom/modules/REG_Patient/tstfile.php?regnamesort="+document.getElementById('patregnamesort').value,true);
xmlhttp.send();
}
</script>

{/literal}  

{literal}
<script type="text/javascript">
function check_date(element){

 //get today's date in string
 var todayDate = new Date();
 //need to add one to get current month as it is start with 0
 var todayMonth = todayDate.getMonth() + 1;
 var todayDay = todayDate.getDate();
 var todayYear = todayDate.getFullYear();
 var todayDateText = todayMonth + "/" + todayDay + "/" +  todayYear;
 //

//get date input from SharePoint DateTime Control
 var inputDateText = element.value;
 //
 

//Convert both input to date type
 var inputToDate = Date.parse(inputDateText);
 var todayToDate = Date.parse(todayDateText);
 //alert(inputToDate);
 //if ( isNaN( inputToDate ) ) {  alert('invalid'); } else { alert('dumdidum');}
 //

  //if (isNaN(inputDateText.getTime())) {alert('formatted but invalid');}

//compare dates
 if (inputToDate > todayToDate) {element.style.color='black';}
 else if (inputToDate < todayToDate) {element.style.color='red';}
 else {element.style.color='black';}
}

		$(function() {
			  $(".research tr:not(.accordion)").hide();
			  $(".research tr:first-child").show();
				
			  $(".research tr.accordion").click(function(){
				  $(this).nextAll("tr").fadeToggle(500);
			  }).eq(0).trigger('click');
			});

	  $(function() {
		$( "#ATP_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Addicit_Hist_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#Addicit_Tx_Hist_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#Addict_Counsel_Refer_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#Addict_Tx_Prgm_Refer_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#12Step_Prgm_Rev_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#Finance_Rev_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#Finance_Referral" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#Relationship_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#Transport_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#Transport_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#RIDE_App_Complete_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#PT-1_App_Comlpete_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });
	  $(function() {
		$( "#KD_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#SuppNetwrk_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		});
	  });

	  $(function() {
		$( "#Employ_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Med_Prob_Rev_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Med_Prob_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#MHP_Rev_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#MHP_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Chilcare_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Chilcare_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Housing_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Housing_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});

	  $(function() {
		$( "#Legal_Review_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});
		
	  $(function() {
		$( "#Legal_Referral_Date" ).datepicker({
		  showOn: "button",
		  buttonImage: "themes/default/images/Calendar.gif",
		  buttonImageOnly: true
		  });
		});
	</script>
{/literal}


<script> <!-- PHP -->
{php}

//session_start();
// store session data
// get all assigned template vars

//$myvars = $this->get_template_vars('myrisk');
//print_r( $myvars->ort1a);

// take a look at them
//print_r($this->myrisk->ort1a);

if (!empty($_POST['regnamesort'])) $_SESSION['regnamesort']=$_POST['regnamesort'];

//var_dump($_SESSION);
if (!empty($_POST['mysort']) AND $_POST['mysort'] != 'all' AND $_POST['mysort'] != 'none' AND $_POST['mysort'] != 'cust')  $mytitle = "List of Refills in Next " .$_POST['mysort']. " Days" ; 
elseif ( $_POST['mysort'] == 'cust')  $mytitle = "List of Refills from " . $_POST[last_pcp_visit_c1] .  " TO " . $_POST[last_pcp_visit_c2];
else 							 $mytitle = "List of All Refills";
if (!empty($_POST['provsort']) AND $_POST['provsort'] != "none" ) 
 $mytitle .= " For " . $_POST['provsort'];
else
 $mytitle .= " For ALL Providers" ;
 
 $this->assign("mytitle", $mytitle);

if (!empty($_POST['mysort']) )  $this->assign("datsel",  $_POST['mysort'] ) ; 
if (!empty($_POST['utssort']) )  $this->assign("utssel",  $_POST['utssort'] ) ; 

if (!empty($_POST['provsort']))  $this->assign("provsel", $_POST['provsort']) ; 


{/php}
</script>


<script type="text/javascript"> 
	var a = document.getElementById( "shortcuts" );
	a.style.display = "none";
	a = document.getElementById( "lastView" );
	a.style.display = "none";
	a = document.getElementById( "globalLinks" );
	a.style.display = "none";
	a = document.getElementById( "sitemapLink" );
	a.style.display = "none";
	a = document.getElementById( "search" );
	a.style.display = "none"; 
</script>

	

<form name="mylist" method="POST" action="index.php?module=REG_Patient&action=SaveTreatmentPlan" onsubmit="">

<button type="submit"> Save </button>

<div id="demo" style="text-align:left;line-height: 400%;width:800px;" >
<p align="center">
<h1 align="Left">
Treatment Plan for Patient <input name = "ptname" id = "ptname" value = "" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
MRN <input name = "mrn" id = "mrn" value = "" >
Clinical Site <input name = "clinsite" id = "clinsite" value = "" > 
</h1>
</p>
</div>
<div id="demo1" style="text-align:left;line-height: 400%;width:800px;" >
<h2 align="right"> 
Based on Intake Assessment by NCM <input name = "ncm" id = "ncm" value = "" >
</h2>
</p>
</div>


<table style="page-break-before: always;" width="800" cellpadding="7" cellspacing="0">
	<col width="601">
	<col width="179">
	<tbody class="research">
		<tr class="accordion">
			<td COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>A.	CONTROLLED SUBSTANCES PLAN</b></p>
			</td>
			<!--<TD WIDTH=179 VALIGN=TOP BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>-->
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency of PCP visits (weeks)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_PCP_Visit_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of TOPCARE NCM visits (F2F)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_NCM_Visit_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of Random TOPCARE NCM Callback Visit (F2F)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_Rand_Call_Visit_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of phone contacts</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_Tel_Contact_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of Random phone contacts</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_Rand_TelContact_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font> 
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of UTS</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_UTS_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of Random UTS</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_Rand_UTS_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of Pill Counts</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_Pill_Ct_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Frequency
				of Random Pill Counts</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select id="CSP_Rand_Pill_Ct_Freq" style="width:70px;">
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
					<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
					<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
					<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
					<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
					<option value="26">26</option></select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#000000" height="7">
				<p class="SubHeader"><b>Providers</b></p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179" bgcolor="#000000">
				<p><br>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Responsible MD</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input id="RxRespnProv_Name" type="text" name="RxRespnProv_Name" size="20">
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Responsible MD (Practice Location)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input id="RxRespnProv_PracLoc" type="text" name="RxRespnProv_PracLoc" size="20">
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#000000" height="7">
				<p class="SubHeader"><b>Pharmacy</b></p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179" bgcolor="#000000">
				<p><br>				
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Pharmacy</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input type="text" name="pharmacy" size="20">
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Pharmacy (Location)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input type="text" name="Pharmacy_PracLoc" size="20">
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Pharmacy (Phone)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input type="text" name="Pharmacy_Phone" size="20">
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Pharmacy (Communication Release(s) signed and in chart)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER" class="MsoNormal">
					<select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option><option value="U">UNKNOWN</option>
					<option value="X">NOT APPLICABLE</option>
					</select>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#000000" height="7">
				<p class="SubHeader"><b>Adjunctive Therapy Providers</b></p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179" bgcolor="#000000">
				<p><br>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Adjunctive	Therapy Provider</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input type="text" name="ATP_Name" size="20">
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Adjunctive	Therapy Provider Referral (Status)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="6">
				<p class="MsoNormal">Adjunctive	Therapy Provider Referred (Date)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER"><input style="width:60%" type="text" id="ATP_Referral_Date" name="ATP_Referral_Date" size="16" >
				</p>
			</td>
		</tr>
		<tr>
			<td style="border: medium none; padding: 0in;" width="601" bgcolor="#ffffff" height="7">
				<p class="MsoNormal">Adjunctive	Therapy Provider (Communication Release(s) signed and in chart)</p>
			</td>
			<td style="border: medium none; padding: 0in;" valign="TOP" width="179">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option><option value="U">UNKNOWN</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</td>
		</tr>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<td COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>B. DRUG & ALCOHOL ABUSE</b></p>
			</td>
			<!--<TD WIDTH=179 VALIGN=TOP BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>-->
		</tr>
		<TR>
			<TD  COLSPAN=2 WIDTH=601 HEIGHT=7 BGCOLOR="#000000" STYLE="border: none; padding: 0in">
				<p class="SubHeader"><B>Addiction (History)</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction History Reviewed </P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction	History  Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Addicit_Hist_Review_Date" name="Addicit_Hist_Review_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  COLSPAN=2 WIDTH=601 HEIGHT=7 BGCOLOR="#000000" STYLE="border: none; padding: 0in">
				<p class="SubHeader"><B>Addiction	Treatment (History)</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction	Treatment History Reviewed</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Treatment History Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Addicit_Tx_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="16">
			</TD>
		</TR>
		<TR>
			<TD  COLSPAN=2 WIDTH=601 HEIGHT=7 BGCOLOR="#000000" STYLE="border: none; padding: 0in">
				<p class="SubHeader"><B>Addiction Treatment (Current) </B>
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Counseling Status</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="E">ENCOURAGED</option>
					<option value="D">DISUSSED</option>
					<option value="G">ENGAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>			
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Counseling (Clinician Name)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Counseling Referral Date (Date Referred)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Addict_Counsel_Refer_Date" name="Addict_Counsel_Refer_Date" size="16">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Counseling (Communication Release signed)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="U">UNKNOWN</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>	
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Treatment Program Status</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="E">ENCOURAGED</option>
					<option value="D">DISUSSED</option>
					<option value="G">ENGAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>	
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Treatment Program Referral Date (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Treatment Program Referral Date (Date Referred)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Addict_Tx_Prgm_Refer_Date" name="Addict_Tx_Prgm_Refer_Date" size="16">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Addiction Treatment Program (Communication Release signed)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="U">UNKNOWN</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN=2 WIDTH=601 HEIGHT=7 BGCOLOR="#000000" STYLE="border: none; padding: 0in">
				<p class="SubHeader"><B>Self Help (12 Step) Programs</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">12	Step Program Attendance Reviewed Status</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="E">ENCOURAGED</option>
					<option value="D">DISUSSED</option>
					<option value="G">ENGAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>	
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">12	Step Program Attendnence Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="12Step_Prgm_Rev_Date" name="12Step_Prgm_Rev_Date" size="16">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">12	Step Program Attendnence (Has Sponsor Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="E">ENCOURAGED</option>
					<option value="D">DISUSSED</option>
					<option value="G">ENGAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>	
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>C.FINANCIAL</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Financials	(Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Financials
				(Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Financials	Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Finance_Rev_Date" name="Finance_Rev_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Finance Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Finance Referral (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Finance_Referral" name="Finance_Referral" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>D. RELATIONSHIPS</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Relationships (Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Relationships Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Relationship Situation Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Relationship_Review_Date" name="Relationship_Review_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Relationship
				Referral</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="E">ENCOURAGED</option>
					<option value="D">DISCUSSED</option>
					<option value="G">ENGAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>E. TRANSPORTATION</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Transportation (Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Transportation
				Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Transportation
				Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Transport_Review_Date" name="Transport_Review_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Transportation
				Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Transportation
				Referral (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Transport_Referral_Date" name="Transport_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">MBTA
				Ride Application Status</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">MBTA
				Ride Application (Date) Completed</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="RIDE_App_Complete_Date" name="RIDE_App_Complete_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">PT-1
				Application Status</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">PT-1
				Application (Date) Completed 
				</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="PT-1_App_Comlpete_Date" name="PT-1_App_Comlpete_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>F.	KNOWLEDGE DEFICITS (KD)</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Knowledge
				Deficit #X (Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Knowledge
				Deficit #X (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Knowledge
				Deficit #X (Referral Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Knowledge
				Deficit #X (Referral Made Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="KD_Referral_Date" name="KD_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>G. SUPPORT NETWORK</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Support
				Network (Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Support
				Network Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Support
				Network (Referral Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Support
				Network (Referral Made Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="SuppNetwrk_Referral_Date" name="SuppNetwrk_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>H. EMPLOYMENT</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Employment
				(Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Employment
				Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Employment
				(Referral Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Employment
				(Referral Made Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Employ_Referral_Date" name="Employ_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD  COLSPAN=2  WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>I. ACTIVE/UNADDRESSED MEDICAL PROBLEMS</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Medical
				Problem (Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Medical
				Problem Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Medical
				Problem Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Med_Prob_Rev_Date" name="Med_Prob_Rev_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Medical
				Problem (Communication Release signed)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="U">UNKNOWN</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Medical
				Problem Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Medical
				Problem (Referral Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Med_Prob_Referral_Date" name="Med_Prob_Referral_Date" size="16">
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD  COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>J. MENTAL HEALTH</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Mental
				Health Problem (Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Mental
				Health Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Mental
				Health Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="MHP_Rev_Date" name="MHP_Rev_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Mental
				Health Problem (Communication Release signed)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="U">UNKNOWN</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Mental
				Health Problem Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Mental
				Health Problem (Referral Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p><input style="width:60%" type="text" id="MHP_Referral_Date" name="MHP_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>K. CHILDCARE</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Childcare
				(Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Childcare
				Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Childcare
				Reviewed (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p><input style="width:60%" type="text" id="Chilcare_Review_Date" name="Chilcare_Review_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Childcare
				Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Childcare
				Referral (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Chilcare_Referral_Date" name="Chilcare_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD  COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>L. Housing</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Housing
				(Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Housing
				Situation Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Housing
				Situation Review (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%"  type="text" id="Housing_Review_Date" name="Housing_Review_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Housing
				Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=7 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Housing
				Situation Referral (Date) 
				</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Housing_Referral_Date" name="Housing_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
	<tbody class="research">
		<tr class="accordion">
			<TD  COLSPAN=2 WIDTH=601 HEIGHT=8 BGCOLOR="#ffc000" STYLE="border-top: 1.00pt solid #00000a; border-bottom: 1.00pt solid #00000a; border-left: 1.00pt solid #00000a; border-right: 1.00pt solid #00000a; padding-top: 0in; padding-bottom: 0in; padding-left: 0.08in; padding-right: 0in">
				<p class="Header"><B>M. LEGAL</B></P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Legal
				(Short Description)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input type="text" id="Addicit_Hist_Review_Date" name="Addicit_Tx_Hist_Review_Date" size="20">
				</P>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Legal
				Situation Reviewed (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="" id="Addicit_Tx_Hist_Review">
					<option value="A">ACTIVE</option>
					<option value="I">INACTIVE</option>
					<option value="R">RESOLVED</option>
					<option value="D">DEFERRED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Legal
				Situation Review (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input  style="width:60%" type="text" id="Legal_Review_Date" name="Legal_Review_Date" size="16">
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Legal
				Referral (Status)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER">
					<font color="#000000" face="Arial, serif" size="3"><select style="">
					<option value="Y">YES</option>
					<option value="N">NO</option>
					<option value="D">DEFERRRED</option>
					<option value="E">ENCOURAGED</option>
					<option value="X">NOT APPLICABLE</option>
					</select></font>
				</p>
			</TD>
		</TR>
		<TR>
			<TD  WIDTH=601 HEIGHT=6 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p class="MsoNormal">Legal
				Referral (Date)</P>
			</TD>
			<TD WIDTH=179 BGCOLOR="#ffffff" STYLE="border: none; padding: 0in">
				<p align="CENTER"><input style="width:60%" type="text" id="Legal_Referral_Date" name="Legal_Referral_Date" size="16">
				</p>
			</TD>
		</TR>
	</tbody>
</table>
</form>

<script type="text/javascript"> <!-- FOR UPDATES, prefill existing values, compute sum ----->
    var sum = 0; var data = 0;
	{foreach name=myrowIteration from=$ort_terms key=id item=myrowData}
	  if('{$myrowData.VAL}' != '') {ldelim} 
	    if('{$patdata.gender}' == 'female')  data = parseInt('{$myrowData.FEM}'); else data = parseInt('{$myrowData.MALE}');
		document.getElementById('{$myrowData.TAG}_val').value = ('{$patdata.gender}' == 'female' ? '{$myrowData.FEM}' : '{$myrowData.MALE}' ); 
		document.getElementById('{$myrowData.TAG}_check').checked = true;
		sum = sum + data;
	  {rdelim} 
	  else document.getElementById('{$myrowData.TAG}_val').value = '0';
	  
    {/foreach} 
       document.getElementById('ORT_SUM').value = sum;
</script>

{literal}
<script>

    // this should be added last so it gets all the ready event
    //$(document).ready(function() {
	    //alert(document.getElementById('mysort').selectedIndex == 4)
    //    if (document.getElementById('mysort').selectedIndex == 4 ) myFunction();
    //});

	$(window).load(function() {
	   

	 
   
    });
	
</script>
{/literal}
