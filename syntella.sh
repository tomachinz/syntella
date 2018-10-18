echo "  _________               __                 .___        __         .__   ";
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  ";
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  ";
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__";
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/";
echo "        \/\/         \/            \/      \/         \/          \/      ";
echo "==========================================================================";
HOST=$(hostname)
TIMESTAMP=$(date +%s)
LOGPATH="$HOME/syntella"
LOGFILE="$LOGPATH/syntella-$HOST-$TIMESTAMP.txt"
mkdir $LOGPATH
touch $LOGFILE

tell_user () {
 echo "                                         =///"
 echo "-------------------------------------------"
 echo $1
 echo "___________________________________________"
}

tell_user "System Intel Tella by Tom Atkinson"
hostname                                                     2>&1 | tee $LOGFILE
uname -a                                                     2>&1 | tee $LOGFILE
tell_user "The following users are logged in"
w                                                            2>&1 | tee $LOGFILE

system_profiler  SPParallelATADataType   2>&1 | tee $LOGFILE
# system_profiler  SPUniversalAccessDataType   2>&1 | tee $LOGFILE
system_profiler  SPApplicationsDataType   2>&1 | tee $LOGFILE
system_profiler  SPAudioDataType   2>&1 | tee $LOGFILE
system_profiler  SPBluetoothDataType   2>&1 | tee $LOGFILE
system_profiler  SPCameraDataType   2>&1 | tee $LOGFILE
system_profiler  SPCardReaderDataType   2>&1 | tee $LOGFILE
system_profiler  SPComponentDataType   2>&1 | tee $LOGFILE
system_profiler  SPiBridgeDataType   2>&1 | tee $LOGFILE
system_profiler  SPDeveloperToolsDataType   2>&1 | tee $LOGFILE
system_profiler  SPDiagnosticsDataType   2>&1 | tee $LOGFILE
system_profiler  SPDisabledSoftwareDataType   2>&1 | tee $LOGFILE
system_profiler  SPDiscBurningDataType   2>&1 | tee $LOGFILE
system_profiler  SPEthernetDataType   2>&1 | tee $LOGFILE
system_profiler  SPExtensionsDataType   2>&1 | tee $LOGFILE
system_profiler  SPFibreChannelDataType   2>&1 | tee $LOGFILE
system_profiler  SPFireWireDataType   2>&1 | tee $LOGFILE
system_profiler  SPFirewallDataType   2>&1 | tee $LOGFILE
system_profiler  SPFontsDataType   2>&1 | tee $LOGFILE
system_profiler  SPFrameworksDataType   2>&1 | tee $LOGFILE
system_profiler  SPDisplaysDataType   2>&1 | tee $LOGFILE
system_profiler  SPHardwareDataType   2>&1 | tee $LOGFILE
system_profiler  SPHardwareRAIDDataType   2>&1 | tee $LOGFILE
system_profiler  SPInstallHistoryDataType   2>&1 | tee $LOGFILE
system_profiler  SPNetworkLocationDataType   2>&1 | tee $LOGFILE
system_profiler  SPLogsDataType   2>&1 | tee $LOGFILE
system_profiler  SPManagedClientDataType   2>&1 | tee $LOGFILE
system_profiler  SPMemoryDataType   2>&1 | tee $LOGFILE
system_profiler  SPNVMeDataType   2>&1 | tee $LOGFILE
system_profiler  SPNetworkDataType   2>&1 | tee $LOGFILE
system_profiler  SPPCIDataType   2>&1 | tee $LOGFILE
system_profiler  SPParallelSCSIDataType   2>&1 | tee $LOGFILE
system_profiler  SPPowerDataType   2>&1 | tee $LOGFILE
system_profiler  SPPrefPaneDataType   2>&1 | tee $LOGFILE
system_profiler  SPPrintersSoftwareDataType   2>&1 | tee $LOGFILE
system_profiler  SPPrintersDataType   2>&1 | tee $LOGFILE
system_profiler  SPConfigurationProfileDataType
# system_profiler SPRawCameraDataType   2>&1 | tee $LOGFILE
system_profiler  SPSASDataType   2>&1 | tee $LOGFILE
system_profiler  SPSerialATADataType   2>&1 | tee $LOGFILE
system_profiler  SPSPIDataType   2>&1 | tee $LOGFILE
system_profiler  SPSmartCardsDataType   2>&1 | tee $LOGFILE
system_profiler  SPSoftwareDataType   2>&1 | tee $LOGFILE
system_profiler  SPStartupItemDataType   2>&1 | tee $LOGFILE
system_profiler  SPStorageDataType   2>&1 | tee $LOGFILE
system_profiler  SPSyncServicesDataType   2>&1 | tee $LOGFILE
system_profiler  SPThunderboltDataType   2>&1 | tee $LOGFILE
system_profiler  SPUSBDataType   2>&1 | tee $LOGFILE
system_profiler  SPNetworkVolumeDataType   2>&1 | tee $LOGFILE
system_profiler  SPWWANDataType   2>&1 | tee $LOGFILE
system_profiler  SPAirPortDataType 2>&1 | tee $LOGFILE



tell_user "Checking router tables (uno momento)"
netstat -Wr                                                  2>&1 | tee $LOGFILE
netstat -Walt                                                2>&1 | tee $LOGFILE
tell_user "nmap -A localhost | Shows listening servers on local"
nmap -A localhost                                            2>&1 | tee $LOGFILE
tell_user "Running lsof | Process names of servers"
lsof -Pnl +M -i -cmd | grep -E "LISTEN|TCP|UDP"              2>&1 | tee $LOGFILE
tell_user "Logging running processes"
ps -ax                                                       2>&1 | tee $LOGFILE
echo "$(ps ax | wc -l) running processes detected by syntella"
df -h
tell_user "Checking pings times to USA, NZ, Australia, Russia, UK"
ping -c 2 8.8.8.8                                            2>&1 | tee $LOGFILE
ping -c 2 akl.funk.nz                                        2>&1 | tee $LOGFILE
ping -c 2 sydney.funk.nz                                     2>&1 | tee $LOGFILE
ping -c 2 funk.nz                                            2>&1 | tee $LOGFILE
ping -c 2 www.rt.com                                         2>&1 | tee $LOGFILE
ping -c 2 www.parliament.uk                                  2>&1 | tee $LOGFILE



tell_user "https upload to tomachi.co"
w                                                            2>&1 | tee $LOGFILE
echo "Finito."                                               2>&1 | tee $LOGFILE

curl -X POST -F "synreport=@$LOGFILE" https://tomachi.co/syntella/fileUpload.php
echo "  _________               __                 .___        __         .__   ";
echo " /   _____/__.__. _______/  |_  ____   _____ |   | _____/  |_  ____ |  |  ";
echo " \_____  <   |  |/  ___/\   __\/ __ \ /     \|   |/    \   __\/ __ \|  |  ";
echo " /        \___  |\___ \  |  | \  ___/|  Y Y  \   |   |  \  | \  ___/|  |__";
echo "/_______  / ____/____  > |__|  \___  >__|_|  /___|___|  /__|  \___  >____/";
echo "        \/\/         \/            \/      \/         \/          \/      ";
echo "==========================================================================";
echo "Your report can be found at: $LOGFILE";

sleep 2
