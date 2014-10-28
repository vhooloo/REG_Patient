{literal}<style type="text/css">table {width:65%;}table.view { border-collapse:collapse; }table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } table.view tr:nth-of-type(odd) { background-color: #def;}</style>{/literal}<h3>{$title}</h3>
<table class="list view" >
{foreach name=provrowIteration from=$data1  item=provrowData1}
{if $provrowData1.provname!=''}
<tr><th colspan="4" style="background-color: #ffffff !important;"><h4><strong>Provider :</strong>&nbsp;&nbsp;{$provrowData1.provname}<h4></th></tr>
{else}
<tr><th colspan="4" style="background-color: #ffffff !important;"><h4><strong>Provider :</strong>&nbsp;&nbsp;No Provider<h4></th></tr>
{/if}
<tr>
<th>Name</th>
<th>MRN</th>
<th>In-Active Date</th>
</tr>
{foreach name=provrowIteration from=$data  item=provrowData }
{if $provrowData1.provname==$provrowData.provname }
<tr>
<td>{$provrowData.lname},&nbsp{$provrowData.fname}</td>
<td>{$provrowData.mrn}</td>
<td>{$provrowData.date_inactive}</td>
</tr>
{/if}
{/foreach}
{foreachelse}
<tr>
<td colspan="4" align="center">No records found with In-Active Date</td>
</tr>
{/foreach}
</table>