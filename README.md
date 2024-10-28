# golang-zip

## objective

* support legacy Windows XP `ZipCrypto` archives in `ShiftJIS`

### encryption

* use https://github.com/hillu/go-archive-zip-crypto for `ZipCrypto`
* use https://github.com/noridas80/zi18np for `ShiftJIS`

### note 

grand `Full Disk Accress` to Visual Studio Code

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

default values

|flag|value|
|:-:|:-:|
|cp932|false|
|unzip|false|
|src||
|dst||
|password||
|encryption (requires password)|zipcrypto|
|method|deflate|
