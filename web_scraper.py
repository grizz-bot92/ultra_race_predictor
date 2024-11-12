import requests
from bs4 import BeautifulSoup
import pandas as pd

url = 'https://ultrasignup.com/results_participant.aspx?fname=Brandon&lname=Benoit'

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
}

response = requests.get(url,headers=headers)

if response.status_code == 200:
    soup = BeautifulSoup(response.content, "html.parser")
