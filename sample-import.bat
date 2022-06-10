REM change these 
set DBENV=XXX
set DBNAME=XXX_XXXXXX_XXX
REM unmask these
set BASEPATH=C:\xxx
set NOTIFY=xxx@xxxx.xxx.xxx
set NOTIFYFROM=xx-xxxxxx@xxxx.xxx.xxx
set SMTPFROM=xxxxxxxxx.xxxxxx
REM review these should be good
set THISREPO=geodatabase-testsites-pub
set THISPUB=%BASEPATH%\%THISREPO%\
set SDEFILE=%BASEPATH%\connections\sqlserver\%DBENV%\%DBNAME%\sl_%DBNAME%_gispub.sde
set TARGETFC=oti_covidtestingsites
set SOURCEFC=%THISPUB%\data\testingsiteslist.csv
set TARGETLOGDIR=%BASEPATH%\geodatabase-scripts\logs\%THISREPO%\
set TOILER=%BASEPATH%\geodatabase-toiler\
set PYTHONPATH=%TOILER%src\py;%THISPUB%
set PROPY=c:\Progra~1\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe
set BATLOG=%TARGETLOGDIR%\%THISREPO%.log
echo starting %THISREPO% import to target %TARGETFC% on %date% at %time% > %TARGETLOGDIR%import.log
%PROPY% %THISPUB%src\py\delete.py %TARGETFC% && (
   echo. deleted target %TARGETFC% on %date% at %time% >> %BATLOG%
) || (
  %PROPY% %THISPUB%src\py\notify.py ": Failed to delete %TARGETFC% on %SDEFILE%" %NOTIFY% "import" && EXIT /B 1
)  
%PROPY% %THISPUB%src\py\import.py %TARGETFC% %SOURCEFC% && (
   echo. >> %BATLOG% echo imported target %TARGETFC% on %date% at %time% >> %BATLOG%
) || (
%PROPY% %THISPUB%src\py\notify.py ": Failed to import %TARGETFC% on %SDEFILE%" %NOTIFY% "import" && EXIT /B 1
) 
