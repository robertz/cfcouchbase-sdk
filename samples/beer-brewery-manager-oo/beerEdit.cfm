<cfoutput>
	<h1>Edit Beer Details</h1>
			
	<cfparam name="url.beerID" default="not_supplied"> 
	
	<cfset beer = application.BreweryService.getBeer( url.beerID )>
	
	<cfif isnull(beer)>
		
		Invalid beerID "#HTMLEditFormat( url.beerID )#"
	
	<cfelse>
			
		<a href="brewery.cfm?breweryID=#HTMLEditFormat( beer.getBrewery_id() )#">Back to brewey Details</a><br><br>
		<a href="beer.cfm?beerID=#HTMLEditFormat( beer.getBeerID() )#">Back to beer Details</a><br><br>
		
		<form action="beerUpdate.cfm" method="post">
			<input type="hidden" value="#HTMLEditFormat( beer.getBeerID() )#" name="beerID" id="beerID">
		
			<table>
				<tr>
					<td>Name:</td>
					<td><input type="text" value="#HTMLEditFormat( beer.getName() )#" name="name" id="name" size=50></td>
				</tr>
				<tr>
					<td>Category:</td>
					<td>
						<input type="text" value="#HTMLEditFormat( beer.getCategory() )#" name="category" id="category" size=50>
					</td>
				</tr>
				<tr>
					<td>Style:</td>
					<td>
						<input type="text" value="#HTMLEditFormat( beer.getStyle() )#" name="style" id="style" size=50>
					</td>
				</tr>
				<tr>
					<td>Description:</td>
					<td>
						<textarea name="description" id="description" rows="7" cols="75">#HTMLEditFormat( beer.getDescription() )#</textarea>
					</td>
				</tr>
				<tr>
					<td>IBU:</td>
					<td><input type="text" value="#HTMLEditFormat( beer.getIBU() )#" name="ibu" id="ibu" size=50></td>
				</tr>
				<tr>
					<td>SRM:</td>
					<td><input type="text" value="#HTMLEditFormat( beer.getSRM() )#" name="srm" id="srm" size=50></td>
				</tr>
				<tr>
					<td>UPC</td>
					<td><input type="text" value="#HTMLEditFormat( beer.getUPC() )#" name="upc" id="upc" size=50></td>
				</tr>
				<tr>
					<td>Last Updated:</td>
					<td>#dateFormat( beer.getUpdated(), "full" )#</td>
				</tr>
			</table>
			
			<button type="submit">Save beer</button>
		
		</form>
		
	</cfif>
	
</cfoutput>