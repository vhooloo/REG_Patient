{literal}
<style type="text/css">
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


//set up the matrix of ort terms
$ort_terms[] = array( 'TAG' => 'ORT-1A', 'DOM' => 'Family History of Substance Abuse (Alcohol)', 'FEM' => '1', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort1a);
$ort_terms[] = array( 'TAG' => 'ORT-1B', 'DOM' => 'Family History of Substance Abuse (Illegal Drugs)', 'FEM' => '2', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort1b);
$ort_terms[] = array( 'TAG' => 'ORT-1C', 'DOM' => 'Family History of Substance Abuse (Prescription Drugs) ', 'FEM' => '4', 'MALE' => '4', 'VAL'=>$this->get_template_vars('myrisk')->ort1c);
$ort_terms[] = array( 'TAG' => 'ORT-2A', 'DOM' => 'Personal History of Substance Abuse (Alcohol) ', 'FEM' => '3', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort2a);
$ort_terms[] = array( 'TAG' => 'ORT-2B', 'DOM' => 'Personal History of Substance Abuse (Illegal Drugs', 'FEM' => '4', 'MALE' => '4', 'VAL' => $this->get_template_vars('myrisk')->ort2b);
$ort_terms[] = array( 'TAG' => 'ORT-2C', 'DOM' => 'Personal History of Substance Abuse (Prescription Drugs) ', 'FEM' => '5', 'MALE' => '5', 'VAL' => $this->get_template_vars('myrisk')->ort2c);
$ort_terms[] = array( 'TAG' => 'ORT-3', 'DOM' => 'Age (Age 1-45) ', 'FEM' => '1', 'MALE' => '1', 'VAL' => $this->get_template_vars('myrisk')->ort3);
$ort_terms[] = array( 'TAG' => 'ORT-4', 'DOM' => 'History of Preadolescent Sexual Abuse', 'FEM' => '3', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort4);
$ort_terms[] = array( 'TAG' => 'ORT-5A', 'DOM' => 'Psychological Disease (Attention Deficit Disorder, (Obsessive Compulsive Disorder, Bipolar, Schizophrenia) ', 'FEM' => '2', 'MALE' => '2', 'VAL' => $this->get_template_vars('myrisk')->ort5a);
$ort_terms[] = array( 'TAG' => 'ORT-5B', 'DOM' => 'Psychological Disease (Depression) ', 'FEM' => '1', 'MALE' => '1', 'VAL' => $this->get_template_vars('myrisk')->ort5b);

$this->assign("ort_terms",  $ort_terms );
$this->assign("pt1",  "myrisk->" );
$this->assign("pt2",  "id_c" );

