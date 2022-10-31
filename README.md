# About 'analyzer'

<p align="center">
   </a>
      <a href="https://github.com/gh0st-anonymous/analyzer">
      <img src="https://img.shields.io/badge/Version-1.0.0-darkgreen">
        <img src="https://img.shields.io/badge/Release%20Date-april%202022-purple">
  <img src="https://shields.io/badge/Bash-100%25-066da5">
  <img src="https://shields.io/badge/Platform-Linux-darkred">
    </a>
  </p>
</p>

analyzer is a bash script that analyze and retrieve data from memory and hard disk drive files using:

volatlity, bulk_extractor, binwalk, foremost and strings.

### Possibility and Capability

>ADVANTAGES:

- have 3 way to analyze the wanted file: 1=standard bash script, 2=argument script, 3=flag script (using arguments)

- capable of doing almost every volatility commands since not every one of them use the same option. (if your suggested profile is for exemple VistaSP1x86, some command could require for exemple WinSP2x86)

- check if the new supposed output file or directory is already created. (instead of :: error cant write on 'file.txt' because 'file.txt' already exist :: you'll get file.2.txt or dir.2 then .3, .4, ect...)

- check for every errors possible. (correct path, correct answers as input, if the mem file choosen is truly a mem file)

- the required dependencies and libraries will be scanned and any missing packages will be installed automatically.

- easy to use since explanations are written. ([sudo] bash  / ./analyzer -I)

- if you need help for the script usage, type [sudo] bash  / ./analyzer -h, for more details about the options.

- help and info menu doesn't require sudo privileges.

>DISADVANTAGES:

- since we can run the script using arguments and flags, we cant put errors message for the flags option using "else" because it will disable the arguments scipt and vice versa.

- if incorrect arguments or flags are written, the standard script will run. (advantage as well)

### 'analyzer' Project

a [project](https://github.com/gh0st-anonymous/analyzer/files/9894648/project.pdf) made by [ThinkCyber.](https://www.thinkcyber.co.il/)

### Video Demonstration

Be Aware: the script could be different from the video since he got upgraded.

[![image](https://user-images.githubusercontent.com/102325071/198853694-862848c2-16fa-43c5-9eb6-abd9679af4bd.jpg)](https://www.youtube.com/watch?v=aII0oweQ1V8)

### Script Usage

just launch the script by typing:

![pic](https://user-images.githubusercontent.com/102325071/199018360-a9922f2d-2106-44d3-a99d-ea9233c0eb67.png)

### Download

from github: 

    git clone https://github.com/gh0st-anonymous/analyzer

from [zip](https://github.com/gh0st-anonymous/analyzer/files/9900045/analyzer.zip) file
