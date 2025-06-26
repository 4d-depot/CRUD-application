Class extends Entity


exposed Function get fullAddress() : text
	var $address: text
	If (This.address#Null)
		$address:=(This.address.street#Null) ? This.address.street : ""
		$address:=(This.address.streetName#Null) ? $address+", "+This.address.streetName : $address
		$address:=(This.address.city#Null) ? $address+", "+This.address.city : $address
		$address:=(This.address.state#Null) ? $address+", "+This.address.state : $address
		$address:=(This.address.zipCode#Null) ? $address+" "+String(This.address.zipCode) : $address
		$address:=(This.address.country#Null) ? $address+", "+This.address.country : $address
	end if 
	return $address
