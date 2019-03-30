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
declare SMALLERTHAN4="3138288"
declare CONTENT5=""
declare ENTER="(Confirm by ENTER)"

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

setFileName1() {
  clear
  echo "Enter the name of the file you are looking for $ENTER: "
  read FILENAME1
}

setPathToDirectory2() {
  clear
  echo "Enter the path to the searched directory $ENTER: "
  read DIRECTORY2
}

setBiggerThan3() {
  clear
  echo "Enter the minimum file size $ENTER: "
  read BIGGERTHAN3
}

setSmallerThan4() {
  clear
  echo "Enter the maximum file size $ENTER: "
  read SMALLERTHAN4
}

setContent5() {
  clear
  echo "Enter the content you are looking for in the file $ENTER: "
  read CONTENT5
}

search() {
  echo "Search result: "
  find $DIRECTORY2 -type f -size +"$BIGGERTHAN3"k -size -"$SMALLERTHAN4"k -name "$FILENAME1" -exec du -ah {} \; -exec grep -iRl $CONTENT5 $DIRECTORY {} \; -exec echo {} \;
  echo "------Executed command------"
  echo "find $DIRECTORY2 -type f -size +"$BIGGERTHAN3"k -size -"$SMALLERTHAN4"k -name "$FILENAME1" -exec du -ah {} \; -exec grep -Ril "$CONTENT5" {} \;"
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

declare OPTION
while [[ $OPTION != 7 ]] ; do                     #Czy OPTION jest różne od 7
  optionsView
  read OPTION                                     #Wprowadz OPTION
  if [[ "$OPTION" == ?(-)+([1-7]) ]] ; then       #Czy OPTION jest cyfra miedzy 1-7
     getOption ${OPTION}
  else                                            #Gdy nie została wybrana cyfra od 1-7
    echo "Choose one of the available options. [ 1 - 7 ]"
  fi
done
