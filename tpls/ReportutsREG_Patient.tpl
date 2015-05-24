<head>

 
<!-- --GRID -->
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.office.css" type="text/css" />


<!-- --GRID -->
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
     <script type="text/javascript" src="custom/topcarejs/json2.js"></script>

 

    <!--script type="text/javascript" src="../../scripts/gettheme.js"></script>
    <script type="text/javascript" src="generatedata.js"></script-->

 <script type="text/javascript">
var mynewdataarray = new Array();
var simplearray = new Array();
var mycounter = 0;
var dataField; 
var rowBoundIndex;

{literal}
$(window).load(function() {
	var data = new Array();
	
	var i = 0;
	var hoory = "no way";
{/literal}	
	{foreach name=myrowIteration from=$mydata key=id item=myrowData}

		var row = {literal} {} {/literal};

		row["provider"]		= "{$myrowData.provname}";
		row["date"] 		= "{$myrowData.thisdate1}";
		row["patientname"] 	= "{$myrowData.last_name}, {$myrowData.first_name}" ;
		row["mrn"] 			= "{$myrowData.pmrn}";
		row["oxy"] 			= "{$myrowData.oxy}";
		row["opiate"] 		= "{$myrowData.opiate}";
		row["methadone"] 	= "{$myrowData.methadone}";
		row["cocaine"] 		= "{$myrowData.cocaine}";
		row["bupreno"] 		= "{$myrowData.bupreno}";
		row["benzo"] 		= "{$myrowData.benzo}";
		row["barbi"] 		= "{$myrowData.barbi}";
		row["amph"] 		= "{$myrowData.amph}";
		data[i] = row;
	    i = i + 1;
	{/foreach}
{literal}	

	var source =
		{
			localdata: data,
			datafields:
					[
						{ name: 'provider', type: 'string' },
						{ name: 'date', type: 'date' },
						{ name: 'patientname', type: 'string' },
						{ name: 'mrn', type: 'string' },
						{ name: 'oxy', type: 'string' },
						{ name: 'opiate', type: 'string' },
						{ name: 'methadone', type: 'string' },
						{ name: 'cocaine', type: 'string' },
						{ name: 'bupreno', type: 'string' },
						{ name: 'benzo', type: 'string' },
						{ name: 'barbi', type: 'string'},
						{name: 'amph', type: 'string'}
						//{ name: 'action', type: 'string' }
					],
					addrow: function (rowid, rowdata, position, commit) {
                    // synchronize with the server - send insert command
                    // call commit with parameter true if the synchronization with the server is successful 
                    //and with parameter false if the synchronization failed.
                    // you can pass additional argument to the commit callback which represents the new ID if it is generated from a DB.
					var row1 = {};
					row["provider"]		= "";
					row["date"] 		= "";
					row["patientname"] 	= "";
					row["mrn"] 			= "";
					row["oxy"] 			= "";
					row["opiate"] 		= "";
					row["methadone"] 	= "";
					row["cocaine"] 		= "";
					row["bupreno"] 		= "";
					row["benzo"] 		= "";
					row["barbi"] 		= "";
					row["amph"] 		= "";
					data.splice(rowid+1, 0, row1);
					var dataAdapter = new $.jqx.dataAdapter(source);
					$("#jqxgrid").jqxGrid({ source: dataAdapter });
                    commit(true);
                },
				  updaterow: function (rowid, newdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
					var arrlength = mynewdataarray.length;
					//console.log("updated row " + rowid + "contents: " + JSON.stringify(newdata) + "length " + arrlength + " " + newdata.uid);
				
					var myindex;
					var datafound = false;
					//console.log("Arraycontents " + JSON.stringify(mynewdataarray));
					//var a = ["a", "b", "c"];
					//for (myindex = 0; myindex < arrlength; myindex++) {
					//		if (mynewdataarray[myindex].uid == newdata.uid) 
					// 		{	 datafound = true;
					//		     console.log ("data found: index " + myindex);
					//			 mynewdataarray[myindex]= newdata;
					//	}
					//}
					//var localdata = {};
					//simplearray[mycounter] = mycounter;
					//mycounter = mycounter + 1;
					//localdata.uid = newdata.uid;
					//localdata.oxy = newdata.oxy;
					//if (!datafound) {mynewdataarray.push(newdata);console.log("added2 " + mynewdataarray[arrlength].uid);}
					//data[newdata.uid]= newdata; 
					//mynewdataarray[arrlength] = localdata;console.log("ADDED " + localdata.uid);console.log("added2 " + mynewdataarray[arrlength].uid);
					//console.log ("counter = " + mycounter);
					data[newdata.uid] = newdata;
                    commit(true);
                },
			datatype: "array"
			//sortcolumn: 'patientname',
			//sortdirection: 'asc'
		};
		
		var dataAdapter = new $.jqx.dataAdapter(source);
		$("#jqxgrid").jqxGrid(
		{
		columnsheight: 35,
		showtoolbar: true,
                rendertoolbar: function (toolbar) {
                    var me = this;
                    var container = $("<div style='margin: 5px;'></div>");
                    toolbar.append(container);
                    container.append('<input id="listnew" type="button" value="List" />');
                    container.append('<input style="margin-left: 5px;" id="addmultiplerowsbutton" type="button" value="Add Multiple New Rows" />');
                    container.append('<input style="margin-left: 5px;" id="deleterowbutton" type="button" value="Delete Selected Row" />');
                    container.append('<input style="margin-left: 5px;" id="updaterowbutton" type="button" value="Update Selected Row" />');
                    $("#listnew").jqxButton();
                    $("#addmultiplerowsbutton").jqxButton();
                    $("#deleterowbutton").jqxButton();
                    $("#updaterowbutton").jqxButton();
                    // update row.
					$("#listnew").on('click', function () {
					//var index;
					
					//for (index = 0; index < mynewdataarray.length; index++) {
					//		console.log("uid =" + mynewdataarray[index].uid + "arr " + JSON.stringify(mynewdataarray[index]));
					//}
					console.log ( "array " + JSON.stringify(mynewdataarray)); 
					var editable = $("#jqxgrid").jqxGrid('endcelledit', rowBoundIndex, dataField, false);
					console.log( "cell contents at " + rowBoundIndex + " " + dataField + $('#jqxgrid').jqxGrid('getcelltext', rowBoundIndex, dataField));
					//console.log ("simplearray = " + JSON.stringify(simplearray));
					});
                    $("#updaterowbutton").on('click', function () {
                        var datarow = generaterow();
                        var selectedrowindex = $("#jqxgrid").jqxGrid('getselectedrowindex');
                        var rowscount = $("#jqxgrid").jqxGrid('getdatainformation').rowscount;
                        if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
                            var id = $("#jqxgrid").jqxGrid('getrowid', selectedrowindex);
                            var commit = $("#jqxgrid").jqxGrid('updaterow', id, datarow);
                            $("#jqxgrid").jqxGrid('ensurerowvisible', selectedrowindex);
                        }
                    });
				},
		//theme: 'office',
		width: 1510,
		height: 600,
		source: dataAdapter,
		showfilterrow: true,
		//groupable: true,
		sortable: true,
		filterable: true,
		editable: true,
		selectionmode: 'singlerow',
		autoshowcolumnsmenubutton: false,
		
		
		columns: [
		    { text: 'Provider', editable:false, filtertype: 'textbox', hidden: false, filtercondition: 'starts_with', datafield: 'provider', width: 140,  sortable: true },
			{ text: 'Date', filtertype: 'date', datafield: 'date', width: 90,  sortable: true,cellsformat: 'M/dd/yy' },
			{ text: 'Patient Name', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'patientname', width: 150,  sortable: true},
			{ text: 'MRN', filtertype: 'textbox', editable:false, filtercondition: 'starts_with', datafield: 'mrn',  width: 90},
			{ text: 'Oxycodone',   datafield: 'oxy', filtertype: 'textbox', width: 90,    sortable:true },
			{ text: 'Opiate', datafield: 'opiate',  filtertype: 'textbox',  width: 90,     sortable:true},
			{ text: 'Methadone', datafield: 'methadone',  filtertype: 'textbox',  width: 90,    sortable:true },
			{ text: 'Cocaine', datafield: 'cocaine',  filtertype: 'textbox',  width: 90,     sortable:true},
			{ text: 'Bupreno', datafield: 'bupreno', filtertype: 'textbox', width: 90,     sortable:true},
			{ text: 'Benzo', datafield: 'benzo', filtertype: 'textbox',   width: 90,     sortable:true},
			{ text: 'Barbiturates', datafield: 'barbi',  filtertype: 'textbox',width: 90,     sortable:true},
			{ text: 'Amphetatmine', datafield: 'amph',  filtertype: 'textbox',width: 90,     sortable:true},
			{ text: 'Edit', datafield: 'Edit', columntype: 'button', cellsrenderer: function () {
                     return "Edit";
                  },buttonclick: function (row) {
                     // open the popup window when the user clicks a button.
                     editrow = row;
                     var offset = $("#jqxgrid").offset();
                     var dataRecord = $("#jqxgrid").jqxGrid('getselectedrowindex');
					 //console.log(dataRecord);
					 
					//var value = $('#jqxgrid').jqxGrid('addrow', dataRecord, {});
					 var row1 = {};
					row["provider"]		= "";
					row["date"] 		= "";
					row["patientname"] 	= "";
					row["mrn"] 			= "";
					row["oxy"] 			= "";
					row["opiate"] 		= "";
					row["methadone"] 	= "";
					row["cocaine"] 		= "";
					row["bupreno"] 		= "";
					row["benzo"] 		= "";
					row["barbi"] 		= "";
					row["amph"] 		= "";
					data.splice(dataRecord+1, 0, row1);
					//$("#jqxgrid").jqxGrid('begincelledit', dataRecord, 'oxy');
					//$("#jqxgrid").jqxGrid('selectcell', dataRecord, 'mrn');
					var state = $("#jqxgrid").jqxGrid('savestate');
					var dataAdapter = new $.jqx.dataAdapter(source);
					$("#jqxgrid").jqxGrid({ source: dataAdapter });
					$("#jqxgrid").jqxGrid('loadstate',state);
                    //commit(true);

 
                 }
			}
		]//,			groups: ['PCP']
	});
	
	$("#jqxgrid").on('cellbeginedit', function (event) 
	{
	console.log("cell edit");
    // event arguments.
    var args = event.args;
    // column data field.
     dataField = event.args.datafield;
    // row's bound index.
     rowBoundIndex = event.args.rowindex;
    // cell value
    var value = args.value;
    // row's data.
    var rowData = args.row;
	console.log("datafield " + dataField + " index " + rowBoundIndex);
	console.log("row with mrn "+ rowData.mrn + "is edited");
	});
	
}); //window load function
{/literal}

