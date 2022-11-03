#!/bin/bash
#
# Recode The Copyright Will Not Make You A Coder
#
# Files Analysis
# Files Enumeration
#
# Version : 1.0 | Codename : analyzer
# Coded by : gh0st | scp
#
# Tested on : Kali Linux
# I highly recommend using this tool on Kali Linux OS
#
# More Info : https://github.com/gh0st-anonymous
#
# Remember To Use For Educational Purpose only
# Im Not Responsible Of Anything That Might Happen
# Use At Your Own Risk


#change automatically from .sh to Xcutable file
sudo chmod +x $0
#cannot be rename on purpose
mv -n $0 analyzer

#set the color variable
#L...=Less...
  RED='\e[1;91m'
  LRED='\e[0;91m'
  BLUE='\e[1;94m'
  LBLUE='\e[0;94m'
  GREEN='\e[1;92m'
  LGREEN='\e[0;92m'
  ORANGE='\e[1;93m'
  LORANGE='\e[0;93m'
  PURPLE='\e[1;95m'
  LPURPLE='\e[0;95m'

#stop the color variable
  STOP='\e[0m'


	##########################################################################
	# arguments script=true / if false, the standard script will run	 #
	# this part will be skiped if 0 or incorrect arguments have been written #
	##########################################################################

#$1 is the alias of the first input
#info menu
                if [[ $1 = -i || $1 = --info ]]
                then
                #clear
                sleep 0.5

		echo ""
		echo -e "\e[4mUsage & Info details\e[0m:"
		echo ""
		echo -e " - analyzer is a script to analyze and retrieve data from memory and hard disk drive files using: ${LGREEN}volatility${STOP}, ${LGREEN}bulk_extractor${STOP}, ${LGREEN}binwalk${STOP}, ${LGREEN}foremost${STOP}, ${LGREEN}strings${STOP}"
		echo -e " - have 3 way to analyze the wanted file: 1=standard bash script, 2=argument script, 3=flags script. ${LORANGE}(${STOP}using arguments${LORANGE})${STOP}"
		echo -e " - capable of doing almost every volatility commands since not every one of them use the same option. ${LORANGE}(${STOP}if your suggested profile is for example VistaSP1x86, some command could require for example WinSP2x86${LORANGE})${STOP}"
		echo -e " - check if the new supposed output file or directory is already created. ${LORANGE}(${STOP}instead of ${LRED}:: ${STOP}error cant write on ${ORANGE}'${STOP}file.txt${ORANGE}'${STOP} because this file exist ${LRED}::${STOP} you'll get file.2 or dir.2 then 3, 4 ect...${LORANGE})${STOP}"
		echo -e " - check for every errors possible. ${LORANGE}(${STOP}correct path, correct answers as input, if the mem file choosen is truly a mem file${LORANGE})${STOP}"
		exit

