{literal}<style type="text/css">table.view { border-collapse:collapse; }table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } table.view tr:nth-of-type(odd) { background-color: #def;}</style>{/literal}<h3>{$title}</h3>

<form name="mylist" method="POST" action="index.php?module=REG_Patient&action=SaveMedList" onsubmit="">
<table class="list view" id ="medtable" >
{assign var='c' value=0}
<tr>
<th>Medid</th>
<th>Name</th>
<th>Description</th>
</tr>
{foreach name=medIteration from=$med  item=mymed }
{assign var='c' value=$c+1}
<tr>
<td><input name="medid_{$c}" value = "{$mymed.medid}" ></td>
<td><input name="medname_{$c}" value = "{$mymed.name}"  ></td>
<td><input name="meddesc_{$c}"  value = "{$mymed.desc}" > <button type="button" onclick="deleteRow(this);">DELETE</button></td>

</tr>

{/foreach}

</table>

<input id="numrows" name="numrows" type="hidden" value="{$c}">
<input name="patid" type="hidden" value="{$patid}">
<button  type="submit" >SAVE</button>
<button  type="button" onclick="insertRow()">Insert</button>
</form>

<script>
var jnumrows = {$c};
{literal}
function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("medtable").deleteRow(i);
}
function insertRow() {
    jnumrows++;
    var table = document.getElementById("medtable");
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	//var cell4 = row.insertCell(4);
    cell1.innerHTML = '<input name="medid_'+jnumrows+'" value = "99" >';
    cell2.innerHTML = '<input name="medname_'+jnumrows+'"  >';
	cell3.innerHTML = '<input name="meddesc_'+jnumrows+'"  > <button type="button" onclick="deleteRow(this);">DELETE</button>';
	document.getElementById("numrows").value = jnumrows;
	//cell2.innerHTML = "NEW CELL4";
}
{/literal}</script>