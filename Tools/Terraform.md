
## Notes on modules

```
proxmox-terraform/
├── main.tf                  # Main configuration file
├── variables.tf             # Variable definitions
├── terraform.tfvars         # Your variable values (customize this)
├── outputs.tf               # Output definitions
├── README.md                # Documentation
└── modules/
    ├── lxc/                 # LXC container module
    │   ├── main.tf
    │   └── variables.tf
    └── vm/                  # VM module
        ├── main.tf
        └── variables.tf
```
