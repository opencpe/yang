PYANG ?= pyang
PLANTUML ?= plantuml

all: prepare_dirs homegateway.svg homegateway-firmware-mgmt.svg

prepare_dirs:
	mkdir -p img/ uml/

%.svg: %.uml
	$(PLANTUML) -tsvg -o ../ uml/$<
	mv img/$**.png img/$*.svg

homegateway.uml: specs/homegateway@2013-12-12.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ $< specs/ietf-interfaces@2013-07-04.yang specs/ietf-ip@2013-10-18.yang specs/ietf-system@2013-11-07.yang specs/homegateway-deviations@2013-12-12.yang specs/homegateway-system@2013-12-12.yang -o uml/$@

homegateway-firmware-mgmt.uml: specs/homegateway-firmware-mgmt@2013-12-12.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ $< -o uml/$@

%.uml: specs/%.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ $< -o uml/$@

clean:
	rm -rf img/
	rm -rf uml/
