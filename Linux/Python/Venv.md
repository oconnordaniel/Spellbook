# Setup python enviorment

``` bash
sudo {{ package manager }} install python3 python3-pip python3-venv
python3 -m venv project_name
source project_name/bin/activate
python3 -m ensurepip --default-pip # not sure what this is. Usually not nessicary, but sometimes helps.
python3 -m pip requierments.txt
```
