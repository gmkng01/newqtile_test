import gradio as gr
from llama_index import VectorStoreIndex, SimpleDirectoryReader, ServiceContext
from llama_index.llms import HuggingFaceLLM
import torch
from llama_index.embeddings import HuggingFaceEmbedding

documents = SimpleDirectoryReader("/home/abhi/Documents/ChatBot/data").load_data()

from llama_index.prompts.prompts import SimpleInputPrompt

system_prompt = "You are a Q&A assistant. Your goal is to answer questions as accurately as possible based on the instructions and context provided."

# This will wrap the default prompts that are internal to llama-index
query_wrapper_prompt = SimpleInputPrompt("<|USER|>{query_str}<|ASSISTANT|>")



llm = HuggingFaceLLM(
    context_window=2048,
    max_new_tokens=128,
    generate_kwargs={"temperature": 0.0, "do_sample": False},
    system_prompt=system_prompt,
    query_wrapper_prompt=query_wrapper_prompt,
    tokenizer_name="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    model_name="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    device_map="cpu",
    # uncomment this if using CUDA to reduce memory usage
    # model_kwargs={"torch_dtype": torch.bfloat16}
)



# loads BAAI/bge-small-en
# embed_model = HuggingFaceEmbedding()

# loads BAAI/bge-small-en-v1.5
embed_model = HuggingFaceEmbedding(model_name="BAAI/bge-small-en-v1.5")

service_context = ServiceContext.from_defaults(
    chunk_size=1024,
    llm=llm,
    embed_model=embed_model
)

index = VectorStoreIndex.from_documents(documents, service_context=service_context)

query_engine = index.as_query_engine()

def predict(input, history):
  response = query_engine.query(input)
  return str(response)

def predict(input, history):
  response = query_engine.query(input)
  return str(response)




gr.ChatInterface(predict).launch(share=True)