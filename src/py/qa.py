import sys
import os
import logging
import pathlib

# SET PYTHONPATH=C:\xxx\geodatabase-toiler\src\py
import gdb
import fc
import cx_sde


def fetchsql(whichsql
            ,database):

    sqlfilepath = pathlib.Path(__file__).parent.parent \
                                        .joinpath('sql_{0}'.format(database)) \
                                        .joinpath(whichsql)
        
    with open(sqlfilepath, 'r') as sqlfile:
        sql = sqlfile.read() 

    return sql 


if __name__ == "__main__":

    targetfcname = sys.argv[1]

    targetsdeconn = os.environ['SDEFILE']
    targetgdb = gdb.Gdb(None
                       ,'sqlserver')

    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger(__name__)

    logger.info('performing qa on {0}'.format(targetfcname))

    qareport = os.linesep

    recordkount = cx_sde.execute_immediate(targetsdeconn
                                          ,fetchsql('checkcount.sql'
                                                    ,targetgdb.database))
    
    if recordkount < 25:

        qareport = qareport + os.linesep \
                + 'record count of {0} is suspicious'.format(recordkount)

    expectedcols = cx_sde.execute_immediate(targetsdeconn
                                           ,fetchsql('checkcolumns.sql'
                                                     ,targetgdb.database))

    if expectedcols < 36:

        qareport = qareport + os.linesep \
                + 'missing expected columns'


    if len(qareport) > 4:

        # 4 allows for a pair of sloppy CRLFs
        logging.error(qareport)

