#!/bin/bash

cd ./packages
mkdir jdtls-1.51
cd jdtls-1.51

wget https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.51.0/jdt-language-server-1.51.0-202510022025.tar.gz

tar -xf jdt-language*
rm *.tar.gz

