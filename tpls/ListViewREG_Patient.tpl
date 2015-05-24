

<meta http-equiv="refresh" content="3600" >
<!--link type="text/css" rel="stylesheet" href="custom/topcarejs/jquery.dropdown.css" />
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /-->
<!-- --GRID -->
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.office.css" type="text/css" />
 <!--link href="custom/topcarejs/sliders/css/styles.css" media="all" rel="stylesheet"-->

  
 
  
     <link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" media="all" rel="stylesheet">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" media="all" rel="stylesheet">
	<link href="custom/topcarejs/slider/css/bootstrap-slider.css" media="all" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.1/modernizr.min.js"></script>

<!--script type="text/javascript" src="custom/topcarejs/jquery.dropdown.js"></script-->

<script type="text/javascript">
var clickname = "";
var clickvalue;
{literal}
function loadUrl(location)
{

	var state = $("#jqxgrid").jqxGrid('savestate');
	var viewcontent = JSON.stringify(state);
	
	var params = "&jqxgridstate="+viewcontent;
	//var e = document.getElementById("mysortrefill");
	for (var l = 0; l < ddarray.length; l++) {
		ddarray[l].sessionparam();
		params = params +  ddarray[l].params;
	};
	if (document.getElementById("inactivecheck").checked) {params = params + "&inactive=true"} else {params = params + "&inactive=clear"} ;
	if (document.getElementById("statuscheck").checked) {params = params + "&status=true"} else {params = params + "&status=clear"};
	

//Send the proper header information along with the request


if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
xmlhttp.open("POST","index.php?entryPoint=session_setting_variable",true);

  }
  else {
       xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
xmlhttp.open("POST","index.php?entryPoint=session_setting_variable",true);
}

xmlhttp.onreadystatechange=function()
  {
    //alert(xmlhttp.readyState);
   if (xmlhttp.readyState >=2) document.location.href = location;
  }
//xmlhttp.open("GET","index.php?module=REG_Patient&action=session_setting_variable&id=jqxgridstate&value=orepiya123",true);

xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", params.length);
//xmlhttp.setRequestHeader("Connection", "close");
xmlhttp.send(params);
//document.location.href = location;
//$.get("index.php?module=REG_Patient&action=session_setting_variable&id=jqxgridstate&value=orepiya123ajax");

  //this.document.location.href = location;
    //alert("loading");
  	//$("#jqxgrid").jqxGrid('loadstate', state);
	//alert("loaded");
  
}

function clearsession()
{

	
	var params = "&jqxgridstate=clear";

	for (var l = 0; l < ddarray.length; l++) {

		params = params + "&" +  ddarray[l].data + "=clear";
	};
	

//Send the proper header information along with the request


if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else {
       xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
}
xmlhttp.onreadystatechange=function()
  {
  
  }

xmlhttp.open("POST","index.php?entryPoint=session_setting_variable",true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", params.length);
xmlhttp.setRequestHeader("Connection", "close");
xmlhttp.send(params);


}

function updateaudit(auditcheck, row, value)
{
//ajax update - auditcheck is the current checkbox, row is value of data in array data[row], value is trueorfalse//pid
//get pid, get state, update using the pid
    var id = new Array();
	var flag;
	
	if (auditcheck.checked) flag = 1; else flag = 0;
	
	id = value.split('//');
	//alert('hereh'+flag+value);
	//alert(flag + id[1]);

 
    var params = "&update_action=audit&pid="+id[1]+"&audit_flag="+flag;
	//alert(params+row+data[row]["patientname"]);
	//alert(data[row]["audit"]);
	data[row]["audit"] = flag == 1? "true//"+id[1]: "false//"+id[1];
	
	var state = $("#jqxgrid").jqxGrid('savestate');
	//var viewcontent = JSON.stringify(state);
	var dataAdapter = new $.jqx.dataAdapter(source);
    $("#jqxgrid").jqxGrid({ source: dataAdapter });
	$("#jqxgrid").jqxGrid('loadstate',state);
	//alert(data[row]["audit"]);
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else {
		   xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
	}
	xmlhttp.onreadystatechange=function()
	  {
	  
	  }

	xmlhttp.open("POST","index.php?entryPoint=updatepatientaudit",true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader("Content-length", params.length);
	xmlhttp.setRequestHeader("Connection", "close");
	xmlhttp.send(params); 
}

function datedropdown(name,label, data, id, prev)
{
	 this.name 		= name;
	 this.label		= label;
	 this.data      = data;
	 this.id        = parseInt(id);
	 this.params   = 'bar';
	 this.selectval = 'ALL';
	 this.previous  = prev;
	 this.render1   = renderfunc;
	 this.render 	= '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;z-index:99999;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\'); $(\'#jqxgrid\').jqxGrid(\'applyfilters\'); break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL"  selected>ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
     this.refillfilter = refillfilter;
	 this.sessionparam = sessionparam;
	 this.renderprevious = renderprevious;
	 this.setrange = setrange;
	 
	 
	 function renderfunc()
	 {
	   //alert('selectval'+ this.selectval);
	   if (this.selectval == 'ALL')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\');$(\'#jqxgrid\').jqxGrid(\'applyfilters\'); ;break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL"  selected>ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
		if (this.selectval == 'Refill7')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); ; break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL">ALL</option><option value="Refill7"   selected>7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
		if (this.selectval == 'Refill14')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); ; break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL" >ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" selected >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
		if (this.selectval == 'range')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); ; break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL" >ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" selected >range</option></select> </div>&nbsp &nbsp';  //function to render html
			
		return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\');  break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL"  selected>ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
	 }
	 
	 function setrange() {
	   document.getElementById(data).value = "range";
	   this.selectval = "range";
	 }
	 
	 
	 function renderprevious() {
	   if (this.prev != "" || this.prev != undefined )  document.getElementById(this.data).value = this.previous;
	   this.selectval = this.previous;
	 }
	 
	 function refillfilter(days){
	  var refilldaysselect = parseInt(days);
	  var today = new Date();
	  var highdate = new Date();
	  var lastutsdate = new Date();
	  highdate.setDate(today.getDate() + refilldaysselect);
	  lastutsdate.setDate(today.getDate() - refilldaysselect);
      var fmthighdate = (highdate.getMonth()+1) + '/'+ highdate.getDate() + '/'+  highdate.getFullYear(); 
	  var fmttoday = (today.getMonth()+1) + '/'+ today.getDate() + '/'+  today.getFullYear(); 
	  var fmtlastutsdate = (lastutsdate.getMonth()+1) + '/'+ lastutsdate.getDate() + '/'+  lastutsdate.getFullYear(); 
	  
	  var filtergroup = new $.jqx.filter();
	  var filterlo = filtergroup.createfilter('datefilter', fmttoday, 'GREATER_THAN_OR_EQUAL');
	  var filtertoday = filtergroup.createfilter('datefilter', fmttoday, 'LESS_THAN_OR_EQUAL');
	  var filterhi = filtergroup.createfilter('datefilter', fmthighdate , 'LESS_THAN_OR_EQUAL');
	  //var filterover = filtergroup.createfilter('datefilter', '11/7/2013', 'LESS_THAN_OR_EQUAL');
	  var filterbot  = filtergroup.createfilter('datefilter', '01/01/2013', 'GREATER_THAN_OR_EQUAL');
	  //filtergroup.addfilter(0, filterlo);
	  var filteruts = filtergroup.createfilter('datefilter', fmtlastutsdate , 'GREATER_THAN_OR_EQUAL');
       
	  //alert(this.data); 
	  if (this.data == "refill") {	filtergroup.addfilter(0, filterbot);filtergroup.addfilter(0, filterhi);}
	  else { filtergroup.addfilter(0, filteruts); filtergroup.addfilter(0, filtertoday); }
	  
		
		$('#jqxgrid').jqxGrid('addfilter', this.data, filtergroup, true);
		this.selectval = document.getElementById(this.data).value;
		clickname = this.data;
		$('#jqxgrid').jqxGrid('applyfilters');
	}
	
	function sessionparam() {
	var e = document.getElementById(this.data);
	//alert(viewcontent);
	this.params =  "&"+this.data+"="+ e.options[e.selectedIndex].value; 
	}
	
}

