Class extends DataClass


exposed Function getUserData()
	var $usersFile : 4D:C1709.File
	var $usersCol : Collection
	
	$usersFile:=File:C1566("/PACKAGE/Project/Sources/Shared/users.json")
	$usersCol:=JSON Parse:C1218($usersFile.getText())
	
	This:C1470.all().drop()
	This:C1470.fromCollection($usersCol)
	
	Web Form:C1735.setMessage("Data created successfully")
	
	
exposed Function search($search : Text) : cs:C1710.UserSelection
	If ($search#"")
		return This:C1470.query("firstName = :1 or lastName = :1"; "@"+$search+"@")
	Else 
		return This:C1470.all()
	End if 
	
exposed Function getUserString() : Text
	var $word : Text
	$word:=(This:C1470.all().length>1) ? "users" : "user"
	return $word
	