#help menu
		elif [[ $1 = -h || $1 = --help ]]
		then
		clear
		sleep 0.5

                echo ""
                echo -e "\e[4mExamples\e[0m:"
		echo ""
		echo -e "${GREEN}$ ${STOP}if the script is runned using false flags or arguments, it will run as normal ${GREEN}$ ${STOP}"
		echo ""
                echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} bash analyzer ${LORANGE}or${STOP} ${RED}sudo${STOP} ./analyzer ${LRED}[${STOP}standard script${LRED} - ${STOP}advanced option${LRED}]${STOP}"
                echo ""
		echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} bash analyzer ${LPURPLE}--info${STOP}"
		echo ""
                echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} bash analyzer ${LPURPLE}-f${STOP} ${LORANGE}<${STOP}file type${LORANGE}>${STOP} ${LPURPLE}-p${STOP} ${LORANGE}<${STOP}file path${LORANGE}>${STOP} ${LPURPLE}-o${STOP} ${LORANGE}<${STOP}output file${LORANGE}>${STOP} ${LPURPLE}-sp${STOP} ${LORANGE}<${STOP}suggested profile${LORANGE}>${STOP} ${LPURPLE}-c${STOP} ${LORANGE}<${STOP}command${LORANGE}>${STOP}"
                echo ""
                echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} ./analyzer ${LORANGE}<${STOP}mem${LORANGE}>${STOP} ${LORANGE}<${STOP}/home/usr/test.mem${LORANGE}>${STOp} ${LORANGE}<${STOP}memExtracted${LORANGE}>${STOP} ${LORANGE}<${STOP}VistaSP1x86${LORANGE}>${STOP} ${LORANGE}<${STOP}psxview${LORANGE}>${STOP}"
		echo ""
		echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} ./analyzer ${LORANGE}<${STOP}HDD${LORANGE}>${STOP} ${LORANGE}<${STOP}/home/usr/test.hdd${LORANGE}>${STOp} ${LORANGE}<${STOP}binExtracted${LORANGE}>${STOP}"

		echo ""
                echo ""
                echo -e "\e[4mOptions\e[0m:"
                echo ""
		echo -e "${PURPLE}-h${STOP} | ${PURPLE}--help${STOP}                    Display help and usage details."
		echo -e "${PURPLE}-i${STOP} | ${PURPLE}--info${STOP}                    Display info details."
                echo -e "${PURPLE}-v${STOP} | ${PURPLE}--version${STOP}                 Display current software version."
		echo ""
                echo -e "${PURPLE}-f${STOP} | ${PURPLE}--file-type${STOP}               File type to analyze. ${LRED}[${STOP}${LBLUE}mem${STOP}${LRED}/${STOP}${LBLUE}hdd${STOP}${LRED}]${STOP}"
                echo -e "${PURPLE}-p${STOP} | ${PURPLE}--path${STOP}                    Path of the wanted file to analyze."
                echo -e "${PURPLE}-o${STOP} | ${PURPLE}--output-file${STOP}             Save the output file."
		echo -e "${PURPLE}-sp${STOP}| ${PURPLE}--suggested-profile${STOP}       Suggested profile from ${ORANGE}'${STOP}image info${ORANGE}'${STOP}. ${LRED}[${STOP}available for ${LBLUE}mem${STOP} analysis only!${LRED}]${STOP}"
		echo -e "${PURPLE}-c${STOP} | ${PURPLE}--command${STOP}                 Command to execute ${LORANGE}(${STOP}./volatility -h${LORANGE})${STOP}. ${LRED}[${STOP}available for ${LBLUE}mem${STOP} analysis only!${LRED}]${STOP}"
                echo -e "			      ${LRED}[${STOP}the output file will be automatically rename as the command name${LRED}]${STOP}"

                echo ""
                echo -e "\e[4mSupported Tools\e[0m:"
                echo ""
                echo -e "|    ${BLUE}MEM${STOP}     |    ${BLUE}HDD${STOP}    |    ${LORANGE}(${STOP}more tools are available using the advanced script option only${LORANGE})${STOP}"
                echo    "|____________|___________|"
                echo    "|            |           |"
                echo    "| Volatility |  Binwalk  |"

                echo ""
                echo ""
                sleep 1
                echo -e " - dont forget going to ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
                sleep 1
                echo ""
                exit

#version menu
		elif [[ $1 = -v || $1 = --version ]]
		then
		echo ""
		echo " analyzer - Version 1.0.0"
		exit
		fi


#User Root Identifier
                if [[ $EUID -ne 0 ]]
                then
                sleep 1
                echo ""
                echo -e "${ORANGE}[i]${STOP} must run as root, type 'sudo su' to get root access."
                echo ""
                echo -e "${ORANGE}[i]${STOP} if this script isn't run as root and instead runned as 'sudo bash ${LORANGE}<${STOP}$0${LORANGE}>${STOP}', some errors might occur."
                exit
                fi


#giving aliases to the input arguments
#for MEM and HDD
file=$1
path=$2
output=$3

#for MEM only
profile=$4
command=$5


	#########################################################################
	# arguments and flags script options using arguments instead of GETOPTS #
	# this part will be skipped if 0 or incorrect flags have been written   #
	#########################################################################


#error message such as 'else ; echo -e "${LPURPLE}$1${STOP} is not an option" ; exit ; fi' will disable the standard arguments script option

			if [[ $1 = -f || $1 = --file-type ]]
			then
			file=$2

				if [[ $3 = -p || $3 = --path ]]
				then
				path=$4
				fi

					if [[ $5 = -o || $5 = --output-file ]]
					then
					output=$6
					fi

						if [[ $7 = -sp || $7 = --suggested-profile ]]
						then
						profile=$8
						fi

							if [[ $9 = -c || $9 = --command ]]
							then
							command=${10}
							fi
			fi


#HDD analyze option
#installing the needed tools
#run commands to the background with 'tmux new -d' (it might create some issues so we are making pauses using 'sleep')

                if [[ $file = HDD || $file = hdd ]]
                then

        tmux new -d sudo apt install binwalk

		clear
                sleep 1
		echo ""
		echo -e "[${BLUE}+${STOP}] Hard Disk Drive analysis in progress."

		sleep 1
		mkdir -p /home/Stats
		mkdir -p /home/hddExtracted
		sleep 2.5

		cd /home/hddExtracted/
