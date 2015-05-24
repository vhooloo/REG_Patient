{literal}
<style type="text/css">
table.view { border-collapse:collapse;
}
table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px;
} 
table.view tr:nth-of-type(odd) {
 
  background-color: #def;
}
</style>
{/literal}

{literal} 
<script type="text/javascript">
	if (typeof jQuery == "undefined") document.write("<script src='custom/include/jquery/jquery.min.js'></" + "script>");
	
</script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<link href="custom/topcarejs/slider/css/bootstrap-slider.css" media="all" rel="stylesheet">

	<!-- Latest compiled and minified JavaScript -->
	    <script src="custom/jquery/jquery-2.1.0.min.js"></script> 
  <script src="custom/jquery/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
	<script type="text/javascript" src="custom/topcarejs/slider/js/bootstrap-slider.js"></script>
  <script>
  $(function() {
    $( "#tabs" ).tabs();
	$( "#tabs1" ).tabs();
	$("#tabs2").tabs();
	 $("#ex1").slider({
	 ticks: [0, 3, 5, 8, 9],
	  ticks_positions: [0, 30, 60, 70, 90],
	     ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
formatter: function(value) {
		return 'Current value: ' + value;
	}
}).on('slide', $("#ex1 .slider-selection").css('background', 'red'));


;
  });
 
  </script>
 
{/literal}
<!--<link type="text/css" rel="stylesheet" href="custom/topcarejs/jquery.dropdown.css" />
<script type="text/javascript" src="custom/topcarejs/jquery.dropdown.js"></script> -->

 <!-- PHP -->
{php}

//session_start();
// store session data
// get all assigned template vars

//$myvars = $this->get_template_vars('myrisk');
//print_r( $myvars->ort1a);

// take a look at them
//print_r($this->myrisk->ort1a);


