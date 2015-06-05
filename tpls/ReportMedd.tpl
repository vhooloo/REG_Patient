{literal}<style type="text/css">table.view { width:60%; border-collapse:collapse; }table.view td, 
table.view th { border-left:1px solid  rgb(171, 195, 215); border-right:1px solid  rgb(171, 195, 215); border-bottom: none; border-top: none; padding:1px; } table.view tr:nth-of-type(odd) { background-color: #def;}</style>{/literal}
{literal}<style type="text/css">td.subtot  {  background-color: #FFD699; text-align:right; }</style>{/literal}
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="custom/topcarejs/bootstrap-select-1.7.1/dist/css/bootstrap-select.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="custom/jquery/jquery-2.1.0.min.js"></script> 
  <script src="custom/jquery/jquery-ui.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="custom/topcarejs/bootstrap-select-1.7.1/dist/js/bootstrap-select.min.js"></script>
	
	
{assign var='newmedd' value=""}
{assign var='oldmedd' value=""}
{assign var='meddisp' value=""}
{assign var="control" value=0}
<h3> {$provname} </h3>
<table class="list view">

<tr>
<!--th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);width:6%;">MEDD Safety</th><th></th><th></th><th></th><th></th><th> </th><th></th>
<th style="width:1%">Multipe Short </th><th rowspan = "2" style="width:6%;white-space: normal;">Multipe Long Acting Opioids</th>
</tr><tr>
<th style="border-bottom:1px solid  rgb(171, 195, 215);">Last Name</th><th style="border-bottom:1px solid  rgb(171, 195, 215);">First Name</th>
<th style="border-bottom:1px solid  rgb(171, 195, 215);">MRN</th>
<th style="border-bottom:1px solid  rgb(171, 195, 215);">Phone</th>
<th style="border-bottom:1px solid  rgb(171, 195, 215);">NCM </th><th style="border-bottom:1px solid  rgb(171, 195, 215);">ORT</th><th style="border-bottom:1px solid  rgb(171, 195, 215);"> Acting Opioids</th-->

<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);width:6%;">MEDD Safety
<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);">Last Name</th>
<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);">First Name</th>
<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);">MRN</th>
<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);">Phone</th>
<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);">NCM </th>
<th rowspan = "2" style="border-bottom:1px solid  rgb(171, 195, 215);">ORT</th>
<th rowspan = "2" style="width:6%;white-space: normal;border-bottom:1px solid  rgb(171, 195, 215);"> Multipe Short Acting Opioids</th>
<th rowspan = "2" style="width:6%;white-space: normal;border-bottom:1px solid  rgb(171, 195, 215);">Multipe Long Acting Opioids</th>
</tr>
<tr>
</tr>

 {foreach name=provit from=$datalist  item=thisdata }

	 {assign var="newmedd" value=$thisdata.medd}
	 {if ($newmedd NE $oldmedd)}
		{if ($thisdata.medd) == "0-3"} {assign var='meddisp' value="< 50mg"} {/if}
		{if ($thisdata.medd) == "4-7"} {assign var='meddisp' value="51-100mg"} {/if}
		{if ($thisdata.medd) == "gt7"} {assign var='meddisp' value="> 100mg"} {/if}
	{else}
		 {assign var='meddisp' value=""}
	 {/if}
	 {if ($newmedd NE $oldmedd) AND $oldmedd != ""}<tr><td colspan="9"  class="subtot">Sub Totals: {$control}</td></tr> {assign var="control" value="0"}{/if}

	<tr>
		<td>{$meddisp}</td><td>{$thisdata.lname}</td><td>{$thisdata.fname}</td><td>{$thisdata.mrn}</td><td>{$thisdata.phone}</td>
		<td>{if ($thisdata.ncm == "0-3")} LOW {/if} {if ($thisdata.ncm == "4-7")} MEDIUM {/if} {if ($thisdata.ncm == "gt7")} HIGH {/if}</td>
		<td>{$thisdata.ortsum}</td>
		<td>{$thisdata.sop}</td><td style="width:1%">{$thisdata.lop}</td>
	</tr>
	
	 {assign var='oldmedd" value=$newmedd}  
	 {assign var="control" value=$control+1}
 {/foreach}
<tr><td colspan="9" class="subtot">Sub Totals: {$control}</td></tr> 

{literal}	
</table>
<script type="text/javascript">
$(document).ready(function(){

</script>
{/literal}
