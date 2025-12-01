Class extends DataStoreImplementation

exposed Function authentify($userName : Text; $password : Text)
	var $guestPrivileges : Collection:=["guest"; "guestPromoted"]
	If (($userName="") && ($password=""))
		return Session:C1714.setPrivileges($guestPrivileges)
	End if 
	var $user : cs:C1710.UserEntity:=ds:C1482.User.query("email = :1 "; $userName).first()
	If (($user#Null:C1517) && (Verify password hash:C1534($password; $user.password)))
		Session:C1714.setPrivileges("connected")
	Else 
		throw:C1805({message: "Authentication failed"})
	End if 
	
exposed Function getManifestObject() : Object
	var $manifestFile : 4D:C1709.File
	var $manifestObject : Object
	$manifestFile:=File:C1566("/PACKAGE/Project/Sources/Shared/manifest.json")
	$manifestObject:=JSON Parse:C1218($manifestFile.getText())
	return $manifestObject
	
exposed Function generateData()
	initData()
	