#if the output dir was already created create another $dir.$i
                              dir=$output

                                      if [[ -e $dir || -L $dir ]] ; then

                                              i=2
                                              while [[ -e $dir.$i || -L $dir.$i ]] ; do
                                              let i++
                                              done

                                              output=$dir.$i
                                      fi

			tmux new -d binwalk --run-as=root --extract --directory /home/hddExtracted/$output $path

#saving statistics
                date=$(date)
                	echo -e " \n \n${BLUE}\e[4mStatistics file:\e[0m${STOP} \n \n ${BLUE}-${STOP} analyze made on: ${LORANGE}$date${STOP} \n ${BLUE}-${STOP} file type searched: $file \n ${BLUE}-${STOP} file path location: $path \n ${BLUE}-${STOP} tool(s) used: ${LGREEN}binwalk${STOP} \n ${BLUE}-${STOP} filtered argument: ${LRED}unavailable${STOP} \n ${BLUE}-${STOP} output path location: /home/hddExtracted/$output" >> /home/Stats/hdd.stats

		echo ""
		echo -e "[${BLUE}+${STOP}] path to the new created directory: /home/hddExtracted/$output"
                echo ""
                sleep 2
                echo -e " - dont forget going to ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
		exit


#MEM analyze option
                elif [[ $file = MEM || $file = mem ]]
                then
		clear


#check if volatility is installed
volatility=$(locate /volatility_2.6_lin64_standalone | head -1)

                if [[ "$volatility" = "" ]]
                then
                        sudo updatedb

                        sleep 1.2
                        echo ""
                        echo -e "[${RED}-${STOP}] volatility package: ${LRED}not installed${STOP}"
                        echo ""

                        wget -nc -q downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip
                        unzip -q volatility_2.6_lin64_standalone.zip
                        sudo rm -rf volatility_2.6_lin64_standalone.zip
                        chmod +x volatility_2.6_lin64_standalone

			sudo updatedb
		fi


#check if the path exist
                check=$(locate $path)

                        if [[ -z "$check" ]]
                        then
                        echo ""
                        echo -e "${ORANGE}[i]${STOP} '$path' doesn't exist on your system."
                        exit
                        fi


#check if the unknown file a truly a mem file, if no exit
#check mem file step
				pwd=$(locate /volatility_2.6_lin64_standalone | head -1)
                                check=$($pwd/./volatility_2.6_lin64_standalone -f $path imageinfo | awk '{print $4 $5}' | grep Nosuggestion)

                                        if [[ $check = Nosuggestion ]]
                                        then
                                        echo ""
                                        echo -e "${RED}ERR${STOP}::not a mem file::scan aborted."
                                        exit
		                        fi


					clear
					echo ""
					echo -e "[${BLUE}+${STOP}] Memory analysis in progress."
					echo ""

                			sudo mkdir -p /home/memExtracted
                			sleep 1

        		        	sudo mkdir -p /home/Stats
	        		        sleep 1

#getting to the 'memExtracted' directory, because it can check for existing file from the inside of the directory only
					cd /home/memExtracted

#checking if the same '$command' was analyzed, if yes it will create '$output.1' then '$output.2' ect ...
#checking all kind of analyzed output if they were(dir,log,dmp)
                        		output=$command

                        			if [[ -e $output.log || -L $output.log || -e $output.dmp || -L $output.dmp || -e $output || -L $output ]] ; then

                                			i=2
                                			while [[ -e $output.$i.log || -L $output.$i.log || -e $output.$i.dmp || -L $output.$i.dmp || -e $output.$i || -L $output.$i ]] ; do
                                			let i++
                                			done

                                			output=$output.$i
                        			fi


#checking different kind of commands
#giving aliases if a specific command have been choosen
#saving the analyzed output

	  sleep 2
          echo -e "[${GREEN}+${STOP}] the analyze could take some time, be patient."
          echo ""

			if [[ $command = volshell ]]
			then
			sleep 2
			echo -e "[${ORANGE}|${STOP}] volshell is a command to access the shell through volatility, no output file will be saved since volshell is on live."
			echo -e "${LORANGE}---${STOP}"
			sleep 1
                        echo -e "[${ORANGE}|${STOP}] you now have access to the memory shell, press ctrl+c to abort. (it might take a few tries)"
                        echo ""
			sleep 1
