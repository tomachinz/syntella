echo "  _________               __                 .___        __         .__   ";
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  ";
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  ";
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__";
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/";
echo "        \/\/         \/            \/      \/         \/          \/      ";
echo "==============v1.5========================================================";
HOST=$(hostname)
TIMESTAMP=$(date +%s)
# LOGPATH="$HOME/syntella"
LOGFILE="syntella-$HOST-$TIMESTAMP.txt"
# LOGWITHPATH="$LOGPATH/$LOGFILE"
LOGWITHPATH="$LOGFILE"
mkdir $LOGPATH
touch $LOGWITHPATH

tell_user () {
 echo "                                         =///"
 echo "-------------------------------------------"
 echo $1
 echo "___________________________________________"
}

tell_user "System Intel Tella by Tom Atkinson"
echo "Your report can be found at: $LOGWITHPATH ";
tail -f $LOGWITHPATH  &
hostname                                                     >>  $LOGWITHPATH
uname -a                                                     >>  $LOGWITHPATH
tell_user "The following users are logged in"
w                                                            >>  $LOGWITHPATH
tell_user "Checking router tables (uno momento)"
netstat -Walt                                                >>  $LOGWITHPATH
netstat -Wr                                                  >>  $LOGWITHPATH
tell_user "nmap -A localhost | Shows listening servers on local"
nmap -A localhost                                            >>  $LOGWITHPATH
tell_user "Running lsof | Process names of servers"
lsof -Pnl +M -i -cmd | grep -E "LISTEN|TCP|UDP"              >>  $LOGWITHPATH
tell_user "Logging running processes"
ps -ax                                                       >>  $LOGWITHPATH
echo "$(ps ax | wc -l) running processes detected by syntella"
df -h
tell_user "Checking pings times to USA, NZ, Australia, Russia, UK"
ping -c 2 8.8.8.8                                            >>  $LOGWITHPATH
ping -c 2 akl.funk.nz                                        >>  $LOGWITHPATH
ping -c 2 sydney.funk.nz                                     >>  $LOGWITHPATH
ping -c 2 funk.nz                                            >>  $LOGWITHPATH
ping -c 2 www.rt.com                                         >>  $LOGWITHPATH
ping -c 2 www.parliament.uk                                  >>  $LOGWITHPATH

tell_user "Running Apple system profiler"
system_profiler  SPParallelATADataType   >>  $LOGWITHPATH
# system_profiler  SPUniversalAccessDataType   >>  $LOGWITHPATH
system_profiler  SPApplicationsDataType   >>  $LOGWITHPATH
system_profiler  SPAudioDataType   >>  $LOGWITHPATH
system_profiler  SPBluetoothDataType   >>  $LOGWITHPATH
system_profiler  SPCameraDataType   >>  $LOGWITHPATH
system_profiler  SPCardReaderDataType   >>  $LOGWITHPATH
system_profiler  SPComponentDataType   >>  $LOGWITHPATH
system_profiler  SPiBridgeDataType   >>  $LOGWITHPATH
system_profiler  SPDeveloperToolsDataType   >>  $LOGWITHPATH
system_profiler  SPDiagnosticsDataType   >>  $LOGWITHPATH
system_profiler  SPDisabledSoftwareDataType   >>  $LOGWITHPATH
system_profiler  SPDiscBurningDataType   >>  $LOGWITHPATH
system_profiler  SPEthernetDataType   >>  $LOGWITHPATH
system_profiler  SPExtensionsDataType   >>  $LOGWITHPATH
system_profiler  SPFibreChannelDataType   >>  $LOGWITHPATH
system_profiler  SPFireWireDataType   >>  $LOGWITHPATH
system_profiler  SPFirewallDataType   >>  $LOGWITHPATH
system_profiler  SPFontsDataType   >>  $LOGWITHPATH
system_profiler  SPFrameworksDataType   >>  $LOGWITHPATH
system_profiler  SPDisplaysDataType   >>  $LOGWITHPATH
system_profiler  SPHardwareDataType   >>  $LOGWITHPATH
system_profiler  SPHardwareRAIDDataType   >>  $LOGWITHPATH
system_profiler  SPInstallHistoryDataType   >>  $LOGWITHPATH
system_profiler  SPNetworkLocationDataType   >>  $LOGWITHPATH
system_profiler  SPLogsDataType   >>  $LOGWITHPATH
system_profiler  SPManagedClientDataType   >>  $LOGWITHPATH
system_profiler  SPMemoryDataType   >>  $LOGWITHPATH
system_profiler  SPNVMeDataType   >>  $LOGWITHPATH
system_profiler  SPNetworkDataType   >>  $LOGWITHPATH
system_profiler  SPPCIDataType   >>  $LOGWITHPATH
system_profiler  SPParallelSCSIDataType   >>  $LOGWITHPATH
system_profiler  SPPowerDataType   >>  $LOGWITHPATH
system_profiler  SPPrefPaneDataType   >>  $LOGWITHPATH
system_profiler  SPPrintersSoftwareDataType   >>  $LOGWITHPATH
system_profiler  SPPrintersDataType   >>  $LOGWITHPATH
system_profiler  SPConfigurationProfileDataType
# system_profiler SPRawCameraDataType   >>  $LOGWITHPATH
system_profiler  SPSASDataType   >>  $LOGWITHPATH
system_profiler  SPSerialATADataType   >>  $LOGWITHPATH
system_profiler  SPSPIDataType   >>  $LOGWITHPATH
system_profiler  SPSmartCardsDataType   >>  $LOGWITHPATH
system_profiler  SPSoftwareDataType   >>  $LOGWITHPATH
system_profiler  SPStartupItemDataType   >>  $LOGWITHPATH
system_profiler  SPStorageDataType   >>  $LOGWITHPATH
system_profiler  SPSyncServicesDataType   >>  $LOGWITHPATH
system_profiler  SPThunderboltDataType   >>  $LOGWITHPATH
system_profiler  SPUSBDataType   >>  $LOGWITHPATH
system_profiler  SPNetworkVolumeDataType   >>  $LOGWITHPATH
system_profiler  SPWWANDataType   >>  $LOGWITHPATH
system_profiler  SPAirPortDataType >>  $LOGWITHPATH

tell_user "https upload to tomachi.co"
w                                                            >>  $LOGWITHPATH
echo "Finito."                                               >>  $LOGWITHPATH
echo "Your report can be found at: $LOGWITHPATH " >>  $LOGWITHPATH
echo "https://tomachi.co/syntella-uploads/uploads/$LOGFILE " >>  $LOGWITHPATH
mkdir ~/syntella
cp $LOGWITHPATH ~/syntella
curl -X POST -F "synreport=@$LOGWITHPATH " https://tomachi.co/syntella-uploads/fileUpload.php
sleep 1
echo "  _________               __                 .___        __         .__   ";
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  ";
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  ";
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__";
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/";
echo "        \/\/         \/            \/      \/         \/          \/      ";
echo "==========================================================================";
echo "Your report can be found at: $LOGWITHPATH ";
echo "https://tomachi.co/syntella-uploads/uploads/$LOGFILE ";
open $LOGWITHPATH
sleep 2
