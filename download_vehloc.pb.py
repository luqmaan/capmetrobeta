import time

import arrow
import requests


def do_it():
    cookie = '_gat=1; _socrata_session_id=BAh7CEkiD3Nlc3Npb25faWQGOgZFRiIlOGYzYTVjYzQ4MTc5NDQ5MjQ3NjE3ODRkNWJlOGUwOTJJIhBfY3NyZl90b2tlbgY7AEZJIjFQejZKOStINmRJOXdiYUs1QUIrMzVVT3N0ZzBoZElJbmc1Z1hrc21ZYVA4PQY7AEZJIgl1c2VyBjsARmkD3bIN--ef3a367d9df89cd620bbde5a2bf43b5e877789f8; logged_in=true; socrata-csrf-token=Pz6J9%2BH6dI9wbaK5AB%2B35UOstg0hdIIng5gXksmYaP8%3D; _ga=GA1.2.716989283.1415392770; _core_session_id=czdpai1tbXlqIDE0MjM4NjQzNTUgZWEzMDQ0ZDAyZGQ0IDhmMTVkNDI1MTFhNTAxMmYyNmM2MWY4MzRlMDllMmViMDkzYzk2ZjQ'
    headers = {'Authorization': 'OAuth GZ3PaFJkMsZP1hAnQcWpyJCpH1TGuj6_26T5', 'Cookie': cookie}
    res = requests.get('https://data.texas.gov/download/i5qp-g5fd/application/octet-stream', headers=headers)
    content = res.content[:100] if len(res.content) > 100 else res.content
    print(res.status_code, res.request.url, res.headers, content)

    with open('vehloc2/i5qp-g5fd-VehLoc.pb-{}'.format(arrow.now().timestamp), 'w+') as fh:
        fh.write(res.content)

while True:
    print('meow')
    do_it()
    time.sleep(30)
