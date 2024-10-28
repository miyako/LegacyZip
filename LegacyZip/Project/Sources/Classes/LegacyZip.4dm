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
	
Function zip($ns : Text; $name : Text)
	
	
	
Function unzip($ns : Text; $name : Text)
	
	
	