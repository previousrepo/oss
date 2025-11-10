# Linux Kernel Modification and Compilation

## Prerequisites
```bash
sudo apt-get update
sudo apt-get install build-essential libncurses-dev bison flex \
  libssl-dev libelf-dev bc dwarves
```

## Download Kernel Source

### Option 1: From Distribution
```bash
apt-cache search linux-source
sudo apt-get install linux-source-5.15.0
cd /usr/src
sudo tar -xjf linux-source-5.15.0.tar.bz2
cd linux-source-5.15.0
```

### Option 2: From kernel.org
```bash
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.tar.xz
tar -xf linux-5.15.tar.xz
cd linux-5.15
```

## Modify Kernel

### Add Print Statement
Edit `init/main.c`:
```bash
nano init/main.c
```

Find the `start_kernel()` function and add:
```c
asmlinkage __visible void __init start_kernel(void)
{
    char *command_line;
    char *after_dashes;

    // ADD THIS LINE
    printk(KERN_INFO "*** CUSTOM KERNEL: Modified by [Your Name] ***\n");
    
    set_task_stack_end_magic(&init_task);
    // ... rest of function
}
```

Or add to `kernel/printk/printk.c`:
```c
void __init printk_custom_message(void)
{
    printk(KERN_INFO "=================================\n");
    printk(KERN_INFO "CUSTOM KERNEL BUILD\n");
    printk(KERN_INFO "Modified by: [Your Name]\n");
    printk(KERN_INFO "Date: [Date]\n");
    printk(KERN_INFO "=================================\n");
}
```

## Configure Kernel

### Use Current Config
```bash
cp /boot/config-$(uname -r) .config
make olddefconfig
```

### Or Configure Manually
```bash
make menuconfig
```

## Compile Kernel

### Build
```bash
make -j$(nproc)
```

This will take 30 minutes to several hours depending on your system.

### Build Modules
```bash
make modules
```

## Install Kernel

### Install Modules
```bash
sudo make modules_install
```

### Install Kernel
```bash
sudo make install
```

### Update GRUB
```bash
sudo update-grub
```

## Reboot and Test

### Reboot
```bash
sudo reboot
```

### Select Custom Kernel
At GRUB menu, select your custom kernel.

### Verify
```bash
uname -r
dmesg | grep "CUSTOM KERNEL"
dmesg | head -50
```

## Cleanup (Optional)
```bash
cd /usr/src/linux-source-5.15.0
make clean
make mrproper
```

## Troubleshooting

### If System Won't Boot
1. Reboot and select old kernel from GRUB
2. Remove custom kernel:
```bash
sudo rm /boot/vmlinuz-5.15.0-custom
sudo rm /boot/initrd.img-5.15.0-custom
sudo update-grub
```

### Check Logs
```bash
dmesg | less
journalctl -b
```

## Safety Tips

1. **Backup**: Always backup important data
2. **Keep Old Kernel**: Don't remove working kernel
3. **Test in VM**: Test in virtual machine first
4. **Disk Space**: Ensure 20GB+ free space
5. **Time**: Compilation takes time, be patient

## Example Print Locations

**Early Boot Message:**
```c
// In init/main.c, start_kernel()
printk(KERN_INFO "*** Custom Kernel Boot ***\n");
```

**Module Load:**
```c
// In kernel/module.c
printk(KERN_INFO "*** Custom Module System ***\n");
```

**Scheduler:**
```c
// In kernel/sched/core.c
printk(KERN_INFO "*** Custom Scheduler Active ***\n");
```
