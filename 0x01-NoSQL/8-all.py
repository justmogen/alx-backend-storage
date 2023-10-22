#!/usr/bin/env python3
""" list all documents in a collection """
import pymongo


def list_all(mongo_collection):
    """ list all documents in a collection """
    return [] if not mongo_collection else list(mongo_collection.find())
