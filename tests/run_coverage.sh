#!/bin/bash

#install coverage.py
#pip3 install coverage
echo Running coverage test
echo Coverage.py must be installed. Check out at: https://coverage.readthedocs.io/en/v4.5.x/index.html

echo
echo Erasing existing configs, if any...
coverage erase
rm ~/.emailto

echo
echo
echo Configuring for first time use.
echo Choose NO to save the file. It will be overwritten later on.
read -n1 -r -p "Press any key to continue..."
echo
coverage run ../emailto

echo
echo
echo Testing with a broken config. Type anything...
read -n1 -r -p "Press any key to continue..."
echo
rm ~/.emailto
cp brokenconfig ~/.emailto
coverage run -a ../emailto --subject mySubject1 --message myMessage1 --recipients "fernandozatt@gmail.com,fernandozatt@gmail.com" --attachments

echo
echo
echo Tampering config with invalid credentials
read -n1 -r -p "Press any key to continue..."
echo
rm ~/.emailto
cp invalidemailto ~/.emailto
coverage run -a ../emailto --subject mySubject2 --message myMessage2 --recipients "fernandozatt@gmail.com,fernandozatt@gmail.com" --attachments attachment.txt --verbose

echo
echo
echo TEST Creating config again...
echo Choose YES and provide functional configuration now:.
read -n1 -r -p "Press any key to continue..."
echo
rm ~/.emailto
coverage run -a ../emailto --verbose

echo
echo
echo TEST Add invalid attachment
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --subject mySubject3 --message myMessage3 --attachments nonexistentfile.txt --verbose

echo
echo
echo TEST Attaching unknown format
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --subject mySubject4 --message myMessage4 --attachments unknownfile.bin --verbose

echo
echo
echo TEST Multiple attachments and recipients
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --subject mySubject5 --message myMessage5 --recipients "fernandozatt@gmail.com,fernandozatt@gmail.com" --attachments "attachment.txt,pic.jpg" --verbose

echo
echo
echo TEST Invalid recipient
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --subject mySubject6 --message myMessage6 --recipients "invalidemailaddr" --verbose

echo
echo
echo TEST No subject
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --message myMessage7 --verbose

echo
echo
echo TEST No message
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --message myMessage8 --verbose

echo
echo
echo TEST Send to default values
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --subject mySubject9 --message myMessage9 --verbose

echo
echo
echo TEST Now disconnect to from internet.
read -n1 -r -p "Press any key to continue..."
coverage run -a ../emailto --subject mySubject10 --message myMessage10 --recipients "fernandozatt@gmail.com,fernandozatt@gmail.com" --attachments pic.jpg --verbose

echo
echo
coverage report -m > result.txt
cat result.txt
