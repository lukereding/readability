import requests
from bs4 import BeautifulSoup

crossref_email = 'lukereding@gmail.com'

doi = 10.1371/journal.pone.0057865

res = requests.get('http://www.crossref.org/openurl/?pid='+crossref_email+'&id=doi:'+doi+'&noredirect=true')
xml = BeautifulSoup(res.text)
attributes = dict(xml.findAll('query')[0].attrs)
print attributes['fl_count']