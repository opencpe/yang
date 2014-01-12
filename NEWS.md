homegateway
===========

Collection of project documentation and Yang specs for homegateway.

Version 0.1.3 - 09 Jan 2014
---------------------------

* Add software 'slots' to abstract how software is stored
* Add state data to link absolute files and paths to slots
* Update the file management / writing model to separate actions for downloading writing to slots and activating.
* Add a ftp-specific firmware-download module as an example for transfer-specific download modules.
* Move all firmware related augmentations from system into the firmware mgtmt

Version 0.1.2 - 19 Dec 2013
---------------------------

* use description statement to explain why a deviation is needed
* /if:interfaces-state/if:interface/ip:ipv6/ip:neighbor/ip:state should be imlemented at some point but not for the first release
* rename homegateway to opencpe, use "ocpe" in namespaces
* replace PRC firmware-status with a list of available partitions and the status of that partition's firmware
* add target location to firmware download (as a feature)
* add transports SCP and HTTPS to RPC firmware-download
* add credentials to RPC firmware-download
* add own modules to features.list

Version 0.1.1 - 12 Dec 2013
---------------------------

* rename homegateway-rpc module to homegateway-firmware-mgmt
* split modules in augmentations and deviations
* remove deviations that remove if-featured nodes
* add descriptions to deviations, explaining why features/nodes are excluded
* add list of supported and unsupported features
* re-add timezones
* re-add stacked interfaces
* re-add static ARP entries as a troubleshooting tool
* remove serialnumber configuration node
* provide current firmware version as RO node or state data
* rename fw-id to job-id
* allow more than one firmware image

Version 0.1.0 - 04 Dec 2013
---------------------------

* project renamed to homegateway
* models converted to use IETF models instead of TR-069

Version 0.1.0 - 27 Sep 2013
---------------------------

* Initial version 0.1.0 of Yang specifications for OpenCPE, covering first 3 main use cases
* Addition of TR-181 Datamodel nodes Device.DeviceInfo and Device.RPC

Known Issues:

* Only partial rendering of Device.RPC, missing Device.RPC.CPE RPC specifications
* Partially wrong rendering of Device.DeviceInfo
