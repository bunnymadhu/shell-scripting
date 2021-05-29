#!/bin/bash

# echo and printf commands can be use to print some message on the screen
# however echo command we use here,because it is simple and yet effective to all the needs.

# syntax : echo input message

echo hai im madhu

# echo to print multiple lines (/n is new line sequence)
# syntax : echo -e "line1\nline2"

echo -e "\nhai,\n\nwelcome to the world"

# print a paragraph
#  syntax : echo -e "\tsome paragraph" is in print a tab space
echo -e "\t A phrase is a group of words that express a concept and
             is used as a unit within a sentence. Eight common types of
             phrases are: noun, verb, gerund, infinitive, appositive,
             participial,prepositional, and absolute. Take a look at our
             selection of phrase examples below."

# print text in colours
# syntax : echo -e "\e[COLOURCODEmmessage"

# colors  code
# red       31
#green     32
#yellow     33
#blue         34
#magenta   35
#cyan          36

echo -e "\e[36mGoodmorning"
echo -e "\e[33mhai to evryone\e[31mhello"
echo -e "\e[32mthis is madhu\e[35mbtch complted"

#echo text in normol colour
# syntax : echo -e "\e[31mGoodmorning\e[0m"

echo -e "\e[33mhai to evryone\e[31mhello"
echo-e "\e[31msathya is cool\e[0m"
echo -e "\e[32mthis is madhu\e[35mbtch complted"