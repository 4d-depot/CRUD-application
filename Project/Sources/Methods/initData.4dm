//%attributes = {}
ds:C1482.User.all().drop()
ds:C1482.Address.all().drop()

var $user : cs:C1710.UserEntity
var $address : cs:C1710.AddressEntity
var $userC; $mydates : Collection
var $item; $info : Object
var $request; $requestAvatar : 4D:C1709.HTTPRequest
var $image : Picture

$request:=4D:C1709.HTTPRequest.new("https://myfakeapi.com/api/users/").wait()
If ($request.response#Null:C1517)
	$userC:=$request.response.body.Users
	For each ($item; $userC)
		$address:=ds:C1482.Address.new()
		$address.street:=$item.address[0].street
		$address.streetName:=$item.address[0].street_name
		$address.city:=$item.address[0].city
		$address.state:=$item.address[0].state
		$address.country:=$item.address[0].country
		$address.zipCode:=Num:C11($item.address[0].postal_code)
		
		$info:=$address.save()
		
		$user:=ds:C1482.User.new()
		$user.firstName:=$item.first_name
		$user.lastName:=$item.last_name
		$user.email:=$item.email
		$user.phone:=$item.phone
		
		$mydates:=Split string:C1554($item.birthdate; "/"; sk ignore empty strings:K86:1)
		$user.birthDate:=Add to date:C393(!00-00-00!; Num:C11($mydates[2]); Num:C11($mydates[1]); Num:C11($mydates[0]))
		
		$requestAvatar:=4D:C1709.HTTPRequest.new($item.avatar).wait()
		If ($requestAvatar.response#Null:C1517)
			BLOB TO PICTURE:C682($requestAvatar.response.body; $image)
			$user.avatar:=$image
		End if 
		
		$user.address:=$address
		
		$info:=$user.save()
	End for each 
End if 