{/literal}
</script>

{php}

//session_start();
// store session data
//if (!empty($_POST['regnamesort'])) $_SESSION['regnamesort']=$_POST['regnamesort'];
//echo "session >>>>>>>>";
//if (!empty($_SESSION['jqxgridstate'])) var_dump($_SESSION['jqxgridstate']);
//if (!empty($_SESSION['mysortrefill'])) var_dump($_SESSION['mysortrefill']);
//var_dump($_SESSION);
{/php}

   <!--script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script-->
 
    <script src="custom/jquery/jquery-2.1.0.min.js"></script> 
  <script src="custom/jquery/jquery-ui.min.js"></script>

 
  


    <!--script type="text/javascript" src="../../scripts/jquery-1.10.2.min.js"></script-->
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.filter.js"></script>
	<script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.storage.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxcheckbox.js"></script>
	<script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.sort.js"></script>
	<script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxdatetimeinput.js"></script>
	<script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.grouping.js"></script>
	<script type="text/javascript" src="custom/topcarejs/jqwidgets/globalization/globalize.js"></script>
		 <script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.edit.js"></script>
		<script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxdata.export.js"></script> 
	<script type="text/javascript" src="custom/topcarejs/jqwidgets/jqxgrid.export.js"></script> 
 <script type="text/javascript" src="custom/topcarejs/slider/js/bootstrap-slider.js"></script>
 
	<!--[if IE 7]>
		<script type="text/javascript" src="custom/topcarejs/json2.js"></script>
	<![endif]--> 
    <!--script type="text/javascript" src="../../scripts/gettheme.js"></script>
    <script type="text/javascript" src="generatedata.js"></script-->
    
 
  	

        <!--script src="custom/topcarejs/sliders/js/plugin.js"></script>
    <script src="custom/topcarejs/sliders/js/main.js"></script>
<script src="custom/topcarejs/jRange-master/jquery.range.js"></script-->


<!-- END GRID -->
<head>
  <!-- Use Internet Explorer 9 Standards mode -->
  <!--meta http-equiv="x-ua-compatible" content="IE=7"-->
</head>


<!-- -->

	
<body class='default'>
	<style> {literal}
        .green:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .green:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
            color: black;
            background-color: #b6ff00;
        }
        .yellow:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .yellow:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
            color: black;
            background-color: yellow;
        }
        .red:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .red:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
            color: black;
            background-color: #e83636;
        }
		
		.jqx-widget-content {
			font-family: Verdana;
			font-size:80%;
			color: blue;
		}
		
		
		
    </style> {/literal}

	<!--div class="container text-center" id="slidertop"-->
    
        <!--div class="col-md-8"-->
 		  <!--img src="custom/themes/scale.jpg" width="650px" style="position:relative;margin-bottom:-30px;">
          <input class="slider" id="slider1" data-slider-max="10" data-slider-min="0" data-slider-step="1" data-slider-value="-0.001" type="text" style="width: 600px;visibility: hidden;position:relative;top: -5px;"-->
          <input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
     
      <!--/div-->
    <!--/div-->
	 <!--div class="row" style="position:relative;margin-bottom:30px;margin-left:40px">
        <div class="col-md-8">
	<input type="text" class="single-slider" value="0" >
	      </div>
    </div-->


<input id="inactivecheck" type="checkbox"  onclick="inactivefilter(this.checked);" {if ($smarty.session.inactive == "true")}checked{/if} > Include Inactive patients </input>
<input id="statuscheck" type="checkbox" onclick="statusfilter(this.checked);"  {if ($smarty.session.status == "true")}checked{/if} > Patients to be followed-up </input>
<input type="button" value="Export to Excel" id='excelExport' />
<input type="button" value="Test CSV" id='exporttest' />
<input name="testjson" id = "testjson"   value="{$smarty.session.jqxgridstate nofilter}" maxlength = "10000"/>


	
	
        <div id="jqxgrid"  ></div>
        


<!--input value = "Sort" type="button" onclick="$('#jqxgrid').jqxGrid('sortby', 'patientname', 'asc');">  </input>
<input id="refresh" type="button" value="Refresh Data" />
<input type="button" id="saveState" value="Save State" />
<input type="button" id="loadState" value="Load State" /-->


