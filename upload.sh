#!/bin/sh

CODENAMES="precise trusty"

debuild clean
rm ../icdiff_*

for CODENAME in $CODENAMES; do
    sed "s/%%CODENAME%%/${CODENAME}/" debian/changelog.template > debian/changelog
    debuild -S -sa
    dput ppa:gslin/icdiff ../icdiff_*.changes
    debuild clean
    rm ../icdiff_*
done
