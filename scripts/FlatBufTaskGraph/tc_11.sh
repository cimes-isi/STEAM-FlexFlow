#!/bin/bash

tc qdisc del dev pp1eth parent ffff: >/dev/null 2>&1
tc qdisc add dev pp1eth ingress
tc qdisc del dev pp2eth parent ffff: >/dev/null 2>&1
tc qdisc add dev pp2eth ingress
tc qdisc del dev pp3eth parent ffff: >/dev/null 2>&1
tc qdisc add dev pp3eth ingress
tc qdisc del dev pp4eth parent ffff: >/dev/null 2>&1
tc qdisc add dev pp4eth ingress
tc filter add dev pp2eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.10.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:f8 pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp4eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.0.0/24 action pedit ex munge eth dst set 14:02:ec:ca:e4:dd pipe action mirred egress redirect dev pp1rdma
tc filter add dev pp4eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.4.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3b:a4 pipe action mirred egress redirect dev pp2rdma
tc filter add dev pp4eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.6.0/24 action pedit ex munge eth dst set 14:02:ec:ca:c5:ef pipe action mirred egress redirect dev pp3rdma
tc filter add dev pp4eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.7.0/24 action pedit ex munge eth dst set 14:02:ec:ca:e4:e1 pipe action mirred egress redirect dev pp1rdma
tc filter add dev pp4eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.4.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3b:a4 pipe action mirred egress redirect dev pp2rdma
tc filter add dev pp3eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.9.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:fc pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp4eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.7.0/24 action pedit ex munge eth dst set 14:02:ec:ca:e4:e1 pipe action mirred egress redirect dev pp1rdma
tc filter add dev pp3eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.10.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:f8 pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp1eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.10.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:f8 pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp2eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.10.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:f8 pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp1eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.10.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:f8 pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp3eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.10.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:f8 pipe action mirred egress redirect dev pp4rdma
tc filter add dev pp4eth prio 0 protocol ip parent ffff: flower skip_hw  dst_ip 10.100.6.0/24 action pedit ex munge eth dst set 14:02:ec:ca:c5:ef pipe action mirred egress redirect dev pp3rdma
tc filter add dev pp4eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.0.0/24 action pedit ex munge eth dst set 14:02:ec:ca:e4:dd pipe action mirred egress redirect dev pp1rdma
tc filter add dev pp3eth prio 0 protocol 802.1Q parent ffff: flower skip_hw vlan_ethtype ip dst_ip 10.100.9.0/24 action pedit ex munge eth dst set 34:80:0d:bc:3c:fc pipe action mirred egress redirect dev pp4rdma
arp -d 10.100.0.2 > /dev/null 2>&1
ip r d 10.100.0.2/32 > /dev/null 2>&1
arp -s 10.100.0.2 14:02:ec:ca:e4:dd -i pp1rdma
ip r a 10.100.0.2/32 src 10.100.11.1 dev pp1rdma
arp -d 10.100.1.1 > /dev/null 2>&1
ip r d 10.100.1.1/32 > /dev/null 2>&1
arp -s 10.100.1.1 14:02:ec:ca:e4:e1 -i pp1rdma
ip r a 10.100.1.1/32 src 10.100.11.1 dev pp1rdma
arp -d 10.100.2.2 > /dev/null 2>&1
ip r d 10.100.2.2/32 > /dev/null 2>&1
arp -s 10.100.2.2 34:80:0d:bc:3b:a8 -i pp2rdma
ip r a 10.100.2.2/32 src 10.100.11.2 dev pp2rdma
arp -d 10.100.3.2 > /dev/null 2>&1
ip r d 10.100.3.2/32 > /dev/null 2>&1
arp -s 10.100.3.2 34:80:0d:bc:3b:a8 -i pp2rdma
ip r a 10.100.3.2/32 src 10.100.11.2 dev pp2rdma
arp -d 10.100.4.4 > /dev/null 2>&1
ip r d 10.100.4.4/32 > /dev/null 2>&1
arp -s 10.100.4.4 34:80:0d:bc:3b:a4 -i pp2rdma
ip r a 10.100.4.4/32 src 10.100.11.2 dev pp2rdma
arp -d 10.100.5.1 > /dev/null 2>&1
ip r d 10.100.5.1/32 > /dev/null 2>&1
arp -s 10.100.5.1 14:02:ec:ca:e4:e1 -i pp1rdma
ip r a 10.100.5.1/32 src 10.100.11.1 dev pp1rdma
arp -d 10.100.6.4 > /dev/null 2>&1
ip r d 10.100.6.4/32 > /dev/null 2>&1
arp -s 10.100.6.4 14:02:ec:ca:c5:ef -i pp3rdma
ip r a 10.100.6.4/32 src 10.100.11.3 dev pp3rdma
arp -d 10.100.7.1 > /dev/null 2>&1
ip r d 10.100.7.1/32 > /dev/null 2>&1
arp -s 10.100.7.1 14:02:ec:ca:e4:e1 -i pp1rdma
ip r a 10.100.7.1/32 src 10.100.11.1 dev pp1rdma
arp -d 10.100.8.1 > /dev/null 2>&1
ip r d 10.100.8.1/32 > /dev/null 2>&1
arp -s 10.100.8.1 14:02:ec:ca:e4:e1 -i pp1rdma
ip r a 10.100.8.1/32 src 10.100.11.1 dev pp1rdma
arp -d 10.100.9.4 > /dev/null 2>&1
ip r d 10.100.9.4/32 > /dev/null 2>&1
arp -s 10.100.9.4 34:80:0d:bc:3c:fc -i pp4rdma
ip r a 10.100.9.4/32 src 10.100.11.4 dev pp4rdma
arp -d 10.100.10.4 > /dev/null 2>&1
ip r d 10.100.10.4/32 > /dev/null 2>&1
arp -s 10.100.10.4 34:80:0d:bc:3c:f8 -i pp4rdma
ip r a 10.100.10.4/32 src 10.100.11.4 dev pp4rdma
