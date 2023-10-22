#!/usr/bin/env python3
"""Log stats new version"""
from pymongo import MongoClient


if __name__ == "__main__":
    """provides some stats about Nginx logs stored in MongoDB"""
    client = MongoClient()
    logs = client.logs.nginx
    num_docs = logs.count_documents({})
    print(f"{num_docs} logs")
    print("Methods:")
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        num_met = logs.count_documents({"method": method})
        print(f"\tmethod {method}: {num_met}")
    filter_path = {"method": "GET", "path": "/status"}
    num_path = logs.count_documents(filter_path)
    print(f"{num_path} status check")
    print("IPs:")
    pipeline = [
        {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ]
    ips = logs.aggregate(pipeline)
    for ip in ips:
        print(f"\t{ip.get('_id')}: {ip.get('count')}")
