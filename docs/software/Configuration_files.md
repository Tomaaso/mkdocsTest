# Configuration files for RadioGaga

## Presentation of files
This page will describe how configuration files works for RadioGaGa.  
There are 2 types of files:  


### **startup_configuration_board_X.conf** 

Contains all command to configure radiogaga module at the startup of the service. This files should load stable commands to enable the same startup each times. 

!!! warning
     Need to generate one file by board

This include : 

- Load filter coefficients and configure shift.
- Apply a value of K and a shift for the trigger, not so low for prevent too much detection. 
- Configure the register in SumX, `'0'` for the last board, `'1'` for others.
- UDP_sender : 
    - enable or not to send frames to TBB
    - set the delay time on TS to delete the traitment time.
    - Configure IP, mac address and port of TBB

### **recursive_configuration_board_X.conf**

Those files allow to reconfigure specifics registers at each new pointing .  

!!! warning
     Need to generate one file by board

This include :   

- Change coefficients and shift of filters.
- Set a new value to K and shift for the trigger.
- Allow to disable some MR in presum if there are some parasites or something else.

## How to generate them ? 

To generate those files there are 2 python scripts which take .yaml files to set different constant and parameters.  
Path : [svn/NenuFar/trunk/receivers/RadioGAGA/software/configuration_files/](https://svn.obs-nancay.fr/svn/NenuFar/trunk/receivers/RadioGAGA/software/configuration_files/)

=== "config_startup.yaml"
     ``` yaml
     # Input file to generate startup configurations files.
     board:
     #Board 0
     - 0:
     filter: 
          - 0:
          path: band_24-76.conf
          shift: 15
          - 1:
          path: rej_36.conf
          shift: 15
          - 2:
          path: rej_73.conf
          shift: 15

     trigger:
          k : 200              
          time_up_val_min : 2
          time_up_val_max : 10
          seuil_delay :  32   

     udp_sender:
          # TBB ip configuration
          mac: ff:ff:ff:ff:ff:ff
          ip: 192.168.7.128
          port: 1242
          delay: 64
          enable: 1
     etc ...
     ```
=== "config_recursive.yaml"
     ``` yaml
     # Input file to generate recursive configurations files.
     board:
     #Board 0
     - 0:
     filter: 
          - 0:
          path: band_24-76.conf
          shift: 15
          - 1:
          path: rej_36.conf
          shift: 15
          - 2:
          path: rej_73.conf
          shift: 15

     trigger:
          k : 200              
          time_up_val_min : 2
          time_up_val_max : 10
          seuil_delay :  32   


     # Board 1 
     - 1:
     filter: 
          - 0:
          path: band_24-76.conf
          shift: 15
          - 1:
          path: rej_36.conf
          shift: 15
          - 2:
          path: rej_73.conf
          shift: 15
     etc...
     ```
Before to run it you should have an updated working copy of the firmware : 
[svn/NenuFar/trunk/recepteur_LANewBa/trunk/firmware/HPAPB/](https://svn.obs-nancay.fr/svn/NenuFar/trunk/recepteur_LANewBa/trunk/firmware/HPAPB/)  
And export the $HPAPB_ROOT_DIR environment variable. Example : 
```
export HPAPB_ROOT_DIR="/home/berthet/Nancay/Nenufar/HPAPB/"
```
Then just need to run the appropriate python script

=== "startup"
     ```bash 

     python gen_startup_configuration.py
     ```
=== "recursive"
     ``` 

     python gen_recursive_configuration.py
     ```

After running scripts. Configurations files are generated, they have the same format than `HPAPB_ADC.conf` or others.  
Example : 

=== "startup_configuration_board_0.conf"
     ```conf 
     # Recursive configuration files for board 0

     ####################
     # Filter 0
     ####################
     # Coef : 
     W 1370000 ffffffcb 
     W 1370001 22 
     W 1370002 2c 
     W 1370003 46 
     W 1370004 ffffffe2 
     W 1370005 ffffffff 
     W 1370006 fffffff0 
     W 1370007 ffffffac 
     W 1370008 8 
     W 1370009 ffffffff 
     W 137000a 6 
     W 137000b 70 
     ...
     ```