</script>
{literal}
<style type="text/css">
.top {
    border-top:thin solid;
    border-color:black;
}

.bottom {
    border-bottom:thin solid;
    border-color:black;
}

.left {
    border-left:thin solid;
    border-color:black;
}

.right {
    border-right:thin solid;
    border-color:black;
}

tr {outline: thin solid black;}

table { border-collapse: collapse; border-spacing: 0; }
</style>
{/literal}
</head>

<body class='default'>
    <h3>{$title}</h3>
	<div style="margin:auto !important; text-align:center">
	<form method="post" name="formUTS">
	
	


<table >
  <tr>
    <td>no border</td>
    <td>no border here either</td>
  </tr>
  <tr>
    <td class="top left">one</td>
    <td class="top right">two</td>
  </tr>
  <tr>
    <td class="bottom left">three</td>
    <td class="bottom right">four</td>
  </tr>
  <tr>
    <td colspan="2">once again no borders</td>
  </tr>
  <tr>
    <td class="top bottom left right" colspan="2">hello</td>
  </tr>
  <tr>
    <td colspan="2">world</td>
  </tr>
</table>


	
	
	Report Duration: <select name="duration" id="duration" onchange="this.form.submit()">
	<option {if $duration eq "1"} selected {/if} value="1">Last 24 Hours</option>
	<option {if $duration eq "2"} selected {/if} value="2">Last Week</option>
	<option {if $duration eq "3"} selected {/if} value="3">Last Month</option>
	<option {if $duration eq "4"} selected {/if} value="4">All Data</option>
	</select>
	</form>
	</div><br>
        <div style="float: left;" id="jqxgrid">
        </div>
       


	   
</body>
