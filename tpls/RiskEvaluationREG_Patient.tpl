{literal}
<style type="text/css">
table.myTable { border-collapse:collapse; }
table.myTable td, table.myTable th { border:1px solid black;padding:5px; }
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
</script>
{/literal}



{php}

//session_start();
// store session data
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



//if (document.forms["mylist"]["last_pcp_visit_c1"].value == null)
{/php}



<form name="mylist" method="POST" action="index.php?module=REG_Patient&action=listview" onsubmit="">


<div id="demo">
<h1>TOPCARE – Individualized Opioid Risk Profile</h1>
</div>

<h2> Patient Name <input name = "ptname" id = "ptname" value = "" >
MRN <input name = "mrn" id = "mrn" value = "" >
Clinical Site<input name = "clinsite" id = "clinsite" value = "" > 
Based on Intake Assessment by NCM <input name = "ncm" id = "ncm" value = "" >
On <input name = "assdate" id = "assdate" value = "" > </h2>

<input name = "sortmemory" id = "sortmemory" value = "" type = "hidden">

<table  width="100%" cellspacing="0" cellpadding="0" border="1" name="mytable" id="mytable" class="myTable">
    <thead>
    <tr height = "20">
		<th width="10%" scope="col" data-sort="string">    <div align="left" width="100%" style="white-space: normal;">  
			Scale <a href="#" onclick="sortTable('asc');" style="font-size:150%;" id = "asc" name = "asc"> &uarr; </a> <a href="#" onclick="sortTable('desc');" style="font-size:150%;" id = "desc" name = "desc"> &darr; </a></div> </th>
		<th width="20%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Domain </div>  </th>
		<th width="10%" scope="col">    <div  id = "dyn1" align="left" width="100%" style="white-space: normal;">  Scoring    </div>	</th>
			<th width="1%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Source			</div></th>				
		<th width="1%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Score	</div></th>
		<th width="1%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Action </div> </th>
    </tr>
	</thead>
	<tbody>
	


	 
	     <tr  height="20">
		    <td  style="border:1px solid black;" valign="top" align="left" scope="row"> ORT </a> </td>
			<td  valign="top" align="left"> Addiction and Diversion Risk  </td>
            <td class="" valign="top" align="left"> Scoring</td>
			<td class="" valign="top" align="left"> Questionnaire </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>

		<tr  height="20">
		    <td class="" valign="top" align="left" scope="row"> ORT-1A </a> </td>
			<td class="" valign="top" align="left"> Family History of Substance Abuse (Alcohol)  </td>
            <td class="" valign="top" align="left"> If F = 1, else if M = 3</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>

		 <tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-1B. </a> </td>
			<td class="" valign="top" align="left"> Family History of Substance Abuse (Illegal Drugs)	  </td>
            <td class="" valign="top" align="left"> If F = 2, else if M = 3</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
		 
	<tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-1C. </a> </td>
			<td class="" valign="top" align="left">  Family History of Substance Abuse (Prescription Drugs)	  </td>
            <td class="" valign="top" align="left"> If F = 4, else if M = 4</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
	<tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-2A. </a> </td>
			<td class="" valign="top" align="left">  Personal History of Substance Abuse (Alcohol)	  </td>
            <td class="" valign="top" align="left"> If F = 3, else if M = 3</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
	<tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-2B. </a> </td>
			<td class="" valign="top" align="left"> Personal History of Substance Abuse (Illegal Drugs)	  </td>
            <td class="" valign="top" align="left"> If F = 4, else if M = 4</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
	<tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-2C. </a> </td>
			<td class="" valign="top" align="left"> Personal History of Substance Abuse (Prescription Drugs)  </td>
            <td class="" valign="top" align="left">	If F = 5, else if M = 5</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
	<tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-3. </a> </td>
			<td class="" valign="top" align="left">  Age (Age 1-45)	  </td>
            <td class="" valign="top" align="left"> If F = 1, else if M = 1</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
	<tr  height="20">
		    <td class="" valign="top" align="left" scope="row">ORT-4. </a> </td>
			<td class="" valign="top" align="left"> History of Preadolescent Sexual Abuse  </td>
            <td class="" valign="top" align="left">	If F = 3, else if M = 0</td>
			<td class="" valign="top" align="left">  </td>	
            <td class="" valign="top" align="left"> </td>
			<td class="" valign="top" align="left">	</td>	  
         </tr>
	<tr  height="20">
				<td class="" valign="top" align="left" scope="row">ORT-5A. </a> </td>
				<td class="" valign="top" align="left"> Psychological Disease (Attention Deficit Disorder, (Obsessive Compulsive Disorder, Bipolar, Schizophrenia)	  </td>
				<td class="" valign="top" align="left"> If F = 2, else if M = 2</td>
				<td class="" valign="top" align="left">  </td>	
				<td class="" valign="top" align="left"> </td>
				<td class="" valign="top" align="left">	</td>	  
			 </tr>
		<tr  height="20">
				<td class="" valign="top" align="left" scope="row">ORT-5B. </a> </td>
				<td class="" valign="top" align="left">  Psychological Disease  (Depression)  </td>
				<td class="" valign="top" align="left">	If F = 1, else if M = 1</td>
				<td class="" valign="top" align="left">  </td>	
				<td class="" valign="top" align="left"> </td>
				<td class="" valign="top" align="left">	</td>	  
			 </tr>
		<tr  height="20">
				<td class="" valign="top" align="left" scope="row">ORT-SUM	</a> </td>
				<td class="" valign="top" align="left"> </td>
				<td class="" valign="top" align="left"> Sum of Above </td>
				<td class="" valign="top" align="left"> Questionnaire </td>
				<td class="" valign="top" align="left"  >  <select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">0-3</option>
					<option value="4-7" style="background-color:#fc0">4-7</option>
					<option value="gt7" style="background-color:red">>7</option>
					</select> </td>	
				<td class="" valign="top" align="left">	</td>	  
			 </tr>

		<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">MEDD</a></td>
	  <td class="" valign="top" align="left">Safety</td>
	  <td class="" valign="top" align="left">See Calculator</td>
	  <td class="" valign="top" align="left">Medication List</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">&lt 50</option>
					<option value="4-7" style="background-color:#fc0">51-100</option>
					<option value="gt7" style="background-color:red"> &gt 100</option>
					</select> </td>	
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Pulmonary Disease</a></td>
	  <td class="" valign="top" align="left">Safety	•</td>
	  <td class="" valign="top" align="left">•	OSA = 1
		•	O2 Dependent = 1
		•	COPD = 1
		Sum of above</td>
	  <td class="" valign="top" align="left">Chart, Interview</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">1</option>
					<option value="4-7" style="background-color:#fc0">2</option>
					<option value="gt7" style="background-color:red"> 3</option>
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Current Rx’d Other Sedating Medications</a></td>
	  <td class="" valign="top" align="left">Safety</td>
	  <td class="" valign="top" align="left">Sum of Medications e.g. Benzos, etc.</td>
	  <td class="" valign="top" align="left">Medication List</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">None</option>
					<option value="4-7" style="background-color:#fc0">1</option>
					<option value="gt7" style="background-color:red"> &gt 1</option>
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">H/o of having Opioids stopped by another provider involuntarily</a></td>
	  <td class="" valign="top" align="left">Addiction & Diversion Risk</td>
	  <td class="" valign="top" align="left">Yes vs. No</td>
	  <td class="" valign="top" align="left">Chart, Interview</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">No</option>
					<option value="4-7" style="background-color:#fc0">Yes</option>
					
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Preoccupation with Medications</a></td>
	  <td class="" valign="top" align="left">Addiction
		& Diversion Risk</td>
	  <td class="" valign="top" align="left">Yes vs. No</td>
	  <td class="" valign="top" align="left">Chart, Interview</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">No</option>
					<option value="4-7" style="background-color:#fc0">Yes</option>
					
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Unstable Social Environment</a></td>
	  <td class="" valign="top" align="left">Addiction & Diversion Risk</td>
	  <td class="" valign="top" align="left">Yes vs. No</td>
	  <td class="" valign="top" align="left">Chart, Interview</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">No</option>
					
					<option value="gt7" style="background-color:red"> Yes</option>
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Insecure Medication Storage</a></td>
	  <td class="" valign="top" align="left">Safety</td>
	  <td class="" valign="top" align="left">Yes vs. No</td>
	  <td class="" valign="top" align="left">Chart, Interview</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">No</option>
					
					<option value="gt7" style="background-color:red"> Yes</option>
					</select></td></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Evidence of Prior aberrant behaviors via chart review</a></td>
	  <td class="" valign="top" align="left">Addiction
		& Diversion Risk</td>
	  <td class="" valign="top" align="left">Yes vs. No</td>
	  <td class="" valign="top" align="left">Chart, Interview</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">No</option>
					
					<option value="gt7" style="background-color:red"> Yes</option>
					</select></td></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">NCM Clinical Risk Assessment  Score</a></td>
	  <td class="" valign="top" align="left">Overall risk</td>
	  <td class="" valign="top" align="left">0 (Lowest) -10 (Highest)</td>
	  <td class="" valign="top" align="left">NCM</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">0-3</option>
					<option value="4-7" style="background-color:#fc0">4-7</option>
					<option value="gt7" style="background-color:red"> 8-10</option>
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>
	<tr  height="20">
	  <td class="" valign="top" align="left" scope="row">Final Clinical Risk Assessment Score</a></td>
	  <td class="" valign="top" align="left">Overall risk</td>
	  <td class="" valign="top" align="left">0 (Lowest) -10 (Highest)</td>
	  <td class="" valign="top" align="left">Provider / Team</td>
	  <td class="" valign="top" align="left"><select style="background-color:green" 
				onchange="if (this.selectedIndex==0) this.style.backgroundColor = 'green';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = 'red';">
					<option value="0-3" style="background-color:green">0-3</option>
					<option value="4-7" style="background-color:#fc0">4-7</option>
					<option value="gt7" style="background-color:red"> 8-10</option>
					</select></td>
	  <td class="" valign="top" align="left"></td>
	</tr>	 
		 
		 
		 
  </tbody>

</table>






</form>


{literal}
<script>

    // this should be added last so it gets all the ready event
    //$(document).ready(function() {
	    //alert(document.getElementById('mysort').selectedIndex == 4)
    //    if (document.getElementById('mysort').selectedIndex == 4 ) myFunction();
    //});

	$(window).load(function() {
	   if (document.getElementById('mysort').selectedIndex == 4 ) myFunction();
	   if ( {/literal} {$smarty.session.regnamesort} != "" ) sortTable('{$smarty.session.regnamesort}'); {literal}
    });
	
</script>
{/literal}
