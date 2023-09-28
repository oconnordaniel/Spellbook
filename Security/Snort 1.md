``` bash
sudo snort -r snort.log.1234 -X > file && sed -E 's/^0x[0-9A-F]{4}: ([A-F0-9]{2} )* / /g' file
```