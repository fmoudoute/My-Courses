"""
Webscraper
"""
#import urllib #python 2.7
import urllib.request #python 3.5

#headjack = urllib.urlopen("http://www.dr-chuck.com/page1.htm") #python 2.7
headjack = urllib.request.urlopen("http://www.dr-chuck.com/page1.htm") #python 3.5

for line in headjack:
    print(line.strip())
