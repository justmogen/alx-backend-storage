#!/usr/bin/env python3
"""Log stats"""
from pymongo import MongoClient

if __name__ == "__main__":
    client = MongoClient()
    logs_collection = client.logs.nginx

    num_docs = logs_collection.count_documents({})

    print(f'{num_docs} logs')
    print('Methods:')
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]

    for method in methods:
        num_method = logs_collection.count_documents({'method': method})
        print(f'\tmethod {method}: {num_method}')

    filter_path = {"method": "GET", "path": "/status"}
    num_path = logs_collection.count_documents(filter_path)
    print(f'{num_path} status check')
