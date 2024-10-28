Class extends _CLI_Controller

Class constructor($CLI : cs:C1710._CLI)
	
	Super:C1705($CLI)
	
Function execute($command : Variant)
	
	This:C1470._stdErrBuffer:=""
	This:C1470._stdOutBuffer:=""
	This:C1470.instance.data:=[]
	This:C1470.instance.error:=[]
	
	Super:C1706.execute($command)
	
Function onData($worker : 4D:C1709.SystemWorker; $params : Object)
	
	var $that : cs:C1710.LegacyZip
	$that:=This:C1470.instance
	
	If ($worker.dataType="text")
		
		This:C1470._stdOutBuffer+=$params.data
		
		$data:=$params.data
		This:C1470.instance.data.combine(Split string:C1554($data; $that.EOL; sk ignore empty strings:K86:1 | sk trim spaces:K86:2))
		
	End if 
	
Function onDataError($worker : 4D:C1709.SystemWorker; $params : Object)
	
	var $that : cs:C1710.LegacyZip
	$that:=This:C1470.instance
	
	If ($worker.dataType="text")
		
		This:C1470._stdErrBuffer+=$params.data
		
		$data:=$params.data
		This:C1470.instance.error.combine(Split string:C1554($data; $that.EOL; sk ignore empty strings:K86:1 | sk trim spaces:K86:2))
		
	End if 
	
Function onResponse($worker : 4D:C1709.SystemWorker; $params : Object)
	
	var $that : cs:C1710.LegacyZip
	$that:=This:C1470.instance
	
	If ($worker.dataType="text")
		
		$data:=$worker.response
		This:C1470.instance.data:=Split string:C1554($data; $that.EOL; sk ignore empty strings:K86:1 | sk trim spaces:K86:2)
		$data:=$worker.responseError
		This:C1470.instance.error:=Split string:C1554($data; $that.EOL; sk ignore empty strings:K86:1 | sk trim spaces:K86:2)
		
	End if 
	
Function onError($worker : 4D:C1709.SystemWorker; $params : Object)
	
Function onTerminate($worker : 4D:C1709.SystemWorker; $params : Object)
	