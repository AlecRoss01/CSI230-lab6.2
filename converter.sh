#!/bin/bash

usage()
{
        echo "$0 usage: [-f input file] [-c U(upper) or L(lower)]"
        exit 1
}

while getopts ":f:c:" options;
do
        case "${options}" in 
                f)
                f=${OPTARG}
                #TO DO IF FILE IS HERE , YAY! IF NOT USAGe
                if [ -f ${f} ];then
                        echo "${f} is a valid file"
                else
                        echo "${f} is an invalid file, does not exist"
                        exit 2
                fi
                ;;
                c)
                c=${OPTARG}
                if [[ ${c} == "U" || ${c} == "L" ]]; then
                        echo "${f} - ${c}"
                else
                        usage
                fi
                ;;
                *)
                usage
                ;;
        esac
done

while read line
do
        if [ ${c} == "U" ]; then
                echo $line | tr [:lower:] [:upper:]
        else
                echo $line | tr [:upper:] [:lower:]
        fi
done < $f
exit 0