//set up the matrix of comm_terms
$comm_terms[] = array( 'TAG' => 'COMM-1', 'DOM' => 'In the past 30 days, how often have you had trouble with thinking clearly or had memory problems?' , 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-1']);
$comm_terms[] = array( 'TAG' => 'COMM-2', 'DOM' => 'In the past 30 days, how often do people complain that you are not completing necessary tasks? (i.e., doing things that need to be done, such as going to class, work or appointments) ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-2']);
$comm_terms[] = array( 'TAG' => 'COMM-3', 'DOM' => ' In the past 30 days, how often have you had to go to someone other than your prescribing physician to get sufficient pain relief from medications? (i.e., another doctor, the Emergency Room, friends, street sources) ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-3']);
$comm_terms[] = array( 'TAG' => 'COMM-4', 'DOM' => ' In the past 30 days, how often have you taken your medications differently from how they are prescribed?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-4']);
$comm_terms[] = array( 'TAG' => 'COMM-5', 'DOM' => 'In the past 30 days, how often have you seriously thought about hurting yourself?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-5']);
$comm_terms[] = array( 'TAG' => 'COMM-6', 'DOM' => ' In the past 30 days, how much of your time was spent thinking about opioid medications (having enough, taking them, dosing schedule, etc.)?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-6']);
$comm_terms[] = array( 'TAG' => 'COMM-7', 'DOM' => 'In the past 30 days, how often have you been in an argument?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-7']);
$comm_terms[] = array( 'TAG' => 'COMM-8', 'DOM' => ' In the past 30 days, how often have you had trouble controlling your anger (e.g., road rage, screaming, etc.)?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-8']);
$comm_terms[] = array( 'TAG' => 'COMM-9', 'DOM' => ' In the past 30 days, how often have you needed to take pain medications belonging to someone else?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-9']);
$comm_terms[] = array( 'TAG' => 'COMM-10', 'DOM' => ' In the past 30 days, how often have you been worried about how you’re handling your medications?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-10']);
$comm_terms[] = array( 'TAG' => 'COMM-11', 'DOM' => ' In the past 30 days, how often have others been worried about how you’re handling your medications? ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-11']);
$comm_terms[] = array( 'TAG' => 'COMM-12', 'DOM' => ' In the past 30 days, how often have you had to make an emergency phone call or show up at the clinic without an appointment? ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-12']);
$comm_terms[] = array( 'TAG' => 'COMM-13', 'DOM' => ' In the past 30 days, how often have you gotten angry with people?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-13']);
$comm_terms[] = array( 'TAG' => 'COMM-14', 'DOM' => ' In the past 30 days, how often have you had to take more of your medication than prescribed?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-14']);
$comm_terms[] = array( 'TAG' => 'COMM-15', 'DOM' => 'In the past 30 days, how often have you borrowed pain medication from someone else?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-15']);
$comm_terms[] = array( 'TAG' => 'COMM-16', 'DOM' => ' In the past 30 days, how often have you used your pain medicine for symptoms other than for pain (e.g., to help you sleep, improve your mood, or relieve stress)?', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-16']);
$comm_terms[] = array( 'TAG' => 'COMM-17', 'DOM' => ' In the past 30 days, how often have you had to visit the Emergency Room?  ', 
						'VAL' => $this->get_template_vars('myrisk')->comm_terms['COMM-17']);

//print_r( $comm_terms);
$this->assign("comm_terms",  $comm_terms );
//set up the matrix of ort terms
$ort_terms[] = array( 'TAG' => 'ORT-1A', 'DOM' => 'Family History of Substance Abuse (Alcohol)', 'FEM' => '1', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort1a);
$ort_terms[] = array( 'TAG' => 'ORT-1B', 'DOM' => 'Family History of Substance Abuse (Illegal Drugs)', 'FEM' => '2', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort1b);
$ort_terms[] = array( 'TAG' => 'ORT-1C', 'DOM' => 'Family History of Substance Abuse (Prescription Drugs) ', 'FEM' => '4', 'MALE' => '4', 'VAL'=>$this->get_template_vars('myrisk')->ort1c);
$ort_terms[] = array( 'TAG' => 'ORT-2A', 'DOM' => 'Personal History of Substance Abuse (Alcohol) ', 'FEM' => '3', 'MALE' => '3', 'VAL' => $this->get_template_vars('myrisk')->ort2a);
$ort_terms[] = array( 'TAG' => 'ORT-2B', 'DOM' => 'Personal History of Substance Abuse (Illegal Drugs)', 'FEM' => '4', 'MALE' => '4', 'VAL' => $this->get_template_vars('myrisk')->ort2b);
$ort_terms[] = array( 'TAG' => 'ORT-2C', 'DOM' => 'Personal History of Substance Abuse (Prescription Drugs) ', 'FEM' => '5', 'MALE' => '5', 'VAL' => $this->get_template_vars('myrisk')->ort2c);
$ort_terms[] = array( 'TAG' => 'ORT-3', 'DOM' => 'Age (Age 1-45) ', 'FEM' => '1', 'MALE' => '1', 'VAL' => $this->get_template_vars('myrisk')->ort3);
$ort_terms[] = array( 'TAG' => 'ORT-4', 'DOM' => 'History of Preadolescent Sexual Abuse', 'FEM' => '3', 'MALE' => '0', 'VAL' => $this->get_template_vars('myrisk')->ort4);
$ort_terms[] = array( 'TAG' => 'ORT-5A', 'DOM' => 'Psychological Disease (Attention Deficit Disorder, Obsessive Compulsive Disorder, Bipolar, Schizophrenia) ', 'FEM' => '2', 'MALE' => '2', 'VAL' => $this->get_template_vars('myrisk')->ort5a);
$ort_terms[] = array( 'TAG' => 'ORT-5B', 'DOM' => 'Psychological Disease (Depression) ', 'FEM' => '1', 'MALE' => '1', 'VAL' => $this->get_template_vars('myrisk')->ort5b);

$this->assign("ort_terms",  $ort_terms );
//$this->assign("pt1",  "myrisk->" );
//$this->assign("pt2",  "id_c" );

//if (document.forms["mylist"]["last_pcp_visit_c1"].value == null)
{/php}

<script type="text/javascript"> {literal}
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

function calcscore(){
    var score = 0;
    $(".comm:checked").each(function(){
        score+=parseInt($(this).val()-1,0);
    });
    $("input[name=sumcomm]").val(score);
	comminterp();

}
$().ready(function(){
	//$('[data-toggle="popover"]').popover();
	calcscore();
	$("input[name=sumort]").val($("input[name=ortsum]").val());
		ortinterp();
    $(".comm").change(function(){
        calcscore();
    });
	$("input[name=sumncm]").val($('#finalscore  option:selected').text());
	$("input[name=ortsum]").change(function(){
        $("input[name=sumort]").val($("input[name=ortsum]").val());
		ortinterp();
    });
	$("select[name=finalscore]").change(function(){
        $("input[name=sumncm]").val($('#finalscore  option:selected').text());
    });
});
{/literal}
	

	</script>
<form name="mylist" method="POST" action="index.php?module=REG_Patient&action=SaveRisk" onsubmit="">
 <input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
 <input type="hidden" name="flag" value="{$smarty.request.flag}">
 <input name = "riskid" id = "riskid" value = "{$myrisk->id_c}" type="hidden" >
 <input name = "commid" id = "commid" value = "{$myrisk->comm_id_c}" type="hidden" >
 <input name = "pid" id = "pid" value = "{$pid}" type="hidden" >
 <input name = "ptname" id = "ptname" value = "{$patdata.lname},{$patdata.fname}" type="hidden">
 <!--div id="demo" style="text-align:center;line-height: 400%;" >
  <h3>TOPCARE – Individualized Opioid Risk Profile </h3>
 </div>
 <div id="demo1" style="text-align:center;line-height: 100%;" >
  <h5> Patient Name
   <input name = "ptname" id = "ptname" value = "{$patdata.lname},{$patdata.fname}" readonly>
   MRN
   <input name = "mrn" id = "mrn" value = "{$patdata.mrn}" readonly>
   Clinical Site
   <input name = "clinsite" id = "clinsite" value = "{$patdata.location}" readonly >
   Based on Intake Assessment by NCM
   <input name = "ncm" id = "ncm" value = "{$myuser->full_name}" readonly>
   On
   <input name = "assdate" id = "assdate"  value = "{if !empty($myrisk->lastmodified)} {$myrisk->lastmodified|date_format} {else} New Risk Profile{/if}" readonly>
  </h2>
 </div-->
 
  <div class="panel panel-primary panel-sm" style="margin-left: 15px; margin-right: 15px">
   <div class="panel-heading">
     <h3 class="panel-title">TOPCARE – Individualized Opioid Risk Profile</h3>
   </div>
   <div class="panel-body">
       <div class="row">
 <div class="col-xs-4"><label for="patname">Patient Name: {$patdata.lname},{$patdata.fname} </label> </div>
 <div class="col-xs-4"><label for="patmrn"> MRN: {$patdata.mrn} </label> </div>
 
 </div>
     </div>
   </div>


 <div class="col-md-8">
 <div id="tabs">
  <ul>
    <li><a href="#fragment-1">Comm</a></li>
    <li><a href="#fragment-2">ORT</a></li>
    
  </ul>
    <div id="fragment-1"><div ng-app="">
 <table width="100%" cellspacing="0" cellpadding="0" border="1" name="mytable" id="mytable" class="list view">
     <thead>
     <th width="75%" scope="col"> <div align="left" width="100%" style="white-space: normal;"> Question </div>
      </th>
      <th width="5%" scope="col"> <div  id = "dyn1" align="left" width="100%" style="white-space: normal;"> Never </div>
      </th>
      <th width="5%" scope="5col"> <div align="left" width="100%" style="white-space: normal;"> Seldom </div></th>
<th width="5%" scope="5col"> <div align="left" width="100%" style="white-space: normal;"> Some times </div></th>
<th width="5%" scope="5col"> <div align="left" width="100%" style="white-space: normal;"> Often </div></th>
<th width="5%" scope="5col"> <div align="left" width="100%" style="white-space: normal;"> Very Often </div></th>

      </thead>
     
     <tbody>

     {foreach name=myrowIteration from=$comm_terms  item=myrowData}
     <tr class="oddListRowS1" height="20">
      <td valign="top"  align="left" >&nbsp &nbsp {$myrowData.TAG}: {$myrowData.DOM} </td>
      <td  valign="top" align="left"><input class="comm" type="radio" id="{$myrowData.TAG}_never" name ="{$myrowData.TAG}_radio"  value='1' {if (($myrowData.VAL == 1) &&  !empty($myrisk->lastmodified) )} checked {/if} > </td>
		<td  valign="top" align="left">	 <input class="comm" type="radio" id="{$myrowData.TAG}_seldom" name ="{$myrowData.TAG}_radio"  value='2' {if ($myrowData.VAL == 2)} checked {/if}> </td>
		<td  valign="top" align="left">	 <input class="comm" type="radio" id="{$myrowData.TAG}_sometimes" name ="{$myrowData.TAG}_radio"  value='3' {if ($myrowData.VAL == 3)} checked {/if}> </td>
		<td valign="top" align="left">	<input class="comm" type="radio" id="{$myrowData.TAG}_often" name ="{$myrowData.TAG}_radio"  value='4' {if ($myrowData.VAL == 4)} checked {/if}> </td>
		<td  valign="top" align="left">	 <input class="comm" type="radio" id="{$myrowData.TAG}_veryoften" name ="{$myrowData.TAG}_radio"  value='5' {if ($myrowData.VAL == 5)} checked {/if}> </td>
	 </td>
     
     </tr>
     {/foreach}

      </tbody>
     
    </table>
	   
 <button class="btn btn-large btn-warning" data-toggle="modal" data-target="#myModalpdf" type="button" >Download Blank COMM</button>

  
</div></div> <!-- fragment 1 ng-app -->

<div id="fragment-2">
<table width="100%" cellpadding="0" cellspacing="0" align="center" class="list view">

     <thead>
     <th width="75%" scope="col"> <div align="left" width="100%" style="white-space: normal;"> Question </div>
      </th>
      <th width="15%" scope="col"> <div  id = "dyn1" align="left" width="100%" style="white-space: normal;"> Assessment </div>
      </th>
      <th width="10%" scope="col"> <div align="left" width="100%" style="white-space: normal;"> Score </div></th>

      </thead>
     
     <tbody>
      <tr class="oddListRowS1" height="20">
       <td  valign="top" align="left" scope="row"><h3> ORT Addiction and Diversion Risk </h3></td>
       <td  valign="top" align="left"></td>
       <td class="" valign="top" align="left"></td>
      </tr>
     {foreach name=myrowIteration from=$ort_terms key=id item=myrowData}
     <tr class="oddListRowS1" height="20">

      <td valign="top"  align="left" >&nbsp &nbsp {$myrowData.TAG}: {$myrowData.DOM} </td>
      <td class="" valign="top" align="left"><input type="checkbox" id="{$myrowData.TAG}_check" name ="{$myrowData.TAG}_check" 
					onclick="if(this.checked) document.getElementById('{$myrowData.TAG}_val').value = ('{$patdata.gender}' == 'female' ? '{$myrowData.FEM}' : '{$myrowData.MALE}' );
else document.getElementById('{$myrowData.TAG}_val').value = 0;document.getElementById('ORT_SUM').value = parseInt(document.getElementById('ORT-1A_val').value) + parseInt(document.getElementById('ORT-1B_val').value) +parseInt(document.getElementById('ORT-1C_val').value) +parseInt(document.getElementById('ORT-2A_val').value) +parseInt(document.getElementById('ORT-2B_val').value) +parseInt(document.getElementById('ORT-2C_val').value) +parseInt(document.getElementById('ORT-3_val').value) +parseInt(document.getElementById('ORT-4_val').value)+parseInt(document.getElementById('ORT-5A_val').value)+parseInt(document.getElementById('ORT-5B_val').value);
if (parseInt(document.getElementById('ORT_SUM').value) <= 3) document.getElementById('ORT_SUM').style.backgroundColor = '#58FA82';
else if (parseInt(document.getElementById('ORT_SUM').value) <= 7) document.getElementById('ORT_SUM').style.backgroundColor = 'yellow';
 else document.getElementById('ORT_SUM').style.backgroundColor = '#FA5858';$('#ORT_SUM').change();" {if ($myrowData.VAL == 1)} checked {/if}></td>
      <td class="" valign="top" align="left"><input type="text" readonly id="{$myrowData.TAG}_val" name ="{$myrowData.TAG}_val" value = '' style="width:70px;"></td>
     </tr>
     {/foreach}
     <tr class="oddListRowS1" height="20">
      <td class="" valign="top" align="left" scope="row"><h3> ORT-SUM: Sum of Above </h3></td>
      <td class="" valign="top" align="left"> </td>
      <td class="" valign="top" align="left"  ><input style="{php} if($this->get_template_vars('myrisk')->ortsum <= 3) echo "background-color:#58FA82;";
else if($this->get_template_vars('myrisk')->ortsum >= 4 || $this->get_template_vars('myrisk')->ortsum <= 7) echo "background-color:#fc0;";
else if($this->get_template_vars('myrisk')->ortsum >= 8) echo "background-color:#FA5858;";
{/php} width:70px;" name="ortsum" id="ORT_SUM" value = "0" readonly>
     </tr>
      </tbody>
     
    </table>
</div> <!--fragment2-->

</div> <!-- tabs -->
</div> <!-- bootstrap col-md-8 -->

 <div class="col-md-4">
 <div id="tabs1">
  <ul>
    <li><a href="#fragment-a">Questions</a></li>
   
    
  </ul>
  <div id = "fragment-a">
<table width="100%" cellspacing="0" cellpadding="0" border="1"  class="list view">
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
       <td class="" valign="top" align="left"><input type="checkbox" tabindex="74" id="short_opioid" name="short_opioid" value="1" title="" {php} if($this->get_template_vars('myrisk')->short_opioid == 1) echo "checked='checked'";
{/php} ></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Multipe Long Acting Opioids </td>
       <td class="" valign="top" align="left"><input type="checkbox" tabindex="74" id="long_opioid" name="long_opioid" value="1" title="" {php} if($this->get_template_vars('myrisk')->long_opioid == 1) echo "checked='checked'";
{/php} ></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">MEDD Safety</td>
       <td class="" valign="top" align="left"><select name="medd" id="medd" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#fc0';if (this.selectedIndex==3) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->medd=='0-3'){echo "background-color:#58FA82;
text-decoraction:blink;";} if($this->
         
        get_template_vars('myrisk')->medd=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->medd=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->medd=='0-3')echo"selected='selected'";
{/php} style="background-color:#58FA82">&lt 50</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->medd=='4-7') echo"selected='selected'";
{/php} style="background-color:#fc0">51-100</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->medd=='gt7') echo"selected='selected'";
{/php} style="background-color:#FA5858"> &gt 100</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <!--<td class="" valign="top" align="left" scope="row">Pulmonary Disease (add scores) OSA =1 , O2 dependent = 1, COPD = 1 </td>-->
       <td class="" valign="top" align="left" scope="row">Obstructive Sleep Apnea </td>
       <td class="" valign="top" align="left"><input type="checkbox" tabindex="74" id="pulmonary" name="pulmonary" value="1" title="" {php} if($this->get_template_vars('myrisk')->pulmonary == 1) echo "checked='checked'";
{/php} ></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Current Rx’d Other Sedating Medications</td>
       <td class="" valign="top" align="left"><select name="currentrx" id="currentrx" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#fc0';if (this.selectedIndex==3) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->currentrx=='0-3'){echo"background-color:#58FA82;";} if($this->get_template_vars('myrisk')->currentrx=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->currentrx=='gt7'){echo"background-color:#FA5858;";}{/php}  width:100px;">
         <option  style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->currentrx=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">None</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->currentrx=='4-7') echo"selected='selected'";
{/php} style="background-color:#fc0">1</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->currentrx=='gt7') echo"selected='selected'";
{/php} style="background-color:#FA5858"> &gt 1</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">H/o of having Opioids stopped by another provider involuntarily</td>
       <td class="" valign="top" align="left"><select name="histopioid" id="histopioid" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#fc0';" style="{php} if($this->get_template_vars('myrisk')->histopioid=='0-3'){echo"background-color:#58FA82;";} if($this->
         
        get_template_vars('myrisk')->histopioid=='4-7'){echo"background-color:#fc0;";} {/php} width:100px;">
         <option  style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->histopioid=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">No</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->histopioid=='4-7') echo"selected='selected'";
{/php} style="background-color:#fc0">Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Preoccupation with Medications</td>
       <td class="" valign="top" align="left"><select name="preocc" id="preocc" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#fc0';" style="{php} if($this->get_template_vars('myrisk')->preocc=='0-3'){echo"background-color:#58FA82;";} if($this->get_template_vars('myrisk')->preocc=='4-7'){echo"background-color:#fc0;";} {/php} width:100px;">
         <option style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->preocc=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">No</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->preocc=='4-7') echo"selected='selected'";
{/php} style="background-color:#fc0">Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Unstable Social Environment</td>
       <td class="" valign="top" align="left"><select name="unstable" id="unstable" onchange="if(this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->unstable=='0-3'){echo"background-color:#58FA82;";} if($this->get_template_vars('myrisk')->unstable=='gt7'){echo"background-color:#FA5858;";} {/php} width:100px;">
         <option  style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->unstable=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">No</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->unstable=='gt7') echo"selected='selected'";
{/php} style="background-color:#FA5858"> Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Insecure Medication Storage</td>
       <td class="" valign="top" align="left"><select name="insecure" id="insecure" onchange="if(this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->insecure=='0-3'){echo"background-color:#58FA82;";} if($this->
         
        get_template_vars('myrisk')->insecure=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option  style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->insecure=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">No</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->insecure=='gt7') echo"selected='selected'";
{/php} style="background-color:#FA5858"> Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">Evidence of Prior aberrant behaviors via chart review</td>
       <td class="" valign="top" align="left"><select name="prioraberrant" id="prioraberrant" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->prioraberrant=='0-3'){echo"background-color:#58FA82;";} if($this->
         
       get_template_vars('myrisk')->prioraberrant=='gt7'){echo"background-color:#FA5858;";} {/php} width:100px;">
         <option  style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->prioraberrant=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">No</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->prioraberrant=='gt7') echo"selected='selected'";
{/php} style="background-color:#FA5858"> Yes</option>
        </select></td>
      </tr>
      <tr class="oddListRowS1" height="20">
       <td class="" valign="top" align="left" scope="row">NCM Clinical Risk Assessment  Score</td>
       <td class="" valign="top" align="left"><select name="finalscore" id="finalscore" onchange="if (this.selectedIndex==0) this.style.backgroundColor = '#ffffff';if (this.selectedIndex==1) this.style.backgroundColor = '#58FA82';if (this.selectedIndex==2) this.style.backgroundColor = '#fc0';if (this.selectedIndex==3) this.style.backgroundColor = '#FA5858';" style="{php} if($this->get_template_vars('myrisk')->finalcore=='0-3'){echo"background-color:#58FA82;";} if($this->
         
       get_template_vars('myrisk')->finalscore=='4-7'){echo"background-color:#fc0;";} if($this->get_template_vars('myrisk')->finalscore=='gt7'){echo"background-color:#FA5858;";}{/php} width:100px;">
         <option  style="background-color:#ffffff">&nbsp;</option>
         <option value="0-3" {php} if($this->get_template_vars('myrisk')->finalcore=='0-3') echo"selected='selected'";
{/php} style="background-color:#58FA82">Low</option>
         <option value="4-7" {php} if($this->get_template_vars('myrisk')->finalscore=='4-7') echo"selected='selected'";
{/php} style="background-color:#fc0">Moderate</option>
         <option value="gt7" {php} if($this->get_template_vars('myrisk')->finalscore=='gt7') echo"selected='selected'";
{/php} style="background-color:#FA5858">High</option>
        </select></td>
      </tr>

     </tbody>
    </table>
	
	 <table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: 1px solid #ABC3D7">
         <tr valign="top">
          <!--td width="20%" valign="top"><strong>Comment</strong></td>
          <td align="right"><textarea name="comment" cols="120" rows="4" id="comment">{php} echo $this->get_template_vars('myrisk')->comment; {/php}</textarea></td-->
		  <div class="form-group">
			<label for="comment">Comment:</label>
				<textarea class="form-control" rows="5" id="comment" name="comment">{php} echo $this->get_template_vars('myrisk')->comment; {/php}</textarea>
			</div>
         </tr>
        </table>
 
  <table width="100%" cellpadding="0" cellspacing="0" border="0" >
         <tr valign="top"  align="center" ><td colspan="2" align="center" valign="bottom" scope="row" >
	   <div class="btn-group dropup">
  <button type="button" class="btn btn-warning" {if isset($smarty.request.flag) && $smarty.request.flag eq 1} onclick="javascript:window.close();" {else} onclick="javascript:history.back();" {/if}> Back </button> &nbsp; 
  <button type="submit" class="btn btn-primary"> Save </button>
	</td>
	</tr>

	</table>
