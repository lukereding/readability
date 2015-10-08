# to do this for a bunch of files in a directory:
for file in ./*.pdf
do
  # convert each pdf to a txt document
  NAME = ${file##*/}
  pdftotext $file $NAME.txt
  # exclude everything above introduction, everything starting at the references
  ### code goes here
  KINCAID= $(ucto -L en -n -s ' ' ~/Documents/behavior_and_technology/$NAME.txt | readability | grep 'Kincaid' | grep -o '[0-9].*')
  AVG_SYL= $(ucto -L en -n -s ' ' ~/Documents/behavior_and_technology/$NAME.txt | readability | grep 'syll_per_word' | grep -o '[0-9].*')
  WORDS_PER_SENTENCE= $(ucto -L en -n -s ' ' ~/Documents/behavior_and_technology/$NAME.txt | readability | grep 'words_per_sentence' | grep -o '[0-9].*')
  echo $KINCAID, $AVG_SYL, $WORDS_PER_SENTENCE
