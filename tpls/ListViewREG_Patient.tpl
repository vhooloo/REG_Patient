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



<!--
{php}
echo 'DATA';
var_dump($provdata);
$db = DBManagerFactory::getInstance();  
	$result = $db->query('SELECT p1b.name provname  from reg_provider p1b');        
	while($row = $db->fetchRow($result))
	{
		echo $row['provname'];
		echo '+++++';
		
	};
	print_r(get_defined_vars());
{/php}
-->





{php}

//var_dump($_POST);
if ($_POST['mysort'] == 'week')  $mytitle = "List of Refills in Next 7 Days" ; 
else 							 $mytitle = "List of All Refills";
if (!empty($_POST['provsort']) AND $_POST['provsort'] != "none" ) 
 $mytitle .= " For " . $_POST['provsort'];
else
 $mytitle .= " For ALL Providers" ;
 
 $this->assign("mytitle", $mytitle);

if ($_POST['mysort'] == 'week')  $this->assign("datsel", "week") ; 
else 							 $this->assign("datsel", "all");
if (!empty($_POST['provsort']))  $this->assign("provsel", $_POST['provsort']) ; 

{/php}

<form method="POST" action="index.php?module=REG_Patient&action=topcare">

<div id="demo">
<h1>{$mytitle}</h1>
</div>

<table class="list view" width="100%" cellspacing="0" cellpadding="0" border="0">
   <tbody>
    <tr height = "20">
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Name </div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  MRN </div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Refill Date 
			<select name="mysort" onchange="this.form.submit()">
				<option value="none" {if (empty($datsel))} selected {/if}></option>
				<option value="all" {if ($datsel == "all")} selected {/if}>All Refills</option>
				<option value="week" {if ($datsel == "week")} selected {/if}>Next Seven Days</option>
				</select>
				</div> </th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Provider 
			<select name = "provsort" onchange="this.form.submit()">
			    <option value="none" {if (empty($provsel))} selected {/if}></option>
				{foreach name=provrowIteration from=$provdata  item=provrowData}
					<option value="{$provrowData.provname}" {if ($provsel == $provrowData.provname)} selected {/if} >{$provrowData.provname}</option>
				{/foreach}
			</select>		
		</th>
		<th width="18%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Action </div> </th>
    </tr>
	
	
    {if (empty($mydata))}  <tr class="oddListRowS1" height="20">  <td class="" valign="top" align="left" scope="row"> <h1>NO REFILLS FOR NEXT SEVEN DAYS</h1> </td>    </tr>   {/if}
	 
	{foreach name=myrowIteration from=$mydata key=id item=myrowData}

	 
	     <tr class="oddListRowS1" height="20">
		    <td class="" valign="top" align="left" scope="row"> <a href="./index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DREG_Patient%26action%3DDetailView%26record%3D{$myrowData.patid}"> 
			{$myrowData.lname}, {$myrowData.fname} </a> </td>
			<td class="" valign="top" align="left"> {$myrowData.mrn}  </td>
            <td class="" valign="top" align="left"> {$myrowData.refill} </td>
            <td class="" valign="top" align="left"> {$myrowData.provname} </td>
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