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


 

    <!--script type="text/javascript" src="../../scripts/gettheme.js"></script>
    <script type="text/javascript" src="generatedata.js"></script-->

 <script type="text/javascript">


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
			datatype: "array"
			//sortcolumn: 'patientname',
			//sortdirection: 'asc'
		};
		
		var dataAdapter = new $.jqx.dataAdapter(source);
		$("#jqxgrid").jqxGrid(
		{
		columnsheight: 35,
		//theme: 'office',
		width: 1210,
		height: 600,
		source: dataAdapter,
		showfilterrow: true,
		//groupable: true,
		sortable: true,
		filterable: true,
		autoshowcolumnsmenubutton: false,
		
		
		columns: [
		    { text: 'Provider', filtertype: 'textbox', hidden: false, filtercondition: 'starts_with', datafield: 'provider', width: 140,  sortable: true },
			{ text: 'Date', filtertype: 'date', datafield: 'date', width: 90,  sortable: true,cellsformat: 'M/dd/yy' },
			{ text: 'Patient Name', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'patientname', width: 150,  sortable: true},
			{ text: 'MRN', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'mrn',  width: 90},
			{ text: 'Oxycodone',   datafield: 'oxy', filtertype: 'textbox', width: 90,    sortable:true },
			{ text: 'Opiate', datafield: 'opiate',  filtertype: 'textbox',  width: 90,     sortable:true},
			{ text: 'Methadone', datafield: 'methadone',  filtertype: 'textbox',  width: 90,    sortable:true },
			{ text: 'Cocaine', datafield: 'cocaine',  filtertype: 'textbox',  width: 90,     sortable:true},
			{ text: 'Bupreno', datafield: 'bupreno', filtertype: 'textbox', width: 90,     sortable:true},
			{ text: 'Benzo', datafield: 'benzo', filtertype: 'textbox',   width: 90,     sortable:true},
			{ text: 'Barbiturates', datafield: 'barbi',  filtertype: 'textbox',width: 90,     sortable:true},
			{ text: 'Amphetatmine', datafield: 'amph',  filtertype: 'textbox',width: 90,     sortable:true}
		]//,			groups: ['PCP']
	});
	
}); //window load function
{/literal}

</script>
</head>

<body class='default'>
    <h3>{$title}</h3>
        <div style="float: left;" id="jqxgrid">
        </div>
        
</body>