</div></div></div> <!-- fragment+ tabs + bootstrap -->
</form>



 
 
 <div class="col-md-4">
 <div id="tabs2">
  <ul>
    <li><a href="#fragment-summary">Summary</a></li>
   
    
  </ul>
  <div id = "fragment-summary">
  <div class="row">
 <div class="col-sm-4"><label for="summcomm">Total COMM Score:</label> <input id="summcomm" type="text" class="form-control" name="sumcomm" disabled/> </div>
 <div class="col-sm-4"><label for="sumort">Total ORT Score:</label> <input id="sumort" type="text" class="form-control" name="sumort" disabled/> </div>
 <div class="col-sm-4"><label for="sumort">NCM Assessment:</label> <input id="sumncm" type="text" class="form-control" name="sumncm" disabled/> </div>
  </div>
   <div class="row">
 <div class="col-md-4" id="comminterp">Comm Interpretation</div>
 <div class="col-md-4" id="ortinterp">Ort Interpretation</div>
 
  </div>
 <!--button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>
 <!-- Button trigger modal -->
<div class="row text-center"><div ><button type="button" class="btn btn-primary btn-lg text-center" data-toggle="modal" data-target="#myModal" >
  Copy Summary
</button></div></div><!--class="col-md-4 col-md-offset-4"-->
</div>
 </div>
 

 
 <div class="row">
   <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
      <li class="active">
          <a href="#home" role="tab" data-toggle="tab">
              <icon class="fa fa-home"></icon> Home
          </a>
      </li>
	</ul>
	
	    <div class="tab-content">
      <div class="tab-pane fade active in" id="home">
          <h2>Home Content Goes Here</h2>
          
      </div>
	  </div>
 
 
 </div>
 </div>


 
 <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Copy (Ctrl+c) Summary to Clipboard </h4>
      </div>
      <div id = "selectme" class="modal-body" >
        This is the text to select
      </div>
	  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        
      </div>
	      <!--div class="modal-body" >
    <iframe src="http://www.hamiltonfht.ca/docs/public/opioid-maintenance---comm-opioid-misuse-measure.pdf" width="1200" height="900" ></iframe>

    </div-->
    </div>
  </div>
