
# Volatility

## Install

## Uses

Each system will have different memory profile. To find the memory profile from the memdump image, run the command:

``` bash
vol.py -f path/to/image.mem imageinfo
# or 
vol.py -f path/to/image.mem kdbgscan
```

kdbgscan: As opposed to [imageinfo](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#imageinfo) which simply provides profile suggestions, kdbgscan is designed to positively identify the correct profile and the correct KDBG address

To run a plug in on the image, we must specify the profile with the command

``` bash
vol.py -f path/to/image.mem --profile=<profile_name>
```

Windows [Commands](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference)

Useful plugins

- pslist
- pstree
- psscan (can show more then just pslist)
- psxview (more info)

- netscan (show all network connections)
- iehistory (show all browser history)
- filescan (show all files in the scan)
