{literal}<style type="text/css">table {width:65%;}table.view { border-collapse:collapse; }table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } table.view tr:nth-of-type(odd) { background-color: #def;}</style>{/literal}<h3>{$title}</h3>
<table class="list view" width="100%">

<tr>
<th>Medid</th>
<th>Name</th>
<th>Description</th>
<th>Date Of Birth</th>
</tr>
{foreach name=pmIteration from=$pm  item=med }
<tr><td>{$med.medid}</td>
<td>{$med.name}</td>
<td>{$med.desc}</td>

</tr>

{/foreach}

</table>