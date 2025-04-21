# Process

1. **Identification** – The first stage identifies potential sources of relevant evidence or information (devices), as well as key custodians and location of data.
2. **Preservation** – The process of preserving relevant electronically stored information (ESI). This is done by protecting the crime or incident scene, capturing visual images of the scene, and documenting all relevant information about the evidence and how it was acquired.
3. **Collection** – Collecting digital information that may be relevant to the investigation. Collection may involve removing the electronic device(s) from the crime or incident scene and then imaging, copying or printing out its (their) content.
4. **Analysis** – An in-depth systematic search of evidence relating to the incident being investigated. The outputs of the examination are data objects found in the collected information. These outputs may include system and user-generated files. The analysis aims to draw conclusions based on the evidence found.
5. **Reporting** – Reports are based on proven techniques and methodology and other competent forensic examiners should be able to duplicate and reproduce the same results.
From [Blue Team Level One](https://elearning.securityblue.team/home/certifications/blue-team-level-1#content#digital-forensics#introduction-to-digital-forensics#digital-forensics-process)

## Analysis

Order of Volatility 
    Processes, Registers & Cache
    Memory
        Network Processes
    Disk (HDD and SSD)
    Remote Logging and Monitoring Data
    Physical Configuration, Network Topology, Archival Media

### 1 – **Registers & Cache**


### 2 – **Memory**


### 3 – **Disk (HDD and SSD)**

#### Files Systems
Metadata and File Carving

Windows - Properties
Linux Tool - `exiftool`
    `scalpel`

##### Trash

Go to `C:\$Recycle.Bin`
Each folder is named for the SSID of the user that deleted the file.
Use `wmic useraccount get name,SID` to get the names of the users on the system. 

Files that begin with `$R` followed by a random string contain the true file contents of the recycled file.

Files that begin with `$I` and end in the same string as the `$R` file counterpart contain the metadata for that specific file, such as the original filename, path, size, and timestamp of when the file was deleted.

User a tool like [RBCmd](https://github.com/EricZimmerman/RBCmd) to show the relevant data

`C:\path\to\RBCmd.exe -d C:\$Recycle.Bin\<sid>\ --csv "C:\path\to\desired\output\RBCmdOutput"`

#### Browser Data

- **Cookies**
- **Favorites**
- **Downloaded Files**
- **URLs Visited**
- **Searches**
- **Cached Webpage**
- **Cached Images**

Tools:
- **KAPE –** [Download](https://www.kroll.com/en/insights/publications/cyber/kroll-artifact-parser-extractor-kape)
- **Browser History Viewer –** [Download](https://www.foxtonforensics.com/browser-history-viewer/) (Choose the 100% free version)
- **Browser History Capturer –** [Download](https://www.foxtonforensics.com/browser-history-capturer/)

Kape: 
Select Target Source (C: or D: or whatever the forensic image is)
Destination: Wherever we're storing our notes
Targets:
- Edge - Browsers - Edge
- Firefox - Browsers - Firefox
- Chrome - Browsers - Chrome

`KAPE Browser Forensics\C\Users\<user>\AppData\Local\Google\Chrome\User Data`
`KAPE Browser Forensics\C\Users\<user>\AppData\Roaming\Mozilla\Firefox\Profiles`

### 4 – **Remote Logging and Monitoring Data**


### 5 – **Physical Configuration, Network Topology, Archival Media**
