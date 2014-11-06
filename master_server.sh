#!/bin/bash
# engine for executing from ec2-sfm.lib

#known functions and execution order to be added.

. ~/sfm/server_sfm/sfm_server.lib

### WORKING FUNCTIONS

#INIT ROUTINES

#1
initVars #MUST BE ON!!!
#2
initRm
#echo "RM turned OFF!"
#3
initDirs

# SERVER INIT ROUTINES

#10
##chooseNumberOfServers
#20
getImgList
#30 - Assigns the IP addresses...
assignIPRange
#39
### not executing serverIDs.... not relevant...
#serverIDs
#echo "end here?"
#read ab
#read av

#40
realServerCreation
#fakeServerCreation
echo "end here?"
#read ab
#read av

initRemoteServers

#50
copyImagesToRealServers
#copyImagesToFakeServers
#60
siftListsPerServer
#70
copyListsToRealServers
#copyListsToFakeServers

# START SIFT ON SERVERS

#80
startRealSifts
#startFakeSifts
#90
waitForSiftsToFinish

echo END HERE?
#read noout

#100
getInverseSifts

echo END AT getInverseSifts
#read nnout
#110
waitForSiftsToCopy

echo END at waitForSiftsToCopy
#read nouut

# START MATCH ON SERVERS

#120
getMatchListTotal
#130
makeMatchLists #depends on getTotalImgCount
#140
startMatchesOnServers
#150
waitForMatchesToExport
#160
combineMatch
#170
copyMatchesToRealServers
#copyMatchesToFakeServers
#180

#CONSIDER MATCHES

#REDISTUBITE VSFMS

#COMBINE VSFMs

#PMVS STAGE



#vsfmMatchImages


### eg a sift looper;
#waitForMatchesToFinish
#exportMatchesFromServer

#waitForMatchesToFinish
#exportMatchesFromServer
