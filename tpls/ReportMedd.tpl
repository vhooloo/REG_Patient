{literal}<style type="text/css">table.view { width:60%; border-collapse:collapse; }table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } table.view tr:nth-of-type(odd) { background-color: #def;}</style>{/literal}
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
{assign var="control" value=0}

<table class="list view">
<tr>
<th>MEDD Safety</th><th>Last Name</th><th>First Name</th><th>MRN</th><th>Phone</th><th>NCM </th><th>ORT</th>
</tr>
 {foreach name=provit from=$datalist  item=thisdata }
	 {assign var='newmedd' value=$thisdata.medd}
	 {if ($newmedd NE $oldmedd) AND $oldmedd != ""}<tr><td colspan="6"  style="background-color:orange;">Sub Totals</td> <td>{$control}</td></tr> {assign var="control" value="0"}{/if}

	<tr>
		<td>{$thisdata.medd}</td><td>{$thisdata.lname}</td><td>{$thisdata.fname}</td><td>{$thisdata.mrn}</td><td>{$thisdata.phone}</td><td>{$thisdata.ncm}</td><td>{$thisdata.ortsum}</td>
	</tr>
	
	 {assign var='oldmedd" value=$newmedd}  
	 {assign var="control" value=$control+1}
 {/foreach}
<tr><td colspan="6" style="background-color:orange;">Sub Totals</td> <td>{$control}</td></tr> 

{literal}	
</table>
<script type="text/javascript">
$(document).ready(function(){

</script>
{/literal}
