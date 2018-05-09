from bs4 import BeautifulSoup
import os
from os.path import join
import re
from random import shuffle
import sys

## to do:
	## extract type of article
	## extract dio
	## extract things in the subject tag

## functions

def clarify_text(text):
	# remove unwanted elements from any block of text
	# what else to et rid of?
	# use re.sub(r"regex","replacement",text)
	
	text = text.replace("\n", " ")
	text = text.replace("\r", " ")
	
	return(text)


try:
	pathname = sys.argv[1]
except:
	print "need to provide pathname to directory you want to save abstract from"
	sys.exit(0)
	
files = os.listdir(pathname)

for file in files:
	
	if file.endswith(".nxml"):		
		
		file = pathname + '/' + file
		print file
		
		soup = BeautifulSoup(open(file), 'xml')
				 
		 # get rid of subtext
		[s.extract() for s in soup('sub')]
		
		#get rid other other stuff you dont care about.
		[s.extract() for s in soup('table')]
		[s.extract() for s in soup('caption')]
		[s.extract() for s in soup('table-wrap')]
		[s.extract() for s in soup('table-wrap-foot')]
		 
		# get the abtract
		abstracts = soup.find_all("abstract")
		try:
			abstract = max(abstracts, key=len).get_text()
			abstract = clarify_text(abstract)
			
			print abstract
			
			## to get subjects:
			#soup.find_all("subject")
			## to get doi
			#soup.find_all("article-id")
			
			# save abstract for readability stats
			text_file = open(file+".txt", "w")
			text_file.write(abstract.encode('utf-8'))
			text_file.close()
		except:
			print "couldn't find abstract"
			
		 
		