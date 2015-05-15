#!/bin/sh

CODENAMES="precise trusty utopic"

debuild clean
rm -f ../icdiff_*

for CODENAME in $CODENAMES; do
    sed "s/%%CODENAME%%/${CODENAME}/g" debian/changelog.template > debian/changelog
    debuild -S -sa
    dput -f ppa:gslin/icdiff ../icdiff_*.changes
    debuild clean
    rm -f ../icdiff_*
done
