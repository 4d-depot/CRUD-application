Class extends DataStoreImplementation

exposed Function authentify($userName : Text; $password : Text)
	If ($userName="Admin" && $password="1234")
		Session:C1714.setPrivileges("connected")
	Else 
		throw:C1805({message: "Authentication failed"})
	End if 