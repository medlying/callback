#!/bin/bash

env| grep PROJECT_ENV

if [ $PROJECT_ENV = "dev" ];then 
	echo "This is dev env"
	/opt/app/bin/run.sh
elif [ $PROJECT_ENV = "qa" ];then
	echo "This is qa env "

	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GRDSDBHOST01/XC2GRDSDBHOST01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GRDSDBHOST01/XC2GRDSDBHOST01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBHOST01/XC2GSQLDBHOST01/g' {} \; 2> /dev/null
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBHOST01/XC2GSQLDBHOST01/g' {} \; 2> /dev/null  
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBUSER01/XC2GSQLDBUSER01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBUSER01/XC2GSQLDBUSER01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBPAWD01/XC2GSQLDBPAWD01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBPAWD01/XC2GSQLDBPAWD01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/CORPTENV/XC2GCUSTOMKEY01/g' {} \; 2> /dev/null
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/CORPTENV/XC2GCUSTOMKEY01/g' {} \; 2> /dev/null
	/opt/app/bin/run.sh
elif [ $PROJECT_ENV = "prod" ];then
	echo "This is prod env"
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GRDSDBHOST01/PC2GRDSDBHOST01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GRDSDBHOST01/PC2GRDSDBHOST01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBHOST01/PC2GSQLDBHOST01/g' {} \; 2> /dev/null
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBHOST01/PC2GSQLDBHOST01/g' {} \; 2> /dev/null  
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBUSER01/PC2GSQLDBUSER01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBUSER01/PC2GSQLDBUSER01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBPAWD01/PC2GSQLDBPAWD01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBPAWD01/PC2GSQLDBPAWD01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/CORPTENV/PC2GCUSTOMKEY01/g' {} \; 2> /dev/null
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/CORPTENV/PC2GCUSTOMKEY01/g' {} \; 2> /dev/null
	/opt/app/bin/run.sh
elif [ $PROJECT_ENV = "loadtest" ];then
	echo "This is  lt env"
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GRDSDBHOST01/LC2GRDSDBHOST01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GRDSDBHOST01/LC2GRDSDBHOST01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBHOST01/LC2GSQLDBHOST01/g' {} \; 2> /dev/null
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBHOST01/LC2GSQLDBHOST01/g' {} \; 2> /dev/null  
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBUSER01/LC2GSQLDBUSER01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBUSER01/LC2GSQLDBUSER01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/IC2GSQLDBPAWD01/LC2GSQLDBPAWD01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/IC2GSQLDBPAWD01/LC2GSQLDBPAWD01/g' {} \; 2> /dev/null 
	find /opt/app/ -name '*.sh' -exec sed -i '' -e 's/CORPTENV/LC2GCUSTOMKEY01/g' {} \; 2> /dev/null
	find /opt/app/ -name '*.tpl' -exec sed -i '' -e 's/CORPTENV/LC2GCUSTOMKEY01/g' {} \; 2> /dev/null
	/opt/app/bin/run.sh
fi
