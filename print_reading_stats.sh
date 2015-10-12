# to do this for a bunch of files in a directory:

echo file, kincaid, average_syl_per_word, avg_words_per_sentence, reading_ease, setences_per_paragraph, characters_per_word, total_words, sentences, long_words, complex_words, nominalizations, begin_pronoun, begin_interr, begin_article, begin_subor, begin_conj, begin_prep, conjugations, to_be_verbs > out.csv

for file in ./*.txt
do
  # convert each pdf to a txt document
  # exclude everything above introduction, everything starting at the references
  ### code goes here
  KINCAID=$(ucto -L en -n -s ' ' $file | readability | grep 'Kincaid' | grep -o '[0-9].*')
  AVG_SYL=$(ucto -L en -n -s ' ' $file | readability | grep 'syll_per_word' | grep -o '[0-9].*')
  WORDS_PER_SENTENCE=$(ucto -L en -n -s ' ' $file | readability | grep 'words_per_sentence' | grep -o '[0-9].*')
  READING_EASE=$(ucto -L en -n -s ' ' $file | readability | grep 'FleschReadingEase' | grep -o '[0-9].*')
  SEN_PER_PARAGRAPH=$(ucto -L en -n -s ' ' $file | readability | grep 'sentences_per_paragraph' | grep -o '[0-9].*')
  CHAR_PER_WORD=$(ucto -L en -n -s ' ' $file | readability | grep 'characters_per_word' | grep -o '[0-9].*')
  TOTAL_WORDS=$(ucto -L en -n -s ' ' $file | readability | grep 'words' | grep -o '[0-9].*')
  SENTENCES=$(ucto -L en -n -s ' ' $file | readability | grep 'sentences' | grep -o '[0-9].*')
  LONG_WORDS=$(ucto -L en -n -s ' ' $file | readability | grep 'long_words' | grep -o '[0-9].*')
  COMPLEX_WORDS=$(ucto -L en -n -s ' ' $file | readability | grep 'complex_words' | grep -o '[0-9].*')
  NOMINALIZATION=$(ucto -L en -n -s ' ' $file | readability | grep 'nominalization' | grep -o '[0-9].*')
  BEGIN_PRONOUN=$(ucto -L en -n -s ' ' $file | readability | grep 'sentence beginnings' -A 7 | grep 'pronoun' | grep -o '[0-9].*')
  BEGIN_INTERR=$(ucto -L en -n -s ' ' $file | readability | grep 'sentence beginnings' -A 7 | grep 'interrogative' | grep -o '[0-9].*')
  BEGIN_ARTICLE=$(ucto -L en -n -s ' ' $file | readability | grep 'sentence beginnings' -A 7 | grep 'article' | grep -o '[0-9].*')
  BEGIN_SUBOR=$(ucto -L en -n -s ' ' $file | readability | grep 'sentence beginnings' -A 7 | grep 'subordination' | grep -o '[0-9].*')
  BEGIN_CONJ=$(ucto -L en -n -s ' ' $file | readability | grep 'sentence beginnings' -A 7 | grep 'conjunction' | grep -o '[0-9].*')
  BEGIN_PREP=$(ucto -L en -n -s ' ' $file | readability | grep 'sentence beginnings' -A 7 | grep 'preposition' | grep -o '[0-9].*')
  CONJ=$(ucto -L en -n -s ' ' $file | readability | grep 'word usage' -A 7 | grep 'conjunction' | grep -o '[0-9].*')
  TO_BE_VERB=$(ucto -L en -n -s ' ' $file | readability | grep 'word usage' -A 7 | grep 'tobeverb' | grep -o '[0-9].*')

  
  echo $file, $KINCAID, $AVG_SYL, $WORDS_PER_SENTENCE, $READING_EASE, $SEN_PER_PARAGRAPH, $CHAR_PER_WORD, $TOTAL_WORDS, $SENTENCES, $LONG_WORDS, $COMPLEX_WORDS, $NOMINALIZATION, $BEGIN_PRONOUN, $BEGIN_INTERR, $BEGIN_ARTICLE, $BEGIN_SUBOR, $BEGIN_CONJ, $BEGIN_PREP, $CONJ, $TO_BE_VERB >> out.csv
done