#voshell
					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command

				cd /home/
                                echo ""
                                date=$(date)
                                echo -e " \n \n${BLUE}\e[4mStatistics file:\e[0m${STOP} \n \n ${BLUE}-${STOP} analyze made on: ${LORANGE}$date${STOP} \n ${BLUE}-${STOP} file type searched: $file \n ${BLUE}-${STOP} file path location: $path \n ${BLUE}-${STOP} suggested profil used: ${LGREEN}$profile${STOP} \n ${BLUE}-${STOP} volatility command used: ${LPURPLE}$command${STOP}  \n ${BLUE}-${STOP} no output saved" >> /home/Stats/mem.stats
                                sleep 2
                                echo -e " - dont forget going to ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
				exit


			elif [[ $command = dlldump || $command = dumpcerts || $command = dumpfiles || $command = dumpregistry || $command = procdump || $command = moddump || $command = vaddump || $command = memdump ]]
			then
			ex="directory"
			i=""
			mkdir -p $output
#dump files
					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --dump-dir=$output



                        elif [[ $command = yarascan ]]
                        then
			ex="directory"
			i=""
                        mkdir -p $output

                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --yara-rules=string --output-file=$output/yara.string.scn
				echo ""
                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --yara-rules=regex --output-file=$output/yara.regex.scn
				echo ""
                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --yara-rules=bytes --output-file=$output/yara.bytes.scn



			elif [[ $command = raw2dmp || $command = imagecopy ]]
			then
			ex="file"
			i=".dmp"
#image files
					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --output-image=$output.dmp



			elif [[ $command = imageinfo || $command = vadinfo || $command = verinfo ]]
			then
			ex="file"
			i=".inf"
#log files
					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --output-file=$output.inf



			else
			ex="file"
			i=".log"
                        		$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --output-file=$output.log
			fi

#exiting from memExtracted DIR and getting back to the main directory
					cd /home/

#saving statistics
        	date=$(date)

                	echo -e " \n \n${BLUE}\e[4mStatistics file:\e[0m${STOP} \n \n ${BLUE}-${STOP} analyze made on: ${LORANGE}$date${STOP} \n ${BLUE}-${STOP} file type searched: $file \n ${BLUE}-${STOP} file path location: $path \n ${BLUE}-${STOP} suggested profil used: ${LGREEN}$profile${STOP} \n ${BLUE}-${STOP} volatility command used: ${LPURPLE}$command${STOP} \n ${BLUE}-${STOP} output path location: /home/memExtracted/$output$i" >> /home/Stats/mem.stats

		echo ""
		echo -e "[${BLUE}+${STOP}] path to the new created $ex: /home/memExtracted/$output$i"
                echo ""
                sleep 2
                echo -e " - dont forget going to ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
                exit
		fi


        ####################################################################
        # standard script option / advanced option                	   #
        # this part will be run if 0 or incorrect flags have been written  #
        ####################################################################


#User Root Identifier
#welcoming the new user
function ROOT()
{

                if [[ $EUID -ne 0 ]]
                then
                sleep 1
                echo ""
                echo -e "${ORANGE}[i]${STOP} must run as root, type 'sudo su' to get root access."
                echo ""
                echo -e "${ORANGE}[i]${STOP} if this script isn't run as root and instead runned as 'sudo bash ${LORANGE}<${STOP}$0${LORANGE}>${STOP}', some errors might occur."
                exit
                fi

        clear
        echo ""
        echo -e "${LRED}\e[5mWARNING!!!${STOP} "
        echo ""
        echo -e "${RED}[i]${STOP} Analyzer (c) 2022 by gh0st - Please do not use in military or secret service organizations, or for illegal purposes."
        echo ""
        sleep 5
        echo -e "${RED}[i]${STOP} you have been warned, continue at your own risk."
        sleep 1.5
        echo ""
        read -p "$(echo -e ${RED}[i]${STOP}) press Any Key to continue, type X to abort: "     aware

                if [[ $aware = X || $aware = x ]]
                then
                sleep 3
                echo ""
                echo -e "${RED}[i]${STOP} session aborted - dont forget going to: ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
                exit

                else
		sudo updatedb
		pwd=$(locate anon.png | head -1)
        	sleep 2

        	echo "" ; echo ""
        	jp2a --colors $pwd
        	echo -e "                                         	 \e[3m we are anonymous \e[0m"
        	echo -e "                                            	   \e[3m  i'm gh0st \e[0m"
        	echo "" ; echo ""
        	sleep 3
        	echo -e "${ORANGE}[i]${STOP} gh0st tools checkpoint."
        	echo "______________________________"
		CHECK_PACKAGES
		fi
}


PACKAGES=(bulk_extractor binwalk foremost strings)
MISSING_PACKAGES=()