//if (document.forms["mylist"]["last_pcp_visit_c1"].value == null)
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
<form name="mylist" method="POST" action="index.php?module=REG_Patient&action=SaveRisk" onsubmit="">
 <input type="hidden" name="flag" value="{$smarty.request.flag}">
 <input name = "riskid" id = "riskid" value = "{$myrisk->id_c}" type="hidden" >
 <input name = "pid" id = "pid" value = "{$pid}" type="hidden" >
 <div id="demo" style="text-align:center;line-height: 400%;" >
  <h1>TOPCARE – Individualized Opioid Risk Profile </h1>
 </div>
 <div id="demo1" style="text-align:center;line-height: 400%;" >
  <h2> Patient Name
   <input name = "ptname" id = "ptname" value = "{$patdata.lname},{$patdata.fname}" >
   MRN
   <input name = "mrn" id = "mrn" value = "{$patdata.mrn}" >
   Clinical Site
   <input name = "clinsite" id = "clinsite" value = "" >
   Based on Intake Assessment by NCM
   <input name = "ncm" id = "ncm" value = "{$myuser->full_name}" >
   On
   <input name = "assdate" id = "assdate"  value = "{if !empty($myrisk->lastmodified)} {$myrisk->lastmodified|date_format} {else} New Risk Profile{/if}" >
  </h2>
 </div>
 <input name = "sortmemory" id = "sortmemory" value = "" type = "hidden">
 <table width="100%" cellpadding="0" cellspacing="0">
  <tr>
   <td width="60%" valign="top"><table width="100%" cellspacing="0" cellpadding="0" border="1" name="mytable" id="mytable" class="list view">
     <thead>
     <th width="75%" scope="col"> <div align="left" width="100%" style="white-space: normal;"> Question </div>
      </th>
      <th width="15%" scope="col"> <div  id = "dyn1" align="left" width="100%" style="white-space: normal;"> Assessment </div>
      </th>
      <th width="10%" scope="col"> <div align="left" width="100%" style="white-space: normal;"> Score </div></th>
     </tr>
      </thead>
     
     <tbody>
      <tr class="oddListRowS1" height="20">
       <td  valign="top" align="left" scope="row"><h2> ORT Addiction and Diversion Risk </h2></td>
       <td  valign="top" align="left"></td>
       <td class="" valign="top" align="left"></td>
      </tr>
     {foreach name=myrowIteration from=$ort_terms key=id item=myrowData}
     <tr class="oddListRowS1" height="20">
      <td valign="top"  align="left" >&nbsp &nbsp {$myrowData.TAG}: {$myrowData.DOM} </td>
      <td class="" valign="top" align="left"><input type="checkbox" id="{$myrowData.TAG}_check" name ="{$myrowData.TAG}_check" 
					onclick="if(this.checked) document.getElementById('{$myrowData.TAG}_val').value = ('{$patdata.gender}' == 'female' ? '{$myrowData.FEM}' : '{$myrowData.MALE}' ); else document.getElementById('{$myrowData.TAG}_val').value = 0;document.getElementById('ORT_SUM').value = parseInt(document.getElementById('ORT-1A_val').value) + parseInt(document.getElementById('ORT-1B_val').value) +parseInt(document.getElementById('ORT-1C_val').value) +parseInt(document.getElementById('ORT-2A_val').value) +parseInt(document.getElementById('ORT-2B_val').value) +parseInt(document.getElementById('ORT-2C_val').value) +parseInt(document.getElementById('ORT-3_val').value) +parseInt(document.getElementById('ORT-4_val').value)+parseInt(document.getElementById('ORT-5A_val').value)+parseInt(document.getElementById('ORT-5B_val').value); if (parseInt(document.getElementById('ORT_SUM').value) <= 7) document.getElementById('ORT_SUM').style.backgroundColor = 'yellow';   else  document.getElementById('ORT_SUM').style.backgroundColor = '#FA5858';  if (parseInt(document.getElementById('ORT_SUM').value) <= 3) document.getElementById('ORT_SUM').style.backgroundColor = '#58FA82';    "></td>
      <td class="" valign="top" align="left"><input type="input" id="{$myrowData.TAG}_val" name ="{$myrowData.TAG}_val" value = '0' onchange="" style="width:70px;"></td>
     </tr>
     {/foreach}
     <tr class="oddListRowS1" height="20">
      <td class="" valign="top" align="left" scope="row"><h2> ORT-SUM: Sum of Above </h2></td>
      <td class="" valign="top" align="left"></td>
      <td class="" valign="top" align="left"  ><input style="background-color:#58FA82; width:70px;" name="ortsum" id="ORT_SUM" value = "0" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';">
     </tr>
     <tr class="oddListRowS1" height="20">
      <td colspan="3" align="left" valign="top" class="" scope="row">
      <table width="100%" cellpadding="0" cellspacing="0" border="0" style="border:none !important">
         <tr valign="top">
          <td width="30%" valign="top"><strong>Comment</strong></td>
          <td align="right"><textarea name="comment" cols="80" rows="4" id="comment">{php} echo $this->get_template_vars('myrisk')->comment; {/php}</textarea></td>
         </tr>
        </table>
      </td>
     </tr>
      </tbody>
     
    </table></td>
   <td valign="top"><table width="100%" cellspacing="0" cellpadding="0" border="1" name="mytable" id="mytable1" class="list view">
     <thead>
     <th width="75%" scope="col"> <div align="left" width="100%" style="white-space: normal;"> Question </div>
      </th>
      <th width="25%" scope="col"> <div  id = "dyn1" align="left" width="100%" style="white-space: normal;"> Assessment </div>
      </th>
     </tr>
      </thead>
     
     <tbody>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Multipe Short Acting Opioids </td>
       <td class="" valign="top" align="left"><input type="checkbox" tabindex="74" id="short_opioid" name="short_opioid" value="1" title="" {php} if($this->get_template_vars('myrisk')->short_opioid == 1) echo "checked='checked'"; {/php} ></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Multipe Long Acting Opioids </td>
       <td class="" valign="top" align="left"><input type="checkbox" tabindex="74" id="long_opioid" name="long_opioid" value="1" title="" {php} if($this->get_template_vars('myrisk')->long_opioid == 1) echo "checked='checked'"; {/php} ></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">MEDD Safety</td>
       <td class="" valign="top" align="left"><select name="medd" id="medd" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->medd=='0-3'){echo "background-color:#58FA82; text-decoraction:blink;";} if($this->
         
        get_template_vars('myrisk')->medd=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->medd=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->medd=='0-3')echo"selected='selected'"; {/php} style="background-color:#58FA82">&lt 50</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->medd=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">51-100</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->medd=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> &gt 100</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Pulmonary Disease (add scores) OSA =1 , O2 dependent = 1, COPD = 1 </td>
       <td class="" valign="top" align="left"><select name="pulmonary" id="pulmonary" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->pulmonary=='0-3'){echo"background-color:#58FA82;";} if($this->
         
        get_template_vars('myrisk')->pulmonary=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->pulmonary=='gt7'){echo"background-color:#FA5858;";}{/php}  width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->pulmonary=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">1   &nbsp </option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->pulmonary=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">2   &nbsp </option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->pulmonary=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> 3 &nbsp </option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Current Rx’d Other Sedating Medications</td>
       <td class="" valign="top" align="left"><select name="currentrx" id="currentrx" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->currentrx=='0-3'){echo"background-color:#58FA82;";} if($this->get_template_vars('myrisk')->currentrx=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->currentrx=='gt7'){echo"background-color:#FA5858;";}{/php}  width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->currentrx=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">None</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->currentrx=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">1</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->currentrx=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> &gt 1</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">H/o of having Opioids stopped by another provider involuntarily</td>
       <td class="" valign="top" align="left"><select name="histopioid" id="histopioid" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';" style="{php} if($this->get_template_vars('myrisk')->histopioid=='0-3'){echo"background-color:#58FA82;";} if($this->
         
        get_template_vars('myrisk')->histopioid=='4-7'){echo"background-color:#fc0;";} {/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->histopioid=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">No</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->histopioid=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Preoccupation with Medications</td>
       <td class="" valign="top" align="left"><select name="preocc" id="preocc" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';" style="{php} if($this->get_template_vars('myrisk')->preocc=='0-3'){echo"background-color:#58FA82;";} if($this->
         
        get_template_vars('myrisk')->preocc=='4-7'){echo"background-color:#fc0;";} {/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->preocc=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">No</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->preocc=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Unstable Social Environment</td>
       <td class="" valign="top" align="left"><select name="unstable" id="unstable" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->unstable=='0-3'){echo"background-color:#58FA82; ";} else{echo"background-color:#FA5858; ";} {/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->unstable=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">No</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->unstable=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Insecure Medication Storage</td>
       <td class="" valign="top" align="left"><select name="insecure" id="insecure" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->insecure=='0-3'){echo"background-color:#58FA82;";} if($this->
         
        get_template_vars('myrisk')->insecure=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->insecure=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">No</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->insecure=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Evidence of Prior aberrant behaviors via chart review</td>
       <td class="" valign="top" align="left"><select name="prioraberrant" id="prioraberrant" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->prioraberrant=='0-3'){echo"background-color:#58FA82;";} if($this->
         
       get_template_vars('myrisk')->prioraberrant=='gt7'){echo"background-color:#FA5858;";} {/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->prioraberrant=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">No</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->prioraberrant=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">NCM Clinical Risk Assessment  Score</td>
       <td class="" valign="top" align="left"><select name="ncmscore" id="ncmscore" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->ncmscore=='0-3'){echo"background-color:#58FA82;";} if($this->
         
       get_template_vars('myrisk')->ncmscore=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->ncmscore=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->ncmscore=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">0-3</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->ncmscore=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">4-7</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->ncmscore=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> 8-10</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20" style="background-color:silver;">
       <td class="" valign="top" align="left" scope="row"><h2>Final Clinical Risk Assessment Score</h2></td>
       <td class="" valign="top" align="left"><select name="finalscore" id="finalscore" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==1) this.style.backgroundColor = '#fc0';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->finalscore=='0-3'){echo"background-color:#58FA82;";} if($this->
         
       get_template_vars('myrisk')->finalscore=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->finalscore=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->finalscore=='0-3') echo"selected='selected'"; {/php} style="background-color:#58FA82">0-3</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->finalscore=='4-7') echo"selected='selected'"; {/php} style="background-color:#fc0">4-7</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->finalscore=='gt7') echo"selected='selected'"; {/php} style="background-color:#FA5858"> 8-10</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">&nbsp;</td>
       <td class="" valign="top" align="left">&nbsp;</td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td colspan="2" align="center" valign="bottom" scope="row" >
	   
	   <button type="button" {if isset($smarty.request.flag) && $smarty.request.flag eq 1} onclick="javascript:window.close();" {else} onclick="javascript:history.back();" {/if}> Back </button> &nbsp; <button type="submit"> Save </button>
       </td>
      </tr>
     </tbody>
    </table></td>
  </tr>
  <tr>
   <td></td>
   <td></td>
  </tr>
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