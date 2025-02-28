#!/bin/sh
#########################################################
version=2.2
description="BoHLALA" !!!

#########################################################

#########################################################
PACKAGE_DIR='BOHLALA/main'
MY_FILE="BoHLALA_FHD.tar.gz"
MY_FILE1="BO_HLALA_skin_V2.2.tar.gz"
MY_FILE2="addons1.tar.gz"
MY_FILE3="addons2.tar.gz"
#########################################################

MY_MAIN_URL="https://raw.githubusercontent.com/BoHLALA/"
MY_URL=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE
MY_URL1=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE1
MY_URL2=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE2
MY_URL3=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE3
MY_TMP_FILE="/tmp/"$MY_FILE
MY_TMP_FILE1="/tmp/"$MY_FILE1
MY_TMP_FILE2="/tmp/"$MY_FILE2
MY_TMP_FILE3="/tmp/"$MY_FILE3

rm -f $MY_TMP_FILE > /dev/null 2>&1
rm -f $MY_TMP_FILE1 > /dev/null 2>&1
rm -f $MY_TMP_FILE2 > /dev/null 2>&1
rm -f $MY_TMP_FILE3 > /dev/null 2>&1

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo 'Downloading '$MY_FILE1' ...'
echo $MY_SEP
echo 'Downloading '$MY_FILE2' ...'
echo $MY_SEP
echo 'Downloading '$MY_FILE3' ...'
echo $MY_SEP
echo ''
wget -T 2 $MY_URL -P "/tmp/"
wget -T 2 $MY_URL1 -P "/tmp/"
wget -T 2 $MY_URL2 -P "/tmp/"
wget -T 2 $MY_URL3 -P "/tmp/"

if [ -f $MY_TMP_FILE ]; [ -f $MY_TMP_FILE1 ]; [ -f $MY_TMP_FILE2 ]; [ -f $MY_TMP_FILE3 ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xf $MY_TMP_FILE -C /
	tar -xf $MY_TMP_FILE1 -C /
	tar -xf $MY_TMP_FILE2 -C /
	tar -xf $MY_TMP_FILE3 -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1
	rm -f $MY_TMP_FILE1 > /dev/null 2>&1
	rm -f $MY_TMP_FILE2 > /dev/null 2>&1
	rm -f $MY_TMP_FILE3 > /dev/null 2>&1

	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then
        echo "#########################################################"
        echo "#    BoHLALA Skin $version INSTALLED SUCCESSFULLY       #"
        echo "#             BY BoHLALA - support on                   #"
        echo "#   https://www.tunisia-sat.com/forums/forums/182/      #"
        echo "#########################################################"
        echo "#           your Device will RESTART Now                #"
        echo "#########################################################"		
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4; sleep 4; init 3;
		fi
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	echo ''
	echo '**************************************************'
	echo '**                   FINISHED                   **'
	echo '**************************************************'
	echo ''
	exit 0
else
	echo ''
	echo "Download failed !"
	exit 1
fi
# ------------------------------------------------------------------------------------------------------------
