# https://ask.openstack.org/en/question/67752/unable-to-delete-port/
# https://ask.openstack.org/en/question/54024/how-to-delete-a-subnet-in-neutron/
subnet_pattern=$1
subnet_ids=$(neutron subnet-list | grep $subnet_pattern | cut -d"|" -f2)
for i in $subnet_ids;
do
  	echo "subnet is $i"
        device_owner_ports=$(neutron port-list | grep gw1 | cut -d"|" -f2)
        for device_owner_port in $device_owner_ports;
        do
          	echo $device_owner_port
                neutron port-update  $device_owner_port --device-owner clear
        done

        port_ids=$(neutron port-list | grep $i | cut -d"|" -f2)
        for port in $port_ids;
        do
          	echo $port
                neutron port-delete $port
        done
	      neutron subnet-delete $i
done