</div>

 <!-- Modal -->
<div class="modal fade" id="myModalpdf" tabindex="-1" role="dialog" aria-labelledby="myModalLabelpdf" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabelpdf">Download or Print COMM for offline evaluation</h4>
      </div>
      <!--div id = "selectme" class="modal-body" >
        This is the text to select
      </div>
	  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        
      </div-->
	      <div class="modal-body" >
    <iframe src="http://www.hamiltonfht.ca/docs/public/opioid-maintenance---comm-opioid-misuse-measure.pdf" width="1200" height="700" ></iframe>

    </div>
    </div>
  </div>
</div>


 
<script type="text/javascript"> <!-- FOR UPDATES, prefill existing values, compute sum ----->
{literal}
$('#myModalpdf').on('shown.bs.modal', function () {
   $(this).find('.modal-dialog').css({width:'70%',
                               height:'90%', 
                              'max-height':'100%'});
});

$('#myModal').on('shown.bs.modal', function () {
   console.log('here');
   //selectText('selectme');
   
});


function comminterp()
{
  if ($('#summcomm').val() >= 9)
	$('#comminterp').text("Patient is at higher risk of opioid Misuse. Consider more intensive monitoring");
  else
	$('#comminterp').text("Patient is at lower risk of opioid Misuse.") ;
}

