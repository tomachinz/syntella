HOST=$(hostname)
TIMESTAMP=$(date +%s)
LOGFILE="syntella-$HOST-$TIMESTAMP.txt"
touch $LOGFILE



echo >> $LOGFILE
echo >> $LOGFILE
echo "  _________               __                 .___        __         .__   "     >>  $LOGFILE
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  "     >>  $LOGFILE
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  "     >>  $LOGFILE
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__"     >>  $LOGFILE
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/"     >>  $LOGFILE
echo "        \/\/         \/            \/      \/         \/          \/      "     >>  $LOGFILE
echo "==============v1.7========================================================"     >>  $LOGFILE
echo >> $LOGFILE
echo >> $LOGFILE



tell_user () {
 echo "                                         =///"
 echo "-------------------------------------------"
 echo $1
 echo "___________________________________________"
}

tell_user "System Intel Tella by Tom Atkinson"
echo "Your report filename is: $LOGFILE ";
echo "Presently your report is located in the Application bundle"
echo "When it's complete it will be copied to ~/syntella/$LOGFILE"
echo "and uploaded to Tomachi Corporation in New Zealand"
echo "syntella@tomachi.co"
echo "Your use of the program implies tacit consent for Tomachi Corporation to"
echo "use in future to develop network anti-virus security software for good."
echo "Your URL is based on the filename and will be displayed at the end"
echo "On my machine it takes 6 minutes to run... "

echo

tail -f $LOGFILE  &
hostname                                                     >>  $LOGFILE
uname -a                                                     >>  $LOGFILE
tell_user "The following users are logged in"
w                                                            >>  $LOGFILE
tell_user "Logging current network sockets (uno momento)"
netstat -Walt                                                >>  $LOGFILE
tell_user "Checking router tables (uno momento)"

netstat -Wr                                                  >>  $LOGFILE
tell_user "nmap -A localhost | Shows listening servers on local"
nmap -A localhost                                            >>  $LOGFILE
tell_user "Running lsof | Process names of servers"
lsof -Pnl +M -i -cmd | grep -E "LISTEN|TCP|UDP"              >>  $LOGFILE
tell_user "Logging running processes"
ps -ax                                                       >>  $LOGFILE
echo "$(ps ax | wc -l) running processes detected by syntella"
df -h
tell_user "Checking pings times to USA, NZ, Australia, Russia, UK"
ping -c 2 8.8.8.8                                            >>  $LOGFILE
ping -c 2 akl.funk.nz                                        >>  $LOGFILE
ping -c 2 sydney.funk.nz                                     >>  $LOGFILE
ping -c 2 funk.nz                                            >>  $LOGFILE
ping -c 2 www.rt.com                                         >>  $LOGFILE
ping -c 2 www.parliament.uk                                  >>  $LOGFILE

tell_user "Running Apple system profiler"
system_profiler  SPParallelATADataType   >>  $LOGFILE
# system_profiler  SPUniversalAccessDataType   >>  $LOGFILE
system_profiler  SPApplicationsDataType   >>  $LOGFILE
system_profiler  SPAudioDataType   >>  $LOGFILE
system_profiler  SPBluetoothDataType   >>  $LOGFILE
system_profiler  SPCameraDataType   >>  $LOGFILE
system_profiler  SPCardReaderDataType   >>  $LOGFILE
system_profiler  SPComponentDataType   >>  $LOGFILE
system_profiler  SPiBridgeDataType   >>  $LOGFILE
system_profiler  SPDeveloperToolsDataType   >>  $LOGFILE
system_profiler  SPDiagnosticsDataType   >>  $LOGFILE
system_profiler  SPDisabledSoftwareDataType   >>  $LOGFILE
system_profiler  SPDiscBurningDataType   >>  $LOGFILE
system_profiler  SPEthernetDataType   >>  $LOGFILE
system_profiler  SPExtensionsDataType   >>  $LOGFILE
system_profiler  SPFibreChannelDataType   >>  $LOGFILE
system_profiler  SPFireWireDataType   >>  $LOGFILE
system_profiler  SPFirewallDataType   >>  $LOGFILE
system_profiler  SPFontsDataType   >>  $LOGFILE
system_profiler  SPFrameworksDataType   >>  $LOGFILE
system_profiler  SPDisplaysDataType   >>  $LOGFILE
system_profiler  SPHardwareDataType   >>  $LOGFILE
system_profiler  SPHardwareRAIDDataType   >>  $LOGFILE
system_profiler  SPInstallHistoryDataType   >>  $LOGFILE
system_profiler  SPNetworkLocationDataType   >>  $LOGFILE
system_profiler  SPLogsDataType   >>  $LOGFILE
system_profiler  SPManagedClientDataType   >>  $LOGFILE
system_profiler  SPMemoryDataType   >>  $LOGFILE
system_profiler  SPNVMeDataType   >>  $LOGFILE
system_profiler  SPNetworkDataType   >>  $LOGFILE
system_profiler  SPPCIDataType   >>  $LOGFILE
system_profiler  SPParallelSCSIDataType   >>  $LOGFILE
system_profiler  SPPowerDataType   >>  $LOGFILE
system_profiler  SPPrefPaneDataType   >>  $LOGFILE
system_profiler  SPPrintersSoftwareDataType   >>  $LOGFILE
system_profiler  SPPrintersDataType   >>  $LOGFILE
system_profiler  SPConfigurationProfileDataType
# system_profiler SPRawCameraDataType   >>  $LOGFILE
system_profiler  SPSASDataType   >>  $LOGFILE
system_profiler  SPSerialATADataType   >>  $LOGFILE
system_profiler  SPSPIDataType   >>  $LOGFILE
system_profiler  SPSmartCardsDataType   >>  $LOGFILE
system_profiler  SPSoftwareDataType   >>  $LOGFILE
system_profiler  SPStartupItemDataType   >>  $LOGFILE
system_profiler  SPStorageDataType   >>  $LOGFILE
system_profiler  SPSyncServicesDataType   >>  $LOGFILE
system_profiler  SPThunderboltDataType   >>  $LOGFILE
system_profiler  SPUSBDataType   >>  $LOGFILE
system_profiler  SPNetworkVolumeDataType   >>  $LOGFILE
system_profiler  SPWWANDataType   >>  $LOGFILE
system_profiler  SPAirPortDataType >>  $LOGFILE

tell_user "https upload to tomachi.co"
w                                                            >>  $LOGFILE
echo "Finito.Finito.Finito."                                 >>  $LOGFILE
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
echo "Your report filename is: $LOGFILE " >>  $LOGFILE
echo "https://tomachi.co/syntella-uploads/uploads/$LOGFILE " >>  $LOGFILE
sleep 1
curl -v -X POST -F "synreport=@$LOGFILE" https://tomachi.co/syntella-uploads/fileUpload.php

sleep 1

open $LOGFILE

mkdir ~/syntella
cp $LOGFILE ~/syntella
rm $LOGFILE
echo "Complete. Your report filename is located at: ~/syntella/$LOGFILE "
echo "https://tomachi.co/syntella-uploads/uploads/$LOGFILE ";
sleep 2
