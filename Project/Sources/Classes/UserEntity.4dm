Class extends Entity


exposed Function get fullAddress() : Text
	var $address : Text
	If (This:C1470.address#Null:C1517)
		$address:=(This:C1470.address.street#Null:C1517) ? This:C1470.address.street : ""
		$address:=(This:C1470.address.streetName#Null:C1517) ? $address+", "+This:C1470.address.streetName : $address
		$address:=(This:C1470.address.city#Null:C1517) ? $address+", "+This:C1470.address.city : $address
		$address:=(This:C1470.address.state#Null:C1517) ? $address+", "+This:C1470.address.state : $address
		$address:=(This:C1470.address.zipCode#Null:C1517) ? $address+" "+String:C10(This:C1470.address.zipCode) : $address
		$address:=(This:C1470.address.country#Null:C1517) ? $address+", "+This:C1470.address.country : $address
	End if 
	return $address