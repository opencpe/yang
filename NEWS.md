homegateway
===========

Collection of project documentation and Yang specs for homegateway.

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
