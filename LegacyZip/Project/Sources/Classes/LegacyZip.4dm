Class extends _CLI

Class constructor()
	
	Super:C1705("zip"; cs:C1710._LegacyZip_Controller)
	
Function _terminate()
	
	This:C1470.controller.terminate()
	
Function _trim($in : Text) : Text
	
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	If (Match regex:C1019("^(\\S+)$"; $in; 1; $pos; $len))
		return Substring:C12($in; $pos{1}; $len{1})
	End if 
	
	return $in
	
Function zip($src : Object; $dst : 4D:C1709.File; $options : Object) : 4D:C1709.SystemWorker
	
	$command:=This:C1470.escape(This:C1470.executablePath)
	
	If (OB Instance of:C1731($src; 4D:C1709.File)) || (OB Instance of:C1731($src; 4D:C1709.Folder))
		If (OB Instance of:C1731($dst; 4D:C1709.File))
			
			$command+=" -src "+This:C1470.quote(This:C1470.expand($src).path)
			$command+=" -dst "+This:C1470.quote(This:C1470.expand($dst).path)
			
			If ($options#Null:C1517)
				If (Bool:C1537($options.cp932))
					$command+=" -cp932"
				End if 
				If ($options.method#Null:C1517) && (Value type:C1509($options.method)=Is text:K8:3) && ($options.method#"")
					$command+=" -method "+String:C10($options.method)
				End if 
				If ($options.password#Null:C1517) && (Value type:C1509($options.password)=Is text:K8:3) && ($options.password#"")
					$command+=" -password "+This:C1470.quote($options.password)
				End if 
				If ($options.encryption#Null:C1517) && (Value type:C1509($options.encryption)=Is text:K8:3) && ($options.encryption#"")
					$command+=" -encryption "+This:C1470.quote($options.encryption)
				End if 
			End if 
			
			This:C1470.controller.execute($command)
			
			return This:C1470.controller.worker
			
		End if 
	End if 
	
Function unzip($src : 4D:C1709.File; $dst : 4D:C1709.Folder; $options : Object) : 4D:C1709.SystemWorker
	
	$command:=This:C1470.escape(This:C1470.executablePath)
	
	If (OB Instance of:C1731($src; 4D:C1709.File))
		If (OB Instance of:C1731($dst; 4D:C1709.Folder))
			
			$command+=" -unzip "
			$command+=" -src "+This:C1470.quote(This:C1470.expand($src).path)
			$command+=" -dst "+This:C1470.quote(This:C1470.expand($dst).path)
			
			If ($options#Null:C1517)
				If (Bool:C1537($options.cp932))
					$command+=" -cp932"
				End if 
				If ($options.password#Null:C1517) && (Value type:C1509($options.password)=Is text:K8:3) && ($options.password#"")
					$command+=" -password "+This:C1470.quote($options.password)
				End if 
			End if 
			
			This:C1470.controller.execute($command)
			
			return This:C1470.controller.worker
			
		End if 
	End if 
	