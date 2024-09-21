#!/usr/bin/env python3

# Import statements
import os
import json
import requests

# Obtain username 
GHUSER = os.getenv('GITHUB_USER')

print(GHUSER)

# Add url variable 
url = 'https://api.github.com/users/{}/events'.format(GHUSER)

print(url)

# Go through the requests 
response = requests.get(url)

r = json.loads(requests.get(url).text)

# Print first 5 types of actions 
for x in r[:5]:
  event = x['type'] + ' :: ' + x['repo']['name']
  print(event)

# print all 
print(r)




