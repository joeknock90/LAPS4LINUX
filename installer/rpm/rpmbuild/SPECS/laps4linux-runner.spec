Name:           laps4linux-runner
Version:        1
Release:        1%{?dist}
Summary:        Laps4linux - auto-rotate the root password for AD bound (samba net, pbis, adcli) linux servers
BuildArch:      noarch

License:        GPL-3.0
URL:            https://github.com/joeknock90/LAPS4LINUX
Source0:        %{name}-%{version}.tar.gz

Requires:       python3 python3-gssapi python3-cryptography python3-dns python3-devel krb5-workstation krb5-devel gcc python3-ldap3

%description
This RPM contains the script and personalized config to run the lap4linux python script


%prep
%setup -q


%build


%install
rm -rf $RPM_BUILD_ROOT

mkdir -p $RPM_BUILD_ROOT/%{_sbindir}
cp usr/sbin/laps-runner $RPM_BUILD_ROOT/%{_sbindir}/laps-runner
mkdir -p $RPM_BUILD_ROOT/%{_sysconfdir}
cp etc/laps/laps-runner.json $RPM_BUILD_ROOT/%{_sysconfdir}

%post


%clean
rm -rf $RPM_BUILD_ROOT


%files
%{_sbindir}/laps-runner
%{_sysconfdir}/laps-runner.json


%changelog
* Mon Feb 26 2024 Joe Knockenhauer <joseph.knockenhauer@noaa.gov>
- Initial package forked from https://github.com/schorschii/LAPS4LINUX
- Package was created for use by NWSER only
- Make for LAPSv1 only
- Removed pip dependecies in favor of creating python3 packages required for install
- Preapre for adding to Satellite as it's own package