function CHECK_PACKAGES()
{

        for package in ${PACKAGES[@]}
        do
                #if package is installed, assign it to $PACKAGE_EXIST
                PACKAGE_EXIST=$(which $package)
                #if $PACKAGE_EXIST is empty, add missing package to $MISSING_PACKAGES
                if [ -z "$PACKAGE_EXIST" ]; then
                        sleep 1.2
                        echo ""
                        echo -e "[${RED}-${STOP}] $package package: ${LRED}not installed${STOP}"
                        MISSING_PACKAGES+=($package)
                else
                        sleep 1.2
                        echo ""
                        echo -e "[${BLUE}+${STOP}] $package package: ${LGREEN}installed${STOP}"
                fi
        done

       #if $MISSING_PACKAGES is not empty, update the kernel to date
        if [ ! -z "$MISSING_PACKAGES" ]; then
        echo ""
        sudo apt-get update ; sudo apt-get upgrade ; sudo apt-get dist-upgrade ; sudo apt-get auto-remove
        echo ""
        fi

        sudo updatedb
        VOLATILITY_CHECK
}


function VOLATILITY_CHECK()
{
                #if package is installed, assign it to $nipe
                volatility=$(locate /volatility_2.6_lin64_standalone | head -1)

                if [[ "$volatility" = "" ]]
                then
                        sudo updatedb

                        sleep 1.2
                        echo ""
                        echo -e "[${RED}-${STOP}] volatility packages: ${LRED}not installed${STOP}"

			sleep 1
			echo -e "\n[${GREEN}+${STOP}] volatility installation in progress."
			sleep 4

			wget -nc -q downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip
			unzip -q volatility_2.6_lin64_standalone.zip
			sudo rm -rf volatility_2.6_lin64_standalone.zip
			chmod +x volatility_2.6_lin64_standalone

                        sudo updatedb
                        VOLATILITY_CHECK
                else
                        sleep 1.2
			echo ""
                        echo -e "[${BLUE}+${STOP}] volatility packages installed successfully."
			echo "______________________________"
                fi
}


#if missing package is installed successfully, takes in 1 argument $1, returns $MPACKAGE_ERR_CODE
function VALIDATE_PACKAGE()
{
        MPACKAGE=$1
        MPACKAGE_EXIST=$(which $MPACKAGE)
}


#install the missing requires packages
function INSTALL_PACKAGES()
{
        for missing_package in ${MISSING_PACKAGES[@]};
        do
                case ${missing_package} in
                        bulk_extractor)
                                echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
                                tmux new -d sudo apt install bulk-extractor

                                VALIDATE_PACKAGE $missing_package
                                if [ ! -z "$MPACKAGE_EXIST" ]; then
                                        echo -e "\n[${BLUE}+${STOP} $missing_package installed successfully."
                                else
                                        echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
                                        exit
                                fi
                                ;;

                        binwalk)
                                echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
                                tmux new -d sudo apt install binwalk

                                VALIDATE_PACKAGE $missing_package
                                if [ ! -z "$MPACKAGE_EXIST" ]; then
                                        echo -e "\n[${BLUE}+${STOP}] $missing_package installed successfully."
                                else
                                        echo -e "\n${RED}[!]${STOP} $missing_package$ installation was unsuccessful. Please run $0 again."
                                        exit
                                fi
                                ;;

                        foremost)
                                echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
                                tmux new -d sudo apt install foremost

                                VALIDATE_PACKAGE $missing_package
                                if [ ! -z "$MPACKAGE_EXIST" ]; then
                                        echo -e "\n[${BLUE}+${STOP} $missing_package installed successfully."
                                else
                                        echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
                                        exit
                                fi
                                ;;

                        strings)
                                echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
                                tmux new -d sudo apt install binutils

                                VALIDATE_PACKAGE $missing_package
                                if [ ! -z "$MPACKAGE_EXIST" ]; then
                                        echo -e "\n[${BLUE}+${STOP}] $missing_package installed successfully."
                                else
                                        echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
                                        exit
                                fi
                                ;;
                esac
        done
}


#file type to choose
function FILE()
{

#getting back to the main directory
 	cd /home/

	echo ""
	echo -e "${ORANGE}[i]${STOP} if you dont know the file type, type 'mem' to make a ${BLUE}true${STOP}/${BLUE}false${STOP} scan."
	echo ""
        read -p " - choose the file type to analyse (ex.mem, hdd): "     type

		if [[ $type = MEM || $type = mem ]]
		then
		MEM


		elif [[ $type = HDD || $type = hdd ]]
		then
		HDD


		else
		echo ""
		echo -e "${ORANGE}[i]${STOP} '$type' is unavailable, type the proposed keywords correctly."
		echo "______________________________"
		FILE
		fi
}



