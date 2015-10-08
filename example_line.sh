# brew install ucto
# also handy to convert pdf docs to plain text:
# brew install poppler
# then
# pdftotext input.pdf output.txt

# example
ucto -L en -n -s ' ' ~/Documents/behavior_and_technology/*.md | readability
