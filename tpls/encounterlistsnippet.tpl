<div id="enclist">

<table  width="100%" class="list view">  
<tbody>
    <tr height = "20">
		<th width="50%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Date </div> </th>
		<th width="50%" scope="col">    <div align="left" width="100%" style="white-space: normal;">  Title </div> </th>
	
    </tr>
	
	
	
	{foreach name=myrowIteration from=$enclist key=id item=myrowData}
	 
	     <tr class="oddListRowS1" height="20">
		    <td width="50%"  class="" valign="top" align="left" scope="row"> {$myrowData.date_entered} </td>
            <td width="50%"  class="" valign="top" align="left"> {$myrowData.summary}  </td>

         </tr>

	{/foreach}

  </tbody>

</table>




</div>