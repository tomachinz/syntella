HOST=$(hostname)
TIMESTAMP=$(date +%s)
FILEPATH="$HOME/syntella/"
LOGFILE="syntella-$HOST-$TIMESTAMP.txt"
SEQUENCE=0
FILENAME="syntella_file_"
echo Log file path: $FILEPATH
touch $LOGFILE
rm tmp_syntella_file_*
rm finished_syntella_file_*

echo >> $LOGFILE
echo >> $LOGFILE
echo "  _________               __                 .___        __         .__   "     >>  $LOGFILE
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  "     >>  $LOGFILE
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  "     >>  $LOGFILE
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__"     >>  $LOGFILE
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/"     >>  $LOGFILE
echo "        \/\/         \/            \/      \/         \/          \/      "     >>  $LOGFILE
echo "==============v0.2.2========================================================"     >>  $LOGFILE
echo >> $LOGFILE
echo >> $LOGFILE

tell_user () {
 echo "                                                       =///"  >>  $LOGFILE
 echo "___________________________________________________________" >>  $LOGFILE
 echo                 $1                                            >>  $LOGFILE
 echo "___________________________________________________________" >>  $LOGFILE
}

backgrounder () {
  SEQUENCE=$1
  MSG=$2
  COMMAND=$3
  NOSPACES=$(echo $MSG | sed "s/ /_/g")
  BACKGROUNDFILE="$FILENAME_tmp_$SEQUENCE_$NOSPACES.txt"
  FINISHEDFILE=$(echo $FILENAME_$FINISHEDFILE_$SEQUENCE_$NOSPACES)

  echo "___________________________________________________________" >>  $BACKGROUNDFILE
  echo FINISHEDFILE $FINISHEDFILE
  echo FINISHEDFILE $FINISHEDFILE
  echo
  echo
  echo
  sleep 1
  echo   >>  $BACKGROUNDFILE
  echo  "Section $SEQUENCE: $MSG    - $COMMAND "   >> $BACKGROUNDFILE
  echo   >>  $BACKGROUNDFILE
  sleep 2
  eval $COMMAND         >> $BACKGROUNDFILE
  echo                  >>  $BACKGROUNDFILE
  sleep 1
  uptime >> $BACKGROUNDFILE
  echo "___________________________________________________________" >>  $BACKGROUNDFILE
  echo                  >>  $BACKGROUNDFILE
  # Dump the contents in one go to allow this function to run in parallel
  echo Finished $SEQUENCE $MSG $COMMAND  >>  $BACKGROUNDFILE
  tail  $BACKGROUNDFILE
  echo
  echo "___________________________________________________________" >>  $BACKGROUNDFILE
  cat $BACKGROUNDFILE >> $LOGFILE
  # sleep 2
  mv $BACKGROUNDFILE $FINISHEDFILE
}
check_pings () {
  tell_user "Checking pings times to USA, NZ, Australia, Russia, UK"
  echo background file: $BACKGROUNDFILE
  ping -c 3 8.8.8.8                                            >>  $BACKGROUNDFILE
  ping -c 3 sydney.funk.nz                                     >>  $BACKGROUNDFILE
  ping -c 3 funk.nz                                            >>  $BACKGROUNDFILE
  ping -c 3 www.rt.com                                         >>  $BACKGROUNDFILE
  ping -c 3 www.parliament.uk                                  >>  $BACKGROUNDFILE
}

tell_user "System Intel Tella by Tom Atkinson - syntella@tomachi.co"
echo "Your report filename is: $LOGFILE";
echo "Presently your report is located in the Application bundle"
echo "When it's complete it will be copied to ~/syntella/$LOGFILE"
echo "and uploaded to Tomachi Corporation in New Zealand"
echo "Your use of the program implies tacit consent for Tomachi Corporation to"
echo "use in future to develop network anti-virus security software for good."
echo


