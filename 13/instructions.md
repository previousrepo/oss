# Debian Package Creation for Python Application

## Prerequisites
```bash
# On Ubuntu/Debian
sudo apt-get install build-essential devscripts debhelper python3 python3-pip dh-python
```

## Create Python Application

### Simple Python App
```bash
mkdir -p ~/myapp
cd ~/myapp
```

Create `helloapp.py`:
```python
#!/usr/bin/env python3

def main():
    print("Hello from Debian Package!")
    print("Version: 1.0")

if __name__ == "__main__":
    main()
```

Create `setup.py`:
```python
from setuptools import setup

setup(
    name='helloapp',
    version='1.0',
    description='Hello World Python Application',
    author='Your Name',
    author_email='you@example.com',
    py_modules=['helloapp'],
    entry_points={
        'console_scripts': [
            'helloapp=helloapp:main',
        ],
    },
)
```

## Create Debian Package Structure

### Initialize
```bash
mkdir -p helloapp-1.0
cd helloapp-1.0
cp ../helloapp.py .
cp ../setup.py .
```

### Create debian/ Directory
```bash
mkdir debian
cd debian
```

### Create control File
`debian/control`:
```
Source: helloapp
Section: python
Priority: optional
Maintainer: Your Name <you@example.com>
Build-Depends: debhelper (>= 10), python3-all, dh-python, python3-setuptools
Standards-Version: 4.1.3
Homepage: https://example.com/helloapp

Package: helloapp
Architecture: all
Depends: ${python3:Depends}, ${misc:Depends}
Description: Hello World Python Application
 A simple Hello World application written in Python
 and packaged as a Debian package.
```

### Create changelog File
```bash
dch --create -v 1.0-1 --package helloapp
```

Or manually create `debian/changelog`:
```
helloapp (1.0-1) unstable; urgency=low

  * Initial release

 -- Your Name <you@example.com>  Thu, 07 Nov 2024 10:00:00 +0000
```

### Create copyright File
`debian/copyright`:
```
Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Upstream-Name: helloapp
Source: https://example.com/helloapp

Files: *
Copyright: 2024 Your Name <you@example.com>
License: MIT
```

### Create rules File
`debian/rules`:
```makefile
#!/usr/bin/make -f

%:
	dh $@ --with python3 --buildsystem=pybuild
```

Make it executable:
```bash
chmod +x debian/rules
```

### Create compat File
```bash
echo "10" > debian/compat
```

## Build Package

### Build
```bash
cd ~/myapp/helloapp-1.0
dpkg-buildpackage -us -uc
```

Or with debuild:
```bash
debuild -us -uc
```

## Install and Test
```bash
cd ~/myapp
sudo dpkg -i helloapp_1.0-1_all.deb
helloapp
```

## Query Package
```bash
dpkg -l helloapp
dpkg -L helloapp
apt show helloapp
```

## Uninstall
```bash
sudo apt remove helloapp
```

## DEB vs RPM Comparison

| Feature | DEB | RPM |
|---------|-----|-----|
| **Format** | .deb | .rpm |
| **Used By** | Debian, Ubuntu, Mint | RHEL, CentOS, Fedora |
| **Build Tool** | dpkg-deb, debuild | rpmbuild |
| **Configuration** | debian/ directory | .spec file |
| **Control File** | debian/control | SPEC file |
| **Dependencies** | Depends: | Requires: |
| **Query** | dpkg -l | rpm -q |
| **Install** | dpkg -i / apt install | rpm -i / yum install |
| **Database** | /var/lib/dpkg | /var/lib/rpm |
| **Complexity** | Multiple files | Single SPEC file |
| **Scripting** | preinst, postinst, prerm, postrm | %pre, %post, %preun, %postun |
| **Architecture** | Architecture: | BuildArch: |
| **Verification** | debsums | rpm -V |
| **Source Package** | .dsc + .tar.gz | .src.rpm |

## Key Differences

### DEB Advantages:
- More granular control with multiple files
- Better dependency resolution (apt)
- Larger package ecosystem
- More flexible maintainer scripts
- Better for desktop distributions

### RPM Advantages:
- Single SPEC file (simpler)
- Better for enterprise environments
- Strong verification features
- Delta RPMs for updates
- Better for server distributions

### File Structure:
**DEB:**
```
debian/
├── control       # Package metadata
├── rules         # Build instructions
├── changelog     # Version history
├── copyright     # License info
├── compat        # Debhelper version
├── install       # File installation (optional)
└── *.install     # Per-package files (optional)
```

**RPM:**
```
SPECS/
└── package.spec  # Everything in one file
```

### Build Commands:
**DEB:**
```bash
dpkg-buildpackage -us -uc
# or
debuild -us -uc
```

**RPM:**
```bash
rpmbuild -ba package.spec
```
