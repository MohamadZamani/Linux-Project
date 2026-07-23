# 💾 Enterprise LVM Storage Management & RBAC

## 📖 Scenario Overview
The database team requires additional storage capacity on their central server. This project demonstrates the provisioning of raw block storage into a highly flexible Logical Volume Management (LVM) stack, formatted with an XFS filesystem, mounted persistently via UUID, and secured using strict Role-Based Access Control (RBAC) group permissions.

## 🛠️ Implementation Procedure

### Step 1: User/Group Provisioning & LVM Installation
Ensure the necessary LVM management tools are installed and create the restricted group for database users.
```bash
# Install LVM2 packages
sudo dnf install -y lvm2

# Create the Database Users group and assign users
sudo groupadd dba_users
sudo usermod -aG dba_users bob
```

### Step 2: Physical Volumes (PV) & Volume Group (VG) Initialization
Identify raw block storage devices and pool them together.
```bash
# Verify raw disks
lsblk

# Initialize physical volumes on /dev/vdd and /dev/vde
sudo pvcreate /dev/vdd /dev/vde

# Create the Volume Group pooling both disks
sudo vgcreate dba_storage /dev/vdd /dev/vde
```

### Step 3: Logical Volume (LV) Provisioning
Allocate 100% of the available pooled storage to a new logical volume.
```bash
# Create Logical Volume utilizing all free VG space
sudo lvcreate -l 100%FREE -n volume_1 dba_storage

# Verify creation
sudo lvdisplay
```

### Step 4: Filesystem Creation & Persistent Mounting
Format the volume with XFS, a high-performance journaling file system, and mount it persistently using its UUID to ensure stability across reboots.
```bash
# Format as XFS
sudo mkfs.xfs /dev/dba_storage/volume_1

# Create the mount point
sudo mkdir -p /mnt/dba_storage

# Retrieve the UUID for fstab stability
sudo blkid /dev/dba_storage/volume_1

# Edit /etc/fstab to include the following line:
# UUID=<your-uuid-here> /mnt/dba_storage xfs defaults 0 0
sudo vi /etc/fstab

# Test the persistent mount
sudo mount -a
```

### Step 5: Directory Permissions & Access Control (RBAC)
Secure the mount point so only the root user and members of dba_users have read, write, and execute permissions.
```bash
# Change group ownership of the directory
sudo chown :dba_users /mnt/dba_storage/

# Enforce strict 770 permissions (Owner: rwx, Group: rwx, Others: ---)
sudo chmod 770 /mnt/dba_storage/

# Verify permissions
ls -ld /mnt/dba_storage/
```
