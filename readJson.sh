#!/bin/sh

function readJson {  
  UNAMESTR=`uname`
  if [[ "$UNAMESTR" == 'Linux' ]]; then
    SED_EXTENDED='-r'
  elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    SED_EXTENDED='-E'
  fi; 

  VALUE=`grep -m 1 "\"${2}\"" ${1} | sed ${SED_EXTENDED} 's/^ *//;s/.*: *"//;s/",?//'`

  if [ ! "$VALUE" ]; then
    echo "Error: Cannot find \"${2}\" in ${1}" >&2;
    echo "false"
  else
    echo $VALUE ;
  fi; 
}

NAME=`readJson a.json name`; 
DESC=`readJson a.json description`;
ROLL=`readJson a.json roll`;

echo $NAME 
echo $DESC
echo $ROLL
