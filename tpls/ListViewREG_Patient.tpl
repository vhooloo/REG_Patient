{literal}
<script>
function myFunction()
{
document.getElementById("demo").innerHTML="Hello World";
}
</script>
{/literal}

<link type="text/css" rel="stylesheet" href="custom/topcarejs/jquery.dropdown.css" />
<script type="text/javascript" src="custom/topcarejs/jquery.dropdown.js"></script>

<!--
<form id="EditView" name="EditView" method="POST" action="index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DVHT_VHPATIENT%26action%3Dindex%26parentTab%3DAll">
<div class="sumbitButtons">

    <input id="search_form_submit" class="button" type="submit" value="Search" name="button" onclick="var _form = document.getElementById('EditView'); _form.action.value='Save';SUGAR.ajaxUI.submitForm(_form);" title="Search" tabindex="2"></input>
    <input id="search_form_clear" class="button" type="button" value="Clear" name="clear" onclick="SUGAR.searchForm.clear_form(this.form); return false;" title="Clear" tabindex="2"></input>
    <a id="advanced_search_link" accesskey="8" href="javascript:void(0);" onclick="SUGAR.searchForm.searchFormSelect('Accounts|advanced_search','Accounts|basic_search')"> … </a>

</div>
-->

<form method="POST" action="index.php?module=REG_Patient&action=topcare">
Choose an option to filter:	
<select name="mysort" onchange="this.form.submit()">
<option value="none"></option>
<option value="all">All Refills</option>
<option value="week">Next Seven Days</option>

</select>

</form>


{php}

//var_dump($_POST);
if ($_POST['mysort'] == 'week')  $this->assign("mytitle", "List of Refills in next 7 days") ; 
else 							 $this->assign("mytitle", "List of All Refills");

{/php}



<div id="demo">
<h1>{$mytitle}</h1>
</div>

<table class="list view" width="100%" cellspacing="0" cellpadding="0" border="0">
   <tbody>
    <tr height = "20">
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Last Name </div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  First Name </div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  MRN </div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Refill Date </div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Action </div> </th>
    </tr>
	
	
    {if (empty($mydata))}  <tr class="oddListRowS1" height="20">  <td class="" valign="top" align="left" scope="row"> <h1>NO REFILLS FOR NEXT SEVEN DAYS</h1> </td>    </tr>   {/if}
	 
	{foreach name=myrowIteration from=$mydata key=id item=myrowData}

	 
	     <tr class="oddListRowS1" height="20">
		    <td class="" valign="top" align="left" scope="row"> <a href="./index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Patient%26action%3DDetailView%26record%3D{$myrowData.patid}"> {$myrowData.lname} </a> </td>
            <td class="" valign="top" align="left"> {$myrowData.fname}  </td>
			<td class="" valign="top" align="left"> {$myrowData.mrn}  </td>
            <td class="" valign="top" align="left"> {$myrowData.refill} </td>
            <!--td class=" phone" valign="top" align="left"> <a href="./index.php?module=REG_Patient&action=PrescriptionRefill&record={$myrowData.patid}">Open...</a></td-->
			<td class="" valign="top" align="left">
				<div id="{$myrowData.patid}" class="dropdown dropdown-tip"> <ul class="dropdown-menu">  
				  <li><a href="./index.php?module=REG_Patient&action=PrescriptionRefill&record={$myrowData.patid}">Refill</a></li>  
				  <li><a href="./index.php?module=REG_Patient&action=PatientEncounter&record={$myrowData.patid}">Encounter</a></li> </ul> </div><input type="button" value="Action" data-dropdown="#{$myrowData.patid}" class="">	
			</td>	  
         </tr>

	{/foreach}

  </tbody>

</table>

</form>