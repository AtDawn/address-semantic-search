#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd`
cd ..
DEPLOY_DIR=`pwd`
CONF_DIR=$DEPLOY_DIR/conf

if [ ! -d $DEPLOY_DIR/log ]; then
    mkdir $DEPLOY_DIR/log
fi

LIB_DIR=$DEPLOY_DIR/lib
LIB_JARS=`ls $LIB_DIR | grep .jar | awk '{print "'$LIB_DIR'/"$0}' | tr "\n" ":"`

echo -e "Starting the service ...\c"
java -classpath $CONF_DIR:$LIB_JARS com.rrs.rd.address.service.AddressFileImporter 