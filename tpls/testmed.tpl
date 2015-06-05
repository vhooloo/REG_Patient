{literal}<style type="text/css">table.medview { border-collapse:collapse; }table.medview td, table.medview th { border:1px solid  rgb(171, 195, 215);padding:5px; } table.medview tr:nth-of-type(odd) { background-color: #def;}</style>{/literal}<h3>{$title}</h3>

<form name="mylist" method="POST" action="index.php?module=REG_Patient&action=SaveMedList" onsubmit="">
<table class="list medview" id ="medtable" >
{assign var='c' value=0}
<tr>
<th>Medid</th>
<th style="width:6%;">Name</th>
<th style="width:6%;">Dose</th>
<th>Freq</th>
<th>Qty</th>
<th>Description</th>
</tr>
{foreach name=medIteration from=$med  item=mymed }
{assign var='c' value=$c+1}
<tr>
<td><input name="medid_{$c}" size="2" value = "{$mymed.medid}" ></td>
<td><input name="medname_{$c}" size="20" value = "{$mymed.name}"  ></td>
<td><input name="meddose_{$c}" size="8" value = "{$mymed.dose}"  ></td>
<td><input name="medfreq_{$c}" size="8" value = "{$mymed.freq}"  ></td>
<td><input name="medqty_{$c}" size="3" value = "{$mymed.qty}"  ></td>
<td><input name="meddesc_{$c}"  size="40" value = "{$mymed.desc}" > <button type="button" onclick="deleteRow(this);">DELETE</button></td>

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
	var cell4 = row.insertCell(3);
	var cell5 = row.insertCell(4);
	var cell6 = row.insertCell(5);
    cell1.innerHTML = '<input name="medid_'+jnumrows+'" value = "99" >';
    cell2.innerHTML = '<input name="medname_'+jnumrows+'"  >';
	cell3.innerHTML = '<input name="meddose_'+jnumrows+'"  >';
	cell4.innerHTML = '<input name="medfreq_'+jnumrows+'"  >';
	cell5.innerHTML = '<input name="medqty_'+jnumrows+'"  >';
	cell6.innerHTML = '<input name="meddesc_'+jnumrows+'"  > <button type="button" onclick="deleteRow(this);">DELETE</button>';
	document.getElementById("numrows").value = jnumrows;
	//cell2.innerHTML = "NEW CELL4";
}
{/literal}</script>