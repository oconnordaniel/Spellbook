# Move win boot partion

In case Windows puts it's boot partition in the wrong drive...

- Boot the computer using the **Windows 7/8/8.1/10** installation media.  
- On the first screen, press **SHIFT+F10** to bring up the command prompt.  
- Run the following commands at the command prompt.  

``` cmd
diskpart  
list disk
select disk 
# Note: Select the disk where you want to add the EFI System partition.  
list partition
select partition 
# Note: Select the Windows OS partition (# number) or your data partition.  
shrink desired=100
create partition efi size=100  
format quick fs=fat32  
assign letter=s  
list partition  
list volume
# Note: Note the volume letter where the Windows OS is installed.  
exit  
  
**bcdboot X:\windows** **/s S:**  
# Note: Replace "X" with the volume letter of the Windows OS partition.  
```
  
BCDBoot copies the boot files from the Windows partition to the EFI System partition and creates the BCD store in the same partition.  
  
Remove the Windows installation media and restart the computer into your BIOS settings and set the SSD as the First Boot Device.
