{literal}
<style type="text/css">
table 
{
width:60%;
}
table.view { border-collapse:collapse; }
table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } 
table.view tr:nth-of-type(odd) {
 
  background-color: #def;
}
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
    		

	document.getElementById("last_pcp_visit_c1").value = "{$smarty.post.last_pcp_visit_c1}";
	document.getElementById("last_pcp_visit_c2").value = "{$smarty.post.last_pcp_visit_c2}";

}
	
</script>
{/literal}

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
	
	

<form name="mylist" method="POST" action="index.php?module=REG_Provider&action=index" onsubmit="">

<button type="submit"> Back to Provider List </button>
<input name = "riskid" id = "riskid" value = "{$myrisk->id_c}" type="hidden" > 
<input name = "pid" id = "pid" value = "{$pid}" type="hidden" > 

<div id="demo" style="text-align:center;line-height: 400%;" >
<h1>TOPCARE – Academic Detailing </h1>
</div>
<div id="demo1" style="text-align:center;line-height: 400%;" >
<h2> Provider Name <input name = "ptname" id = "ptname" value = "{$provider.provname}" >
<!-- Clinical Site <input name = "clinsite" id = "clinsite" value = "" --> 
Based on Report Run by NCM <input name = "ncm" id = "ncm" value = "{$myuser->full_name}" >
On <input name = "assdate" id = "assdate"  value = "{$smarty.now|date_format}" > </h2> </div>

<input name = "sortmemory" id = "sortmemory" value = "" type = "hidden">

<table cellspacing="0" cellpadding="0" border="1" name="mytable" id="mytable" class="list view" style="width:650px !important" align="center">

    <thead>
    
		<th width="70%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Category </div>  </th>
		<th width="15%" scope="col">    <div  id = "dyn1" align="left" width="100%" style="white-space: normal;">  Assessment    </div>	</th>
        <th width="15%" scope="col">    <div  id = "dyn1" align="left" width="100%" style="white-space: normal;">  Numbers   </div>	</th>
		

    </tr>
	</thead>
	<tbody>
	

		
	<tr class="oddListRowS1" height="20">
				<td class="" valign="top" align="left" scope="row"> <h2> Number of Sessions/week </h2> </td>

				<td class="" valign="top" align="left"  >  </td>
                <td class="" valign="top" align="left"  >  </td>
  
	</tr>

	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with treatment agreements</td>
	  <td class="" valign="top" align="left"> {math equation="x/y*100" x=$patienttreatment.pattreatct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left"> {$patienttreatment.pattreatct} out of {$numpatient.numpatientct}</td>
	</tr>
	
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">Range of # of early re-fills per year across all patients </td>

	  <td class="" valign="top" align="left"></td>
      <td class="" valign="top" align="left"></td>
	</tr>

	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with &#060 than 2 urine tox/year </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$uts.utsct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$uts.utsct} out of {$numpatient.numpatientct}</td>
	</tr>
	
<!--	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with &#060 than 2 urine tox/year in moderate risk profile group</td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$utsmod.utsct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$utsmod.utsct} out of {$numpatient.numpatientct}</td>
	</tr>
	
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with &#060 than 2 urine tox/year in high risk profile group </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$utshigh.utsct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$utshigh.utsct} out of {$numpatient.numpatientct}</td>
	</tr>-->
	
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients on multiple short-acting opioids </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$shortacting.shortactingct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$shortacting.shortactingct} out of {$numpatient.numpatientct}</td>
	</tr>
	
 
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients on multiple long-acting opioids </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$longacting.longactingct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$longacting.longactingct} out of {$numpatient.numpatientct}</td>
	</tr>	 
		 
<!--		 
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with a dosage &#062 50 mg morphine equivalence </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$patientmedd.patmeddct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$patientmedd.patmeddct} out of {$numpatient.numpatientct}</td>
	</tr>	 
-->
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with a dosage &#062 50 mg morphine equivalence</td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$medd4_7.count y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$medd4_7.count} out of {$numpatient.numpatientct}</td>
	</tr>	 
		 
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with a dosage &#062 100 mg morphine equivalence</td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$meddgt7.count y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$meddgt7.count} out of {$numpatient.numpatientct}</td>
	</tr>	 
		 
			 
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with substance abuse history</td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$substancehx.substancect y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$substancehx.substancect} out of {$numpatient.numpatientct}</td>
	</tr>	 
		 
			 
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with respiratory history </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$patientresp.patrespct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$patientresp.patrespct} out of {$numpatient.numpatientct}</td>
	</tr>	 
		 
			 
	<tr class="oddListRowS1" height="20">
	  <td class="" valign="top" align="left" scope="row">% of patients with mental health diagnosis history </td>
	  <td class="" valign="top" align="left">{math equation="x/y*100" x=$mentalhx.mentalct y=$numpatient.numpatientct format="%.2f"}</td>
      <td class="" valign="top" align="left">{$mentalhx.mentalct} out of {$numpatient.numpatientct}</td>
	</tr>	 
		 
		 
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
