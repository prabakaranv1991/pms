import requests
import json

url = "https://intouch.mapmyindia.com/apis/user/login?username=9944193082&password=275b37fcf68e182c155f22ded6b5a987"

payload = {}
headers = {
  'Cookie': 'BCSI-CS-90649b75d166525c=1'
}

response = requests.request("POST", url, headers=headers, data = payload, verify=False)

data = json.loads(response.text.encode('utf8'))

url = "https://intouch.mapmyindia.com/apis/api/getLiveData?entityId=624789&state=1630922439"
payload = {}
headers = {
  'Authorization': 'Bearer '+data['data']['access_token'],
  'Cookie': 'BCSI-CS-90649b75d166525c=1'
}
response = requests.request("POST", url, headers=headers, data = payload, verify=False)
data = json.loads(response.text.encode('utf8'))
odomter = int(data['data']['mydevices'][0]['intouchOdometer'])
print(odomter)