</body>


	<script type="text/javascript">
	
	
	
	var refilldaysselect;
	var data = new Array();
	
	
	
	{literal}
	//mytimeout = setTimeout(function(){ document.location.href = "./index.php?module=Users&action=Logout"; }, 10000);
	
	//(function(window) {
	//	window.onerror = function (errorMsg, url, lineNumber, column, errorObj) {
	//	console.log('Error: ' + errorMsg + ' Script: ' + url + ' Line: ' + lineNumber
	//	+ ' Column: ' + column + ' StackTrace: ' +  errorObj);
	//	};
	//})(window);
	
	
	var risklist = {
     bup:  [{buptake:"pos", buptest:"pos", bupmsg:"Expected Patient prescribed Buprenorphine and UDT for Buprenorphine is positive "}, {buptake:"neg", buptest:"neg", bupmsg:"Expected Patient NOT prescribed Buprenorphine and UDT for Buprenorphine is negative"},{buptake:"pos", buptest:"neg", bupmsg:"Unexpected: Patient NOT prescribed Buprenorphine, highly unlikey that UDT for Buprenorphine would be positive"} , {buptake:"neg", buptest:"pos", bupmsg:"Unexpected:  Patient prescribed Buprenorphine, highly unlikey that UDT for Buprenorphione would be negative"}],
	 meth:  [{methtake:"pos", methtest:"pos", methmsg:"Expected Patient prescribed Methadone and UDT for Methadone is positive "}, {methtake:"neg", methtest:"neg", methmsg:"Expected Patient Not prescribed Methadone and UDT for Methadone is negative"},{methtake:"pos", methtest:"neg", methmsg:"Unexpected Patient prescribed Methadone, highly unlikey that UDT for Mathadone would be negative "} , {methtake:"neg", methtest:"pos", methmsg:"Unexpected Patient NOT prescribed Mathadone, highly unlikey that UDT for Mathadone would be positive"}],
	 //***opiates -- all that make opiates definitely positive
	codeine: [{codeinetake:"pos", opiatetest:"pos", opiatemsg:"Expected pos opiates due to codeine"}, {codeinetake:"neg", opiatetest:"neg", opiatemsg:"Expected -ve\-ve"} ,{codeinetake:"pos", opiatetest:"neg", opiatemsg:"Unexpected codeine makes positive opiate"}, {codeinetake:"neg", opiatetest:"pos", opiatemsg:"Unexpected positive opiate when no codeine"}],
	heroin: [{herointake:"pos", opiatetest:"pos", opiatemsg:"Expected pos opiates due to"}, {herointake:"neg", opiatetest:"neg", opiatemsg:"Expected -ve\-ve"} ,{herointake:"pos", opiatetest:"neg", opiatemsg:"Unexpected heroin makes positive opiate"}],
	morphine: [{morphinetake:"pos", opiatetest:"pos", opiatemsg:"Expected pos opiates due to morphine"}, {morphinetake:"neg", opiatetest:"neg", opiatemsg:"Expected -ve\-ve"} ,{morphinetake:"pos", opiatetest:"neg", opiatemsg:"Unexpected morphine makes positive opiate"},{morphinetake:"neg", opiatetest:"pos", opiatemsg:"Unexpected positive opiate when no morphine"}],
	
	//*** opiates -- all that can make possibly opiates +ve but not necessarily
	hydrocod: [ {hydrocodtake:"neg", opiatetest:"neg", opiatemsg:"Expected -ve\-ve"} ,{hydrocodtake:"pos", opiatetest:"pos", opiatemsg:"Possible hydrocodone makes positive opiate"},{hydrocodtake:"neg", opiatetest:"pos", opiatemsg:"Unexepected for hydrocodone"},{hydrocodtake:"pos", opiatetest:"neg", opiatemsg:"Possible hydrocodone not detected by opiate all the time"}],
	hydromor: [{hydromortake:"neg", opiatetest:"neg", opiatemsg:"Expected"} ,{hydromortake:"pos", opiatetest:"pos", opiatemsg:"Possible hydromorphone makes positive opiate"},{hydromortake:"neg", opiatetest:"pos", opiatemsg:"Unexepected for hydromorphone"},{hydromortake:"pos", opiatetest:"neg", opiatemsg:"Possible hydromorphone not detected by opiate all the time"}],
	
	//*** mep and fenta
    mep: [{meptake:"pos", opiatetest:"pos", opiatemsg:"Unexpected", mepmsg:"Possible Cannot determine if patient is or is not taking Meperidine since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"}, {meptake:"neg", opiatetest:"neg", mepmsg:"Possible Cannot determine if patient is or is not taking Meperidine since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"} , {meptake:"pos", opiatetest:"neg", mepmsg:"Possible Possible Cannot determine if patient is or is not taking Meperidine since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"}, {meptake:"neg", opiatetest:"pos", opiatemsg:"Unexpected", mepmsg:"Possible Possible Cannot determine if patient is or is not taking Meperidine since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"}],
	fent: [{fenttake:"pos", opiatetest:"pos", opiatemsg:"Unexpected", fentmsg:"Possible Cannot determine if patient is or is not taking Fentanyl since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"}, {fenttake:"neg", opiatetest:"neg", fentmsg:"Possible Possible Cannot determine if patient is or is not taking Fentanyl since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"} , {fenttake:"pos", opiatetest:"neg", fentmsg:"Possible Cannot determine if patient is or is not taking Fentanyl since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"}, {fenttake:"neg", opiatetest:"pos", opiatemsg:"Unexpected", fentmsg:"Possible Cannot determine if patient is or is not taking Fentanyl since this medication does not show up in an Opiates only screening test, Consider Specific Confirmatory testing"}],
	
	 //*** oxycod and oxymorph
	 oxycod: [{oxycodtake:"pos", opiatetest:"pos", opiatemsg:"Possible high recent dose"}, {oxycodtake:"neg", opiatetest:"neg", opiatemsg:"Expected Irrelevant if only factor"} , {oxycodtake:"pos", opiatetest:"neg", opiatemsg:"Possible not detected"}, {oxycodtake:"neg", opiatetest:"pos", opiatemsg:"Unexpected due to oxy only"},{oxycodtake:"pos", oxytest:"pos", oxymsg:"Expected:Oxycodone taken and test positive"}, {oxycodtake:"neg", oxytest:"neg", oxymsg:"Expected:No Oxycodone taken, test negative"}, {oxycodtake:"pos", oxytest:"neg", oxymsg:"Unexpected:oxycodone  taken should give positive test"}, {oxycodtake:"neg", oxytest:"pos", oxymsg:"Unexpected:oxycodone not taken should not give positive test"}],
	 oxymorph: [{oxymorphtake:"pos", opiatetest:"pos", opiatemsg:"Possible high recent dose"}, {oxymorphtake:"neg", opiatetest:"neg", opiatemsg:"Expected Irrelevant if only factor"} , {oxymorphtake:"pos", opiatetest:"neg", opiatemsg:"Possible not detected"}, {oxymorphtake:"neg", opiatetest:"pos", opiatemsg:"Unexpected due to oxy only"},{oxymorphtake:"pos", oxytest:"pos", oxymsg:"Expected:oxymorphone taken and test positive"}, {oxymorphtake:"neg", oxytest:"neg", oxymsg:"Expected:No oxymorphone taken, tet negative"}, {oxymorphtake:"pos", oxytest:"neg", oxymsg:"Unexpected:oxymorphone taken should give positive test"}, {oxymorphtake:"neg", oxytest:"pos", oxymsg:"Unexpected:oxymorphone not taken should not give positive test"}]
                   };
	 var riskSource =
            {
                 datatype: "array",
                 datafields: [
                     { name: 'value', type: 'string' },
                     { name: 'label', type: 'string' }
                 ],
                 localdata: risklist
            };
	var riskAdapter = new $.jqx.dataAdapter(riskSource, {
                autoBind: true
            });
			
	var source =
	{
		localdata: data,
		//sort: customsort, //function (column, direction) {$("#jqxgrid").jqxGrid('sortby', 'mrn', 'asc');},
		//filter: function(parm1, parm2,parm3, parm4){alert(JSON.stringify(parm1)+JSON.stringify(parm2)+JSON.stringify(parm3)+JSON.stringify(parm4));},
		datafields:
                [
				    { name: 'active', type: 'string' },
					{ name: 'location', type: 'string' },
					{ name: 'patientname', type: 'string' },
					{ name: 'patientnameexport', type: 'string' },
					{ name: 'firstname', type: 'string' },
					{ name: 'lastname', type: 'string' },
					{ name: 'mrn', type: 'string' },
                    { name: 'refill', type: 'date' },
                    { name: 'status', type: 'string' },
					{ name: 'last_uts', type: 'date' },
					{ name: 'pmp_date', type: 'date' },
					{ name: 'dob', type:'date' },
					{ name: 'zip', type:'string' },
					//{ name: 'next_pcp', type: 'date' },
                    { name: 'pcp', type: 'string'},
					//{name: 'riskString',  value: 'risk', values: { source: riskAdapter.records, value: 'value', name: 'label' } },
					{name: 'risk', type: 'string' },
					//{ name: 'risklist', value: 'countryCode', values: { source: riskAdapter.records, value: 'value', name: 'label' } },
                    { name: 'action', type: 'string' },
					{name: 'audit', type: 'string'}
                ],
		datatype: "array"
		//sortcolumn: 'patientname',
		//sortdirection: 'asc'
	};
	
	function customsort (column, direction) {
	  data.sort(function(a, b){
	        var keyA = a.pcp; //new Date(a.pcp);
			var keyB = b.pcp; //new Date(b.pcp);
			//alert(keyA + "//" +  keyB);
			// Compare the 2 dates
			if(keyA < keyB) return -1;
			if(keyA > keyB) return 1;
			return 0;
			});
		$("#jqxgrid").jqxGrid('updatebounddata', 'sort');
	};
	
	
	
