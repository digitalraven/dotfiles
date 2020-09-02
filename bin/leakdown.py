#! /usr/local/bin/python3

import urllib.request, urllib.error, urllib.parse

url='http://leaknudes.com/gallery/1955'

response = urllib.request.urlopen(url)
webContent = reqponse.read()

print(webContent)
