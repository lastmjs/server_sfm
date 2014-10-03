server_sfm
==========

Distribute SFM over a network

====
Very preliminary, although it does actually work, if used as follows;

To get it to go, have a look at a lot of the paths and variables, and please help contribute to making it work on 
Linux/Windows too.
What we need is some things in there that are OS checks, so we can work with different platforms well.

Anyway,
First things that you'll need to do to get it working is have ssh keys into all your machines on your network, 
I've called them sfm.pem... 
Also copy the contents of this github into a directory called ~/sfm/server_sfm/ on your Host and Slaves.
Then you'll need to change your server names in the server list, mine are called 
nz7-10XXX.local etc, so change yours accordingly.  
Next big thing you'll need to do is launch the watcher script on
your slave machines, that's the sh_server.sh script.  I do this from an ssh connection from my main machine into the 
slaves, then they lauch an shell with a screen context so I get around the GL context problem.

Then, go into your Pictures directory, which should be backed up and ONLY contain JPGs!  It deletes the rest... (at a prompt 
of course).
Then enter...
```
sh ~/sfm/server_sfm/sfm-server.sh
```
then watch it go!

One proplem I've noticed using internet pictures is that files with names over about 30 characters are truncated and fail... in which case execute the script ~/sfm/server_sfm/checksiftsarethere.sh and it will populate missing sifts and keep going.  

After the matches have finished, then continue to PMVS, as this has not been built in yet...
Updates soon,
Cheers,
Dan
