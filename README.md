# plonky
A Perl program to generate a conky rc file for a fast admin/dev configuration. 

What is conky? See: https://github.com/brndnmtthws/conky

## Requirements
* Linux or other OS that can run conky
* conky
* Perl

### Notes 
* lsof is used for displaying network connexions. lsof is a common Linux utility.
* For ChromeOS with Crostini, enable window decorations in .conkyrc so that conky draws a title bar. 

## Usage
In a terminal in $home, execute:
    `perl plonky.pl > .conkyrc`

Then run 
    `conky -d -b` 

## Screen Captures

Network connections are summarised:

![example01](https://github.com/viviparous/plonky/blob/main/screenshot-03-netconns.jpg)


Raspberry Pi 400:

![example02](https://github.com/viviparous/plonky/blob/main/screenshot-02-rpi400.jpg)

Venerable Thinkpad with VMware virtual adaptors:

![example03](https://github.com/viviparous/plonky/blob/main/screenshot-01-vmware.jpg)
