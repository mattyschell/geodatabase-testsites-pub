import sys
import os
import logging
import pathlib

# SET PYTHONPATH=C:\xxx\geodatabase-toiler\src\py
import gdb
import fc
import cx_sde


if __name__ == "__main__":

    targetfcname = sys.argv[1]
    sourcefc     = sys.argv[2]

    targetsdeconn = os.environ['SDEFILE']
    targetgdb = gdb.Gdb(None
                       ,'sqlserver')

    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger(__name__)

    logger.info('importing {0}'.format(targetfcname))

    # We do not overwrite, we do not trust me  
    # Caller must delete as an explicit decision if thats desired on this target
    targetgdb.importtable(sourcefc
                         ,targetfcname)

    targetfc = fc.Fc(targetgdb
                    ,targetfcname)  

    logger.info('updating statistics on {0}'.format(targetfcname))

    output = targetfc.analyze(['BUSINESS'])

    logger.info('completed import of {0}'.format(targetfcname))
