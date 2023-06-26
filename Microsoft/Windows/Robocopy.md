``` cmd
robocopy "C:\Source\Folder\no\slash" "C:\Dest\Folder\no\slash" /s /z /r:3 /copy:DAT /dcopy:DA /log+:"C:\Users\$USER\Desktop\log.txt"
```

/s - Copies subdirectories. This option automatically excludes empty directories.

/z - Copies files in restartable mode. In restartable mode, should a file copy be interrupted, Robocopy can pick up where it left off rather than recopying the entire file.

/r:`<n>` - Specifies the number of retries on failed copies. The default value of _n_ is 1,000,000 (one million retries).

/log+:`<logfile>` - Writes the status output to the log file (appends the output to the existing log file).

/copy:`<copyflags>` - Specifies which file properties to copy. The valid values for this option are:

-   **D** - Data
-   **A** - Attributes
-   **T** - Time stamps
-   **X** - Skip alt data streams
-   **S** - NTFS access control list (ACL)
-   **O** - Owner information
-   **U** - Auditing information

The default value for the **/COPY** option is **DAT** (data, attributes, and time stamps). The **X** flag will be ignored if either **/B** or **/ZB** is used.

/dcopy:`<copyflags>` - Specifies what to copy in directories. The valid values for this option are:

-   **D** - Data
-   **A** - Attributes
-   **T** - Time stamps
-   **E** - Extended attribute
-   **X** - Skip alt data streams

The default value for this option is **DA** (data and attributes).