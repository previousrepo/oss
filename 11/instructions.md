# RPM Package Creation for Java Application

## Prerequisites
```bash
# On CentOS/RHEL/Fedora
sudo yum install rpm-build rpmdevtools java-11-openjdk-devel
```

## Setup RPM Build Environment
```bash
rpmdev-setuptree
```

This creates:
```
~/rpmbuild/
├── BUILD
├── RPMS
├── SOURCES
├── SPECS
└── SRPMS
```

## Create Java Application

### Simple Java App
```bash
mkdir -p ~/myapp/src/com/example
cd ~/myapp
```

Create `src/com/example/HelloApp.java`:
```java
package com.example;

public class HelloApp {
    public static void main(String[] args) {
        System.out.println("Hello from RPM Package!");
        System.out.println("Version: 1.0");
    }
}
```

### Compile
```bash
javac src/com/example/HelloApp.java
```

### Create JAR
```bash
mkdir -p build
jar cvfe build/helloapp.jar com.example.HelloApp -C src .
```

### Create Wrapper Script
Create `helloapp.sh`:
```bash
#!/bin/bash
java -jar /usr/share/helloapp/helloapp.jar "$@"
```

## Prepare Sources
```bash
mkdir -p helloapp-1.0
cp build/helloapp.jar helloapp-1.0/
cp helloapp.sh helloapp-1.0/
tar czf ~/rpmbuild/SOURCES/helloapp-1.0.tar.gz helloapp-1.0/
```

## Create SPEC File
Create `~/rpmbuild/SPECS/helloapp.spec`:
```spec
Name:           helloapp
Version:        1.0
Release:        1%{?dist}
Summary:        Hello World Java Application

License:        MIT
URL:            https://example.com/helloapp
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
Requires:       java-11-openjdk

%description
A simple Hello World Java application packaged as RPM.

%prep
%setup -q

%build
# Nothing to build, pre-compiled

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/share/helloapp
mkdir -p $RPM_BUILD_ROOT/usr/bin

install -m 644 helloapp.jar $RPM_BUILD_ROOT/usr/share/helloapp/
install -m 755 helloapp.sh $RPM_BUILD_ROOT/usr/bin/helloapp

%files
/usr/share/helloapp/helloapp.jar
/usr/bin/helloapp

%changelog
* Thu Nov 07 2024 Your Name <you@example.com> - 1.0-1
- Initial RPM release
```

## Build RPM
```bash
rpmbuild -ba ~/rpmbuild/SPECS/helloapp.spec
```

## Install and Test
```bash
sudo rpm -ivh ~/rpmbuild/RPMS/noarch/helloapp-1.0-1.*.noarch.rpm
helloapp
```

## Query Package
```bash
rpm -qi helloapp
rpm -ql helloapp
```

## Uninstall
```bash
sudo rpm -e helloapp
```

## RPM vs DEB Comparison

| Feature | RPM | DEB |
|---------|-----|-----|
| **Format** | .rpm | .deb |
| **Used By** | RHEL, CentOS, Fedora, SUSE | Debian, Ubuntu, Mint |
| **Build Tool** | rpmbuild | dpkg-deb, debuild |
| **Spec File** | .spec file | debian/ directory |
| **Dependencies** | Requires: | Depends: |
| **Query** | rpm -q | dpkg -l |
| **Install** | rpm -i / yum install | dpkg -i / apt install |
| **Database** | /var/lib/rpm | /var/lib/dpkg |
| **Complexity** | Single SPEC file | Multiple control files |
| **Scripting** | %pre, %post, %preun, %postun | preinst, postinst, prerm, postrm |
| **Architecture** | BuildArch | Architecture |
| **Verification** | rpm -V | debsums |
| **Source Package** | .src.rpm | .dsc + .tar.gz |

## Key Differences

### RPM Advantages:
- Single SPEC file (simpler)
- Better for enterprise environments
- Strong verification features
- Delta RPMs for updates

### DEB Advantages:
- More granular control
- Better dependency resolution (apt)
- Larger package ecosystem
- More flexible maintainer scripts

### Build Process:
**RPM:**
1. Create SPEC file
2. Run rpmbuild
3. Done

**DEB:**
1. Create debian/ directory
2. Create control, rules, changelog, etc.
3. Run debuild or dpkg-buildpackage
4. Done
