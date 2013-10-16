PYANG ?= pyang
PLANTUML ?= plantuml

all: prepare_dirs ietf-inet-types.svg ietf-yang-types.svg Device.RPC.svg Device.DeviceInfo.svg opencpe-system.svg

prepare_dirs:
	mkdir -p img/ uml/

%.svg: %.uml
	$(PLANTUML) -tsvg -o ../ uml/$<
	mv img/$**.png img/$*.svg

Device.DeviceInfo.uml: specs/Device.DeviceInfo.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ specs/Device.DeviceInfo.VendorConfigFile.yang specs/Device.DeviceInfo.SupportedDataModel.yang specs/Device.DeviceInfo.NetworkProperties.yang $< -o uml/$@

Device.RPC.uml: specs/Device.RPC.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ specs/Device.RPC.CPE.yang $< -o uml/$@

%.uml: specs/%.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ $< -o uml/$@

clean:
	rm -rf img/
	rm -rf uml/
