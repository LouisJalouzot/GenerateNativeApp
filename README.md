# GenerateNativeApp
Bash script to automatically generate a wrapper application for a website on a 64 bits linux os. It creates a corresponding `.desktop` file in `$HOME/.local/share/applications` so that it appears in the applications menu.

## Requirements
`sudo apt-get install nativefier jq`

## Usage
To create a wrapper for a website at `url` with a name `app_name`:
- Create the folder `$HOME/NativeApps` and add an icon file `{app_name_trimmed}.png` in it
- Run
```bash
/bin/bash gen_app.sh "{url}" "{app_name}"
```

## Example
```bash
/bin/bash gen_app.sh "https://slides.google.com" "Google Slides"
```
which requires a file `$HOME/NativeApps/GoogleSlides.png`
