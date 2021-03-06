{literal}<style type="text/css">
table {width:65%;}table.view { border-collapse:collapse; }table.view td, table.view th { border:1px solid  rgb(171, 195, 215);padding:5px; } table.view tr:nth-of-type(odd) { background-color: #def;}</style>
{/literal}
<h3>{$title}</h3>
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
<th>Refill</th>
<th>Risk Level</th>
<th>Next Pill Count</th>
</tr>
{foreach name=provrowIteration from=$data item=provrowData}
{if $provrowData1.provname==$provrowData.provname}
<tr>
<td>{$provrowData.last_name},&nbsp{$provrowData.first_name}</td>
<td>{$provrowData.mrn}</td>
<td>{$provrowData.refill}</td>
<td>{if ($provrowData.risk == "")} "NA" {elseif ( $provrowData.risk  >= 0 AND  $provrowData.risk  < 4  )} "LOW"  {elseif ( $provrowData.risk  >= 4 AND  $provrowData.risk  < 7  )} "MODERATE"   {elseif ( $provrowData.risk  >= 7   )} "HIGH"  {elseif ( $provrowData.risk    < 0  )} "NA" {else} "NA" {/if}</td>
<td>{$provrowData.next_pill_count}</td>
</tr>
{/if}
{foreachelse}
<tr><td colspan="4" align="center">No records found with Next Pill Count</td></tr>
{/foreach}
{/foreach}
</table>