function MEM()
{

	########################################################
	# MEM scan using volatility / scan unknown file / LOOP #
	########################################################


#giving alias to volatility path to use without need of being in the directory
pwd=$(locate /volatility_2.6_lin64_standalone | head -1)

#run commands to the background with 'tmux new -d' (it might create some issues so we are making pauses using 'sleep')


	echo ""
        read -p " - type the MEM file path: "     path
        echo "______________________________"


#check if the path exit
	check=$(locate $path)

        	if [[ -z "$check" ]]
        	then
		echo ""
        	echo -e "${ORANGE}[i]${STOP} '$path' doesn't exist on your system."
		MEM
        	fi


#check if the unknown file a truly a mem file, if no exit
#check mem file step
		check=$($pwd/./volatility_2.6_lin64_standalone -f $path imageinfo | awk '{print $4 $5}' | grep Nosuggestion)

			if [[ $check = Nosuggestion ]]
			then
			echo ""
			echo -e "${RED}ERR${STOP}::not a mem file::scan aborted."
			FILE
			fi

		echo ""
		echo -e "${GREEN}WIN${STOP}::is a mem file::scan in progress."
		echo "______________________________"


#step 1 (image info)
                echo "" ; echo "" ; echo -e "       ${ORANGE}<${STOP} volatility : STEP 1/3 ${ORANGE}>${STOP}" ; echo "" ; echo ""
                $pwd/./volatility_2.6_lin64_standalone  -f $path imageinfo
                echo "______________________________" ; echo ""


#step 2 (suggested profile)
	read -p " - type the 'Suggested Profile(s)' (ex.VistaSP1x86, Win2008SP1x86): "     profile
	echo "______________________________"

		echo "" ; echo "" ; echo -e "       ${ORANGE}<${STOP} volatility : STEP 2/3 ${ORANGE}>${STOP}" ; echo "" ; echo ""
		$pwd/./volatility_2.6_lin64_standalone -h | tail -116
		echo "______________________________" ; echo ""


#step 3 (command)
	read -p " - type the wanted volatility command to use (ex.psxview, pstree): "     command
	sleep 2.5
	clear

                echo "" ; echo "" ; echo -e "       ${ORANGE}<${STOP} volatility : STEP 3/3 ${ORANGE}>${STOP}" ; echo "" ; echo ""



                sudo mkdir -p /home/memExtracted
                sleep 1

                sudo mkdir -p /home/Stats
                sleep 1

                echo -e "[${BLUE}+${STOP}] Memory analysis in progress."
                echo ""


#getting to the 'memExtracted' directory, because it can check for existing file from the inside of the directory only
		cd /home/memExtracted


#checking if the same '$command' was analyzed, if yes it will create '$output1' then '$output2' ect ...
#checking all kind of analyzed output if they were(dir,log,dmp)
                                        output=$command

                                                if [[ -e $output.log || -L $output.log || -e $output.dmp || -L $output.dmp || -e $output || -L $output ]] ; then

                                                        i=2
                                                        while [[ -e $output.$i.log || -L $output.$i.log || -e $output.$i.dmp || -L $output.$i.dmp || -e $output.$i || -L $output.$i ]] ; do
                                                        let i++
                                                        done

                                                        output=$output.$i
                                                fi

#checking different kind of commands
#giving aliases if a specific command have been choosen
#saving the analyzed output

	    sleep 2
            echo -e "[${GREEN}+${STOP}] the analyze could take some time, be patient."
            echo ""

                        if [[ $command = volshell ]]
                        then
                        sleep 2
                        echo -e "[${ORANGE}|${STOP}] volshell is a command to access the shell through volatility, no output file will be saved since volshell is on live."
                        echo -e "${LORANGE}---${STOP}"
                        sleep 1
                        echo -e "[${ORANGE}|${STOP}] you now have access to the memory shell, press ctrl+c to abort. (you'll be redirect to the 'file' section)"
                        echo ""
                        sleep 1
                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command
#volshell output
				cd ..
                        	date=$(date)
                        	echo -e " \n \n${BLUE}\e[4mStatistics file:\e[0m${STOP} \n \n ${BLUE}-${STOP} analyze made on: ${LORANGE}$date${STOP} \n ${BLUE}-${STOP} file type searched: $file \n ${BLUE}-${STOP} file path location: $path \n ${BLUE}-${STOP} suggested profil used: ${LGREEN}$profile${STOP} \n ${BLUE}-${STOP} volatility command used: ${LPURPLE}$command${STOP}  \n - no output saved" >> /home/Stats/mem.stats
                        	sleep 2
                        	FILE



                        elif [[ $command = dlldump || $command = dumpcerts || $command = dumpfiles || $command = dumpregistry || $command = procdump || $command = moddump || $command = vaddump || $command = memdump ]]
                        then
			ex="directory"
                        i=""
                        mkdir -p $output

                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --dump-dir=$output



			elif [[ $command = yarascan ]]
			then
			ex="directory"
			i=""
			mkdir -p $output

					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --yara-rules=string --output-file=$output/yara.string.scn
				echo ""
					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --yara-rules=regex --output-file=$output/yara.regex.scn
				echo ""
					$pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --yara-rules=bytes --output-file=$output/yara.bytes.scn



                        elif [[ $command = raw2dmp || $command = imagecopy ]]
                        then
			ex="file"
                        i=".dmp"
                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --output-image=$output.dmp



			elif [[ $command = imageinfo  || $command = vadinfo || $command = verinfo ]]
                        then
			ex="file"
                        i=".inf"
                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --output-file=$output.inf



                        else
			ex="file"
                        i=".log"
                                        $pwd/./volatility_2.6_lin64_standalone -f $path --profile=$profile $command --output-file=$output.log
                        fi

#getting back to the main directory
		cd ..

#saving statistics
	date=$(date)

		echo -e " \n \n${BLUE}\e[4mStatistics file:\e[0m${STOP} \n \n ${BLUE}-${STOP} analyze made on: ${LORANGE}$date${STOP} \n ${BLUE}-${STOP} file type searched: $type \n ${BLUE}-${STOP} file path location: /home/memExtracted \n ${BLUE}-${STOP} suggested profil used: ${LGREEN}$profile${STOP} \n ${BLUE}-${STOP} volatility command used: ${LPURPLE}$command${STOP} \n ${BLUE}-${STOP} output path location: /home/memExtracted/$output$i" >> /home/Stats/mem.stats

		echo ""
		echo -e "[${BLUE}+${STOP}] path to the new created $ex: /home/memExtracted/$output$i"
		echo ""

#loop
		read -p " - type 'RE' to RE:analyse the MEM file, press Any Key to continue analyzing file(s), type X to exit: "     choice

			if [[ $choice = X || $choice = x ]]
        	        then
        	        echo ""
        	        echo -e " - dont forget going to: ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
			sleep 3
			exit

			elif [[ $choice = RE || $choice = re ]]
			then
			echo ""
			clear
			sleep 2
			MEM

			else
			clear
			sleep 2
                        FILE
			fi
}



