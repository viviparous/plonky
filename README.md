# plonky
A Perl program to generate a conky rc file. 

What is conky? See: https://github.com/brndnmtthws/conky

## Requirements
* Linux or other OS that can run conky
* conky
* Perl

Note: For ChromeOS with Crostini, enable window decorations in .conkyrc so that conky draws a title bar. 

## Usage
In a terminal in $home, execute:
    `perl plonky.pl > .conkyrc`

Then run 
    `conky -d -b` 

## Example

Don't laugh at the CPU. ^_^

![example01](https://github.com/viviparous/plonky/blob/main/screenshot-01-vmware.jpg)
