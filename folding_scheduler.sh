#Check indoor temperature if possible else check outdoor temperature

#If indoor temperature is below 68 degrees, run folding@home
#Continuously check indoor temperature every 5 minutes?

systemctl start foldingathome.service
systemctl start foldingathome-nvidia.service

#If outdoor temperature is below 32 degrees, run folding@home
#Continuously check indoor temperature every 5 minutes?
systemctl start foldingathome.service
systemctl start foldingathome-nvidia.service
