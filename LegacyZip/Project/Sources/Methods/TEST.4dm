//%attributes = {}
var $LegacyZip : cs:C1710.LegacyZip

$LegacyZip:=cs:C1710.LegacyZip.new()

$src:=Folder:C1567(fk desktop folder:K87:19).folder("test")
If ($src.exists)
	$src.delete(Delete with contents:K24:24)
End if 
$src.create()
$src.file("あいうえお.txt").setText("あいうえお")
$src.folder("かきくけこ").create()

$dst:=Folder:C1567(fk desktop folder:K87:19).file("test.zip")
If ($dst.exists)
	$dst.delete()
End if 

$options:={cp932: True:C214; method: "deflate"; password: "dddd"; encryption: "zipcrypto"}
$worker:=$LegacyZip.zip($src; $dst; $options)
$worker.wait()
ALERT:C41($LegacyZip.data.join("\r"))

$src:=$dst
$dst:=Folder:C1567(fk desktop folder:K87:19).folder("zipcrypto")
$dst.create(Delete with contents:K24:24)

$worker:=$LegacyZip.unzip($src; $dst; $options)
$worker.wait()
ALERT:C41($LegacyZip.data.join("\r"))