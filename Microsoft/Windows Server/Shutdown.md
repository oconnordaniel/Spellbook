``` cmd
shutdown /t 0 /r /f /c "Comment here... " /d p:4:1 
```

/d `[p \\| u:]<xx>:<yy>`
    Lists the reason for the system restart or shutdown. The supported parameter values are:
    - **P** - Indicates that the restart or shutdown is planned.
    - **U** - Indicates that the reason is user-defined.
        **NOTE**: If **p** or **u** aren't specified, the restart or shutdown is unplanned.
    - _xx_ Specifies the major reason number (a positive integer, less than 256).
    - _yy_ Specifies the minor reason number (a positive integer, less than 65536).

E P     1       1       Hardware: Maintenance (Planned)
E P     2       4       Operating System: Reconfiguration (Planned)
E P     4       1       Application: Maintenance (Planned)
