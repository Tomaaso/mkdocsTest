# PyFDA

This page explains how to generate coefficients for filter module.  
To do it we use pyFDA, it's a open source python program. To dowload it : 
``` console
pip install pyfda
```
And to launch it : 
``` console
pyfdax
```
## Import existing filter
Now you can load a an existing filter project (`.npz`) to autoconfigure different parameters.   
Files : [svn/NenuFar/trunk/receivers/RadioGAGA/doc/](https://svn.obs-nancay.fr/svn/NenuFar/trunk/receivers/RadioGAGA/doc/)  -- todo

![Figure 1 : Loading of rej_36M.npz](../figures/pyfda_npz.png)



## Export new set of coefficients
Now to generate a new filter you just have to modify frequency and weight parameters as your wish.  
Then when you are satisfied by the configuration, click on **b,a** tab, then set fields to **Dec** and **Integer** with **W = 16**
![Figure 2 : Exporting coefficients](../figures/pyfda_export.png)

Click on save button and save it in [svn/NenuFar/trunk/recepteur_LANewBa/trunk/firmware/HPAPB/src/PROCESSING_MODULES/filter/src/data/PyFDA/](https://svn.obs-nancay.fr/svn/NenuFar/trunk/recepteur_LANewBa/trunk/firmware/HPAPB/src/PROCESSING_MODULES/filter/src/data/PyFDA/)