


<link type="text/css" rel="stylesheet" href="custom/topcarejs/jquery.dropdown.css" />
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<!-- --GRID -->
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.office.css" type="text/css" />

<script type="text/javascript" src="custom/topcarejs/jquery.dropdown.js"></script>

<script type="text/javascript">
var clickname;
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
	

//Send the proper header information along with the request


if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }

xmlhttp.onreadystatechange=function()
  {
  
  }
//xmlhttp.open("GET","index.php?module=REG_Patient&action=session_setting_variable&id=jqxgridstate&value=orepiya123",true);
xmlhttp.open("POST","index.php?entryPoint=session_setting_variable",false);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", params.length);
xmlhttp.setRequestHeader("Connection", "close");
xmlhttp.send(params);

//$.get("index.php?module=REG_Patient&action=session_setting_variable&id=jqxgridstate&value=orepiya123ajax");

  this.document.location.href = location;
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

xmlhttp.onreadystatechange=function()
  {
  
  }

xmlhttp.open("POST","index.php?entryPoint=session_setting_variable",false);
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
	 this.render 	= '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;z-index:99999;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\'); break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL"  selected>ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
     this.refillfilter = refillfilter;
	 this.sessionparam = sessionparam;
	 this.renderprevious = renderprevious;
	 this.setrange = setrange;
	 
	 
	 function renderfunc()
	 {
	   //alert('selectval'+ this.selectval);
	   if (this.selectval == 'ALL')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\');$(\'#jqxgrid\').jqxGrid(\'render\'); $(\'#jqxgrid\').jqxGrid(\'render\');break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL"  selected>ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
		if (this.selectval == 'Refill7')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\'); break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL">ALL</option><option value="Refill7"   selected>7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
		if (this.selectval == 'Refill14')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\'); break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL" >ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" selected >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
		if (this.selectval == 'range')
			return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\'); break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL" >ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" selected >range</option></select> </div>&nbsp &nbsp';  //function to render html
			
		return '<div style="text-align: center; font-weight:bold;" ><p><b>'+this.label+'</b></p><select style="width:60px;font-size:80%;padding-left:0px;padding-right:0px;" id="'+this.data+'" name="'+this.data+'" onclick="if(event.stopPropagation)event.stopPropagation();else event.cancelBubble=true;" onchange="ddarray['+this.id+'].selectval = this.value;clickname=this.id;clickvalue=this.value;;switch(document.getElementById(\''+this.data+'\').selectedIndex) { case 0: $(\'#jqxgrid\').jqxGrid(\'removefilter\', \''+this.data+'\', \'true\'); $(\'#jqxgrid\').jqxGrid(\'refreshfilterrow\'); break;  case 1: ddarray['+this.id+'].refillfilter(7); break;  case 2: ddarray['+this.id+'].refillfilter(14);break;}"> <option value="ALL"  selected>ALL</option><option value="Refill7" >7 Days</option><option value="Refill14" >14 Days</option><option value="range" >range</option></select> </div>&nbsp &nbsp';  //function to render html
		
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
	  highdate.setDate(today.getDate() + refilldaysselect);
      var fmthighdate = (highdate.getMonth()+1) + '/'+ highdate.getDate() + '/'+  highdate.getFullYear(); 
	  var fmttoday = (today.getMonth()+1) + '/'+ today.getDate() + '/'+  today.getFullYear(); 
	  
	  var filtergroup = new $.jqx.filter();
	  var filterlo = filtergroup.createfilter('datefilter', fmttoday, 'GREATER_THAN_OR_EQUAL');
	  var filterhi = filtergroup.createfilter('datefilter', fmthighdate , 'LESS_THAN_OR_EQUAL');
	  //var filterover = filtergroup.createfilter('datefilter', '11/7/2013', 'LESS_THAN_OR_EQUAL');
	  var filterbot  = filtergroup.createfilter('datefilter', '01/01/2013', 'GREATER_THAN_OR_EQUAL');
	  //filtergroup.addfilter(0, filterlo);

	  if (this.data == "refill")
	  	filtergroup.addfilter(0, filterbot);
	  else filtergroup.addfilter(0, filterlo);
	  
		filtergroup.addfilter(0, filterhi);
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

  <script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
 
  


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
	<!--[if IE 7]>
		<script type="text/javascript" src="custom/topcarejs/json2.js"></script>
	<![endif]--> 
    <!--script type="text/javascript" src="../../scripts/gettheme.js"></script>
    <script type="text/javascript" src="generatedata.js"></script-->
    


    



<!-- END GRID -->



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


<input id="inactivecheck" type="checkbox" value="inactive" onclick="inactivefilter(this.checked);"> Include Inactive patients </input>
<input name="testjson" id = "testjson" type = "hidden"  value="{$smarty.session.jqxgridstate nofilter}"/>

        <div id="jqxgrid"  ></div>
        


<!--input value = "Sort" type="button" onclick="$('#jqxgrid').jqxGrid('sortby', 'patientname', 'asc');">  </input>
<input id="refresh" type="button" value="Refresh Data" />
<input type="button" id="saveState" value="Save State" />
<input type="button" id="loadState" value="Load State" /-->


</body>


	<script type="text/javascript">
	var refilldaysselect;
	
	{literal}
	function refillfilter(value, type) {
	
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

	}
	
	var ddarray = new Array();
	
	var dd0 = new datedropdown('Next PCP', 'Next PCP', 'next_pcp', '0', {/literal}'{$smarty.session.next_pcp}'{literal});
	ddarray.push(dd0);
	var dd1 = new datedropdown('Last UTS', 'Last UTS', 'last_uts', '1', {/literal}'{$smarty.session.last_uts}'{literal});
	ddarray.push(dd1);
	var dd2 = new datedropdown('UTS', 'UTS', 'uts', '2', {/literal}'{$smarty.session.uts}'{literal});
	ddarray.push(dd2);
	var dd3 = new datedropdown('Refill', 'Refill', 'refill', '3', {/literal}'{$smarty.session.refill}'{literal});
	ddarray.push(dd3);
	
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
		
   
	$("#jqxgrid").on("filter", function (event) 
	{   
	   
		var filterinfo1 = $("#jqxgrid").jqxGrid('getfilterinformation');
		var filterfound = false;
		//alert('click'+clickname);  
		//if (clickname != "") { clickname = ""; return;} //no need to process further
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
	    $('#jqxgrid').jqxGrid('refreshfilterrow');
			
	});  
	/*
	$(document).ready(function() {
	alert('ready');
	}); */
	/////////////////////////////// INIT CODE
	$(window).load(function() {
        //$(document).load(function () {

				
	var data = new Array();
	var i = 0;

	
	
	 
	
	
	{/literal}
	{foreach name=myrowIteration from=$mydata key=id item=myrowData}

 

		var row = {literal} {} {/literal};
		row["active"]		= "{$myrowData.active}";
		row["location"] 	= "{$myrowData.location}";
		row["patientname"] 	= "{$myrowData.lname}, {$myrowData.fname}//{$myrowData.patid}" ;
		row["mrn"] 			= "{$myrowData.mrn}";
		row["refill"] 		= "{$myrowData.refill}";
		row["uts"] 			= "{$myrowData.uts}";
		row["last_uts"] 	= "{$myrowData.last_uts}";
		row["next_pcp"] 	= "{$myrowData.next_pcp}";
		row["pcp"] 			= "{$myrowData.provname}";
		row["action"] 		= "{$myrowData.patid}";
		row["risk"] 		= {if ( $myrowData.risk  >= 0 AND  $myrowData.risk  < 4  )} "LOW" {/if} {if ( $myrowData.risk  >= 4 AND  $myrowData.risk  < 7  )} "MODERATE" {/if}  {if ( $myrowData.risk  >= 7   )} "HIGH" {/if} ;
		data[i] = row;
	    i = i + 1;
	{/foreach}

	{literal}

	var source =
	{
		localdata: data,
		datafields:
                [
				    { name: 'active', type: 'string' },
					{ name: 'location', type: 'string' },
					{ name: 'patientname', type: 'string' },
					{ name: 'mrn', type: 'string' },
                    { name: 'refill', type: 'date' },
                    { name: 'uts', type: 'date' },
					{ name: 'last_uts', type: 'date' },
					{ name: 'next_pcp', type: 'date' },
                    { name: 'pcp', type: 'string'},
					{name: 'risk', type: 'string'},
                    { name: 'action', type: 'string' }
                ],
		datatype: "array",
		sortcolumn: 'patientname',
		sortdirection: 'asc'
	};
	
	var linkrenderer = function (row, column, value) {
                
                //return '<div id="patid'+row+'"class="dropdown dropdown-tip"> <ul class="dropdown-menu"> <li><a href="./index.php?module=REG_Patient&action=PrescriptionRefill&record=1">Refill</a></li>  <li><a href="./index.php?module=REG_Patient&action=PatientEncounter&record=2">Encounter</a></li></ul> </div><input type="button" value="Action" data-dropdown="#patid'+row+'" class="">	';
				return '<select id="mysort'+row+'" name="mysort'+row+'" onchange="if (document.getElementById(\'mysort'+row+'\').selectedIndex ==1 ) loadUrl(\'./index.php?module=REG_Patient&action=PrescriptionRefill&record='+value+'\'); else loadUrl(\'./index.php?module=REG_Patient&action=PatientEncounter&record='+value+'\');"> <option value="Action"  selected>Action</option><option value="Refill" >Refill</option><option value="Enc" >Encounter</option>	</select>';
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
			break;
		};
	};
	return '<div style="text-align: center; margin-top: 5px;font-weight:bold;">' + value + '</div>';
	}
	
	var patientrenderer = function (row, columnfield, value, defaulthtml, columnproperties) {
			 var res = value.split("//");
             return   '<a href="./index.php?module=REG_Patient&action=DetailView&record='+ res[1] +'">' + res[0] + '</a>';
    }
	
			 
	var dataAdapter = new $.jqx.dataAdapter(source);
	
	
	
	
	$("#jqxgrid").jqxGrid(
	{
		columnsheight: 35,
		theme: 'office',
		width: 1210,
		height: 600,
		source: dataAdapter,
		showfilterrow: true,
		groupable: true,
		sortable: true,
		filterable: true,
		autoshowcolumnsmenubutton: false,
		
		columns: [
		    { text: 'Active', filtertype: 'textbox', hidden: true, filtercondition: 'starts_with', datafield: 'active', width: 20, renderer:columnsrenderer, sortable: true },
			{ text: 'Location', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'location', width: 80, renderer:columnsrenderer, sortable: true },
			{ text: 'Patient Name', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'patientname', width: 140, renderer:columnsrenderer, sortable: true, cellsrenderer:patientrenderer },
			{ text: 'MRN', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'mrn', renderer:columnsrenderer, width: 110},
			{ text: 'Refill', filtertype: 'date',  filterable:true, datafield: 'refill', width: 140, cellsformat: 'M/dd/yy', renderer:columnsrenderer,  sortable:true },
			{ text: 'UTS', filtertype: 'date', filterable:true, datafield: 'uts',  width: 140,   cellsformat: 'M/dd/yy', renderer:columnsrenderer, sortable:true },
			{ text: 'Last UTS', filtertype: 'date', filterable:true, datafield: 'last_uts',  width: 140,   cellsformat: 'M/dd/yy', renderer:columnsrenderer, sortable:true },
			{ text: 'Next PCP', filtertype: 'date', filterable:true, datafield: 'next_pcp',  width: 140,   cellsformat: 'M/dd/yy', renderer:columnsrenderer, sortable:true },
			{ text: 'PCP', datafield: 'pcp', filtertype: 'textbox', width: 120,  renderer:columnsrenderer },
			{ text: 'Risk Level', datafield: 'risk', filtertype: 'list', filteritems: ['LOW', 'MODERATE', 'HIGH'], renderer:columnsrenderer, width: 100},
			{ text: 'Action', datafield: 'action',  width: 100,  cellsrenderer:linkrenderer, filterable:false, renderer:columnsrenderer, sortable:false }
		]//,			groups: ['PCP']
	});
	
	var localizationobj = {};
	localizationobj.filterchoosestring = 'ALL RISK';
	$("#jqxgrid").jqxGrid('localizestrings', localizationobj);
	
	var myprevstate = document.getElementById("testjson").value;
    var setinactive = false;	 //default is false
	
	if (myprevstate != "") 
	 {
	   $("#jqxgrid").jqxGrid('loadstate',JSON.parse(myprevstate));
	
		var filtersinfo = $('#jqxgrid').jqxGrid('getfilterinformation');
		var setinactive = true;  //if previous state, need to check if previous state set inactive
		for (var j=0;j<filtersinfo.length;j++)
		{ 
			
			if (filtersinfo[j].filtercolumn == 'active') setinactive = false; // previous state also contained only active records
		}
		//now clear the session
		document.getElementById("testjson").value = "";
		clearsession();
		
	 }	
	 else inactivefilter(false);
	document.getElementById("inactivecheck").checked = setinactive;
	for (var z = 0; z < ddarray.length; z++) {
		ddarray[z].renderprevious();
	}
	$('#jqxgrid').jqxGrid('applyfilters');
	
	

	
	}); //window load function

 </script>
	{/literal}
