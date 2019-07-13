
Once you did with terrafrom apply, ssh on to the instance

    ssh -i <youkey>.pem -l ubuntu <ipaddress>

now assume root user privilage
    sudo -s

get  all device volume information
df -h

now create a volume to  mount the new ebs volume we have created
    mkfs.ext4  <volume name> # we have used  /dev/xvdh as the device volume name as part of resource "aws_volume_attachment"  in instance.tf  file
    mkdir /data
    mount /dev/xvdh /data

#now even when you restart the instance the data saved in /data will be saved but the volume we mounted will be gone as it's a temporary mount. Let's make the mount persistent
    vim /etc/fstab
add a line as below
    /dev/xvdh /data ext4 defaults 0 0
save and exit vim

now you can unmount /data volume
    unmount /data

now to mount back /data we can just use below command instaed of mount /dev/xvdh /data
    mount /data
