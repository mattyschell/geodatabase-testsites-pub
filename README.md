# geodatabase-testsites-pub

We will publish a comma separated value file of COVID-19 testing site locations to an ESRI Enterprise Geodatabase and also to ArcGIS Online.  Friends, this our test locations publishing process, our rules, the trick is never to be afraid.


## Dependencies

   * [ESRI ArcGIS Pro python 3.x](https://pro.arcgis.com/en/pro-app/arcpy/get-started/installing-python-for-arcgis-pro.htm) 
   * [geodatabase-toiler](https://github.com/mattyschell/geodatabase-toiler) on PYTHONPATH


## Import to Publishing Database and QA

For now we expect the csv to be here:

    data\testingsiteslist.csv

Copy sample-import.bat to import.bat and update the environmentals at the top.

```
> import.bat
```



## Publish

TBD