# About 'analyzer'

<p align="center">
   </a>
      <a href="https://github.com/Gh0stAn0n/analyzer">
      <img src="https://img.shields.io/badge/Version-1.0.0-darkgreen">
        <img src="https://img.shields.io/badge/Release%20Date-april%202022-purple">
  <img src="https://shields.io/badge/Bash-100%25-066da5">
  <img src="https://shields.io/badge/Platform-Linux-darkred">
    </a>
  </p>
</p>

analyzer is a bash script that analyze and retrieve data from memory and hard disk drive files using:

[volatlity](https://github.com/volatilityfoundation/volatility), [bulk_extractor](https://www.kali.org/tools/bulk-extractor/), [binwalk](https://www.kali.org/tools/binwalk/), [foremost](https://www.kali.org/tools/foremost/) and [strings](https://linuxhint.com/strings-ubuntu-command-use/).

### Possibility and Capability

>PROS:

- help and info menu doesn't require sudo privileges.

- have 3 way to analyze the wanted file: 1=standard bash script, 2=argument script, 3=flag script (using arguments)

- capable of doing almost every volatility commands since not every one of them use the same option. (if your suggested profile is for exemple VistaSP1x86, some command could require for exemple WinSP2x86)

- will save the user general scans in a statistics file.

- check if the new supposed output file or directory is already created. (instead of :: error cant write on 'file.txt' because 'file.txt' already exist :: you'll get file.2.txt or dir.2 then .3, .4, ect...)

- check for every errors possible. (correct path, correct answers as input, if the mem file choosen is truly a mem file)

- the required dependencies and libraries will be scanned and any missing packages will be installed automatically.

>CONS:

- since we can run the script using arguments and flags, we cant put errors message for the flags option using "else" because it will disable the arguments scipt and vice versa.

- if incorrect arguments or flags are written, the standard script will run. (advantage as well)

### 'analyzer' Project

a [project](https://github.com/Gh0stAn0n/analyzer/files/9894648/project.pdf) made by [ThinkCyber](https://www.thinkcyber.co.il/).

### Video Demonstration

Be Aware: the script could be different from the video since he got upgraded.

[![image](https://user-images.githubusercontent.com/102325071/198853694-862848c2-16fa-43c5-9eb6-abd9679af4bd.jpg)](https://www.youtube.com/watch?v=aII0oweQ1V8)

### Script Usage

launch the script by typing:

└─$ sudo bash analyzer.sh

└─$ sudo ./analyzer

-h (stand for help) for more info about the flags option.

-i (stand for info) for more info about the script.

### Download

from [zip](https://github.com/Gh0stAn0n/analyzer/files/9926932/analyzer.zip) file or from github: 

    git clone https://github.com/Gh0stAn0n/analyzer
