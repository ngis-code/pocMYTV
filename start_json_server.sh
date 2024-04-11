npm install -g json-server
clear
echo Below is the current ip addr
ipconfig getifaddr en0
echo change the ip addr and port to 3000 in globals.dart file
npx json-server db.json