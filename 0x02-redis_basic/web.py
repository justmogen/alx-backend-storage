#!/usr/bin/env python3
"""
Creating a web cache for a requesting a url and getting it's html contents
"""
import redis
import requests
r = redis.Redis()
count = 0


def get_page(url: str) -> str:
    """cache the value of a given url"""
    r.set(f"cached:{url}", count)
    res = requests.get(url)
    r.incr(f"count:{url}")
    r.setex(f"cached:{url}", 10, r.get(f"cached:{url}"))
    return res.text

if __name__ == "__main__":
    get_page('http://slowwly.robertomurray.co.uk')
