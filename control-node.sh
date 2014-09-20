#!/bin/sh

#

 			#### pmvs Render server begins here...
 			###
 			### how to do it, we need a job sender/listener .. we have a listener on the render-node side,
 			### repurpose this for control-node to send out jobs, when we know the render-nodes are available
 			
 	
 	
 # control-node
 
 
 # get our variables from...
 source ~/sfm/server_sfm/server-sfm.lib
 
initVars
 
 # runs a while loop that sends out jobs to servers...		
# in the same way that the listener nodes works, however I want better stats back as to what servers are online, and what they are doing...

# eg

# jobs monitor... maybe this is an entirely different thread?/script

#  server name  | benchmark speed |     job          |  percent complete  |    ETA  |
#------------------------------------------------------------------------------------	
#   nz7-10500   |       4.2       | pmvs option-0020 |**20%***************|03:20:00 | 
#       16      |        17       |       17         |         20         |    10   |       
#column ^^ width 

# first thing... jobs server...

CONTROL_PATH=""
CONTROL_JOBS_SETUP_DIR=""
CONTROL_JOBS_PENDING_DIR=""
CONTROL_JOBS_CUED_DIR=""
CONTORL_JOBS_COMPLETED_DIR=""


