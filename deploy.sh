#!/usr/bin/bash

cd ~
source stackrc

openstack overcloud deploy --templates \
-e /home/stack/templates/storage-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environment/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
-e /home/stack/templates/firstboot-environment.yaml \
--control-flavor control \
--compute-flavor compute \
--ceph-storage-flavor ceph-storage \
--control-scale 1 \
--compute-scale 1 \
--ceph-storage-scale 3 \
--ntp-server time.nist.gov \
--neutron-tunnel-types vxlan \
--neutron-network-type vxlan 
