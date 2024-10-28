![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/LegacyZip)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/LegacyZip/total)

# LegacyZip

## dependencies.json

 ```json
{
	"dependencies": {
		"LegacyZip": {
			"github": "miyako/LegacyZip",
			"version": "^1.0.0"
		}
	}
}
```

```4d
var $LegacyZip : cs.LegacyZip

$LegacyZip:=cs.LegacyZip.new()

$src:=Folder(fk desktop folder).folder("test")
If ($src.exists)
	$src.delete(Delete with contents)
End if 
$src.create()
$src.file("あいうえお.txt").setText("あいうえお")
$src.folder("かきくけこ").create()

$dst:=Folder(fk desktop folder).file("test.zip")
If ($dst.exists)
	$dst.delete()
End if 

$options:={cp932: True; method: "deflate"; password: "dddd"; encryption: "zipcrypto"}
$worker:=$LegacyZip.zip($src; $dst; $options)
$worker.wait()
ALERT($LegacyZip.data.join("\r"))

$src:=$dst
$dst:=Folder(fk desktop folder).folder("zipcrypto")
$dst.create(Delete with contents)

$worker:=$LegacyZip.unzip($src; $dst; $options)
$worker.wait()
ALERT($LegacyZip.data.join("\r"))
```

## objective

* support legacy Windows XP `ZipCrypto` archives in `ShiftJIS`

### encryption

* use https://github.com/hillu/go-archive-zip-crypto for `ZipCrypto`
* use https://github.com/noridas80/zi18np for `ShiftJIS`

## Go Build

```
GOOS=darwin GOARCH=arm64 go build -o zip-arm main.go
GOOS=darwin GOARCH=amd64 go build -o zip-amd main.go
lipo -create zip-arm zip-amd -output uuid
GOOS=windows GOARCH=amd64 go build -o zip.exe main.go
```

## CLI

```
zip -src "path.zip" \
    -dst "path" \
    -cp932 \
    -password "password"\
    -unzip \
    -encryption zipcrypto \
    -method deflate
```

|flag|default|other|
|:-|:-:|:-:|
|cp932|false|true|
|unzip|false|true|
|src|||
|dst|||
|password|||
|encryption (requires password)|zipcrypto|aes128 aes192 aes256|
|method|deflate|store|
