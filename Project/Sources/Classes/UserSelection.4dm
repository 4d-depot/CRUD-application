Class extends EntitySelection

exposed function createuser($user : cs.UserEntity)->$users : cs.UserSelection
	var $info: object
	$users := this.copy()
	case of
		:(($user.firstName = "") || ($user.lastName = "") || ($user.email = ""))
		web Form.setWarning("Required Field : FirstName, LastName & Email")
	else
		$info := $user.save()
		if ($info.success)
			web Form.setMessage("Save Successful")
			if(not($users.contains($user)))
				$users.add($user)
			end if
		end if 
	end case 
	