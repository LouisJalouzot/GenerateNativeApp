#!/bin/bash
url=$1
name=$2
name_trimmed="${name// /}"
rm -rf $HOME/NativeApps/${name_trimmed}-linux-x64
nativefier "${url}" --name "${name}" --maximize --disable-dev-tools --icon "$HOME/NativeApps/${name_trimmed}.png" --userAgentHonest true
chmod +x $HOME/NativeApps/${name_trimmed}-linux-x64/${name_trimmed}
PACKAGE_JSON_PATH="$HOME/NativeApps/${name_trimmed}-linux-x64/resources/app/package.json"
WM_CLASS=$(jq -r '.name' "${PACKAGE_JSON_PATH}")
desktop_file="~/.local/share/applications/${name_trimmed}.desktop"
eval "echo '[Desktop Entry]' > ${desktop_file}"
eval "echo 'Type=Application' >> ${desktop_file}"
eval "echo 'Terminal=false' >> ${desktop_file}"
eval "echo 'Name=${name}' >> ${desktop_file}"
eval "echo 'Exec=$HOME/NativeApps/${name_trimmed}-linux-x64/${name_trimmed}' >> ${desktop_file}"
eval "echo 'Icon=$HOME/NativeApps/${name_trimmed}.png' >> ${desktop_file}"
eval "echo 'StartupWMClass=${WM_CLASS}' >> ${desktop_file}"
chmod +x $HOME/.local/share/applications/${name_trimmed}.desktop
echo "${desktop_file}"