/* 	$("#jqxgrid").on("sort", function (event) 
{
    // event arguments.
    var args = event.args;
    // sorting information.
    var sortInfo = event.args.sortinformation;
    // sort direction.
    var sortdirection = sortInfo.sortdirection.ascending ? "ascending" : "descending";
    // column data field.
    var sortColumnDataField = sortInfo.sortcolumn;
	alert(sortInfo + sortdirection + sortColumnDataField);
});   */

/*$('.single-slider').jRange({
    from: 0,
    to: 10,
    step: 1,
    scale: ["0 no pain",1,2,3,4,5,6,7,8,9,"10 max pain"],
    format: '%s',
    width: 300,
    showLabels: true
});

*/
$("#ex1").bootstrapSlider({
tooltip: 'always',
formatter: function(value) {
		return 'Current value: ' + value;
	},
	//ticks: [0, 1, 2, 3, 4],
    ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
}).on('change', function(){if (this.value > 10 ) $("#ex1Slider .slider-selection").css('background', 'red'); else $("#ex1Slider .slider-selection").css('background', 'green');});




/*
$('#slidertop').on('click', function(){
   console.log("You clicked the button "+ $("#slider1").attr("data-slider-value") + " " + $("#slidertop .tooltip .tooltip-inner").text());
});

	$("#slider1").click(function() {
	  console.log("clicked");
	  console.log("hooray"+$(this).attr("data-slider-value"));
	});
	
	$('.slider').bind('focus blur select change click dblclick mousedown mouseup mouseover mousemove mouseout keypress keydown keyup', function(e) {
      console.log(e.type + ": " + $(this).val() );
}); 
	
*/
	$("#exporttest").click(function() {
	var A = [['n','sqrt(n)']];  // initialize array of rows with header row as 1st item
for(var j=1;j<10000;++j){ A.push([j, Math.sqrt(j)]) }
var csvRows = [];
for(var i=0,l=A.length; i<l; ++i){
    csvRows.push(A[i].join(','));   // unquoted CSV row
}
var csvString = csvRows.join("\r\n");
	var IEwindow = window.open();
	IEwindow.document.write(csvString);
	IEwindow.document.close();
	IEwindow.document.execCommand('SaveAs', true,  "testdfg.csv");
	setTimeout(function(){ IEwindow.close(); }, 5000);
	});
	
	
	$("#excelExport").click(function() {
	//alert("test");
	//for (var zz1=0;zz1<data.length;zz1++) {
	//	$("#jqxgrid").jqxGrid('setcellvalue', zz1, 'patientname', 'Export');
	//}
	$("#jqxgrid").jqxGrid('hidecolumn', 'patientname');
	$("#jqxgrid").jqxGrid('hidecolumn', 'action');
	$("#jqxgrid").jqxGrid('showcolumn', 'patientnameexport');
    var mydataload = $("#jqxgrid").jqxGrid('exportdata', 'json',null, true, null, true);
	var myjson = eval("(" + mydataload + ")");
	console.log(myjson);
	var csvRows = [];
		for(var i = 0; i < myjson.length; i++) {
    var obj = myjson[i];

		//var id = obj["MRN"];
		//var name = obj["Location1"];
		csvRows.push(obj["firstname"] + "," + obj["lastname"] + "," + obj["ZIP"] + "," + obj["DOB"] );
		//console.log(id);
		//console.log(name);
	}
	var csvString = csvRows.join("\r\n");
		var IEwindow = window.open();

	IEwindow.document.write(csvString);
	IEwindow.document.close();
	if (IEwindow.document.execCommand('SaveAs', null,  "pmpexport.csv"))
	{
	IEwindow.close();}
	else
	{
		
		var uri = 'data:application/csv;charset=utf-8,' + escape(csvString);
        var link = IEwindow.document.createElement("a");
        link.href = uri;
        link.style = "visibility:hidden";
        link.download = "pmpexport.csv";
        IEwindow.document.body.appendChild(link);
        link.click();
        IEwindow.document.body.removeChild(link);
		setTimeout(function(){ IEwindow.close(); }, 100);
		//IEwindow.close();
	}
	
	//$("#jqxgrid").jqxGrid('showcolumn', 'action');
	//$("#jqxgrid").jqxGrid('showcolumn', 'patientname');
	//$("#jqxgrid").jqxGrid('hidecolumn', 'patientnameexport');
	});
	
	
	//$(window).focus(function() {
	//$("#jqxgrid").jqxGrid('showcolumn', 'patientname');
	//$("#jqxgrid").jqxGrid('showcolumn', 'action');
	//$("#jqxgrid").jqxGrid('hidecolumn', 'patientnameexport');
	//alert("focus");
	//});
	var mytimeout;
	
	$(document).click(function(event) {
		//window.lastElementClicked = event.target;
		clearTimeout(mytimeout);
		console.log("clicked and cleared");
		mytimeout = setTimeout(function(){ document.location.href = "./index.php?module=Users&action=Logout&login_module=REG_Patient&login_action=index"; }, 600000);
		//alert(event.target);
	});
	
		$( window ).resize(function() {
  console.log( "Handler for .resize() called." );
});

	/*function refillfilter(value, type) {
	  
      refilldaysselect = parseInt(value);

	  var filtergroup = new $.jqx.filter();
	  //var filterlo = filtergroup.createfilter('datefilter', '11/7/2013', 'GREATER_THAN_OR_EQUAL');
	  var filterhi = filtergroup.createfilter('datefilter', '11/14/2013', 'LESS_THAN_OR_EQUAL');
	  //var filterover = filtergroup.createfilter('datefilter', '11/7/2013', 'LESS_THAN_OR_EQUAL');
	  var filterbot  = filtergroup.createfilter('datefilter', '01/01/2013', 'GREATER_THAN_OR_EQUAL');
	  //filtergroup.addfilter(0, filterlo);

	  if (type == 'rx') { // add overdue as or condition for refill
	  	filtergroup.addfilter(0, filterbot);
		filtergroup.addfilter(0, filterhi);
		$('#jqxgrid').jqxGrid('addfilter', 'refill', filtergroup, true);
		return;
	 }
		
      
	  if (type == 'uts'){
	   //filtergroup.addfilter(0, filterlo);
	   //filtergroup.addfilter(0, filterhi);
		$('#jqxgrid').jqxGrid('addfilter', 'uts', filtergroup, true);}

	} */
	
	var ddarray = new Array();
	
	///var dd0 = new datedropdown('Next PCP', 'Next PCP', 'next_pcp', '0', {/literal}{if ($smarty.session.next_pcp == "")}'ALL'{else}'{$smarty.session.next_pcp}' {/if }{literal});
	//ddarray.push(dd0);
	var dd0 = new datedropdown('Last UTS', 'Last UTS', 'last_uts', '0', {/literal}{if ($smarty.session.last_uts == "")}'ALL'{else}'{$smarty.session.last_uts}' {/if }{literal});
	ddarray.push(dd0);
	//var dd2 = new datedropdown('UTS', 'UTS', 'uts', '2', {/literal}{if ($smarty.session.uts == "")}'ALL'{else}'{$smarty.session.uts}' {/if }{literal});
	//ddarray.push(dd2);
	var dd1 = new datedropdown('Refill', 'Refill', 'refill', '1', {/literal}{if ($smarty.session.refill == "")}'ALL'{else}'{$smarty.session.refill}' {/if }{literal});
	ddarray.push(dd1);
	
	function inactivefilter(inactiveflag) {
	
      
	  var filtergroup = new $.jqx.filter();
	  //actives;
	  var filteron = filtergroup.createfilter('stringfilter', '1', 'EQUAL');
	  
	  filtergroup.addfilter(0, filteron);
      if (!inactiveflag) {
		$('#jqxgrid').jqxGrid('addfilter', 'active', filtergroup, true);
		 }
	  else
	  { 
        $('#jqxgrid').jqxGrid('removefilter', 'active',  true);	  
		}
	 }
		
   function statusfilter(inactiveflag) {
	
      
	  var filtergroup = new $.jqx.filter();
	  //actives;
	  var filteron = filtergroup.createfilter('stringfilter', '^Inten', 'STARTS_WITH');
	  
	  filtergroup.addfilter(0, filteron);
      if (inactiveflag) {
		$('#jqxgrid').jqxGrid('addfilter', 'status', filtergroup, true);
		 }
	  else
	  { 
        $('#jqxgrid').jqxGrid('removefilter', 'status',  true);	  
		}
	 }
	 
	 function auditfilter(auditcheckbox) {
	
      
	  var filtergroup = new $.jqx.filter();
	  //actives;
	  var filteron = filtergroup.createfilter('stringfilter', 'false', 'STARTS_WITH');
	  
	  filtergroup.addfilter(0, filteron);
	  alert("got it");
      //if (!auditcheckbox.checked) {
	  //   alert("yes");
		$('#jqxgrid').jqxGrid('addfilter', 'audit', filtergroup, true);
	//	 }
	 // else
	  //{ 
	  //  alert("no");
      //  $('#jqxgrid').jqxGrid('removefilter', 'audit',  true);	  
	//	}
	 }
	 
	/*$("#jqxgrid").on("filter", function (event) 
	{   
	   
		var filterinfo1 = $("#jqxgrid").jqxGrid('getfilterinformation');
		var filterfound = false;
		alert('click filter + ' + clickname);  
		if (clickname != "") { clickname = ""; return;} //no need to process further
		for (var zz=0;zz<ddarray.length;zz++) {
		
			filterfound = false;
			for (var y=0;y <filterinfo1.length;y++)
			{ 
			    //alert(filterinfo1[y].filtercolumn);
				
				if ( (filterinfo1[y].filtercolumn == ddarray[zz].data) && (ddarray[zz].data != clickname) && (document.getElementById(ddarray[zz].data).value == 'ALL') ) { ddarray[zz].setrange();} 		 //document.getElementById("refill").value = "range";
				if ( filterinfo1[y].filtercolumn == ddarray[zz].data) {filterfound = true;break;}                                                 //go to next filter
			}
			if (!filterfound) {  //alert('click'+clickname+'notfound'+ddarray[zz].data);
			document.getElementById(ddarray[zz].data).value = 'ALL';}
		
		}
	    //$('#jqxgrid').jqxGrid('refreshfilterrow');
			
	});  */
	/*
	$(document).ready(function() {
	alert('ready');
	}); */
	/////////////////////////////// INIT CODE
	
	//window.onerror = function (errorMsg, url, lineNumber, column, errorObj) {
    //console.log('Error: ' + errorMsg + ' Script: ' + url + ' Line: ' + lineNumber
    //+ ' Column: ' + column + ' StackTrace: ' +  errorObj);
	//}
	
	
	$(window).load(function() {
        //$(document).load(function () {
     mytimeout = setTimeout(function(){ document.location.href = "./index.php?module=Users&action=Logout&loginErrorMessage=SessionExpired"; }, 600000);
				
	//var data = new Array();
	var i = 0;

	//alrt(dummy);
	//alert(JSON.stringify(risklist["bup"][0]));
	 
	 var myselection = {methtake:"pos", methtest:"neg", buptake:"neg", buptest: "neg", opiatetest: "pos", codeinetake: "neg", morphinetake:"neg", hydrocodtake:"pos", hydromortake:"pos",  oxycodtake:"pos", oxymorphtake:"neg", oxytest:"neg", meptake:"pos", fenttake:"pos"}; 
	//if (typeof myselection["fake"] == "undefined" ) alert("undefined detected");

	var diagmsg = " ";
	var opiatemsg = " ";
	var ijk = 0;
	
	var buplist = ["bup", "meth"];
	var outerindex = buplist.length;
	var drugname;
	while (outerindex--) {
	    drugname = buplist[outerindex];
		ijk = risklist[drugname].length;
		while (ijk--) {
			//alert(JSON.stringify(risklist["bup"][ijk]));
		  if (risklist[drugname][ijk][drugname+"take"] == myselection[drugname+"take"] && risklist[drugname][ijk][drugname+"test"] == myselection[drugname+"test"]) {
			  diagmsg += drugname + " is " + risklist[drugname][ijk][drugname+"msg"] + "\n";
		   } 
		}
	}
	//definite list for opiates
	codlist = ["codeine", "morphine"];
	var opiateresults = {Expected:[], Unexpected:[], Possible:[]};
	outerindex = codlist.length;
	
	while (outerindex--) {
	    drugname = codlist[outerindex];
		ijk = risklist[drugname].length;
		while (ijk--) {
			//alert(JSON.stringify(risklist["codeine"][ijk]));
		  if (risklist[drugname][ijk][drugname+"take"] == myselection[drugname+"take"] && risklist[drugname][ijk]["opiatetest"] == myselection["opiatetest"]) {
			   //opiatemsg += "\n " + drugname + " opiate is " + risklist[drugname][ijk]["opiatemsg"];
			   if ( risklist[drugname][ijk]["opiatemsg"].indexOf("Expected") > -1 ) {
			      opiateresults["Expected"].push(risklist[drugname][ijk]["opiatemsg"]);}
			   if ( risklist[drugname][ijk]["opiatemsg"].indexOf("Unexpected") > -1 ) {
			      opiateresults["Unexpected"].push(risklist[drugname][ijk]["opiatemsg"]);}
		   } 
		}
	
	}
	//for opiates
	possiblelist = ["hydrocod", "hydromor", "oxycod"];
	outerindex = possiblelist.length;
	while (outerindex--) {
	    drugname = possiblelist[outerindex];
		ijk = risklist[drugname].length;
		while (ijk--) {
			//alert(JSON.stringify(risklist["codeine"][ijk]));
		  if (risklist[drugname][ijk][drugname+"take"] == myselection[drugname+"take"] && risklist[drugname][ijk]["opiatetest"] == myselection["opiatetest"]) {
			   //opiatemsg += "\n " + drugname + " opiate is " + risklist[drugname][ijk]["opiatemsg"];
			   if ( risklist[drugname][ijk]["opiatemsg"].indexOf("Possible") > -1 ) {
			      opiateresults["Possible"].push(risklist[drugname][ijk]["opiatemsg"]);}
			   if ( risklist[drugname][ijk]["opiatemsg"].indexOf("Unexpected") > -1 ) {
			      opiateresults["Unexpected"].push(risklist[drugname][ijk]["opiatemsg"]);}
		   } 
		}
	
	}
	console.log ( "All opiates trigers" + JSON.stringify(opiateresults));
	
	if ( myselection["opiatetest"] == "pos" && ( myselection["codeinetake"] == "pos" || myselection["morphinetake"] == "pos" ) ) console.log ( JSON.stringify(opiateresults["Expected"]));
	else if ( myselection["opiatetest"] == "neg" && ( myselection["codeinetake"] == "pos" || myselection["morphinetake"] == "pos" ) ) console.log ( JSON.stringify(opiateresults["Unexpected"]));
	else if ( myselection["opiatetest"] == "neg" && ( myselection["codeinetake"] == "neg" && myselection["morphinetake"] == "neg" ) && ( myselection["hydrocodtake"] == "neg" && myselection["hydromortake"] == "neg" ) ) console.log ( JSON.stringify(opiateresults["Expected"]));
	else if ( myselection["opiatetest"] == "neg" && ( myselection["codeinetake"] == "neg" && myselection["morphinetake"] == "neg" ) && ( myselection["hydrocodtake"] == "pos" || myselection["hydromortake"] == "pos"  || myselection["oxycodtake"] == "pos" ) ) console.log ( JSON.stringify(opiateresults["Possible"]));
	else if ( myselection["opiatetest"] == "pos" && ( myselection["codeinetake"] == "neg" && myselection["morphinetake"] == "neg" ) && ( myselection["hydrocodtake"] == "pos" || myselection["hydromortake"] == "pos"  || myselection["oxycodtake"] == "pos" ) ) console.log ( JSON.stringify(opiateresults["Possible"]));
	
	var fentlist = ["mep", "fent"];	outerindex = fentlist.length;
	
	while (outerindex--) {
	   drugname = fentlist[outerindex];
		ijk = risklist[drugname].length;
		while (ijk--) {
			//alert(JSON.stringify(risklist["meperidine"][ijk]));
		  if (risklist[drugname][ijk][drugname+"take"] == myselection[drugname+"take"] && risklist[drugname][ijk]["opiatetest"] == myselection["opiatetest"]) {
			   diagmsg += " \n " + drugname +" is " + risklist[drugname][ijk][drugname+"msg"];
		   } 
		}
	}	
	
	var oxylist = ["oxycod", "oxymorph"];	outerindex = oxylist.length;
	var oxyresults = {Expected:[], Unexpected:[]};
	while (outerindex--) {
	   drugname = oxylist[outerindex];
	   ijk = risklist[drugname].length;
		while (ijk--) {
			//alert(JSON.stringify(risklist["meperidine"][ijk]));
		  //if (risklist[drugname][ijk][drugname+"take"] == myselection[drugname+"take"] && risklist[drugname][ijk]["opiatetest"] == myselection["opiatetest"]) {
			//   opiatemsg += "\n " + drugname +" opiate is " + risklist[drugname][ijk]["opiatemsg"];
		  // } 
		   if (risklist[drugname][ijk][drugname+"take"] == myselection[drugname+"take"] && risklist[drugname][ijk]["oxytest"] == myselection["oxytest"]) {
			   //diagmsg += " \n " + drugname + " test result is " + risklist[drugname][ijk]["oxymsg"];
			   if ( risklist[drugname][ijk]["oxymsg"].indexOf("Expected") > -1 ) {
			      oxyresults["Expected"].push(risklist[drugname][ijk]["oxymsg"]);}
			   if ( risklist[drugname][ijk]["oxymsg"].indexOf("Unexpected") > -1 ) {
			      oxyresults["Unexpected"].push(risklist[drugname][ijk]["oxymsg"]);}
		   } 
		}
	}
	//if (  oxyresults["Unexpected"].length > 0 ) alert ( JSON.stringify(oxyresults["Unexpected"]));
	//else alert ( JSON.stringify(oxyresults["Expected"]));
	
	if ( myselection["oxytest"] == "pos" && ( myselection["oxycodtake"] == "pos" || myselection["oxymorphtake"] == "pos" ) ) console.log ( JSON.stringify(oxyresults["Expected"]));
	else if ( myselection["oxytest"] == "neg" && ( myselection["oxycodtake"] == "pos" || myselection["oxymorphtake"] == "pos" ) ) console.log ( JSON.stringify(oxyresults["Unexpected"]));
	else if ( myselection["oxytest"] == "neg" && ( myselection["oxycodtake"] == "neg" && myselection["oxymorphtake"] == "neg" ) ) console.log ( JSON.stringify(oxyresults["Expected"]));
	
	console.log(diagmsg);
	
	{/literal}
	{foreach name=myrowIteration from=$mydata key=id item=myrowData}

        

		var row = {literal} {} {/literal};

		row["active"]		= "{$myrowData.active}";
		row["location"] 	= "{$myrowData.location}";
		row["patientname"] 	= "{$myrowData.lname}, {$myrowData.fname}//{$myrowData.patid}" ;
		row["patientnameexport"] 	= "{$myrowData.lname}, {$myrowData.fname}" ;
		row["firstname"] 	= "{$myrowData.fname}" ;
		row["lastname"] 	= "{$myrowData.lname}" ;
		row["mrn"] 			= "{$myrowData.mrn}";
		row["refill"] 		= "{$myrowData.refill}";
		row["status"] 			= "{$myrowData.status}";
		row["last_uts"] 	= "{$myrowData.last_uts}"; //|date_format:"%m/%d/%Y"}";
		row["pmp_date"] 	= "{$myrowData.pmp_date}"; //|date_format:"%m/%d/%Y"}";
		row["dob"] 			= "{$myrowData.dob}";
		row["zip"]          = "{$myrowData.zip}";
		//row["next_pcp"] 	= "{$myrowData.next_pcp}";
		row["pcp"] 			= "{$myrowData.provname}";
		row["action"] 		= "{$myrowData.patid}";
		//row["risk"] 		=  {if ($myrowData.risk == "")} "NA" {elseif ( $myrowData.risk == "0-3" )} "LOW"  {elseif ( $myrowData.risk == "4-7" )} "MODERATE"  {elseif ( $myrowData.risk == "gt7" )} "HIGH"  {elseif ( $myrowData.risk  >= 0 AND  $myrowData.risk  < 4  )} "LOW"  {elseif ( $myrowData.risk  >= 4 AND  $myrowData.risk  < 7  )} "MODERATE"   {elseif ( $myrowData.risk  >= 7   )} "HIGH"  {elseif ( $myrowData.risk    < 0  )} "NA" {else} "NA" {/if} ;
		row["risk"] 		=  {if ($myrowData.risk == "")} "A" {elseif ( $myrowData.risk == "0-3" )} "B"  {elseif ( $myrowData.risk == "4-7" )} "C"  {elseif ( $myrowData.risk == "gt7" )} "D"  {elseif ( $myrowData.risk  >= 0 AND  $myrowData.risk  < 4  )} "B"  {elseif ( $myrowData.risk  >= 4 AND  $myrowData.risk  < 7  )} "C"   {elseif ( $myrowData.risk  >= 7   )} "D"  {elseif ( $myrowData.risk    < 0  )} "A" {else} "A" {/if} ;
		row["audit"]		=  "{$myrowData.audit_flag}" == "1" ? "true//"+"{$myrowData.patid}":"false//"+"{$myrowData.patid}";
		data[i] = row;
	    i = i + 1;
	{/foreach}

	{literal}
	//alert("start");
	

	
	var linkrenderer = function (row, column, value) {
                
                //return '<div id="patid'+row+'"class="dropdown dropdown-tip"> <ul class="dropdown-menu"> <li><a href="./index.php?module=REG_Patient&action=PrescriptionRefill&record=1">Refill</a></li>  <li><a href="./index.php?module=REG_Patient&action=PatientEncounter&record=2">Encounter</a></li></ul> </div><input type="button" value="Action" data-dropdown="#patid'+row+'" class="">	';
				return '<select id="mysort'+row+'" name="mysort'+row+'" onchange="switch (document.getElementById(\'mysort'+row+'\').selectedIndex) { case 1: loadUrl(\'./index.php?module=REG_Patient&action=PrescriptionRefill&record='+value+'\'); break; case 2:  loadUrl(\'./index.php?module=REG_Patient&action=PatientEncounter&record='+value+'\'); break; case 3: loadUrl(\'./index.php?module=REG_Patient&action=treatmentplan&record='+value+'\');break;case 4: loadUrl(\'./index.php?module=REG_Patient&action=riskevaluation&patid='+value+'\');break;}"> <option value="Action"  selected>Action</option><option value="Refill" >Refill</option><option value="Enc" >Encounter</option><option value="Tp" >Treatment Plan</option><option value="risk" >Risk Evaluation</option>	</select>';
    }
	
	var auditrenderer = function (row, column, value) {
	        // call function update audit and pass parameters
	        var fstr = "updateaudit(this, '" + row + "','" + value + "')";
	        if (value.split("//")[0] == "false")
				return '<input type="checkbox"  onclick="'+ fstr + ';"> ';
			else
				return '<input type="checkbox"  checked onclick="'+ fstr + ';"> ';	
	}
	
	var auditfilterrenderer = function(value) {
		 return '<div style="font-size:80%;"><p>Audit Flag</p><p> Click to</p><p> Update</p></div>'; 
		        //for later if filter is needed
				//return '<input type="checkbox" value=Bike1" checked onclick="alert(\'me\');auditfilter(this);">';
	}
	
	var riskrenderer = function(row, column,value) {
		 if (value == "A")	return '<p>NA</p>';
		 if (value == "B")	return '<p>LOW</p>';
		 if (value == "C")	return '<p>MODERATE</p>';
		 if (value == "D")	return '<p>HIGH</p>';
		 return '<p>NA</p>';
			
	}
	
	var columnsrenderer = function (value) {
	//return '<div style="text-align: center; margin-top: 5px;">' + value + '</div>';

	//if (value == 'Refill')
	//	return '<div>Refill <select style="width:75px;" id="mysortrefill" name="mysortrefill" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="switch(document.getElementById(\'mysortrefill\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \'refill\', true); break;  case 1: refillfilter(7, \'rx\'); break;  case 2: refillfilter(14, \'rx\');break;}"> <option value="Action"  selected>ALL</option><option value="Refill7" >Next 7 Days</option><option value="Refill14" >Next 14 Days</option>&nbsp &nbsp</select> </div>&nbsp &nbsp';
	//if (value == 'UTS')
	//	return '<div>UTS<select style="width:75px;" id="mysortuts" name="mysortuts" onchange="switch(document.getElementById(\'mysortuts\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \'uts\', true); break;  case 1: refillfilter(7, \'uts\'); break;  case 2: refillfilter(14, \'uts\');break;}"> <option value="Action"  selected>ALL</option><option value="Refill7" >Next 7 Days</option><option value="Refill14" >Next 14 Days</option>	</select></div>';
	//if (value == 'Next PCP') return ddarray[0].render;
	//if (value == 'Patient Name') return '<p>Patient</p> <p> Name </p>';
	for (var k = 0; k < ddarray.length; k++) {
		if (value == ddarray[k].name) {
			return ddarray[k].render1();
			//return ddarray[k].render;
			break;
		};
	};
	return '<div style="text-align: center; margin-top: 5px;font-weight:bold;">' + value + '</div>';
	}
	
	var patientrenderer = function (row, columnfield, value, defaulthtml, columnproperties) {
			 var res = value.split("//");
             return   '<a href="./index.php?module=REG_Patient&action=DetailView&record='+ res[1] +'">' + res[0] + '</a>';
    }
	
	var dateoverduerenderer = function (row, columnfield, value, defaulthtml, columnproperties) {
		if (value == "") return;

		var _MS_PER_DAY = 1000 * 60 * 60 * 24;
		var today = new Date();
		//var highdate = new Date(value);
		var utc1 = Date.UTC(today.getFullYear(), today.getMonth(), today.getDate());
		var utc2 = Date.UTC(value.getFullYear(), value.getMonth(), value.getDate());
	 
		var diffdays = Math.floor((utc2 - utc1) / _MS_PER_DAY);
	 
	 
        if (diffdays < 0) {
            return  '<div style="color:red;">' + (value.getMonth()+1) + '/'+ value.getDate() + '/'+  value.getFullYear(); + '</div>';;
         }
        return   '<div style="color:black;">' + (value.getMonth()+1) + '/'+ value.getDate() + '/'+  value.getFullYear(); + '</div>';
    }
	
	
	var datecellclass = function (row, columnfield, value) {
	 if (value == "") return;
	 var _MS_PER_DAY = 1000 * 60 * 60 * 24;
	 var today = new Date();
	 var highdate = new Date(value);
	 var utc1 = Date.UTC(today.getFullYear(), today.getMonth(), today.getDate());
	 var utc2 = Date.UTC(highdate.getFullYear(), highdate.getMonth(), highdate.getDate());
	 
	 var diffdays = Math.floor((utc2 - utc1) / _MS_PER_DAY);
	 
	 
                if (diffdays < 0) {
                    return 'red';
                }
 
                //else return 'green';
     }
			 
	var dataAdapter = new $.jqx.dataAdapter(source);
	 var ddsource = [{
     text: "Affogato",
     value: 0
	}, {
     text: "Americano",
     value: 1
	}];
	
    var generaterow = function (i) {
                var row = {};
                row["active"]		= "1";
		row["location"] 	= "Test";
		row["patientname"] 	= "Test,Bunny//123" ;
		row["patientnameexport"] 	= "Test,Bunny" ;
		row["mrn"] 			= "4588";
		row["refill"] 		= "";
		row["status"] 			= "";
		row["last_uts"] 	= ""; 
		
		row["pcp"] 			= "Added";
		row["action"] 		= "123";
		
		row["risk"] 		=  "A" ;
		row["audit"]		=  "true//123";
                return row;
            }
	
	$("#jqxgrid").jqxGrid(
	{
		columnsheight: 35,
		width: 1210,
		height: 600,
		source: dataAdapter,
		showfilterrow: true,
		//groupable: true,
        filterable:true,
		sortable: true,
		editable: true,
		selectionmode: 'singlecell',
		editmode: 'click',
		
		columns: [
		    { text: 'Active', hidden: true,  datafield: 'active', width: 20,  filterable:true,filtertype: 'textbox', editable:false },
			{ text: 'Location1',  datafield: 'location', width: 80,  sortable: true, editable:false },
			///{ text: 'Location', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'location', width: 80, renderer:columnsrenderer, sortable: true },
			{ text: 'Patient Name', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'patientname', width: 140, renderer:columnsrenderer, sortable: true, cellsrenderer:patientrenderer, editable:false },
			{ text: 'Patient Name', datafield: 'patientnameexport', width: 140, hidden:true,editable:false},
			{ text: 'firstname', datafield: 'firstname', width: 30, hidden:true,editable:false},
			{ text: 'lastname', datafield: 'lastname', width: 30, hidden:true,editable:false},
			{ text: 'MRN', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'mrn', renderer:columnsrenderer, width: 110, editable:false},
			{ text: 'Refill',   datafield: 'refill', filtertype: 'range', width: 200,  renderer:columnsrenderer,  sortable:true, cellsrenderer:dateoverduerenderer, cellsformat: 'd', editable:false },
			{ text: 'Status',   hidden: true, datafield: 'status',  width: 20, filterable:true,filtertype: 'textbox'},
			{ text: 'Last UTS', filtertype: 'range',  datafield: 'last_uts',  width: 140,   renderer:columnsrenderer, sortable:true, cellsformat: 'd', editable:true },
			{ text: '<p>PMP Date</p> <p>(editable)</p>', filtertype: 'range',  datafield: 'pmp_date',  width: 140,   renderer:columnsrenderer, sortable:true, cellsformat: 'd', editable:true , 
			createeditor: function (row, cellvalue, editor, cellText, width, height) { editor.append('01/01/2015');console.log('init');},
			initeditor: function (row, cellValue, editor, cellText, width, height) { cellText = '01/01/2015';cellValue='01/01/2015';},
			validation: function (cell, value) 
				{
					var myid = $('#jqxgrid').jqxGrid('getcelltext', cell.row, 'patientname'); console.log("myid is " + myid);console.log("date is"+value);
					var date_string;
					var res = myid.split("//");
					try{date_string = (value.getMonth() + 1) + '/' + value.getDate() + '/' +  value.getFullYear();}catch (err){console.log (err.message);return false;}
					$.ajax({
									url: 'index.php?entryPoint=updatepatientaudit&update_action=pmp&pmp_date='+date_string+'&pid='+res[1],
									//data: {my_json_data: "{ text: 'Provider', editable:false, filtertype: 'textbox', hidden: false, filtercondition: 'starts_with', datafield: 'provider', width: 140,  sortable: true, cellsrenderer:cellsrenderer }"},
									type: 'POST',
									async: true,
									dataType: 'text',
									cache:false,
									success:function(text){
										console.log('AJAX SUCCESS' + text);
									}, 
									complete : function(text){
									    
										console.log('AJAX COMPLETE');
									
									}
							});
							return true;
			
				}
			},
			{ text: 'DOB', filtertype: 'date',  datafield: 'dob',  width: 20, cellsformat: 'd',hidden:true,editable:false },
			{ text: 'ZIP', datafield: 'zip', filtertype: 'textbox', width: 6,  hidden:true, editable:false},
			//{ text: 'Next PCP', filtertype: 'date',  datafield: 'next_pcp',  width: 140,    renderer:columnsrenderer, sortable:true, cellsformat: 'd' },
			{ text: 'PCP', datafield: 'pcp', filtertype: 'textbox', width: 120,  renderer:columnsrenderer , editable:false},
			{ text: 'Risk Level', datafield: 'risk', filtertype: 'list', filteritems: ['LOW', 'MODERATE', 'HIGH', 'NA'], cellsrenderer:riskrenderer,renderer:columnsrenderer, width: 100, editable:true},
			//{ text: 'Risk Level', datafield: 'risk', filtertype: 'list', filteritems: new $.jqx.dataAdapter(riskSource), cellsrenderer:riskrenderer,renderer:columnsrenderer, width: 100},
			//{ text: 'Risk Level', datafield: 'risk', cellsrenderer:riskrenderer,  filtertype: 'list', filteritems: [{label:'Av',value:'A'} ], width: 100,createfilterwidget: function (column, htmlElement, editor) { editor.jqxDropDownList({source:ddsource,displayMember: "value", valueMember: "value" });  }},
			 //{ text: 'Risk Level', datafield: 'risk', displayfield:'riskString', filtertype: 'list', filteritems: new $.jqx.dataAdapter(riskSource),  width: 100},
			{ text: 'Action', datafield: 'action',  width: 120,  cellsrenderer:linkrenderer, filterable:false, renderer:columnsrenderer, sortable:false, menu:false, editable:false },
			{ text: 'Audit', datafield: 'audit',  width: 60,  cellsrenderer:auditrenderer, filterable:false, renderer:auditfilterrenderer, editable:false} //,sortable:false, menu:false },
		]//,			groups: ['PCP']
	});
	
	//alert("grid");
	$("#jqxgrid").bind('cellendedit', function (event) {
		var args = event.args;
		 var columnDataField = args.datafield;
		 var rowIndex = args.rowindex;
		 var cellValue = args.value;
		 var oldValue = args.oldvalue;
		 var arraylen = data.length;
		 var j = 0;
		  if ( columnDataField == "last_uts" ) {   
			console.log("cell end edit checking....");
		 }
	});

	var localizationobj = {};
	localizationobj.filterchoosestring = 'ALL RISK';
	localizationobj.emptydatastring = "No data to display. Please verify filters and clear unnecessary ones.",
	$("#jqxgrid").jqxGrid('localizestrings', localizationobj);
	//$("#jqxgrid").jqxGrid('selectionmode', 'singlerow');
	
	var myprevstate = document.getElementById("testjson").value;
    //var setinactive = false;	 //default is false
	
	//alert(myprevstate);
	if (myprevstate != "") 
	 {
	   //alert("in my pev state"); alert(JSON.parse(myprevstate));
	   //alert(myprevstate);
	   $("#jqxgrid").jqxGrid('loadstate',JSON.parse(myprevstate));
	    
		//alert("what happened?");
		//var filtersinfo = $('#jqxgrid').jqxGrid('getfilterinformation');
		//var setinactive = true;  //if previous state, need to check if previous state set inactive
		//for (var j=0;j<filtersinfo.length;j++)
		//{ 
			
		//	if (filtersinfo[j].filtercolumn == 'active') {setinactive = false; }// previous state also contained only active records
		//	if (filtersinfo[j].filtercolumn == 'status') {document.getElementById("statuscheck").checked = true; }
		//}
		//now clear the session
		document.getElementById("testjson").value = "";
		clearsession();
		
	 }	
	 //else inactivefilter(false);
 //alert("what happened?");
	//document.getElementById("inactivecheck").checked = setinactive;
	for (var z = 0; z < ddarray.length; z++) {
		ddarray[z].renderprevious();
	}
	if ( document.getElementById("inactivecheck").checked ) {
		inactivefilter(true);
	} else {inactivefilter(false);}
	if ( document.getElementById("statuscheck").checked ) {
		statusfilter(true);
	} else {statusfilter(false);}
	
	$('#jqxgrid').jqxGrid('applyfilters');
	
	//alert ("Window load");

	
	}); //window load function

 </script>
	{/literal}