function ortinterp()
{
	if ($('#sumort').val() > 7)
	$('#ortinterp').text("ORT Score is greater than 7. High Risk - Test urine 6 times per year.");
		if ($('#sumort').val() > 3 && $('#sumort').val() <= 7)
			$('#ortinterp').text("ORT Score is between 3 and 7. Medium Risk - Test urine 4 times per year.");
		if ($('#sumort').val() <= 3 )	
			$('#ortinterp').text("ORT Score is 3 or lower. Low Risk - Test urine 2 times per year.");
}
(function ($) {
      $.each(['show', 'hide'], function (i, ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
          this.trigger(ev);
          return el.apply(this, arguments);
        };
      });
    })(jQuery);
	
   $('#myModal').on('show', function() {
  
	 //$('#selectme').css('visibility', 'visible');
	 var copytext = '<p>Patient: ' + $('#ptname').val() + '</p>';
	 copytext	+= '<p>Total Comm Score: ' + $('#summcomm').val() + ".  " + $('#comminterp').text() + '</p>';
	 copytext += '<p>Total ORT Score: ' + $('#sumort').val() +  ".  " + $('#ortinterp').text() + '</p>';
	 copytext += '<p>NCM Clinical Risk: ' + $('#finalscore  option:selected').text() +'</p>';
	 $('#selectme').html(copytext);
	 
	
	 setTimeout(function(){ console.log('selecting');selectText('selectme'); }, 1000);
   });
   
       function selectText(containerid) {

        if (document.selection) {
		console.log(1);
		  
            var range = document.body.createTextRange();
            range.moveToElementText(document.getElementById(containerid));
            
			window.clipboardData.setData("Text", range.text);
			range.select();
        } else if (window.getSelection) {
		    console.log(2);
            var range = document.createRange();
            range.selectNode(document.getElementById(containerid));
            window.getSelection().addRange(range);
        }
    }
{/literal}

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
	   
	if (sum <= 3)
		document.getElementById('ORT_SUM').style.backgroundColor = '#58FA82';
	else if (sum <= 7)
		document.getElementById('ORT_SUM').style.backgroundColor = 'yellow'; 
	else 
		document.getElementById('ORT_SUM').style.backgroundColor = '#FA5858';
	   
</script> 
	
</div> <!-- bootstrap col-md-8 -->	


</form>

