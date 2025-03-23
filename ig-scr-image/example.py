from ihs import Scraper, Downloader
from dotenv import load_dotenv
import os

load_dotenv()

<<<<<<<< Updated upstream:virtualscrap/example.py
username = os.getenv('IG_USERNAME')
password = os.getenv('IG_PASSWORD')

if __name__ == "__main__":
    credentials = {
        'username': username,
        'password': password
========

if __name__ == "__main__":
    credentials = {
        'username': os.getenv('IG_USER'),
        'password': os.getenv('IG_PASS')
>>>>>>>> Stashed changes:ig-scr-image/example.py
    }
    urls_path = 'scraped/urls.txt'
    Scraper(login=credentials,
            max_samples=10,
            url_save_path=urls_path,
            driver_path='/usr/bin/chromedriver').scan(tag='happy')
    Downloader(url_file=urls_path,
               img_folder='img/').start(wait_time=1.0)
