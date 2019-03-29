#!/usr/bin/env bash
echo "Witaj! Uruchomiłeś skrypt, który ułatwi Ci wyszukiwanie plików"
declare OPTION
declare FILENAME1=" "
declare DIRECTORY2=" "
declare BIGGERTHAN3=" "
declare SMALLERTHAN4=" "
declare CONTENT5=" "

search() {
  echo "Search result: "
}

optionsView() {
  echo  "--------------------------------------------------------------"
  echo "1 - File name: $FILENAME1"
  echo "2 - Directory: "$DIRECTORY2""
  echo "3 - Bigger than: "$BIGGERTHAN3""
  echo "4 - Smaller than: "$SMALLERTHAN4""
  echo "5 - Content: "$CONTENT5""
  echo "6 - Search. "
  echo "7 - Stop the program."
  echo "--------------------------------------------------------------"
}

setFileName1() {
  echo "Search by file name."
}

setPathToDirectory2() {
  echo "Search in directory."
}

setBiggerThan3() {
  echo "Search bigger than."
}

setSmallerThan4() {
  echo "Search smaller than."
}

setContent5() {
  echo "Search with content."
}

while [[ $OPTION != 7 ]] ; do                     #Czy OPTION jest różne od 7
  optionsView
  read OPTION                                     #Wprowadz OPTION
  if [[ "$OPTION" == ?(-)+([1-7]) ]] ; then       #Czy OPTION jest cyfra miedzy 1-7
    if [ $OPTION -eq 1 ] ; then                   #Czy OPTION jest równe 1? itd.
      setFileName1
    fi
    if [ "$OPTION" -eq 2 ] ; then
      setPathToDirectory2
    fi
    if [ "$OPTION" -eq 3 ] ; then
      setBiggerThan3
    fi
    if [ "$OPTION" -eq 4 ] ; then
      setSmallerThan4
    fi
    if [ "$OPTION" -eq 5 ] ; then
      setContent
    fi
  else                                            #Gdy nie została wybrana cyfra od 1-7
    echo "Choose one of the available options. [ 1 - 7 ]"
  fi
done
