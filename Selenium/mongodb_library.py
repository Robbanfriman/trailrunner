from pymongo import MongoClient

class MongoDBLibrary:
    def __init__(self, connection_uri):
        self.client = MongoClient(connection_uri)
        self.database = None
        self.collection = None

    def connect_to_database(self, database_name):
        self.database = self.client[database_name]

    def select_collection(self, collection_name):
        self.collection = self.database[collection_name]

    def find_documents(self, query={}):
        return list(self.collection.find(query))

    def close_connection(self):
        if self.client:
            self.client.close()