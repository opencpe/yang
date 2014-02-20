PYANG ?= pyang
PLANTUML ?= plantuml

all: clean prepare_dirs opencpe-system.svg opencpe-firmware-mgmt.svg

prepare_dirs:
	mkdir -p img/ uml/

%.svg: %.uml
	$(PLANTUML) -tsvg -o ../ uml/$<
	mv img/$**.png img/$*.svg

opencpe-system.uml: specs/opencpe-system@2014-01-27.yang
	$(PYANG) \
    --uml-description \
    --uml-footer='' \
    -f uml \
    -p specs/ $< \
    specs/ietf-interfaces@2013-07-04.yang \
    specs/ietf-ip@2013-10-18.yang \
    specs/ietf-system@2013-11-07.yang \
    specs/opencpe-deviations@2014-01-12.yang \
    specs/opencpe-system@2014-01-27.yang \
    --features ietf-system:authentication,local-users,timezone-location,crypt-hash-md5,crypt-hash-sha-256,crypt-hash-sha-512,ntp \
    --features opencpe-firmware-mgmt:firmware-slots \
    --deviation-module specs/opencpe-deviations@2014-01-12.yang \
    -o uml/$@

opencpe-firmware-mgmt.uml: specs/opencpe-firmware-mgmt@2014-02-06.yang
	$(PYANG) \
    --uml-description \
    --uml-footer='' \
    -f uml \
    -p specs/ $< \
    --features opencpe-firmware-mgmt:firmware-slots \
    -o uml/$@

%.uml: specs/%.yang
	$(PYANG) --uml-description --uml-footer='' -f uml -p specs/ $< -o uml/$@

clean:
	rm -rf img/
	rm -rf uml/