function HDD()
{
	####################################################
	# HDD scan using one or more forensic tools / LOOP #
	####################################################



		echo ""
		read -p " - type the HDD file path: "     path
		echo "______________________________"


#check if the path exist
        	check=$(locate $path)

                	if [[ -z "$check" ]]
                	then
                	echo ""
			echo -e "${ORANGE}[i]${STOP} '$path' doesn't exist on your system."
                	HDD
			fi

		echo ""
		read -p " - type 1 for bulk_extractor, 2 for binwalk, 3 for foremost, 4 for strings, 5 for alls: "     tool
		echo ""


#checking available options for strings before the scan get started

			if [[ $tool -eq 4 || $tool -eq 5 ]]
			then
			read -p " - (strings) would you like to filter the research using grep ? (yes/no): "        filter

	                                if [[ $filter = NO || $filter = no || $filter = n ]]
        	                        then
					echo ""

	                                elif [[ $filter = YES || $filter = yes || $filter = y ]]
	                                then
        	                        echo ""
						read -p " - type 'spec' to search the KeyWord as a specific argument, type 'exe' to exept the KeyWord from the reseach: "       special

							if [[ $special = SPEC || $special = Spec || $special = spec ]]
							then
							flag="i"

							elif [[ $special = EXE || $special = Exe || $special = exe ]]
							then
							flag="vi"

							else
							echo ""
                                        		echo -e "${ORANGE}[i]${STOP} '$special' is unavailable, type the proposed keywords correctly."
							HDD
							fi

					echo ""
                                        read -p " - type the wanted argument to filter: "        argument
                                        echo ""

					else
					echo ""
                	                echo -e "${ORANGE}[i]${STOP} '$filter' is unavailable, type the proposed keywords correctly."
                        	        echo ""
                                	HDD
					fi
			fi

		clear
		sleep 1
		echo ""
		echo -e "[${BLUE}+${STOP}] Hard Disk Drive analysis in progress."


#giving aliases to the used tool
#giving aliases to the used tool new output path info

	if [[ $tool -eq 1 ]]
	then
	tool="bulk_extractor"
	dirpath="bulkExtracted"

	elif [[ $tool -eq 2 ]]
	then
	tool="binwalk"
	dirpath="binExtracted"

	elif [[ $tool -eq 3 ]]
	then
	tool="foremost"
	dirpath="foreExtracted"

	elif [[ $tool -eq 4 ]]
	then
	tool="strings"
	dirpath="striExtracted"

	elif [[ $tool -eq 5 ]]
	then
	tool="bulk_extractor / binwalk / foremost / strings"
	dirpath="all_hddExtracted"
	fi


                sudo mkdir -p /home/hddExtracted
                sleep 1

		cd /home/hddExtracted

#dir checker
#checking if the same '$dirpath' was created, if yes it will create '$dirpath.1' then '$dirpath.2' ect ...

             dir=$dirpath

                if [[ -e $dir || -L $dir ]] ; then

                i=2
                while [[ -e $dir.$i || -L $dir.$i ]] ; do
                let i++
                done

             dirpath=$dir.$i

                fi

			sleep 2.5


#run commands to the background with 'tmux new -d' (it might create some issues so we are making pauses using 'sleep')

        		if [[ $tool = bulk_extractor ]]
			then
			mkdir -p $dirpath
				tmux new -d bulk_extractor -o $dirpath $path


	                elif [[ $tool = binwalk ]]
        	        then
			#mkdir -p /home/$dirpath
				tmux new -d binwalk --run-as=root --extract --directory $dirpath/binExtracted $path


	                elif [[ $tool = foremost ]]
        	        then
			#mkdir -p /home/$dirpath
				tmux new -d foremost $path -o $dirpath/foreExtracted


                	elif [[ $tool = strings ]]
                	then
			mkdir -p $dirpath

					if [[ $filter = YES || $filter = yes || $filter = y ]]
					then
						strings $path | grep -$flag "$argument" >> $dirpath/striExtracted.txt
					else
						strings $path >> $dirpath/striExtracted.txt
					fi


               		elif [[ $tool = "bulk_extractor / binwalk / foremost / strings" ]]
                	then
			mkdir -p $dirpath

				tmux new -d bulk_extractor -o $dirpath/bulkExtracted $path
			sleep 2.5
				tmux new -d binwalk --run-as=root --extract --directory $dirpath/binExtracted $path
			sleep 2.5
				tmux new -d foremost $path -o $dirpath/foreExtracted
			sleep 2.5

                                        if [[ $filter = YES || $filter = yes || $filter = y ]]
                                        then
                                                strings $path | grep -$flag "$argument" >> $dirpath/striExtracted.txt
                                        else
                                                strings $path >> $dirpath/striExtracted.txt
                                        fi

                        else
                        echo ""
                        echo -e "${ORANGE}[i]${STOP} '$tool' is unavailable, type the proposed keywords correctly."
                        echo ""
                        HDD
                        fi


#giving aliases if a special request was made from strings
	if [[ $filter = YES || $filter = yes || $filter = y ]]
	then
	argument=$argument

		if [[ $special = EXE || $special = Exe || $special = exe ]]
		then
		argument="all exept :: "$argument
		fi
	else
	argument=(${LRED}none${STOP})
	fi


#saving statistics
	mkdir -p /home/Stats

        date=$(date)
                echo -e " \n \n${BLUE}\e[4mStatistics file:\e[0m${STOP} \n \n ${BLUE}-${STOP} analyze made on: ${LORANGE}$date${STOP} \n ${BLUE}-${STOP} file type searched: $type \n ${BLUE}-${STOP} file path location: $path \n ${BLUE}-${STOP} tool(s) used: ${LGREEN}$tool${STOP} \n ${BLUE}-${STOP} filtered argument: $argument \n ${BLUE}-${STOP} output path location: /home/$dirpath" >> /home/Stats/hdd.stats

		sleep 2
                echo ""
                echo -e "[${BLUE}+${STOP}] path to the new created directory: /home/hddExtracted/$dirpath"
		echo ""


#loop
		sleep 1
                read -p " - type 'RE' to RE:analyse the file using HDD tools, press Any Key to continue analyzing file(s), type X to exit: "     choice

                        if [[ $choice = X || $choice = x ]]
                        then
                        echo ""
                        echo -e " - dont forget going to: ${RED}https://github.com/gh0st-anonymous${STOP} for more content."
                        sleep 3
                        exit

			elif [[ $choice = RE || $choice = re ]]
			then
			echo ""
			clear
			sleep 2
			HDD

			else
			clear
			sleep 2
			FILE
			fi
}

#functions:
ROOT           #root identifier
FILE          #file type to choose
#MEM           #memory file
#HDD           #hdd file
