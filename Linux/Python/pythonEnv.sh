#!/bin/bash

if (  ! */bin/activate "exists" ):
	echo "New env name: "
	read Name
	python3 -m venv $Nmae

source $Nmae/bin/activate
