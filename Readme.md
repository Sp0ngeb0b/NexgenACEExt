**Preview:**

![previewClientConfig](https://user-images.githubusercontent.com/12958319/78816215-b630d200-79d1-11ea-8d65-8c38c26ecb5e.jpg)
![previewAdmin](https://user-images.githubusercontent.com/12958319/78816218-b6c96880-79d1-11ea-9475-d0459e6788bd.jpg)

```
####################################################################################################
##
##  Nexgen ACE Extension version 1 for IACEv11
##  [NexgenACEExt11_1 - For Nexgen 112]
##
##  Version: 1
##  Release Date: April 2020
##  Author: Patrick "Sp0ngeb0b" Peltzer
##  Contact: spongebobut@yahoo.com  -  www.unrealriders.eu
##
####################################################################################################
##   Table of Content
##
##   1. About
##   2. Requirements
##   3. Server Install
##   4. Credits and thanks
##   5. Info for programmers
##   6. FAQs
##   7. Changelog
##
####################################################################################################

####################################################################################################
## 
##  1. About
##
####################################################################################################
NexgenACEExt connects the Nexgen Server Controller with UT's actively developed anti cheat, ACE.
It fixes the incompatibility between Nexgen and ACE's crosshair scaling feature which does work
now as intended. Also, a GUI front-end for both, client-side ACE settings as well as admin ACE 
features is included.

NexgenACEExt also provides an interface for other Nexgen plugins to receive ACE hardware info without 
being package dependent on the IACE file of the corresponding ACE version. In case of future ACE
updates, only NexgenACEExt needs to be updated; other plugins will still function.

####################################################################################################
##
##  2. Requirements
##
####################################################################################################
Nexgen 1.12
ACEv11 (any version using the IACEv11 file)

Optional Nexgen plugins profiting from NexgenACEExt:
NexgenPlayerLookup
NexgenABM

Note: This plugin replaces NexgenACEcsFix and NexgenABM10x!

####################################################################################################
## 
##  3. Server Install
##
####################################################################################################
 1. Make sure your server has been shut down.
 
 2. Deinstall any existing version of NexgenACEcsFix and NexgenABM10x.

 3. Copy the NexgenACEExt11_1.u file to the system folder of your UT
    server.

 4. If your server is using redirect upload the NexgenACEExt11_1.u.uz file
    to the redirect server.

 5. Open your servers configuration file and add the following server package:

      ServerPackages=NexgenACEExt11_1

    Also add the following server actor:

      ServerActors=NexgenACEExt11_1.NexgenACEExt

    Note that the actor must be added AFTER the Nexgen controller server actor
    (ServerActors=Nexgen112.NexgenActor).

 6. Restart your server.  

####################################################################################################
## 
##  4. Credits and thanks
##
####################################################################################################
- Defrost for developing Nexgen (http://www.unrealadmin.org/forums/showthread.php?t=26835)
  
- AnthraX for his priceless work on ACE (http://utgl.unrealadmin.org/ace/)

####################################################################################################
##
##  5. Info for programmers
##
####################################################################################################
This mod is open source. You can view/and or use the source code of it partially or entirely without
my permission. You are also more then welcome to recompile this mod for another Nexgen version.
Nonetheless I would like you to follow these limitations:

- If you use parts of this code for your own projects, please give credits to me in your readme.
  (Patrick 'Sp0ngeb0b' Peltzer)
  
- If you recompile or edit this plugin, please leave the credits part of the readme intact, as well
  as the author line in the panel. Also note that you have to pay attention to the naming of your
  version to avoid missmatches. All official updates will be made ONLY by me and therefore counting up
  version numbers are forbidden (e.g. NexgenACEExt11_2). Instead, add an unique suffix 
  (e.g. NexgenACEExt11_2_X).
  
While working with Nexgen's 1.12 TCP functions, I encountered a far-reaching bug in Nexgen's core
file which will prevent empty strings in an array to be transfered correctly. A detailed explanation
and solution can be found here: http://www.unrealadmin.org/forums/showthread.php?t=31280

####################################################################################################
##
##  6. FAQs
##
####################################################################################################
Q: Why can't I take screenshots?
A: You need to set the ACE 'AdminPass' in its config to a password of your choice. NexgenACEExt will
   automatically read it and is then able to request ACE screenshots.

Q: Why can't I screenshot or request info for spectators?
A: ACE must be configured to check spectators in order to generate hardware information for them. 
   Set 'bCheckSpectators' to 'true' in your ACE configuration.

Q: How do I save the client settings?
   All settings are saved immediately or may require a press of the 'Enter' key in case of number 
   inputs. Depending on the setting, it is either applied directly or after a reconnect.
   
Q: The ACE client settings section doesn't show up!
A: ACE only provides the settings instance once you have been connected to the server as a player.
   After that, you can also access it as a spectator.
   
Q: Any pro tips?
A: '!ace' will automatically open the ACE client settings GUI.

Q: Which admin rights are required for the ACE Admin tab?
A: Moderate rights.

Q: I'm using a custom Nexgen version and there's no compatible version of this plugin available.
   Am I allowed to recompile this package on my own?
A: Generally, if you want a version of this plugin for a custom Nexgen version, ask me and I will
   do the job for you. If - for whatever reasons - you are unable to get in contact with me, you are
   allowed to recompile the plugin with respecting the conditions stated in section 5.

####################################################################################################
##
##  7. Changelog
##
####################################################################################################
- Version 1: Initial release.


Bug reports / feedback can be send directly to me.



Sp0ngeb0b, April 2020

admin@unrealriders.eu / spongebobut@yahoo.com
www.unrealriders.eu
```