<head>

 
<!-- --GRID -->
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet" href="custom/topcarejs/jqwidgets/styles/jqx.office.css" type="text/css" />
{literal}
<style>

.radio-toolbar input[type="radio"] {
   /* display:none; */ 
}

.radio-toolbar label {
    display:inline-block;
    background-color:#ddd;
    padding:4px 11px;
    font-family:Arial;
    font-size:16px;
}

.radio-toolbar input[type="radio"]:checked + label { 
    background-color:#f68428;
}

.check-toolbar input[type="checkbox"] {
    display:none;  
}

.check-toolbar label {
    display:inline-block;
    background-color:red;
    padding:4px 11px;
    font-family:Arial;
    font-size:16px;
}

.check-toolbar input[type="checkbox"]:checked + label { 
    background-color:#f68428;
}
</style>
{/literal}

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
var mynewdataarray = new Array(100);
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
		row["patientname"] 	= "{$myrowData.last_name}, {$myrowData.first_name}" ;
		row["mrn"] 			= "{$myrowData.pmrn}";
		
		data[i] = row;
	    i = i + 1;
	{/foreach}
{literal}	

   var cellsrenderer = function (row, column, value, defaultHtml) {
                if (row == 0 || row == 2 || row == 5) {
                    var element = $(defaultHtml);
                    element.css('color', '#999');
                    return element[0].outerHTML;
                }

                return defaultHtml;
            }
	var radiocellsrenderer = function (row, column, value, defaultHtml) {
                //return '<div class="radio-toolbar"><input type="radio"  value=1 ><label>Yes</label><input type="radio"><label>No</label></div>';
				//if (value == "NEG") return "boom";
                //return defaultHtml;
            }
			
	var opcellsrenderer = function (row, column, value, defaultHtml) {
				//console.log(defaultHtml);
                return '<input type="radio"  name="op1" value=1 ><label>Yes</label><input type="radio" name="op1" value=2><label>No</label></div>';
				//if (value == "hi") return "boom";
                //return defaultHtml;
            }		
			
			//<div class="radio-toolbar"><input type="radio" id="'.$myrowData['TAG'].'_checkid1" name ="'.$myrowData['TAG'].'_check" female='.$myrowData['FEM'].' male='.$myrowData['MALE'].' value=1 ><label for="'.$myrowData['TAG'].'_checkid1">Yes</label>&nbsp;<input type="radio" id="'.$myrowData['TAG'].'_checkid2" name ="'.$myrowData['TAG'].'_check"  male=0 female=0><label for="'.$myrowData['TAG'].'_checkid2">No&nbsp;</label></div>
			
			var initGridEditor = function (row, cellValue, editor, cellText, width, height) {

                    //var checkBoxHTMLElement = editor.find('div:first');
                    //checkBoxHTMLElement.jqxCheckBox({ checked: cellValue.toString() == "true" });
					//console.log("checkbox");
					//$('<div class="check-toolbar"><input type="checkbox" name="blahz'+row+'" id="blahz'+row+'" value=1 onclick="if (this.checked) this.nextSibling.innerHTML=\'POS\';else this.nextSibling.innerHTML=\'NEG\';" ><label  id="labelid'+row+'" for="blahz'+row+'">NEG</label></div>').prependTo(editor);
					//$('<input type="button" value="NA" onclick ="if (this.value == \'NA\') this.value = \'NEG\';  else if (this.value == \'NEG\') this.value = \'POS\'; else if (this.value == \'POS\') this.value = \'NA\';">').prependTo(editor);
					//editor.prepend();

            }
			var gridEditorValue = function (row, cellValue, editor) {
                //if (row == 2) {
                     var checkBoxHTMLElement = ((editor.find('input:first'))[0]).value;
					 console.log("value " + checkBoxHTMLElement);
                    //return checkBoxHTMLElement.val();
					    //console.log(checkBoxHTMLElement);
                 //   return checkBoxHTMLElement.val();
                //}
                //console.log("value " + checkBoxHTMLElement.innerHTML);
				return checkBoxHTMLElement;
            }

	var source =
		{
			//localdata: data,
			unboundmode: true,
			totalrecords: 100,
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
					// addrow: function (rowid, rowdata, position, commit) {
                    // synchronize with the server - send insert command
                    // call commit with parameter true if the synchronization with the server is successful 
                    //and with parameter false if the synchronization failed.
                    // you can pass additional argument to the commit callback which represents the new ID if it is generated from a DB.
					//var row1 = {};
					//row["provider"]		= "";
					//row["date"] 		= "";
					//row["patientname"] 	= "";
					//row["mrn"] 			= "";
					//row["oxy"] 			= "";
					//row["opiate"] 		= "";
					//row["methadone"] 	= "";
					//row["cocaine"] 		= "";
					//row["bupreno"] 		= "";
					//row["benzo"] 		= "";
					//row["barbi"] 		= "";
					//row["amph"] 		= "";
					//data.splice(rowid+1, 0, row1);
					//var dataAdapter = new $.jqx.dataAdapter(source);
					//$("#jqxgrid").jqxGrid({ source: dataAdapter });
                    //commit(true);
                //}, 
				  updaterow: function (rowid, newdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
					var arrlength = mynewdataarray.length;
					//console.log("updated row " + rowid + "contents: " + JSON.stringify(newdata) + "length " + arrlength + " " + newdata.uid);
				
					var myindex;
					var datafound = false;
					console.log("Update " + rowid + JSON.stringify(newdata));
					
					if (rowid <= mynewdataarray.length)
						mynewdataarray[rowid] = newdata;
					else
						{
						  mynewdataarray.push(newdata);
						 } ;
					
					
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
					//data[newdata.uid] = newdata;
                    commit(true);
                }//,
			//datatype: "array"
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
                        
						$.ajax({
									url: 'index.php?entryPoint=addUTSAjax',
									//data: {my_json_data: "{ text: 'Provider', editable:false, filtertype: 'textbox', hidden: false, filtercondition: 'starts_with', datafield: 'provider', width: 140,  sortable: true, cellsrenderer:cellsrenderer }"},
									data: JSON.stringify(mynewdataarray),
									type: 'POST',
									async: false,
									dataType: 'json',
									cache:false,
									success:function(data, textStatus, jqXHR){
										console.log('AJAX SUCCESS');
									}, 
									complete : function(data, textStatus, jqXHR){
									    
										console.log('AJAX COMPLETE');
										console.log(JSON.stringify(data));
									}
							});
                        
                    });
					
					
				},
		//theme: 'office',
		width: 1510,
		height: 600,
		source: dataAdapter,
		//showfilterrow: true,
		//groupable: true,
		//sortable: true,
		//filterable: true,
		editable: true,
		selectionmode: 'singlecell',
		editmode: 'click',
		autoshowcolumnsmenubutton: false,
		
		
		columns: [
		    { text: 'Provider', editable:false, filtertype: 'textbox', hidden: false, filtercondition: 'starts_with', datafield: 'provider', width: 140,  sortable: true, cellsrenderer:cellsrenderer },
			{ text: 'Date', filtertype: 'date', datafield: 'date', columntype: 'datetimeinput', width: 90,  sortable: true,cellsformat: 'M/d/yy' , cellsrenderer:cellsrenderer },
			{ text: 'Patient Name', filtertype: 'textbox', filtercondition: 'starts_with', datafield: 'patientname', width: 150,  sortable: true,  cellbeginedit: function (row) {return false;}, cellsrenderer:cellsrenderer },
			{ text: 'MRN', filtertype: 'textbox', editable:true, filtercondition: 'starts_with', datafield: 'mrn',  width: 90, cellsrenderer:cellsrenderer, validation: function (cell, value) {console.log("checking...."+ JSON.stringify(cell));var arraylen = data.length;
	var j = 0;
		  for( j = 0, len = arraylen; j < arraylen; j++) {
			if( data[ j ].mrn === value ) {
			$("#jqxgrid").jqxGrid('setcellvalue', cell.row, 'patientname', data[j].patientname);
				 return true;
			}
		   }
		  return { result: false, message: "This patient not found" };}},
			{ text: 'Oxycodone',   datafield: 'oxy', columntype:'custom', width: 90,    sortable:true , cellsrenderer: radiocellsrenderer, validation: function(cell, value)
			 { if ($('#jqxgrid').jqxGrid('getcelltext', cell.row, 'mrn') == "" ) return {result:false, message:'Enter MRN'}; if ($('#jqxgrid').jqxGrid('getcelltext', cell.row, 'date') == "" ) return {result:false, message:'Enter Date'}; else return true;},
				createeditor: function (row, cellvalue, editor, cellText, width, height) {
                          // construct the editor.
                          //var inputElement = $("<input/>").prependTo(editor);
                                   var element = $('<input type="button" value="NA" onclick ="if (this.value == \'NA\') this.value = \'NEG\';  else if (this.value == \'NEG\') this.value = \'POS\'; else if (this.value == \'POS\') this.value = \'NA\';">');
                    editor.append(element);
                    //element.jqxCheckBox({ animationShowDelay: 0, animationHideDelay: 0, width: 16, height: 16});console.log("created");
                      }, initeditor: initGridEditor, geteditorvalue: gridEditorValue },
			{ text: 'Opiate', datafield: 'opiate',  editable:false,columntype:'custom', filtertype: 'textbox',  width: 90,     sortable:true, cellsrenderer:opcellsrenderer },
			{ text: 'Methadone', datafield: 'methadone',  filtertype: 'textbox',  width: 90,    sortable:true , cellsrenderer:cellsrenderer },
			{ text: 'Cocaine', datafield: 'cocaine',  filtertype: 'textbox',  width: 90,     sortable:true, cellsrenderer:cellsrenderer },
			{ text: 'Bupreno', datafield: 'bupreno', filtertype: 'textbox', width: 90,     sortable:true, cellsrenderer:cellsrenderer },
			{ text: 'Benzo', datafield: 'benzo', filtertype: 'textbox',   width: 90,     sortable:true, cellsrenderer:cellsrenderer },
			{ text: 'Barbiturates', datafield: 'barbi',  filtertype: 'textbox',width: 90,     sortable:true, cellsrenderer:cellsrenderer },
			{ text: 'Amphetamine', datafield: 'amph',  filtertype: 'textbox',width: 90,     sortable:true, cellsrenderer:cellsrenderer }//,
			//{ text: 'Edit', datafield: 'Edit', columntype: 'button', cellsrenderer: function () {
            //         return "Edit";
            //      },buttonclick: function (row) {
                     // open the popup window when the user clicks a button.
             //        editrow = row;
            //         var offset = $("#jqxgrid").offset();
            //        var dataRecord = $("#jqxgrid").jqxGrid('getselectedrowindex');
					 //console.log(dataRecord);
					 
					//var value = $('#jqxgrid').jqxGrid('addrow', dataRecord, {});
			//		 var row1 = {};
			//		row["provider"]		= "";
			//		row["date"] 		= "";
			//		row["patientname"] 	= "";
			//		row["mrn"] 			= "";
			//		row["oxy"] 			= "";
			//		row["opiate"] 		= "";
			//		row["methadone"] 	= "";
			//		row["cocaine"] 		= "";
			//		row["bupreno"] 		= "";
			//		row["benzo"] 		= "";
			//		row["barbi"] 		= "";
			//		row["amph"] 		= "";
			//		data.splice(dataRecord+1, 0, row1);
					//$("#jqxgrid").jqxGrid('begincelledit', dataRecord, 'oxy');
					//$("#jqxgrid").jqxGrid('selectcell', dataRecord, 'mrn');
			//		var state = $("#jqxgrid").jqxGrid('savestate');
			//		var dataAdapter = new $.jqx.dataAdapter(source);
			//		$("#jqxgrid").jqxGrid({ source: dataAdapter });
			//		$("#jqxgrid").jqxGrid('loadstate',state);
                    //commit(true);

 
             //    }
			//}
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
	
	
	// $("#jqxgrid").bind('cellendedit', function (event) {
    // var args = event.args;
    // var columnDataField = args.datafield;
    // var rowIndex = args.rowindex;
    // var cellValue = args.value;
    // var oldValue = args.oldvalue;
	// var arraylen = data.length;
	// var j = 0;
	 // if ( columnDataField == "mrn" ) {   
		// console.log("cell end edit checking....");
		  // for( j = 0, len = arraylen; j < arraylen; j++) {
			// if( data[ j ].mrn === cellValue ) {
				
				// console.log ("patient " + data[j].patientname);
				 // $("#jqxgrid").jqxGrid('setcellvalue', rowIndex, 'patientname', data[j].patientname);
				  // $('#jqxgrid').jqxGrid('selectcell', rowIndex, 'methadone');
				 // break;
				 
			// }
		   // }
		  // if ( j == arraylen ) {
		  // console.log ("patient not found");
				 // $("#jqxgrid").jqxGrid('setcellvalue', rowIndex, 'patientname', "Not found");
				 // return false;
				
			// }
	// }
//});
	
	
	$("#jqxgrid").jqxGrid('setcellvalue', 3, 'patientname', "test");
	
}); //window load function
{/literal}

</script>


</head>

<body >
    <h3>{$title}</h3>
	<!--div class="check-toolbar"><input type="checkbox" name="blah" id="blah1" value=1 onclick="if (this.checked) this.nextSibling.innerHTML='POS';else this.nextSibling.innerHTML='NEG';"><label  for="blah1">NEG</label></div-->
	<table  id ="outertable" width="60%" style="border: 1px solid black;">
	<tr><td> Ho HUm </td> <td width="70%" style="border: 1px solid black;" > ho</td></tr>
	tr><td> Ho HUm </td> <td width="70%" style="border: 1px solid black;" > {$snippet}</td></tr>
	</table>
	<!--input type="button" name="blahbtn" id="blahbtn1" value="NA" onclick ="if (this.value == 'NA') this.value = 'NEG';  else if (this.value == 'NEG') this.value = 'POS'; else if (this.value == 'POS') this.value = 'NA';"-->
	<!--div style="margin:auto !important; text-align:center">
	
	
	



        <div style="float: left;" id="jqxgrid">
        </div-->
       


	   
</body>
