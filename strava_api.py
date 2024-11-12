import requests
import time
import pandas as pd

access_token = '16be5ec039b7d78bf8db7db49c2618c3392992b9'
start_timestamp = 1480636800
per_page = 200
page = 1

all_activities = []

while True:
    url = f'https://www.strava.com/api/v3/athlete/activities'
    params = {
        'access_token': access_token,
        'after': start_timestamp,
        'per_page': per_page,
        'page': page
    }

    response = requests.get(url, params=params)
    data = response.json()

    if not data:
        break

    all_activities.extend(data)
    print(f"Fetched page {page} with {len(data)} activities.")

    page+=1
    time.sleep(1)

df = pd.json_normalize(all_activities)
df.to_csv('strava_activities.csv', index=False)

print('Data has been saved')

