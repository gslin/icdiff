#!/bin/sh

CODENAMES="precise trusty"

for CODENAME in $CODENAMES; do
    sed "s/%%CODENAME%%/${CODENAME}/" debian/changelog.template > debian/changelog
    debuild -S -sa
    dput ppa:gslin/icdiff ../icdiff_*.changes
done
