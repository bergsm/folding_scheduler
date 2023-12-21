#Check indoor temperature if possible else check outdoor temperature

#If indoor temperature is below 68 degrees, run folding@home
#Continuously check indoor temperature every 5 minutes?

#systemctl start foldingathome.service
#systemctl start foldingathome-nvidia.service

#If outdoor temperature is below 32 degrees, run folding@home
while true
do
    outdoor_temp=$(curl -Ss https://wttr.in/?format="%t" | sed 's/[^0-9]*//g')

    if [ $outdoor_temp -lt 32 ]
    then
        echo "Outdoor temperature is below 32 degrees, starting folding@home"
        systemctl start foldingathome.service
        systemctl start foldingathome-nvidia.service
    else
        echo "Outdoor temperature is above 32 degrees, stopping folding@home"
        systemctl stop foldingathome.service
        systemctl stop foldingathome-nvidia.service
    fi

    sleep 900
    #Check if past 0700, if so stop folding@home and exit
    current_time=$(date +%H%M)
    if [ $current_time -gt 0700 ]
    then
        echo "It is past 0700, stopping folding@home"
        systemctl stop foldingathome.service
        systemctl stop foldingathome-nvidia.service
        exit
    fi
done
