# WountyContainer

## Version:
WountyContainer v2 (GNU/Linux x86_64).

## License:
Copyright (C) 2022 egrullon \<Amix\>.

License GPLv3+: GNU GPL version 3 or later https://www.gnu.org/licenses/gpl-3.0.html.

This program comes with ABSOLUTELY NO WARRANTY.

This is free software and you are free to change and redistribute it.

## Description:

WountyContainer is a docker image for advanced web enumeration that makes use of other popular tools to automate the early stages of recognition in Bug Bounty processes. This tool is very important as part of the Bug Bounties techniques.

## Docker Install 
```
cd /opt
```
```
sudo git clone https://github.com/egrullon/WountyContainer.git
```
```
cd WountyContainer
```
```
docker build -t wounty:v2 .
```
```
docker run -it -v /tmp/:/opt/projects wounty:v2
```
### Usage:
```
wounty example.com
```

