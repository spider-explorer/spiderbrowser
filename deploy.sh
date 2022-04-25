#! bash -uvx
set -e
cwd=`pwd`
cd binary
rm -rf vc_redist.x64.exe
rm -rf translations iconengines imageformats platforms styles
windeployqt --qmldir $cwd spiderbrowser.exe
mkdir -p plugins
if [ -f "vc_redist.x64.exe" ]; then
  dark -x vc_redist.x64.tmp vc_redist.x64.exe
  7z x -y vc_redist.x64.tmp/AttachedContainer/packages/vcRuntimeMinimum_amd64/cab1.cab
  rm -rf vc_redist.x64.exe
fi
rm -rf *.tmp

