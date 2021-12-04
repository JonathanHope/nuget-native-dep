#!/usr/bin/env bash

# Windows x86
echo ''
echo 'Building Windows/x86 native library'
(./dockcross-windows-x86 cmake -Bbuild-windows-x86 -H. -GNinja &&
./dockcross-windows-x86 ninja -Cbuild-windows-x86) ||
{ echo 'Fail: Could not build Windowx/x86 native library'; exit 1; }
echo 'Success: Windows/x86 native library built'

# Windowx x64
echo ''
echo 'Building Windows/x64 native library'
(./dockcross-windows-x64 cmake -Bbuild-windows-x64 -H. -GNinja &&
./dockcross-windows-x64 ninja -Cbuild-windows-x64) ||
{ echo 'Fail: Could not build Windowx/x64 native library'; exit 1; }
echo 'Succss: Windows/x64 native library built'

# Linux x86
echo ''
echo 'Building Linux/x86 native library'
(./dockcross-linux-x86 cmake -Bbuild-linux-x86 -H. -GNinja &&
./dockcross-linux-x86 ninja -Cbuild-linux-x86) ||
{ echo 'Fail: Could not build Linux/x86 native library'; exit 1; }
echo 'Success: Linux/x86 native library built'

# Linux x64
echo ''
echo 'Building Linux/x64 native library'
(./dockcross-linux-x64 cmake -Bbuild-linux-x64 -H. -GNinja &&
./dockcross-linux-x64 ninja -Cbuild-linux-x64) ||
{ echo 'Fail: Could not build Linux/x64 native library'; exit 1; }
echo 'Success: Linux/x64 native library built'

# Nuget Package
echo ''
echo 'Building Nuget package'
(docker build -t hello-package -f Dockerfile.package . &&
CID=$(docker create hello-package) &&
docker cp ${CID}:/build . &&
docker rm ${CID}) ||
{ echo 'Fail: Could not build Nuget package'; exit 1; }
echo 'Success: Nuget package built'