#!/bin/bash
# ex ffmxf_server_local.sh
# (no input args)
# Created by devteam on 20/05/13.
# Copyright 2013 LuckyBulldozer.com. All rights reserved.

#job watcher script os x sfmCloud

#Start Up... Move incomplete jobs from JOBS CUED TO JOBS PENDING...




. ~/sw/sfm/sfm.lib
#. ~/dsw/video_server/ds_common.lib

RENDER_SERVER=$HOME/sfm/RENDER_SERVER
JOBS_PENDING=$RENDER_SERVER/JOBS_PENDING/


OUTPUT_FOLDER=$RENDER_SERVER/JOBS_COMPLETED
#RENDER_SERVER=`cat ~/.dsw/RENDER_SERVER_VAR`  # now sourced from ~/ds_common.lib

#move cued jobs back to pending on startup
mv RENDER_SERVER/JOBS_CUED/* RENDER_SERVER/JOBS_PENDING/ 2>/dev/null
#make sure there are new directories incase we are in a new location
echo "about to makedirs.."
mkdir -p $RENDER_SERVER/JOBS_SETUP $RENDER_SERVER/JOBS_PENDING $RENDER_SERVER/JOBS_CUED/ $RENDER_SERVER/JOBS_COMPLETED
cd $RENDER_SERVER
#Begin Main Loop
while true
 do
	printf "\rWaiting for render script. ."
	# Find Number of Jobs in JOBS_PENDING Directory
	WORKTODO=`ls -1 JOBS_PENDING/* 2>/dev/null| wc -l`
		while [ $WORKTODO -gt 0 ]
			do
			#unixify.sh $JOBS_PENDING_PRORES/*
			#echo "IN THE LOOP"
			# Re-Init JOBS_CUE
			rm -r .JOBS_CUE
			# Rebuild the JOBS_CUE (No longer randome selection)
			for jc in `ls -1 JOBS_PENDING/* 2>/dev/null`; do basename $jc >>.JOBS_CUE; done
			#head -$((${RANDOM} % `wc -l < .JOBS_CUE` + 1)) .JOBS_CUE | tail -1 > .JOB_CHOICE
			#choose JOB
			head -1 .JOBS_CUE > .JOB_CHOICE
			#Init Variable
			CHOOSE_JOB=`cat .JOB_CHOICE`
			echo "Working on..." $CHOOSE_JOB
			# Move job from PENDING TO CUED
			mv JOBS_PENDING/$CHOOSE_JOB JOBS_CUED/$CHOOSE_JOB
			# Execute Job Script
			JOBS_CUED/$CHOOSE_JOB 
			if [ $? -eq 0 ]
				then 
				#on Job Completion, Move Job to COMPLETED
				mv JOBS_CUED/$CHOOSE_JOB JOBS_COMPLETED/
				# build in number of retries
			fi 
			
			#Find out nubmer of remaining Jobs for WORKTODO variable
			WORKTODO=`ls -1 JOBS_PENDING/* 2>/dev/null| wc -l `
			echo "$WORKTODO"
			#find jobs that are in JOBS_SETUP
					
			done
   sleep .1
   #HALFWIDTH=$(($COLUMNS / 2 ))
   #eval "printf '. %.0s' {1..$COLUMNS}"
   #printf "\rWaiting for render script.. "
   sleep .2
   printf "\rWaiting for render script..."
   sleep .2
   printf "\rWaiting for render script .."
   sleep .2
   done
	
	
done
#head back to begining of loop

