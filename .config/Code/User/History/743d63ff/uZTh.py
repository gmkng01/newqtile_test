from llama_index import VectorStoreIndex, SimpleDirectoryReader, ServiceContext
from llama_index.llms import HuggingFaceLLM
# import torch

documents = SimpleDirectoryReader("/home/abhi/Documents/ChatBot/data").load_data()