# tell_user "Running Apple system profiler"
# system_profiler  SPParallelATADataType   >>  $LOGFILE
# system_profiler  SPUniversalAccessDataType   >>  $LOGFILE
# system_profiler  SPApplicationsDataType   >>  $LOGFILE
backgrounder "00" "SPApplicationsDataType" 'system_profiler SPApplicationsDataType | grep Location' &
# system_profiler  SPAudioDataType   >>  $LOGFILE
# system_profiler  SPBluetoothDataType   >>  $LOGFILE
# system_profiler  SPCameraDataType   >>  $LOGFILE
# system_profiler  SPCardReaderDataType   >>  $LOGFILE
# system_profiler  SPComponentDataType   >>  $LOGFILE
# system_profiler  SPiBridgeDataType   >>  $LOGFILE
# system_profiler  SPDeveloperToolsDataType   >>  $LOGFILE
backgrounder "01" "Developer Tools" 'system_profiler SPDeveloperToolsDataType' &
backgrounder "02" "Disabled Software" 'system_profiler SPDisabledSoftwareDataType' &
backgrounder "03" "Extensions" 'system_profiler SPExtensionsDataType' &
backgrounder "04" "Firewall Setup" 'system_profiler SPFirewallDataType' &
# system_profiler  SPDiagnosticsDataType   >>  $LOGFILE
# system_profiler  SPDiscBurningDataType   >>  $LOGFILE
# system_profiler  SPEthernetDataType   >>  $LOGFILE
# system_profiler  SPFibreChannelDataType   >>  $LOGFILE
# system_profiler  SPFireWireDataType   >>  $LOGFILE
# system_profiler  SPFontsDataType   >>  $LOGFILE
# system_profiler  SPFrameworksDataType   >>  $LOGFILE
# system_profiler  SPDisplaysDataType   >>  $LOGFILE
# system_profiler  SPHardwareDataType   >>  $LOGFILE
# system_profiler  SPHardwareRAIDDataType   >>  $LOGFILE
backgrounder "05" "Installers History" 'system_profiler SPInstallHistoryDataType' &
backgrounder "06" "Network Location" 'system_profiler SPNetworkLocationDataType' &
# system_profiler  SPLogsDataType   >>  $LOGFILE
# system_profiler  SPManagedClientDataType   >>  $LOGFILE
# system_profiler  SPMemoryDataType   >>  $LOGFILE
# system_profiler  SPNVMeDataType   >>  $LOGFILE
backgrounder "07" "Network" 'system_profiler SPNetworkDataType' &
# system_profiler  SPPCIDataType   >>  $LOGFILE
# system_profiler  SPParallelSCSIDataType   >>  $LOGFILE
# system_profiler  SPPowerDataType   >>  $LOGFILE
# system_profiler  SPPrefPaneDataType   >>  $LOGFILE
# system_profiler  SPPrintersSoftwareDataType   >>  $LOGFILE
# system_profiler  SPPrintersDataType   >>  $LOGFILE
backgrounder "08" "Configuration" 'system_profiler SPConfigurationProfileDataType' &
# system_profiler SPRawCameraDataType   >>  $LOGFILE
# system_profiler  SPSASDataType   >>  $LOGFILE
# system_profiler  SPSerialATADataType   >>  $LOGFILE
# system_profiler  SPSPIDataType   >>  $LOGFILE
# system_profiler  SPSmartCardsDataType   >>  $LOGFILE
backgrounder "09" "SPSoftwareDataType" 'system_profiler SPSoftwareDataType' &
backgrounder "10" "SPStartupItemDataType" 'system_profiler SPStartupItemDataType' &
# system_profiler  SPStorageDataType   >>  $LOGFILE
# system_profiler  SPSyncServicesDataType   >>  $LOGFILE
# system_profiler  SPThunderboltDataType   >>  $LOGFILE
# system_profiler  SPUSBDataType   >>  $LOGFILE
# system_profiler  SPNetworkVolumeDataType   >>  $LOGFILE
# system_profiler  SPWWANDataType   >>  $LOGFILE
# system_profiler  SPAirPortDataType >>  $LOGFILE
backgrounder "11" "Netstat" 'netstat -Walt | grep -v -E "kctl|kevt|dgram|kevt|stream" | grep -E "tcp|udp|icmp"' &
backgrounder "12" "List of open files with internet servers" 'lsof -Pnl +M -i -cmd | grep -E "LISTEN|TCP|UDP"' &
backgrounder "13" "Check ping times" 'check_pings' &
backgrounder "14" "Networok Map" 'nmap -sV -T4 -O -F --version-light localhost' &

tail -f $LOGFILE  &
hostname                                                     >>  $LOGFILE
uname -a                                                     >>  $LOGFILE
tell_user "The following users are logged in"
w                                                            >>  $LOGFILE

tell_user "Logging current network sockets with netstat (uno momento)"
echo "Active Internet connections (including servers)"       >>  $LOGFILE
echo "Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)" >>  $LOGFILE

tell_user "Checking router tables (uno momento)"
netstat -Wrn                                                  >>  $LOGFILE

tell_user "Running processes"
ps -ax                                                       >>  $LOGFILE
echo "$(ps ax | wc -l) running processes detected by syntella"

df -h      >>  $LOGFILE

tell_user "Checking domain name resolvers with scutil --dns"
scutil --dns                                                 >>  $LOGFILE

w  >>  $LOGFILE

tell_user "Last 24 logins..."
last | tail -n 24 >> $LOGFILE

tell_user "List disks with diskutil"
diskutil list                     >>  $LOGFILE

TOGO=`expr $(ls -lah | grep tmp_syntella_file | wc -l)`
while [ $TOGO -gt 0 ]; do
  echo waiting for $TOGO to finish
  sleep $TOGO
  sleep 2
  TOGO=`expr $(ls -lah | grep tmp_syntella_file | wc -l)`
  ls | grep _syntella_file
done
URL="https://tomachi.co/syntella-uploads/uploads/$LOGFILE";
uptime                                         >>  $LOGFILE
echo "Finito."                                 >>  $LOGFILE

echo >> $LOGFILE
echo >> $LOGFILE
echo "  _________               __                 .___        __         .__   "     >>  $LOGFILE
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  "     >>  $LOGFILE
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  "     >>  $LOGFILE
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__"     >>  $LOGFILE
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/"     >>  $LOGFILE
echo "        \/\/         \/            \/      \/         \/          \/      "     >>  $LOGFILE
echo "=========================================================================="     >>  $LOGFILE
echo >> $LOGFILE
echo >> $LOGFILE
echo "This report URL is: $URL " >>  $LOGFILE
echo
echo
mkdir -p $FILEPATH
cp $LOGFILE $FILEPATH

upload () {
  echo "Begin https upload to Tomachi Corporation"
  curl --progress-bar --referer https://tomachi.co -F "synreport=@$LOGFILE" https://tomachi.co/syntella-uploads/fileUpload.php
  echo
  echo "Complete. Your report filename is located at: ~/syntella/$LOGFILE"
  echo $URL
  open "https://tomachi.co/syntella-uploads/uploads/$LOGFILE"
  # open $LOGFILE
  sleep 2
}
# upload
rm $LOGFILE
rm tmp_syntella_file_* 2>/dev/null
rm syntella-*-*.txt 2>/dev/null
