
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
	
	
 Provider: <select id= "provselect" class="selectpicker">
	<option value="0" selected> </option>
 {foreach name=provit from=$provlist  item=thisprov }
    <option value="{$thisprov.provid}">{$thisprov.provname}</option>
 {/foreach}
  </select>

  
   <button id="reportbtn" class="btn btn-large btn-warning"   type="button" > MEDD Report</button>
  
{literal}	

<script type="text/javascript">
$(document).ready(function(){
    $('.selectpicker').selectpicker();
	
    $("#reportbtn").click(function(){
        var sp = $("#provselect option:selected").val();
        
		 window.location = 'index.php?module=REG_Patient&action=reportmedd&provid=' + sp;
    });
});
</script>
{/literal}
