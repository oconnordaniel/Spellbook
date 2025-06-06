# IR Tools

## Eric Zimmerman's tools

Eric Zimmerman is a security researcher who has written a few tools to help perform forensic analysis on the Windows platform. These tools help the registry, file system, timeline, and many other analyses. To learn more about these tools, you can check out the [Windows Forensics 1](https://tryhackme.com/room/windowsforensics1) and [Windows Forensics 2](https://tryhackme.com/room/windowsforensics2) rooms, where these tools are discussed concerning the different artifacts found in the Windows Operating System.

## KAPE

Kroll Artifact Parser and Extractor (KAPE) is another beneficial tool by Eric Zimmerman. This tool automates the collection and parsing of forensic artifacts and can help create a timeline of events. You can check out the [KAPE room](https://tryhackme.com/room/kape) to learn more about KAPE.

## Autopsy

Autopsy is an open-source forensics platform that helps analyze data from digital media like mobile devices, hard drives, and removable drives. Various plugins for autopsy speed up the forensic process and extract and present valuable information from the raw data sources. TryHackMe's [Autopsy room](https://tryhackme.com/room/btautopsye0) can help if you want to learn more about it.

## Volatility

Volatility is a tool that helps perform memory analysis for memory captures from both Windows and Linux Operating Systems. It is a powerful tool that can help extract valuable information from the memory of a machine under investigation. You can learn more about Volatility in the [Volatility room](https://tryhackme.com/room/volatility).
  
## Redline

Redline is an incident response tool developed and freely distributed by FireEye. This tool can gather forensic data from a system and help with collected forensic information. You can learn more about Redline in the [Redline room](https://tryhackme.com/room/btredlinejoxr3d).

## Velociraptor

Velociraptor is an advanced endpoint-monitoring, forensics, and response platform. It is open-source but very powerful. TryHackMe has created a [Velociraptor room](https://tryhackme.com/room/velociraptorhp) for you to learn more about it.

## DeepBlue CLI

Takes in exported .evtx log files, or can be run on a live system to analyze the local log files.

`./DeepBlue.ps1 ./Log1.evtx` to analyze a log file. 
`./DeepBlue.ps1 -log <group>` to analyze logs on a live system, passing in groups like `system` or `security`.

## Some VBA tools

- oleid
- decalage.info/oletools
- mraptor
- decalage.info/python/oletools
- olevba
- decalage.info/python/oletools

<github.com/decalage2/oletools/>
