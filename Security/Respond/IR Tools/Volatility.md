
# Volatility

## Install

## Uses

``` bash
# To get image info
vol.py \
	-f path/to/image.mem
	imageinfo



vol.py \
	-f path/to/image.mem
	--profile=
```

Windows [Commands](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference)

Useful plugins

- kdbgscan: As opposed to [imageinfo](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#imageinfo) which simply provides profile suggestions, kdbgscan is designed to positively identify the correct profile and the correct KDBG address
