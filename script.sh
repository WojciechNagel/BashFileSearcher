#!/usr/bin/env bash
echo "--------------------------------------------------------------------------------"
echo "------ Hello man, you started me so you probably want to see how I work.  ------"
echo "------     I will try to help you find the file you are looking for.      ------"
echo "--------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------"

declare FILENAME1="*"
declare DIRECTORY2="/"
declare BIGGERTHAN3="0"
declare SMALLERTHAN4="99999999"
declare CONTENT5=""

optionsView() {
  echo "--------------------------------------------------------------------------------"
  echo "OPTION:   PROPERTY:          VALUES:"
  echo "1.        File name:         $FILENAME1"
  echo "2.        Directory:         $DIRECTORY2"
  echo "3.        Bigger than(k):    $BIGGERTHAN3"
  echo "4.        Smaller than:      $SMALLERTHAN4"
  echo "5.        Content:           $CONTENT5"
  echo "6.        Search.  "
  echo "7.        Stop the program."
  echo "--------------------------------------------------------------------------------"
}

declare ENTER="(Confirm by ENTER)"

setFileName1() {
  clear
  echo "Enter the NAME of the file you are looking for $ENTER: "
  read FILENAME1
}

setPathToDirectory2() {
  clear
  echo "Enter the PATH  to the searched directory $ENTER: "
  read DIRECTORY2
}

setBiggerThan3() {
  clear
  echo "Enter the MINIMUM file size $ENTER: "
  read BIGGERTHAN3
}

setSmallerThan4() {
  clear
  echo "Enter the MAXIMUM file size $ENTER: "
  read SMALLERTHAN4
}

setContent5() {
  clear
  echo "Enter the CONTENT you are looking for in the file $ENTER: "
  read CONTENT5
}

search() {
  declare STAR='*'
  if [ "${FILENAME1}" = "${STAR}" ]; then
    find $DIRECTORY2 -type f -size +"$BIGGERTHAN3"k -size -"$SMALLERTHAN4"k -name "$FILENAME1" -exec grep -iRl "$CONTENT5" $DIRECTORY2 {} \; 2>&1 | grep -v 'Permission denied' | grep -v 'No such file or directory' > result.txt
    echo "----- Executed command -----"
    echo "find $DIRECTORY2 -type f -size +"$BIGGERTHAN3"k -size -"$SMALLERTHAN4"k -name "$FILENAME1" -exec grep -iRl "$CONTENT5" $DIRECTORY2 {} \; | uniq"
  else
    find $DIRECTORY2 -type f -size +"$BIGGERTHAN3"k -size -"$SMALLERTHAN4"k -name "$FILENAME1" -exec grep -iRl "$CONTENT5" $DIRECTORY2/$FILENAME1 {} \; 2>&1 | grep -v 'Permission denied'| grep -v 'No such file or directory' > result.txt
    echo "----- Executed command -----"
    echo "find $DIRECTORY2 -type f -size +"$BIGGERTHAN3"k -size -"$SMALLERTHAN4"k -name "$FILENAME1" -exec grep -iRl "$CONTENT5" $DIRECTORY2/$FILENAME1 {} \; | uniq"
  fi
  echo "------Search result: -------"
  cat result.txt | sort | uniq
}

getOption() {
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
    setContent5
  fi
  if [ "$OPTION" -eq 6 ] ; then
    search
  fi
}

while [[ $OPTION != 7 ]] ; do                     #Czy OPTION jest różne od 7
  optionsView
  read OPTION                                     #Wprowadz OPTION
  if [[ "$OPTION" == ?(-)+([1-7]) ]] ; then       #Czy OPTION jest cyfra miedzy 1-7
     getOption ${OPTION}
  else                                            #Gdy nie została wybrana cyfra od 1-7
    echo "Choose one of the available options. [ 1 - 7 ]"
  fi
done
